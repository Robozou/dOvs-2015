signature CODEGEN =
sig
    structure Frame: FRAME
    val codegen: Frame.frame -> Tree.stm -> Assem.instr list
end

structure X86Gen: CODEGEN =
struct

structure Frame: FRAME = X86Frame
structure S = Symbol
structure T = Tree
structure Tm = Temp
structure A = Assem
structure F = Frame
structure PT = PrintTree(F)

exception TODO

fun int i =
    if i >= 0
    then Int.toString i
    else "-" ^ Int.toString (~i)

fun codegen frame stm =
    let
        val ilist = ref (nil: A.instr list)

        fun emit x = (ilist := x :: (!ilist))

        fun result gen =
            let val t = Tm.newtemp ()
            in  gen t; t
            end

        fun operator2jump oper =
            case oper of
                T.EQ => "je"
              | T.NE => "jne"
              | T.LT => "jl"
              | T.GT => "jg"
              | T.LE => "jle"
              | T.GE => "jge"
              | _ => "bad branch operator!"

        fun moveInstr s d doc = A.MOVE { assem = "\tmovl `s0, `d0"
                                       , src = s
                                       , dst = d
                                       , doc = "x86gen:" ^ doc}

        fun adjustSP count = A.OPER { assem = "\taddl $" ^ int count ^ ", `d0"
                                    , src = [F.SP] (* old-SP used *)
                                    , dst = [F.SP]
                                    , jump = NONE
                                    , doc = "x86gen:55"}

        fun allocArgs count = adjustSP (~F.wordSize*count)
        fun freeArgs count = adjustSP (F.wordSize*count)

        fun munchStm (T.SEQ (a, b)) = (munchStm a; munchStm b)

          (* MOVE *)
          | munchStm (T.MOVE (T.TEMP t, T.CALL (T.NAME l, args))) =
            ( emit (A.OPER { assem = "\tcall " ^ S.name l
                           , src = munchArgs args
                           , dst = F.calldefs
                           , jump = NONE
                           , doc = "x86gen:68"})
            ; emit (freeArgs (length args))
            ; emit (moveInstr F.EAX t "70"))

          | munchStm (T.MOVE (T.MEM e1, T.CALL (T.NAME l, args))) =
            let
                val t = Tm.newtemp ()
            in
                emit (A.OPER { assem = "\tcall " ^ S.name l
                             , src = munchArgs args
                             , dst = F.calldefs
                             , jump = NONE
                             , doc = "x86gen:80"})
              ; emit (freeArgs (length args))
              ; emit (moveInstr F.EAX t "82")
              ; emit (A.OPER { assem = "\t movl `s1, (`s0)"
                             , src = [munchExp e1, t]
                             , dst = []
                             , jump = NONE
                             , doc = "x86gen:87"})
            end

          | munchStm (T.MOVE (T.MEM (T.BINOP (T.PLUS, e1, T.CONST i)), e2)) =
            ( emit (A.OPER { assem = "\tmovl `s1, " ^ int i ^ "(`s0)"
                             , src = [munchExp e1, munchExp e2]
                             , dst = []
                             , jump = NONE
                             , doc = "x86gen:95" }))

          | munchStm (T.MOVE (T.MEM (T.BINOP (T.PLUS, T.CONST i, e1)), e2)) =
            ( emit (A.OPER { assem = "\tmovl `s1, " ^ int i ^ "(`s0)"
                             , src = [munchExp e1, munchExp e2]
                             , dst = []
                             , jump = NONE
                             , doc = "x86gen:102" }))

          | munchStm (T.MOVE (T.MEM (T.CONST i), e2)) =
          let
              val t = Tm.newtemp ()
          in
            ( emit (A.OPER { assem = "\tmovl " ^ int i ^ "`d0"
                             , src = []
                             , dst = [t]
                             , jump = NONE
                             , doc = "x86gen:112"})
              ; emit (A.OPER { assem = "\tmovl `s0, (`s1)"
                             , src = [munchExp e2, t]
                             , dst = []
                             , jump = NONE
                             , doc = "x86gen:117" })) (* Hopefully we'll never use this case *)
          end
          | munchStm (T.MOVE (T.MEM e1, e2)) =
            ( emit (A.OPER { assem = "\tmovl `s1, (`s0)"
                             , src = [munchExp e1, munchExp e2]
                             , dst = []
                             , jump = NONE
                             , doc = "x86gen:124" }))

          | munchStm (T.MOVE (T.TEMP i, e2)) =
            ( emit (moveInstr (munchExp e2) i  "127")) (*  TODO  SPØRG CASPER*)

          | munchStm (T.LABEL lab) =
            ( emit (A.LABEL { assem = S.name lab^":", lab=lab
                              , doc = "x86gen:131" }))

          (* JUMP *)
          | munchStm (T.CJUMP (oper, T.CONST i, e2, lab1, lab2)) =
            let
              val lab = Tm.newLabel "fallthrough"
            in
              ( emit (A.OPER {assem = "\tcmpl $" ^ int i ^ ", `s0"
                              , src = [munchExp e2]
                              , dst = []
                              , jump = NONE
                              , doc = "x86gen:139" })
              ; emit (A.OPER {assem = "\t" ^(operator2jump(oper)) ^ " `j0"
                              , src = []
                              , dst = []
                              , jump = SOME [lab1, lab]
                              , doc = "x86gen:144" })
              ; emit (A.LABEL {assem = S.name lab ^ ":" (* fallthough label *)
                              , lab = lab
                              , doc = "x86gen:147"})
              ; emit (A.OPER {assem = "\tjmp `j0"
                            , src = []
                            , dst = []
                            , jump = SOME [lab2]
                            , doc = "x86gen:149" }) )
            end

          | munchStm (T.CJUMP (oper, e1, T.CONST i, lab1, lab2)) =
            let
              val lab = Tm.newLabel "fallthrough"
            in
              ( emit (A.OPER {assem = "\tcmpl $" ^ int i ^ ", `s0"
                            , src = [munchExp e1]
                            , dst = []
                            , jump = NONE
                            , doc = "x86gen:157" })
              ; emit (A.OPER {assem = "\t" ^(operator2jump(oper)) ^" `j0"
                            , src = []
                            , dst = []
                            , jump = SOME [lab1]
                            , doc = "x86gen:162" })
              ; emit (A.LABEL {assem = S.name lab ^ ":"
                            , lab = lab
                            , doc = "x86gen:171"})
              ; emit (A.OPER {assem = "\tjmp `j0"
                            , src = []
                            , dst = []
                            , jump = SOME [lab2]
                            , doc = "x86gen:179" }) )
            end

          | munchStm (T.CJUMP (oper, e1, e2, lab1, lab2)) =
            let
              val lab = Tm.newLabel "fallthrough"
            in
              ( emit (A.OPER {assem = "\tcmpl `s0, `s1"
                            , src = [munchExp e1, munchExp e2]
                            , dst = []
                            , jump = NONE
                            , doc = "x86gen:174" })
                ; emit (A.OPER {assem = "\t" ^ (operator2jump(oper)) ^" `j0"
                              , src = []
                              , dst = []
                              , jump = SOME [lab1]
                              , doc = "x86gen:179" })
                ; emit (A.LABEL {assem = S.name lab ^ ":"
                              , lab = lab
                              , doc = "x86gen:171"})
                ; emit (A.OPER {assem = "\tjmp `j0"
                              , src = []
                              , dst = []
                              , jump = SOME [lab2]
                              , doc = "x86gen:184" }) )
            end

          | munchStm (T.JUMP (T.NAME lab, llst)) =
            ( emit (A.OPER {assem = "\tjmp "^ S.name lab
                          , src = []
                          , dst = []
                          , jump = SOME llst
                          , doc = "x86gen:191" }))

          (* EXP *)
          | munchStm (T.EXP (T.CALL (T.NAME lab, args))) =
            ( emit (A.OPER {assem = "\tcall " ^ S.name lab
                          , src = munchArgs args
                          , dst = F.calldefs
                          , jump = NONE
                          , doc = "x86gen:199"})
            ; emit (freeArgs (length args)))

          | munchStm (T.EXP exp) =
            ( munchExp exp; ())

          (* If no match so far, complain *)
          | munchStm (T.JUMP a) =
            emit (A.OPER { assem = "\t# JUMP: bad JUMP in munchStm!"
                         , src = []
                         , dst = []
                         , jump = NONE
                         , doc = "x86gen:211"})

          | munchStm (T.MOVE a) =
            emit (A.MOVE { assem = "\t# MOVE: bad MOVE in munchStm!"
                         , src = Tm.newtemp ()
                         , dst = Tm.newtemp ()
                         , doc = "x86gen:217"})

        and munchArgs args =
            (* in the simple approach used here, we pass all args in memory *)
            let val rargs = rev args (* push args right-to-left *)
                fun munchArgs1 [] = []
                  | munchArgs1 (ah::at) =
                       (emit (A.OPER {assem = "\tpushl `s0"
                                    , src = [munchExp ah]
                                    , dst = []
                                    , jump = NONE
                                    , doc = "x86gen:228"});munchArgs1(at)) (* we already have temps pushed to stack, so doesn't really matter what we output *)
            in  munchArgs1 rargs
            end

        (* Memory access *)
        and munchExp (T.MEM (T.BINOP (T.PLUS, e, T.CONST n))) =
            result (fn r => emit (A.OPER { assem = "\tmovl " ^ int n ^
                                                   "(`s0), `d0"
                                         , src = [munchExp e]
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:239"}))

          | munchExp (T.MEM (T.BINOP (T.PLUS, T.CONST n, e))) =
            result (fn r => emit (A.MOVE { assem = "\tmovl " ^ int n ^
                                                   "(`s0), `d0"
                                         , src = munchExp e
                                         , dst = r
                                         , doc = "x86gen:246"}))

          | munchExp (T.MEM (T.BINOP (T.MINUS, e, T.CONST n))) =
            result (fn r => emit (A.MOVE { assem = "\tmovl -" ^ int n ^
                                                   "(`s0), `d0"
                                         , src = munchExp e
                                         , dst = r
                                         , doc = "x86gen:253"}))

          | munchExp (T.MEM e) =
            result (fn r => emit (A.MOVE { assem = "\tmovl (`s0), `d0"
                                         , src = munchExp e
                                         , dst = r
                                         , doc = "x86gen:259"}))

          (* PLUS *)
          | munchExp (T.BINOP (T.PLUS, e1, T.CONST i)) =
            result (fn r => (emit (moveInstr (munchExp e1) r "263")
                           ; emit (A.OPER { assem = "\taddl $" ^ int i ^ ", `s0"
                                          , src = [r]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:267"})))

          | munchExp (T.BINOP (T.PLUS, T.CONST i, e1)) =
            result (fn r => (emit (moveInstr (munchExp e1) r "270")
                           ; emit (A.OPER { assem = "\taddl $" ^ int i ^ ", `s0"
                                          , src = [r]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:274"})))

          | munchExp (T.BINOP (T.PLUS, e1, e2)) =
            (* Hint, p203: use src=[r,_] and do not use `s0,
             * which specifies that r is used *)
            result (fn r => (emit (A.OPER { assem = "\tmovl `s1, `d0"
                                         , src = [r, munchExp e1]
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:283"})
                          ; emit (A.OPER { assem = "\taddl `s0, `d0"
                                         , src = [munchExp e2]
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:288"})))
             (* Why does this make sense Casper? TODO what is going on *)

          (* MINUS *)
          | munchExp (T.BINOP (T.MINUS, e1, T.CONST i)) =
            result (fn r => (emit (moveInstr (munchExp e1) r "293")
                           ; emit (A.OPER { assem = "\tsubl $" ^ int i ^ ", `s0"
                                          , src = [r]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:398"})))

          | munchExp (T.BINOP (T.MINUS, T.CONST 0, e1)) =
            result (fn r => (emit (A.OPER { assem = "\tmovl $" ^ int 0 ^ ", `d0"
                                         , src = []
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:305"})
                           ; emit (A.OPER { assem = "\tsubl `s1, `s0"
                                         , src = [r, munchExp e1]
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:310"})))

          | munchExp (T.BINOP (T.MINUS, T.CONST i, e1)) =
            result (fn r => (emit (A.OPER { assem = "\tmovl $" ^ int i ^ ", `d0"
                                          , src = []
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:317"})
                           ; emit (A.OPER { assem = "\tsubl `s1, `s0"
                                          , src = [r, munchExp e1]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:322"})))

          | munchExp (T.BINOP (T.MINUS, e1, e2)) =
            result (fn r => emit (A.OPER { assem = "\tsubl `d0, `s1"
                                         , src = [r, munchExp e2]
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:329"}))

          (* MULTIPLY *)
          | munchExp (T.BINOP (T.MUL, e1, e2)) = (* move e1 to EAX *)
            result (fn r => (emit (moveInstr (munchExp e1) F.EAX "355")
                          ; (emit (A.OPER { assem = "\timull `s0"
                                         , src = [munchExp e2]
                                         , dst = []
                                         , jump = NONE
                                         , doc = "x86gen:360"}))
                          ; (emit (moveInstr F.EAX r "361"))))

          (* DIVIDE *)

          | munchExp (T.BINOP (T.DIV, e1, e2)) =
            (* Hint from
             * http://www.cs.mun.ca/~rod/winter2004/cs3724/notes/asm.html:
             *
             * "To divide x by y, we first convert it into 64-bits, and
             * them use idivl.
             *
             *  movl  x, %eax
             *  cltd
             *  idivl y
             *
             * The quotient is in %eax, and the remainder is in %edx."
             *)
            result (fn r => (emit (A.MOVE { assem = "\tmovl `s0, `d0"
                                          , src = munchExp e1
                                          , dst = F.EAX
                                          , doc = "x86gen:358"})
                           ; emit (A.OPER { assem = "\tcltd"
                                          , src = []
                                          , dst = []
                                          , jump = NONE
                                          , doc = "x86gen:363"})
                           ; emit (A.OPER { assem = "\tidivl `s0"
                                          , src = [munchExp e2]
                                          , dst = []
                                          , jump = NONE
                                          , doc = "x86gen:373"})
                           ; emit (moveInstr F.EAX r "369") ))

          (* AND *)
          | munchExp (T.BINOP (T.AND, e1, T.CONST i)) =
            result (fn r => (emit (A.OPER { assem = "\tmovl $" ^ int i ^ ", `d0"
                                          , src = []
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:377"})
                           ; emit (A.OPER { assem = "\tandl `s1, `d0"
                                          , src = [r, munchExp e1]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:382"})))

          | munchExp (T.BINOP (T.AND, T.CONST i, e1)) =
            result (fn r => (emit (A.OPER { assem = "\tmovl $" ^ int i ^ ", `d0"
                                          , src = []
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:389"})
                           ; emit (A.OPER { assem = "\tandl `s1, `d0"
                                          , src = [r, munchExp e1]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:394"})))

          | munchExp (T.BINOP (T.AND, e1, e2)) =
            result (fn r => (emit (moveInstr (munchExp e1) r "397")
                           ; emit (A.OPER { assem = "\tandl `s1, `d0"
                                          , src = [r, munchExp e2]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:402"})))

          (* OR *)
          | munchExp (T.BINOP (T.OR, e1, T.CONST i)) =
            result (fn r => (emit (A.OPER { assem = "\tmovl $" ^ int i ^ ", `d0"
                                          , src = []
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:410"})
                           ; emit (A.OPER { assem = "\torl `s1, `d0"
                                          , src = [r, munchExp e1]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:415"})))

          | munchExp (T.BINOP (T.OR, T.CONST i, e1)) =
            result (fn r => (emit (A.OPER { assem = "\tmovl $" ^ int i ^ ", `d0"
                                          , src = []
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:422"})
                           ; emit (A.OPER { assem = "\torl `s1, `d0"
                                          , src = [r, munchExp e1]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:427"})))

          | munchExp (T.BINOP (T.OR, e1, e2)) =
            result (fn r => (emit (moveInstr (munchExp e1) r "430")
                           ; emit (A.OPER { assem = "\torl `s1, `d0"
                                          , src = [r, munchExp e2]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:435"}))) (* Kinda unnecessary, since we use if-statements instead *)

          (* Other constructs *)
          | munchExp (T.TEMP t) = t

          | munchExp (T.ESEQ (s, e)) = (munchStm s; munchExp e)

          | munchExp (T.NAME label) =
            result (fn r =>
                    emit (A.OPER { assem = "\tmovl $" ^ S.name(label) ^ ", `d0"
                                 , src = []
                                 , dst = [r]
                                 , jump = NONE
                                 , doc = "x86gen:448"}))

          | munchExp (T.CONST n) =
            result (fn r =>
                    emit (A.OPER { assem = "\tmovl $" ^ int n ^ ", `d0"
                                  , src = []
                                  , dst = [r]
                                  , jump = NONE
                                  , doc = "x86gen:456"}))

          (* If no match so far, complain *)
          | munchExp (tr as T.CALL (_, _)) =
            ( TextIO.output (TextIO.stdErr, "\nBUG: bad CALL in munchExp:\n")
            ; PT.printExp (TextIO.stdErr, tr)
            ; TextIO.flushOut TextIO.stdErr
            ; result (fn _ => emit (A.OPER { assem = "\t# bad CALL!"
                                           , src = []
                                           , dst = []
                                           , jump = NONE
                                           , doc = "x86gen:467"})))

          | munchExp (tr as T.BINOP (_, _, _)) =
            ( TextIO.output (TextIO.stdErr, "\nBUG: bad BINOP in munchExp:\n")
            ; PT.printExp (TextIO.stdErr, tr)
            ; TextIO.flushOut TextIO.stdErr
            ; result (fn _ => emit (A.OPER { assem = "\t# bad BINOP!"
                                           , src = []
                                           , dst = []
                                           , jump = NONE
                                           , doc = "x86gen:477"})))
    in
        munchStm stm;
        rev (!ilist)
    end

end (* X86Gen *)
