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



fun listprint (seen, init) =
  case seen of
      [] => init
   |  [x] =>  init ^ S.name x ^ "]"
   |  (x::xs) => listprint(xs, init ^ S.name x ^ ", ")

fun listprintprime (seen) =
  foldl (fn (x,l) => l ^ S.name x ^ " ") "[ " seen
		     
type extra = {break : bool, assign : S.symbol list option}

(* placehloder for declarations, the final code should compile without this *)
val TODO_DECL = TAbs.TypeDec [] (* Delete when possible *)
val TODO_FUN = TAbs.FunctionDec [] (* Delete when possible *)

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

fun errorCycleFound (pos,n,seen) =
  err pos ("found cycle for " ^ S.name n ^ " in type dec list " ^ listprintprime(seen) ^ "]")

fun errorFieldNotInRec (pos, id) =
  err pos ("field '" ^ S.name id ^"' not in record")

fun errorTypMis (pos, exp, act) =
  err pos ("type mismatch, expected " ^ exp ^ " but found " ^ act)

fun errorFunUnd (pos, func) =
  err pos ("function " ^ S.name func ^ " is undefined")

fun errorFoundNeed (pos, found, need, name) =
  err pos ("found " ^ found ^ " " ^ S.name name ^ " should have been " ^ need)

fun errorFormalMismatch (pos, lenf, lenga) =
  err pos ("found argument list of length " ^
	   Int.toString(lenf) ^ " but should have been " ^
	   Int.toString(lenga))

fun errorVarUndef (pos, var) =
  err pos ("var " ^ S.name var ^ " is undefined")

fun errorNotARec (pos, id) =
  err pos (S.name id ^ " not a record")

fun errorTodo (pos) =
  err pos ("unfinished code in compiler")

fun errorDuplicate (pos, name) =
  err pos ("duplicate " ^ S.name name)

fun errorFunRet (pos,exp,act) =
  err pos ("found return type " ^ act  ^ " expected " ^ exp)

fun errorCompErr (pos) =
  err pos ("error in compiler")

fun errorNoTypInName (pos, name) =
  err pos ("no type in name " ^ name)

fun errorNotAssignable (pos, var) =
  err pos ("can't assign to variable " ^ S.name var)

fun errorDuplicateField (pos, field) =
  err pos ("duplicate field '" ^ S.name field ^ "' in record")



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

fun makeTypDecData (name, ty) =
  {name = name, ty = ty} : TAbs.tydecldata

fun makeFunDecData (name, params, resultTy, body) =
  {name = name, params = params, resultTy = resultTy, body = body} : TAbs.fundecldata



fun lookupTy tenv sym pos =
  let
      val tyOpt = S.look (tenv, sym)
  in
      case tyOpt of
	  NONE   => (errorTypUnd(pos,sym);Ty.ERROR)
	| SOME(t) =>  t
  end

fun actualTy (Ty.NAME (s, ty)) pos =
  let
  in
      case !ty of
	  NONE =>  Ty.ERROR
       |  SOME ty => actualTy ty pos
  end
  | actualTy (Ty.ARRAY(t,u)) pos = Ty.ARRAY(actualTy(t) pos,u)
  | actualTy t _ = t


fun checkdup ([],[]) = ()
  | checkdup (name::xs, pos::poss) =
    if (List.all (fn (x) => (name <> x)) xs)
    then checkdup(xs,poss)
    else (errorDuplicate(pos, name))
  | checkdup (_,_) = ()



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

fun compareTypes (t1,t2, pos) =
  let val act = actualTy t1 pos
  in
      if(act <> t2) then
	  case (act,t2) of
	      (Ty.RECORD(_,_),Ty.NIL) => ()
	   |  (Ty.NIL,Ty.RECORD(_,_))  => ()
	   |  (_,_) => (errorTypMis(pos,PT.asString(act),PT.asString(t2));())
      else ()
  end

fun typEq (t1,t2,ty,pos) =
  if (t1 <> ty) then
      (errorTypMis(pos,PT.asString(ty),PT.asString(t1));())
  else if (t2 <> ty) then
      (errorTypMis(pos,PT.asString(ty),PT.asString(t2));())
  else ()

fun transTy (tenv, t) = (* TODO: Return ERROR or tell user there is an error *)
  case t of A.NameTy(s,p) => (case S.look(tenv,s) of SOME(t) => t
						   | NONE => (errorTypUnd(p,s); Ty.ERROR))
          | A.ArrayTy(s,p) => (case S.look(tenv,s) of SOME(t) => Ty.ARRAY(t, ref())
                                                    | NONE => (errorTypUnd(p,s); Ty.ERROR))
          | A.RecordTy(fields) => (if (checkFieldDuplicates(fields))
				  then Ty.RECORD(recList(fields, tenv), ref())
				  else Ty.ERROR) (* TODO: Return ERROR or tell user there is an error *)
and checkFieldDuplicates (fields) =
    (case fields of
	[] => true
      | ({name,escape,typ,pos}::xs) => (if (checkFieldWithRest(name,xs,pos))
					then checkFieldDuplicates(xs)
					else false))
and checkFieldWithRest (n, rest, pos) =
    (if (List.all (fn ({name,escape,typ,pos}) => n <> name) rest)
     then true
     else (errorDuplicateField(pos,n); false))
and recList (fields, tenv) =
    let val ret = foldl (fn ({name,escape,typ = (s,p), pos},l) =>
			    case S.look(tenv,s) of
				NONE => (errorTypUnd(pos,s);l)
			     |  SOME(t) => l @ [(name,t)])  [] fields
    in
	ret
    end

fun transExp (venv, tenv, extra : extra) =
  let
      (* this is a placeholder value to get started *)
      val TODO = {exp = TAbs.ErrorExp, ty = Ty.ERROR}
      val TODO_NIL = {exp = TAbs.NilExp, ty = Ty.NIL}

      fun trexp (A.NilExp) = {exp = TAbs.NilExp, ty = Ty.NIL}
        | trexp (A.VarExp var) = trvar var
        | trexp (A.IntExp int) = {exp = TAbs.IntExp int, ty = Ty.INT}
        | trexp (A.StringExp (s,_)) = {exp = TAbs.StringExp s, ty = Ty.STRING}
        | trexp (A.BreakExp(_)) = let val breakex as {break = breakbool, assign = NONE} = extra
				  in
				      if  (breakbool)
				      then {exp = TAbs.BreakExp , ty = Ty.UNIT}
				      else TODO
				  end
        | trexp (A.CallExp {func, args, pos}) =
	  (case S.look(venv,func) of
	       NONE => (errorFunUnd(pos,func);TODO)
	     | SOME (E.VarEntry{ty}) => (errorFoundNeed(pos, "function" , "var", func); TODO)
	     | SOME (E.FunEntry{formals,result}) =>
	       let (* 1. Go through formals and create a list of types expressions
			    2. Return TAbs.CallExp with call data of function symb and typed exps
			 Going through the formal list:
			    1. Create a function that takes the value env, typ env, exps, accumulator
			    2. This function should pattern match on A.CallExp formals
			    3. If empty list return accumulator
			    4. If 1 element return typed version of expression and put into a list
			    5. If multiple elements: concat typed version of new exp and call recursively
		    *)
		   val typexps = getTypExps(venv, tenv, args)
	       in (checkformals(formals,typexps,pos);
		   {exp = TAbs.CallExp {func = func, args = typexps}, ty = actualTy result pos}) end)
        | trexp (A.OpExp {left,oper,right,pos}) =
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
	  in  if (bop = TAbs.EqOp orelse bop = TAbs.NeqOp)
              then (case actualTy lty pos of
			Ty.INT => (compareTypes(Ty.INT, actualTy rty pos,pos);
				   (case rty of
					Ty.INT =>
					{exp = TAbs.OpExp{left = lexp, oper = bop, right = rexp},
					 ty = Ty.INT}
				     |  _ => {exp = TAbs.OpExp{left = lexp, oper = bop, right = TODO},
					      ty = Ty.INT}))
		      | Ty.STRING => (compareTypes(Ty.STRING, actualTy rty pos,pos);
				      (case rty of
					   Ty.STRING =>
					   {exp = TAbs.OpExp{left = lexp, oper = bop, right = rexp},
					    ty = Ty.INT}
					|  _ => {exp = TAbs.OpExp{left = lexp, oper = bop, right = TODO},
						 ty = Ty.INT}))				      
		      | Ty.ARRAY(t,u) => (compareTypes(Ty.ARRAY(t,u),actualTy rty pos,pos);
					  (case rty of
					       Ty.ARRAY(t,u) =>
					       {exp = TAbs.OpExp{left = lexp, oper = bop, right = rexp},
						ty = Ty.INT}
					    |  _ => {exp = TAbs.OpExp{left = lexp, oper = bop, right = TODO},
						     ty = Ty.INT}))
		      | Ty.RECORD(fs,u) => (compareTypes(Ty.RECORD(fs,u), actualTy rty pos,pos);
					    (case rty of
						 Ty.RECORD(fs,u) =>
						 {exp = TAbs.OpExp{left = lexp, oper = bop, right = rexp},
						  ty = Ty.INT}
					      |  _ =>
						 {exp = TAbs.OpExp{left = lexp, oper = bop, right = TODO},
						  ty = Ty.INT}))
		      | t => (errorTypMis(pos, " int, string, array or record ", PT.asString(t));
			      {exp = TAbs.OpExp{left = lexp, oper = bop, right = rexp},
			       ty = Ty.ERROR}))
	      else if (bop = TAbs.PlusOp orelse bop = TAbs.MinusOp
		       orelse bop = TAbs.TimesOp orelse bop = TAbs.ExponentOp)
	      then 
		  (typEq(actualTy lty pos, actualTy rty pos,Ty.INT,pos);
		   {exp = TAbs.OpExp{left = lexp, oper = bop, right = rexp},
		    ty = Ty.INT})
	      else (case actualTy lty pos of
			Ty.INT => (compareTypes(Ty.INT, actualTy rty pos,pos);
				   (case actualTy rty pos of
					Ty.INT =>
					{exp = TAbs.OpExp{left = lexp, oper = bop, right = rexp},
					 ty = Ty.INT}
				      | _ =>
					{exp = TAbs.OpExp{left = lexp, oper = bop, right = TODO},
					 ty = Ty.INT}))
		      | Ty.STRING => (compareTypes(Ty.STRING, actualTy rty pos,pos);
				      (case actualTy rty pos of
					   Ty.STRING =>
					   {exp = TAbs.OpExp{left = lexp, oper = bop, right = rexp},
					    ty = Ty.INT}
					 | _ =>
					   {exp = TAbs.OpExp{left = lexp, oper = bop, right = TODO},
					    ty = Ty.INT}))
		      | t => (errorTypMis(pos, " int or string ", PT.asString(t)); TODO)) 
	  end
        | trexp (A.RecordExp {fields,typ,pos}) =
	  (case S.look(tenv, typ) of
	       NONE => (errorTypUnd(pos,typ);TODO)
	    |  SOME(t) => let val act = actualTy t pos
			  in
			      (case act of
				   Ty.RECORD(tfs,u) => (
				    let val defFields = convertRecFields(tenv, venv, fields)
				    in
					(compareRecfields(tfs,fields,pos);
					 {exp = TAbs.RecordExp {fields = defFields}, ty = act})
				    end)
				 | t => (errorTypMis(pos,"record",PT.asString(act));TODO))
			  end)
        | trexp (A.SeqExp (exps)) =
	  let val texp = getSeqFromExps(venv, tenv, exps, [], extra)
          in
	      texp
	  end
        | trexp (A.AssignExp {var = v,exp = e, pos}) =
	  let val extrarec as {break = _, assign = asslist} = extra
	      val actualvar = (case v of A.SimpleVar(s,p) => s
				      | A.FieldVar(v,s,p) => s
				      | A.SubscriptVar(v,e,p) => S.symbol("_")) (* HACK: ID invalid *)
	      val tvar as {exp = tyvar, ty = varty} = trvar v
	      val texp as {exp = tyexp, ty = expty} = trexp e
          in
	      (compareTypes(varty, actualTy expty pos, pos);
	       let val actvar =
		       (case tyvar of (TAbs.VarExp {var = var', ty = ty'}) => {var = var', ty = ty'}
				   | _ => {var = TAbs.SimpleVar(S.symbol("_")), ty = Ty.ERROR})
	       in
		   (case asslist of
			NONE =>
	       		{exp = TAbs.AssignExp {var = actvar, exp = texp}, ty = Ty.UNIT}
		      | SOME(x) =>
			(let fun checkVar([x]) =
			       (if (actualvar = x)
				then (errorNotAssignable(pos,x); {exp = TAbs.ErrorExp,
				      ty = Ty.UNIT})
				else {exp = TAbs.AssignExp {var = actvar, exp = texp},
				      ty = Ty.UNIT})
			       | checkVar (x::xs) =
				 (if (actualvar = x)
				  then (errorNotAssignable(pos,x); {exp = TAbs.ErrorExp,
				      ty = Ty.UNIT})
				  else checkVar(xs))
			       | checkVar([]) = {exp = TAbs.AssignExp {var = actvar, exp = texp},
				      ty = Ty.UNIT} 
			 in
			     checkVar(x)
			 end))
	       end)
	  end
        | trexp (A.IfExp {test,thn,els,pos}) =
	  let val test' as {exp = testexp, ty = tty} = trexp test
	      val thn'  as {exp = thenexp, ty = thty} = trexp thn
	  in
	      (compareTypes(tty, Ty.INT,pos);
	       let val els' =
		       case els of
			   NONE => (compareTypes(Ty.UNIT, actualTy thty pos,pos); NONE)
			 | SOME e =>
			   let val elexp as {exp = exp, ty = ety} = trexp e
			   in
			       (compareTypes(thty, actualTy ety pos, pos); SOME elexp)
			   end
	       in
		   {exp = TAbs.IfExp {test = test', thn = thn', els = els'}, ty = actualTy thty pos}
	       end)
	  end
        | trexp (A.WhileExp {test,body,pos}) =
	  let val test' as {exp = _, ty = tty} = trexp test
              val body' as {exp = _, ty = bty} = transExp (venv, tenv, {break = true, assign = NONE}) body
	  in
	      (compareTypes(Ty.INT, actualTy tty pos, pos);
	       compareTypes(Ty.UNIT, actualTy bty pos, pos);
	       {exp = TAbs.WhileExp {test = test', body = body'}, ty = Ty.UNIT})
	  end
        | trexp (A.ForExp {var, escape, lo, hi, body, pos}) = 
	  let val tlo as {exp = _, ty = tylo} = trexp lo
	      val thi as {exp = _, ty = tyhi} = trexp hi
	      val venv' = S.enter(venv, var, E.VarEntry{ty = Ty.INT})
	      val extraAss as {break = _, assign = assignlist} = extra
	      val asslist = (case assignlist of
				 NONE => []
			       | SOME(x) => x)
	      val tbody as {exp = _, ty = tybody} =
		  transExp(venv', tenv,
			   {break = true, assign = SOME(var :: asslist)}) body
	  in
	      (typEq(actualTy tylo pos, actualTy tyhi pos,Ty.INT,pos);
	       compareTypes(Ty.UNIT,tybody, pos);
	       {exp = TAbs.ForExp {var = var, escape = escape, lo = tlo, hi = thi, body = tbody},
		ty = Ty.UNIT})
	  end
        | trexp (A.LetExp {decls,body,pos = _}) =
	  let
	      val {decls=decls', tenv=tenv', venv=venv'} = transDecs(venv, tenv, decls, {break = false,
											 assign = NONE})
	      val bexp as {exp = _, ty = bty} = transExp(venv',tenv', {break = false, assign = NONE}) body
          in
	      {exp = TAbs.LetExp {decls = decls', body = bexp},
	       ty = bty}
	  end
        | trexp (A.ArrayExp {typ, size, init, pos}) =
	  (case S.look(tenv,typ) of
	       NONE => (errorTypUnd (pos,typ); TODO)
	    |  SOME typ => let val act = (actualTy(typ) pos)
			   in
			       case act of
				   Ty.ARRAY(att,u) =>
				   let val tinit as {exp = inexp, ty = inty} = trexp init
				       val tsize as {exp = sizexp, ty = sizty} = trexp size
				   in
				       (compareTypes(Ty.INT, actualTy sizty pos, pos);
					compareTypes(att, actualTy inty pos, pos);
					{exp = TAbs.ArrayExp {size = tsize, init = tinit}, ty = act})
				   end
				 | t => (errorTypMis(pos, PT.asString(act), "array"); TODO)
			   end )
      and trvar (A.SimpleVar (id, pos)) =
	  (case S.look(venv, id) of
	       NONE =>
	       (errorVarUndef(pos,id); TODO)
	     | SOME (E.FunEntry{formals,result}) =>
	       (errorFoundNeed(pos, "function", "var", id);TODO)
	     | SOME (E.VarEntry{ty}) =>
	       {exp = TAbs.VarExp {var = TAbs.SimpleVar(id), ty = actualTy ty pos}, ty = actualTy ty pos})
        | trvar (A.FieldVar (var, id, pos)) = (* TODO: Doesn't actually check field type at the moment *)
	  let val tvar as {exp = varex, ty = vty} = trvar var
	      val actvty = actualTy vty pos
	  in
	      (case actvty of
		   Ty.RECORD(fields,u) =>
		   (let val varTy = checkIfFieldExists(fields,id,pos)
			val typedVar =
			    (case varex of (TAbs.VarExp {var = var', ty = _}) => var'
					| _ => TAbs.SimpleVar(S.symbol "_")) (* <= ERROR*)
		    in 
			{exp = TAbs.VarExp {var = TAbs.FieldVar ({var = typedVar, ty = actvty}, id),
					    ty = varTy}
			,ty = actualTy varTy pos}
		    end)
		 | t => (errorTypMis(pos,"record", PT.asString(actualTy t pos)); TODO))
	  end
        | trvar (A.SubscriptVar (var, exp, pos)) =
	  let val tvar as {exp = varex, ty = vty} = trvar var
	  in
	      (case vty of
		   Ty.ARRAY(ty,u) =>
		   let val exp' as {exp = exp, ty = ty'} =
			   transExp(venv,tenv,{break = false, assign = NONE}) exp
		       val typedVar =
			   (case varex of (TAbs.VarExp {var = var', ty = _}) => var'
				       | _ => TAbs.SimpleVar(S.symbol "_")) (* <= ERROR*)
		   in
		       (case ty' of
			    Ty.INT =>
			    {exp = TAbs.VarExp {var =
						TAbs.SubscriptVar(
						    {var = typedVar, ty = ty},exp'),
						ty = ty}, (* TODO: Is this actual type? *)
			     ty = ty}
			 |  t => TODO)
		   end
		 | t => (errorTypMis(pos, "array", PT.asString(t)); TODO))
	  end	      
  in
      trexp
  end
and convertRecFields(venv, tenv, fields) =
    let val newFields =
	    foldl (fn ((s,e,p),l) =>
		      let val trexp = transExp(tenv, venv, {break = false, assign = NONE}) e
		      in
			  l @ [(s,trexp)]
		      end) [] fields
    in
	newFields
    end
and compareRecfields(fs,tfs,pos) =
    let val lengfs = length fs
	val lengtfs = length tfs
    in
	if(lengfs <> lengtfs) then (errorFormalMismatch(pos,lengfs,lengtfs);()) else
	(case tfs of
	     [] => ()
	  |  [(s,e,p)] => ()
	  |  ((s,e,p)::xs) => ())
    end
and checkIfFieldExists(fields,id,pos) =
    (case fields of
	 [] => (errorFieldNotInRec(pos,id); Ty.ERROR)
       | 	[(s,t)] => if(s = id) then t else (errorFieldNotInRec(pos,id); Ty.ERROR)
       |  ((s,t)::xs) => if(s = id) then t else checkIfFieldExists(xs, id, pos))			 
and checkformals (forms, args, pos) = 
    let val lenf = length forms
	val lena = length args
    in if (lenf <> lena)
       then (errorFormalMismatch(pos, lena, lenf); ())
       else let fun test([x],[{exp, ty}]) = compareTypes(x, ty, pos)
                  | test((x::xs), ({exp, ty}::exps)) = (compareTypes(x, ty, pos); test(xs, exps))
                  | test([],[]) = ()
                  (* Boilerplate to avoid nonexhaustive match warning *)
                  | test([x],[]) = (errorFormalMismatch(pos, lena, lenf); ())
                  | test([],[x]) = (errorFormalMismatch(pos, lena, lenf); ())
                  | test((x::xs),[]) = (errorFormalMismatch(pos, lena, lenf); ())
                  | test([],(x::xs)) = (errorFormalMismatch(pos, lena, lenf); ())
            in test(forms, args)
            end
    end
and getTypExps (venv, tenv, exps) =
    let val typExps =
	    foldl (fn ((x,p),l) =>
		      let val texp = transExp(venv, tenv, {break = false, assign = NONE}) x
		      in
			  l @ [texp]
		      end) [] exps
    in
	typExps
    end
and getSeqFromExps (venv, tenv, exps, inp, extra : extra) =
    case exps of
        []      => {exp = TAbs.SeqExp(inp), ty = Ty.UNIT}
     |  [(x,p)] => let val texp as {exp = _, ty = typ} = transExp(venv, tenv, extra) x
		   in
		       {exp = TAbs.SeqExp(inp @ [texp]), ty = typ}
		   end
     |  ((x,p)::xs) => let val texp as {exp = _, ty = typ} = transExp(venv,tenv, extra) x
		       in
			   getSeqFromExps(venv, tenv, xs, inp @ [texp], extra)
		       end
and transDec (venv, tenv, A.VarDec {name, escape, typ = NONE, init, pos}, extra : extra) =
    let
        val {exp, ty} = transExp(venv, tenv, {break = false, assign = NONE}) init
    in
        (if (ty = Ty.NIL) then errorNil(pos,name) else ();
         {decl = makeVarDec(name,escape,ty,{exp = exp, ty = ty}),
	  tenv = tenv,
	  venv = S.enter(venv, name, E.VarEntry{ty = ty})})
    end
  | transDec ( venv, tenv
               , A.VarDec {name, escape, typ = SOME (s, pos), init, pos=pos1}, extra) =
    let
	val {exp, ty} = transExp(venv, tenv, {break = false, assign = NONE}) init
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
		(case ty of
		     Ty.NIL => {decl = makeVarDec(name,escape,ty,{exp = exp, ty = acttyp}),
				tenv = tenv,
				venv = S.enter(venv, name, E.VarEntry{ty = acttyp})}
		  |  _  => (compareTypes(acttyp,actualTy ty pos,pos);
			    {decl = makeVarDec(name,escape, actualTy ty pos,
					       {exp = exp, ty = acttyp}),
			     tenv = tenv,
			     venv = S.enter(venv, name, E.VarEntry{ty = acttyp})}))
	    end
    end
  | transDec (venv, tenv, A.TypeDec tydecls, extra) =
    (* Type Declarations:
       1. Check for cyclic definition (i.e. a -> b -> c -> a is illegal)
     *)
    let val tydecs as {decl = decls  , tenv = tenv', venv = venv} = makeTypDec(tydecls,tenv, venv)
    in
	(checkdup(map #name tydecls, map #pos tydecls);
	 (checkcycles(tenv',tydecls));
	 tydecs)
    end(* TODO *)

  | transDec (venv, tenv, A.FunctionDec fundecls, extra) =
    let val fundecs = makeFunDecs(fundecls,tenv, venv)
    in
	(checkdup(map #name fundecls, map #pos fundecls);
	 fundecs)
    end
and checkcycles (tenv,decs) =
    (case decs of
	 ({name,ty,pos}::xs) =>
	 let val xs = xs
	 in
	     (case S.look(tenv,name) of
		  NONE => ()
		| SOME(Ty.NAME(_,r)) => (checkcycle(tenv,!r,[name],pos);checkcycles(tenv,xs))
		| _ => ())
	 end
       | _ => ())
and checkcycle (tenv, cur, seen, pos) =
    (case cur of
	 SOME(Ty.NAME(n,r)) => (if (List.all(fn (x) => n <> x) seen)
				then checkcycle(tenv,!r,n::seen,pos)
				else errorCycleFound(pos,n,seen))
       | NONE => ()
       | _ => ())
and makeFunDecs (decls, tenv, venv) = (* Maybe literally the ugliest function we have ever made *)
    let val venv'
	    = foldl (fn ({name, params, result, body,pos}, venv) =>
			let val resultTy = (case result of
						NONE => Ty.UNIT
					     |  SOME(s,pos) =>
						(case S.look(tenv,s) of
						     SOME(t) => t
						  |  NONE => (errorTypUnd(pos,s);Ty.ERROR)))
			    fun transparam{name,escape,typ = (t,p),pos} =
			      case S.look(tenv,t)
			       of SOME t => {name=name,ty=t,escape = escape}
				| NONE => (errorTypUnd(pos,t);{name=name,ty=Ty.ERROR,escape = escape})
			    val params' = map transparam params
			    val funEntr = E.FunEntry{formals = map #ty params',
						     result=resultTy}
			in
			    S.enter(venv,name,funEntr)
			end) venv decls
	val venv'' =
	    foldl (fn ({name, params, result, body, pos}, venv) =>
		      let fun transparam{name,escape,typ = (t,p),pos} =
			    case S.look(tenv,t)
			     of SOME t => {name=name,ty=t,escape = escape}
			      | NONE => (errorTypUnd(pos,t);{name=name,ty=Ty.ERROR,escape = escape})
			  val params' = map transparam params
			  fun enterparam ({name,ty,escape},venv) =
			    S.enter(venv,name,
				    E.VarEntry{ty=ty})
			  val venv'' = foldl enterparam venv' params'
			  val body' as {exp = _, ty = bty} = transExp(venv'',tenv, {break = false,
										    assign = NONE}) body
		      in
			  venv
		      end) venv decls
	fun transFuncs{name,params,result,body,pos} =
	  (let fun transparam{name,escape,typ = (t,p),pos} =
		 (case S.look(tenv,t)
		   of SOME t => {name=name,ty=t,escape = escape}
		    | NONE => (errorTypUnd(pos,t);{name=name,ty=Ty.ERROR,escape = escape}))
	       val params' = map transparam params
	       val res' = (case result of
			       NONE => Ty.UNIT
			    |  SOME(s,pos) =>
			       (case S.look(tenv,s) of
				    SOME(t) => t
				 |  NONE => (errorTypUnd(pos,s);Ty.ERROR)))
	       fun enterparam ({name,ty,escape},venv) =
		 S.enter(venv,name,
			 E.VarEntry{ty=ty})
	       val venv'' = foldl enterparam venv' params'
	       val body' as {exp = _, ty = bty} = transExp(venv'', tenv, {break = false, assign = NONE}) body
	   in
	       case S.look(venv',name) of
		   SOME s => {name = name, params = params', resultTy = res', body = body'}
		 | NONE => {name = name, params = params', resultTy = Ty.ERROR, body = body'}
	   end)
	val funcs = map transFuncs decls
    in
	{decl = TAbs.FunctionDec funcs, venv = venv', tenv = tenv}
    end
and makeTypDec (decls, tenv, venv) =
    (let val tenv' = foldl (fn ({name,ty,pos},env) =>
			       (S.enter(env,name, Ty.NAME(name,ref NONE)))) tenv decls
	 val tenv'' = foldl (fn ({name,ty,pos},env) =>
				(case S.look(env,name)
				  of
				     SOME(Ty.NAME(n,r)) =>
				     (r := SOME(transTy(env,ty)); env)
				  |  _ => (errorNoTypInName(pos,S.name name); env))) tenv' decls
	 fun transDecls{name,ty,pos} =
	   case S.look(tenv'',name) of
	       SOME t => {name = name, ty = t}
	     | NONE => {name = name, ty = Ty.ERROR} 
	 val newData = map transDecls decls
     in {decl = TAbs.TypeDec newData, tenv = tenv'', venv = venv} end)			    
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
  transExp (Env.baseVenv, Env.baseTenv, {break = false, assign = NONE}) absyn

end (* Semant *)
