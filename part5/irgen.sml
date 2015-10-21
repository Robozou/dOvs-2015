signature IRGEN =
sig
  val transProg: TAbsyn.exp -> Translate.frag list
end

structure IRgen :> IRGEN =
struct

structure S = Symbol
structure TAbs = TAbsyn
structure E = IRgen_Env
structure Ty = Types
structure Tr = Translate

type extra = { level : Tr.level (* frame of enclosing function *)
             , break : S.symbol option } (* jump to this label on 'break' *)


(* Helper functions *)

fun actualTy (Ty.NAME (_, ref (SOME ty))) = actualTy ty
  | actualTy t = t

val TODO = {exp=Tr.bogus, ty=Ty.ERROR}        

fun transExp (venv, extra : extra) =
    let                               
        (*fun trexp {exp=TAbs.NilExp, ty} = {exp=Tr.nil2IR (), ty=ty}
          | trexp _ = TODO*)
                
        (* The below code suggest how to translate depending what case
        you are in, however, uncommenting the section would result in
        type-errors. You will have to write the rest of the cases your
        selves.*)

        fun trexp {exp=TAbs.NilExp,ty}  =
            {exp = Tr.nil2IR (), ty = Ty.NIL}

          | trexp {exp = TAbs.VarExp var, ty} =
            trvar var 

          | trexp {exp=TAbs.IntExp i,ty} =
            {exp = Tr.int2IR i, ty = Ty.INT}

          | trexp {exp = TAbs.StringExp s, ty} =
            {exp = Tr.string2IR s, ty = Ty.STRING}
(*
          | trexp (TAbs.OpExp {left, oper, right}) break =
            raise TODO (* NB: many cases here! *)

          | trexp (TAbs.CallExp {func, args}) break =
            (case S.look (venv, func) of
                 SOME (E.FunEntry {formals, result, level=level', label}) =>
                 raise TODO (* using Tr.procCall2IR, Tr.funCall2IR *)
               | SOME (E.VarEntry {ty, ...}) =>
                 raise TODO (* error handling *)
               | NONE =>
                 raise TODO (* error handling *))

          | trexp (TAbs.IfExp {test, thn, els}) break =
            raise TODO (* using Tr.ifThen2IR, Tr.ifThenElse2IR *)

          | trexp (TAbs.WhileExp {test, body}) break =
            raise TODO (* using Tr.newBreakPoint, Tr.while2IR *)

          | trexp (aexp as TAbs.RecordExp {fields, typ}) break =
            raise TODO (* using Tr.record2IR, maybe Tr.nil2IR with errors *)

          | trexp (TAbs.SeqExp []) _ =
            (* ensure there is some expression if the SeqExp is empty *)
            raise TODO

          | trexp (TAbs.SeqExp (aexps as (aexp'::aexps'))) break =
            raise TODO (* using Tr.seq2IR, Tr.eseq2IR *)

          | trexp (TAbs.AssignExp {var, exp}) break =
            raise TODO (* using Tr.assign2IR, checkAssignable *)

          | trexp (TAbs.ForExp {var, escape, lo, hi, body}) _ =
            raise TODO (* using Tr.newBreakPoint, Tr.allocLocal, Tr.forIR *)

          | trexp (TAbs.BreakExp) break =
            raise TODO (* using Tr.break2IR *)

          | trexp (term as TAbs.LetExp {decls, body}) break =
            raise TODO (* using transDecs, transExp, Tr.let2IR *)

          | trexp (TAbs.ArrayExp {size, init}) break =
            raise TODO (* using Tr.array2IR *) 

        (* NB: trvar must generate a tree describing the given
         * variable such that it will work for both evaluation and
         * assignment; any expression will be fine for evaluation,
         * but assignment only works with MOVE(TEMP _, _) and
         * MOVE(MEM _, _) because we can only store the new value
         * into a register or into a memory cell (error cases can
         * generate a NoOp value (Ex (CONST 0)), so they avoid
         * the problem).  This means that Tr.simpleVar, Tr.fieldVar, 
         * and Tr.subscript2IR must return an Ex (MEM _) or an 
         * Ex (TEMP _).
         *)*)

        and trvar {var=TAbs.SimpleVar id, ty} : {exp:Tr.exp,ty:Ty.ty} = 
            TODO (* using Tr.simpleVar *)

          | trvar {var=TAbs.FieldVar (var, id), ty} : {exp:Tr.exp,ty:Ty.ty} = 
            (* ignore 'mutationRequested': all record fields are mutable *)
            TODO (* using Tr.fieldVar *)
                                       
          | trvar {var=TAbs.SubscriptVar (var, exp), ty} : {exp:Tr.exp,ty:Ty.ty} = 
            (* ignore 'mutationRequested': all array entries are mutable *)
            TODO (* using Tr.subscript2IR *)

    in
        trexp
    end
        
and transDec ( venv
             , TAbs.VarDec {name,escape=ref esc,ty,init}
             , explist (* accumulate decl elaboration code *)
             , extra) =
    let 
        val {exp=initExp,ty=initTy} = transExp (venv,extra) init
        val acc = Tr.allocLocal (#level extra) esc
        val var = Tr.simpleVar (acc, #level extra)
    in
        ( { venv = S.enter(venv,name,(E.VarEntry { access=acc
                                                 , ty=actualTy ty
                                                 , escape=ref esc})) }
        , explist @ (Tr.assign2IR(var, initExp) :: []))
    end
                
  | transDec (venv, TAbs.TypeDec tydecls, explist, extra) = 
    (* This will actually do nothing, since we do not need typing information *)
    ({ venv = venv}, explist)
        
  | transDec (venv, TAbs.FunctionDec fundecls, explist, extra) =
    ( {venv = venv}, explist) (* TODO *)

and transDecs (venv, decls, extra) =
    ({venv = venv}, []) (* TODO *)                 

fun transProg absyn : Tr.frag list  =
    let
        val {exp=exp,ty} = transExp ( E.baseVenv
                                    , { break=NONE
                                      , level=E.initLevel}) absyn
    in
        if ty=Ty.UNIT
        then Tr.procEntryExit {level = E.initLevel, body = exp }
        else Tr.funEntryExit {level = E.initLevel, body = exp};
        Tr.getResult ()
    end
        
end (* IRgen *)
