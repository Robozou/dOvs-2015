(* AU Compilation 2015.
 *
 * This the main working file for Part 4 - Semantic Analysis
 *
 *)



(* Our signature that for the semantic interface exposes only one function. *)

signature SEMANT =
sig
  val transProg: Absyn.exp -> TAbsyn.exp
end

structure Semant :> SEMANT =
struct


structure S = Symbol
structure A = Absyn
structure E = Env
structure Ty = Types
structure PT = PrintTypes
structure TAbs = TAbsyn

(* Use the extra record to add more information when traversing the tree
   It should become obvious when you actually need it, what to do.
   Alternatively, you have to add extra parameters to your functions *)

type extra = {}

(* placehloder for declarations, the final code should compile without this *)
val TODO_DECL = TAbs.TypeDec [] (* Delete when possible *)

(* Error messages *)

val err = ErrorMsg.error

fun out msg pos = err pos msg

fun errorInt (pos, ty) =
    err pos ("INT required, " ^ PT.asString ty ^ " provided")

fun errorUnit (pos, ty) =
    err pos ("UNIT required, " ^ PT.asString ty ^ " provided")

fun errorNil (pos, id) =
    err pos ("need to give " ^ S.name id ^ " a type when assigning the value nil")

fun errorTypUnd (pos, ty) =
    err pos ("type  " ^ S.name ty ^ " undefined")

fun errorTypMis (pos, exp, act) =
    err pos ("type mismatch, expected " ^ exp ^ " but found " ^ act)

(* Write additional error messages here *)


(* -- Helper functions -- *)

(* Use the below three funs like:
   throw errorUnit (pos,ty) ifFalse isUnit(_) *)

fun ifTrue test err args = if test
                           then err args
                           else ()

fun ifFalse test err args = if test
                            then ()
                            else err args

fun throw err args testFun test  = testFun test err args


fun lookupTy tenv sym pos =
    let
        val tyOpt = S.look (tenv, sym)
    in
        Ty.ERROR (* TODO *)
    end

fun actualTy (Ty.NAME (s, ty)) pos =
    Ty.ERROR (* TODO *)
  | actualTy t _ = t

fun checkInt (ty, pos) =
    case ty
     of Ty.INT => ()
      | Ty.ERROR => ()
      | _ => errorInt (pos, ty)

fun isUnit (ty) =
    case ty
     of Ty.UNIT => true
      | Ty.ERROR => true
      | _ => false

fun checkAssignable (declared: Ty.ty, assigned: Ty.ty, pos, msg) =
    let
        val aDeclared = actualTy declared pos
        val aAssigned = actualTy assigned pos
    in
        () (* TODO *)
    end


fun makeTypedVarDec (idsym, ty, e, esc) =
                  { name = idsym
		  , escape = esc
	          , ty = ty
	          , init = e} : TAbsyn.vardecldata

  


fun tyToString(ty) =
   case ty of
	Ty.NIL => "nil"
      | Ty.INT => "int"
      | Ty.STRING => "string"
      | Ty.RECORD(_,_) => "record"
      | Ty.ARRAY(t,_) => "array of " ^ tyToString(t)
      | Ty.UNIT => "unit"
      | Ty.NAME(s,t) => "name of " ^ S.name(s)
      | Ty.ERROR => "error" 					   


fun compareTypes(t1,t2, pos) =
  if(t1 <> t2) then
      case (t1,t2) of
	  (Ty.RECORD(_,_),Ty.NIL) => ()
       |  (Ty.NIL,Ty.RECORD(_,_))  => ()
       |  (_,_) => (errorTypMis(pos,tyToString(t1),tyToString(t2));())
  else ()				 
					   

       

fun transTy (tenv, t) = Ty.ERROR (* TODO *)

fun transExp (venv, tenv, extra : extra) =
    let
        (* this is a placeholder value to get started *)
        val TODO = {exp = TAbs.ErrorExp, ty = Ty.ERROR}

        fun trexp (A.NilExp) = {exp = TAbs.NilExp, ty = Ty.NIL}
          | trexp (A.VarExp var) = trvar var
          | trexp (A.IntExp int) = {exp = TAbs.IntExp int, ty = Ty.INT}
          | trexp (A.StringExp (s,_)) = {exp = TAbs.StringExp s, ty = Ty.STRING}
          (*| trexp (A.BreakExp(_)) = {exp = TAbs.BreakExp , ty = Ty.UNIT}*)
          | trexp (A.CallExp _) = TODO
          | trexp (A.OpExp _) = TODO
          | trexp (A.RecordExp _) = TODO
          | trexp (A.SeqExp _) = TODO
          | trexp (A.AssignExp _) = TODO
          | trexp (A.IfExp _) = TODO
          | trexp (A.WhileExp _) = TODO
          | trexp (A.ForExp _) = TODO
          | trexp (A.LetExp {decls,body,pos}) = 
	    let
		val {decls=decls', tenv=tenv', venv=venv'} = transDecs(venv, tenv, decls, {})
		val {exp,ty} = transExp(venv',tenv', {}) body
                in
		    (*{exp = TAbs.LetExp {decls = decls', body = exp}, ty = ty}*) TODO
	        end 
          | trexp (A.ArrayExp _) = TODO
          | trexp _ = {exp = TAbs.ErrorExp, ty = Ty.ERROR}

        and trvar (A.SimpleVar (id, pos)) = TODO
          | trvar (A.FieldVar (var, id, pos)) = TODO
          | trvar (A.SubscriptVar (var, exp, pos)) = TODO
    in
        trexp
    end

and transDec ( venv, tenv, A.VarDec {name, escape, typ = NONE, init, pos}, extra : extra) =
             let
                val {exp, ty} = transExp(venv, tenv, {}) init
              in
                (if (ty = Ty.NIL) then errorNil(pos,name) else ();
                  {decl = TAbs.VarDec {name = name, escape = escape, ty = ty, init = {exp = exp,ty = ty}} , tenv = tenv, venv = S.enter(venv, name, E.VarEntry{ty = ty})}) (* TODO *)
             end
  | transDec ( venv, tenv
             , A.VarDec {name, escape, typ = SOME (s, pos), init, pos=pos1}, extra) =
             let
		 val {exp, ty} = transExp(venv, tenv, {}) init
	     in
		 case S.look(tenv,s) of
		     NONE =>     (errorTypUnd(pos,s); {decl = TAbs.VarDec {name = name, escape = escape, ty = ty, init = {exp = exp, ty = ty}}, tenv = tenv, venv = S.enter(venv, name, E.VarEntry{ty = ty})}) (* TODO *)
                  |  SOME(typ) =>    
	              (* 1. Check actual type
		         2. Compare init type to dec type*)
		       let val acttyp = actualTy typ pos (* TODO: Implement actualTy*)
                         in
			   (compareTypes(typ,ty,pos);
			   {decl = TAbs.VarDec{name = name, escape = escape, ty = acttyp, init = {exp = exp, ty = acttyp}}, tenv = tenv, venv = S.enter(venv, name, E.VarEntry{ty = acttyp})})
		       end
             end
  | transDec (venv, tenv, A.TypeDec tydecls, extra) =
    {decl = TODO_DECL, tenv = tenv, venv = venv} (* TODO *)

  | transDec (venv, tenv, A.FunctionDec fundecls, extra) =
    {decl = TODO_DECL, tenv = tenv, venv = venv} (* TODO *)

and transDecs (venv, tenv, decls, extra : extra) =
    let fun visit venv tenv decls result =
            case decls
             of [] => {decls = result, venv = venv, tenv = tenv}
              | (d::ds) =>
                let
                    val { decl = decl
                        , venv = venv'
                        , tenv = tenv'} = transDec (venv, tenv, d, extra)
                in
                    visit venv' tenv' ds (result @ (decl :: []))
                end
    in
        visit venv tenv decls []
    end

fun transProg absyn =
    transExp (Env.baseVenv, Env.baseTenv, {}) absyn

end (* Semant *)
