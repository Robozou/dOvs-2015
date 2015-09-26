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



fun makeVarDec (name, escape, ty, init) =
  TAbs.VarDec {name = name, escape = escape, ty = ty, init = init}

fun lookupTy tenv sym pos =
    let
        val tyOpt = S.look (tenv, sym)
    in
        Ty.ERROR (* TODO *)
    end

fun actualTy (Ty.NAME (s, ty)) pos =
    let in case !ty of
	NONE =>  Ty.ERROR
     |  SOME ty => actualTy ty pos end
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



fun tyToString (ty) =
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
					   
fun typEq(t1,t2,ty,pos) =
  if (t1 <> ty) then
      (errorTypMis(pos,tyToString(t1),tyToString(ty));())
  else if (t2 <> ty) then
      (errorTypMis(pos,tyToString(t2),tyToString(ty));())
  else ()
      


fun transTy (tenv, t) = Ty.ERROR (* TODO *)

fun transExp (venv, tenv, extra : extra) =
    let
        (* this is a placeholder value to get started *)
        val TODO = {exp = TAbs.ErrorExp, ty = Ty.ERROR}
        val TODO_NIL = {exp = TAbs.NilExp, ty = Ty.NIL}		       

        fun trexp (A.NilExp) = {exp = TAbs.NilExp, ty = Ty.NIL}
          | trexp (A.VarExp var) = trvar var
          | trexp (A.IntExp int) = {exp = TAbs.IntExp int, ty = Ty.INT}
          | trexp (A.StringExp (s,_)) = {exp = TAbs.StringExp s, ty = Ty.STRING}
          (*| trexp (A.BreakExp(_)) = {exp = TAbs.BreakExp , ty = Ty.UNIT}*)
          | trexp (A.CallExp _) = TODO
          | trexp (A.OpExp {left,oper,right,pos}) = (* Missing actual typing at the bottom *)
	    let val lexp as {exp = _, ty = lty} = trexp left
		val rexp as {exp = _, ty = rty} = trexp right
  		val bop = case oper of
			      A.EqOp  => TAbs.EqOp
		            | A.NeqOp => TAbs.NeqOp
 		            | A.LtOp => TAbs.LtOp
 			    | A.LeOp => TAbs.LeOp
			    | A.GtOp => TAbs.GtOp
			    | A.GeOp => TAbs.GeOp
			    | A.PlusOp => TAbs.PlusOp
			    | A.MinusOp => TAbs.MinusOp
			    | A.TimesOp => TAbs.TimesOp
			    | A.DivideOp => TAbs.DivideOp
			    | A.ExponentOp => TAbs.ExponentOp
	    in (typEq(lty,rty,Ty.INT,pos);
		{exp = TAbs.OpExp{left = lexp, oper = bop, right = rexp},
		 ty = lty}) (* <= TODO: Missing actual typing *)
	    end
          | trexp (A.RecordExp _) = TODO
          | trexp (A.SeqExp (exps)) = 
	    let val texp = getTypFromExps(venv, tenv, exps, [])
            in
		texp
	    end
          | trexp (A.AssignExp {var = v,exp = e, pos = _}) = TODO
          | trexp (A.IfExp {test,thn,els,pos}) =
	    let val test' as {exp = testexp, ty = tty} = trexp test
	        val thn'  as {exp = thenexp, ty = thty} = trexp thn
	    in
		(compareTypes(tty,Ty.INT,pos);
		 let val els' =
			 case els of
			     NONE => (compareTypes(Ty.UNIT,thty,pos); NONE)
			   | SOME e =>
			     let val elexp as {exp = exp, ty = ety} = trexp e
			     in
				 (compareTypes(ety,thty, pos); SOME elexp)
			     end
		 in
		     {exp = TAbs.IfExp {test = test', thn = thn', els = els'}, ty = thty} 
		 end)
	    end
          | trexp (A.WhileExp {test,body,pos}) =
	    let val test' as {exp = _, ty = tty} = trexp test
                val body' as {exp = _, ty = bty} = trexp body
	    in
		(compareTypes(tty, Ty.INT, pos);
		 compareTypes(bty, Ty.UNIT, pos);
		 {exp = TAbs.WhileExp {test = test', body = body'}, ty = Ty.UNIT})
	    end
          | trexp (A.ForExp {var, escape, lo, hi, body, pos}) = TODO
          | trexp (A.LetExp {decls,body,pos = _}) = 
	    let
		val {decls=decls', tenv=tenv', venv=venv'} = transDecs(venv, tenv, decls, {})
		val bexp as {exp = _, ty = bty} = transExp(venv',tenv', {}) body
                in
		    {exp = TAbs.LetExp {decls = decls', body = bexp},
					      ty = bty} 
	        end 
          | trexp (A.ArrayExp {typ, size, init, pos}) =
	    (case S.look(tenv,typ) of
		NONE => (errorTypUnd (pos, typ); TODO)
	     |  SOME typ => let val act = actualTy(typ) in TODO end )
          | trexp _ = TODO

        and trvar (A.SimpleVar (id, pos)) = TODO
          | trvar (A.FieldVar (var, id, pos)) = TODO
          | trvar (A.SubscriptVar (var, exp, pos)) = TODO
    in
        trexp
    end
and getTypFromExps (venv, tenv, exps, inp) =
    case exps of
        []      => {exp = TAbs.SeqExp(inp), ty = Ty.UNIT}
     |  [(x,p)] => let val texp as {exp = _, ty = typ} = transExp(venv, tenv, {}) x
	       in
		   {exp = TAbs.SeqExp(inp @ [texp]), ty = typ}
	       end
     |  ((x,p)::xs) => let val texp as {exp = _, ty = typ} = transExp(venv,tenv, {}) x
	       in
		   getTypFromExps(venv, tenv, xs, inp @ [texp])
	       end
and transDec ( venv, tenv, A.VarDec {name, escape, typ = NONE, init, pos}, extra : extra) =
             let
                val {exp, ty} = transExp(venv, tenv, {}) init
              in
                (if (ty = Ty.NIL) then errorNil(pos,name) else ();
                  {decl = makeVarDec(name,escape,ty,{exp = exp, ty = ty}),
		   tenv = tenv,
		   venv = S.enter(venv, name, E.VarEntry{ty = ty})}) 
             end
  | transDec ( venv, tenv
             , A.VarDec {name, escape, typ = SOME (s, pos), init, pos=pos1}, extra) =
             let
		 val {exp, ty} = transExp(venv, tenv, {}) init
	     in
		 case S.look(tenv,s) of
		     NONE =>     (errorTypUnd(pos,s);
				  {decl = makeVarDec(name,escape,ty,{exp = exp, ty = ty}),
				   tenv = tenv,
				   venv = S.enter(venv, name, E.VarEntry{ty = ty})}) 
                  |  SOME(typ) =>    
	              (* 1. Check actual type
		         2. Compare init type to dec type*)
		       let val acttyp = actualTy typ pos 
                         in
			   (compareTypes(typ,ty,pos);
			   {decl = makeVarDec(name,escape,ty,{exp = exp, ty = acttyp}),
			    tenv = tenv,
			    venv = S.enter(venv, name, E.VarEntry{ty = acttyp})})
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
