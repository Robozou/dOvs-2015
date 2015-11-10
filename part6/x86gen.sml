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
                                    , doc = "x86gen:52"}

        fun allocArgs count = adjustSP (~F.wordSize*count)
        fun freeArgs count = adjustSP (F.wordSize*count)

        fun munchStm (T.SEQ (a, b)) = (munchStm a; munchStm b)

          (* MOVE *)
          | munchStm (T.MOVE (T.TEMP t, T.CALL (T.NAME l, args))) =
            ( emit (A.OPER { assem = "\tcall " ^ S.name l
                           , src = munchArgs args
                           , dst = F.calldefs
                           , jump = NONE
                           , doc = "x86gen:68"}) (* Check line number TODO *)
            ; emit (freeArgs (length args))
            ; emit (moveInstr F.EAX t "70"))(* Check line number TODO *)

          | munchStm (T.MOVE (T.MEM e1, T.CALL (T.NAME l, args))) =
            let
                val t = Tm.newtemp ()
            in
                emit (A.OPER { assem = "\tcall " ^ S.name l
                             , src = munchArgs args
                             , dst = F.calldefs
                             , jump = NONE
                             , doc = "x86gen:80"}) (* Check line number TODO *)
              ; emit (freeArgs (length args))
              ; emit (moveInstr F.EAX t "82") (* Check line number TODO *)
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
                             , doc = "x86gen:94" })) (* Check line number TODO *)

          | munchStm (T.MOVE (T.MEM (T.BINOP (T.PLUS, T.CONST i, e1)), e2)) =
            ( emit (A.OPER { assem = "\tmovl `s1, " ^ int i ^ "(`s0)"
                             , src = [munchExp e1, munchExp e2]
                             , dst = []
                             , jump = NONE
                             , doc = "x86gen:98" })) (* Check line number TODO *)

          | munchStm (T.MOVE (T.MEM (T.CONST i), e2)) =
          let
              val t = Tm.newtemp ()
          in
            ( emit (A.OPER { assem = "\tmovl " ^ int i ^ "`d0"
                             , src = []
                             , dst = [t]
                             , jump = NONE
                             , doc = "x86gen:107"})
              ; emit (A.OPER { assem = "\tmovl `s0, (`s1)"
                             , src = [munchExp e2, t]
                             , dst = []
                             , jump = NONE
                             , doc = "x86gen:113" })) (* Hopefully we'll never use this case *)
          end
          | munchStm (T.MOVE (T.MEM e1, e2)) =
            ( emit (A.OPER { assem = "\tmovl `s1, (`s0)"
                             , src = [munchExp e1, munchExp e2]
                             , dst = []
                             , jump = NONE
                             , doc = "x86gen:120" })) (* Check line number TODO *)

          | munchStm (T.MOVE (T.TEMP i, e2)) =
            ( emit (moveInstr (munchExp e2) i  "123")) (* Check line number TODO  SPØRG CASPER*)

          | munchStm (T.LABEL lab) =
            ( emit (A.LABEL { assem = S.name lab^":\n", lab=lab
                              , doc = "x86gen:127" }))

          (* JUMP *)
          | munchStm (T.CJUMP (oper, T.CONST i, e2, lab1, lab2)) =
            ( emit (A.OPER {assem = "\tcmpl $" ^ int i ^ ", `s0"
                            , src = [munchExp e2]
                            , dst = []
                            , jump = NONE
                            , doc = "x86gen:136" })
            ; emit (A.OPER {assem = "\t" ^(operator2jump(oper)) ^ " `j0"
                            , src = []
                            , dst = []
                            , jump = SOME [lab1]
                            , doc = "x86gen:141" })
            ; emit (A.OPER {assem = "\t jmp `j0"
                          , src = []
                          , dst = []
                          , jump = SOME [lab2]
                          , doc = "x86gen:145" }) )
                           (* Casper said we should split it up, but we can't remember what he said about jumps and labels TODO *)

          | munchStm (T.CJUMP (oper, e1, T.CONST i, lab1, lab2)) =
            ( emit (A.OPER {assem = "\tcmpl $" ^ int i ^ ", `s0"
                          , src = [munchExp e1]
                          , dst = []
                          , jump = NONE
                          , doc = "x86gen:146" })
            ; emit (A.OPER {assem = "\t" ^(operator2jump(oper)) ^" `j0"
                          , src = []
                          , dst = []
                          , jump = SOME [lab1]
                          , doc = "x86gen:158" })
            ; emit (A.OPER {assem = "\t jmp `j0"
                          , src = []
                          , dst = []
                          , jump = SOME [lab2]
                          , doc = "x86gen:163" }) )

          | munchStm (T.CJUMP (oper, e1, e2, lab1, lab2)) =
            ( emit (A.OPER {assem = "\tcmpl `s0, `s1"
                          , src = [munchExp e1, munchExp e2]
                          , dst = []
                          , jump = NONE
                          , doc = "x86gen:171" })
              ; emit (A.OPER {assem = "\t" ^ (operator2jump(oper)) ^" `j0"
                            , src = []
                            , dst = []
                            , jump = SOME [lab1]
                            , doc = "x86gen:176" })
              ; emit (A.OPER {assem = "\t jmp `j0"
                            , src = []
                            , dst = []
                            , jump = SOME [lab2]
                            , doc = "x86gen:181" }) )

          | munchStm (T.JUMP (T.NAME lab, llst)) =
            ( emit (A.OPER {assem = "\tjmp "^ S.name lab
                          , src = []
                          , dst = []
                          , jump = SOME llst
                          , doc = "x86gen:188" }))

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
                                    , doc = "x86gen:228"});Tm.newtemp()::munchArgs1(at))
            in  munchArgs1 rargs
            end (* Remember this one in calls, we dunno TODO *)

        (* Memory access *)
        and munchExp (T.MEM (T.BINOP (T.PLUS, e, T.CONST n))) =
            result (fn r => emit (A.OPER { assem = "\tmovl " ^ int n ^
                                                   "(`s0), `d0"
                                         , src = [munchExp e]
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:244"}))

          | munchExp (T.MEM (T.BINOP (T.PLUS, T.CONST n, e))) =
            result (fn r => emit (A.OPER { assem = "\tmovl " ^ int n ^
                                                   "(`s0), `d0"
                                         , src = [munchExp e]
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:252"}))

          | munchExp (T.MEM (T.BINOP (T.MINUS, e, T.CONST n))) =
            result (fn r => emit (A.OPER { assem = "\tmovl -" ^ int n ^
                                                   "(`s0), `d0"
                                         , src = [munchExp e]
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:260"}))

          | munchExp (T.MEM e) =
            result (fn r => emit (A.OPER { assem = "\tmovl (`s0), `d0"
                                         , src = [munchExp e]
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:267"}))

          (* PLUS *)
          | munchExp (T.BINOP (T.PLUS, e1, T.CONST i)) =
            result (fn r => (emit (A.OPER { assem = "\tmovl `s0, `d0"
                                          , src = [munchExp e1]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:275"})
                           ; emit (A.OPER { assem = "\taddl `s0, $" ^ int i
                                          , src = [r]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:280"})))

          | munchExp (T.BINOP (T.PLUS, T.CONST i, e1)) =
            result (fn r => (emit (A.OPER { assem = "\tmovl `s0, `d0"
                                          , src = [munchExp e1]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:287"})
                           ; emit (A.OPER { assem = "\taddl `s0, $" ^ int i
                                          , src = [r]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:292"})))

          | munchExp (T.BINOP (T.PLUS, e1, e2)) =
            (* Hint, p203: use src=[r,_] and do not use `s0,
             * which specifies that r is used *)
            result (fn r => emit (A.OPER { assem = "\taddl `s1, `d0"
                                         , src = [r, munchExp e2]
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:301"}))
             (* Why does this make sense Casper? TODO why no munchExp e1 *)

          (* MINUS *)
          | munchExp (T.BINOP (T.MINUS, e1, T.CONST i)) =
            result (fn r => (emit (A.OPER { assem = "\tmovl `s0, `d0"
                                          , src = [munchExp e1]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:309"})
                           ; emit (A.OPER { assem = "\tsubl $" ^ int i ^ ", `s0"
                                          , src = [r]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:314"})))

          | munchExp (T.BINOP (T.MINUS, T.CONST 0, e1)) =
            result (fn r => (emit (A.OPER { assem = "\tmovl $" ^ int 0 ^ ", `d0"
                                         , src = []
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:321"})
                           ; emit (A.OPER { assem = "\tsubl `s1, `s0"
                                         , src = [r, munchExp e1]
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:326"})))

          | munchExp (T.BINOP (T.MINUS, T.CONST i, e1)) =
            result (fn r => (emit (A.OPER { assem = "\tmovl $" ^ int i ^ ", `d0"
                                          , src = []
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:333"})
                           ; emit (A.OPER { assem = "\tsubl `s1, `s0"
                                          , src = [r, munchExp e1]
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:338"})))

          | munchExp (T.BINOP (T.MINUS, e1, e2)) =
            result (fn r => emit (A.OPER { assem = "\tsubl `d0, `s1"
                                         , src = [r, munchExp e2]
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:346"}))

          (* MULTIPLY *)
          | munchExp (T.BINOP (T.MUL, e1, e2)) =
            result (fn r => emit (A.OPER { assem = "\timull `d0"
                                         , src = [r, munchExp e2]
                                         , dst = [r]
                                         , jump = NONE
                                         , doc = "x86gen:354"}))

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
            result (fn r => (emit (A.OPER { assem = "\tmovl `s0, `d0"
                                          , src = [munchExp e1]
                                          , dst = [F.EAX] (* is r and EAX the same? *)
                                          , jump = NONE
                                          , doc = "x86gen:375"})
                           ; emit (A.OPER { assem = "\tcltd" (* correct conversion? *)
                                          , src = []
                                          , dst = []
                                          , jump = NONE
                                          , doc = "x86gen:380"})
                           ; emit (A.OPER { assem = "\tidivl `s0"
                                          , src = [munchExp e2]
                                          , dst = []  (* so is it stored in EAX now? *)
                                          , jump = NONE
                                          , doc = "x86gen:385"})
                           ; emit (A.OPER { assem = "movl `s0, `d0"
                                          , src = [F.EAX]   (* Should we move the result? *)
                                          , dst = [r]
                                          , jump = NONE
                                          , doc = "x86gen:380"})
                                         ))
                (* CASPER HELP US, this is what we got from the comment above TODO *)

          (* AND *)
          | munchExp (T.BINOP (T.AND, e1, T.CONST i)) =
            result (fn r => raise TODO)

          | munchExp (T.BINOP (T.AND, T.CONST i, e1)) =
            result (fn r => raise TODO)

          | munchExp (T.BINOP (T.AND, e1, e2)) =
            result (fn r => raise TODO)

          (* OR *)
          | munchExp (T.BINOP (T.OR, e1, T.CONST i)) =
            result (fn r => raise TODO)

          | munchExp (T.BINOP (T.OR, T.CONST i, e1)) =
            result (fn r => raise TODO)

          | munchExp (T.BINOP (T.OR, e1, e2)) =
            result (fn r => raise TODO)

          (* Other constructs *)
          | munchExp (T.TEMP t) = t

          | munchExp (T.ESEQ (s, e)) = (print("15");raise TODO)

          | munchExp (T.NAME label) =
            result (fn r => label)

          | munchExp (T.CONST n) =
            result (fn r =>
                    emit (A.OPER { assem = "\tmovl $" ^ int n ^ ", `d0"
                                  , src = []
                                  , dst = [r]
                                  , jump = NONE
                                  , doc = "x86gen:287"}))

          (* If no match so far, complain *)
          | munchExp (tr as T.CALL (_, _)) =
            ( TextIO.output (TextIO.stdErr, "\nBUG: bad CALL in munchExp:\n")
            ; PT.printExp (TextIO.stdErr, tr)
            ; TextIO.flushOut TextIO.stdErr
            ; result (fn _ => emit (A.OPER { assem = "\t# bad CALL!"
                                           , src = []
                                           , dst = []
                                           , jump = NONE
                                           , doc = "x86gen:248"})))

          | munchExp (tr as T.BINOP (_, _, _)) =
            ( TextIO.output (TextIO.stdErr, "\nBUG: bad BINOP in munchExp:\n")
            ; PT.printExp (TextIO.stdErr, tr)
            ; TextIO.flushOut TextIO.stdErr
            ; result (fn _ => emit (A.OPER { assem = "\t# bad BINOP!"
                                           , src = []
                                           , dst = []
                                           , jump = NONE
                                           , doc = "x86gen:258"})))
    in
        munchStm stm;
        rev (!ilist)
    end

end (* X86Gen *)
