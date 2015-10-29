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

exception Bug of string

(* Helper functions *)

fun actualTy (Ty.NAME (_, ref (SOME ty))) = actualTy ty
  | actualTy t = t

val TODO = Tr.bogus

fun transExp (venv, extra : extra) =
    let
        fun trexp {exp=TAbs.NilExp,ty}  =
            Tr.nil2IR ()

          | trexp {exp = TAbs.VarExp var, ty} =
            trvar var

          | trexp {exp=TAbs.IntExp i,ty} =
            Tr.int2IR i

          | trexp {exp = TAbs.StringExp s, ty} =
            Tr.string2IR s

          | trexp {exp = TAbs.OpExp {left as {exp = lexp,ty = lty},
				     oper,
				     right as {exp = rexp, ty = rty}}, ty} =
	    let
		val leftexp = trexp left
		val rightexp = trexp right
		val func = case (actualTy lty, actualTy rty) of
			       (Ty.INT, Ty.INT) => Tr.intOp2IR
			     | (Ty.STRING, Ty.STRING) => Tr.stringOp2IR (* Compare Array and record TODO? *)
			     | (Ty.ARRAY(_,_),Ty.ARRAY(_,_)) => Tr.intOp2IR
			     | (Ty.RECORD(_,_),Ty.RECORD(_,_)) => Tr.intOp2IR
			     | (_ , _) => raise Bug "failed type checking in compiler" (* Is this a bug or no TODO*)
	    in
		case oper of
		    TAbs.PlusOp => func(TAbs.PlusOp,leftexp,rightexp)
		  | TAbs.MinusOp => func(TAbs.MinusOp, leftexp, rightexp)
		  | TAbs.TimesOp => func(TAbs.TimesOp, leftexp, rightexp)
		  | TAbs.DivideOp => func(TAbs.DivideOp, leftexp, rightexp)
		  | TAbs.ExponentOp => func(TAbs.ExponentOp, leftexp, rightexp)
		  | TAbs.LtOp => func(TAbs.LtOp, leftexp, rightexp)
		  | TAbs.LeOp => func(TAbs.LeOp, leftexp, rightexp)
		  | TAbs.GtOp => func(TAbs.GtOp, leftexp, rightexp)
		  | TAbs.GeOp => func(TAbs.GeOp, leftexp, rightexp)
		  | TAbs.EqOp => func(TAbs.EqOp, leftexp, rightexp)
		  | TAbs.NeqOp => func(TAbs.NeqOp, leftexp, rightexp)

	    end

          | trexp {exp = TAbs.CallExp {func, args}, ty} =
            (case S.look (venv, func) of
                 SOME (E.FunEntry {formals, result, level=level', label}) =>
                let
                  fun iter [] = []
                  | iter(x::xs) = trexp(x)::iter(xs)
                in
                 (case result of
                    Ty.UNIT => Tr.procCall2IR(level',#level extra,label,iter(args))
                  | _       => Tr.funCall2IR(level',#level extra,label,iter(args)))
                end
               | SOME (E.VarEntry {ty, ...}) =>
                 raise Bug "VarEntry found"
               | NONE =>
                 raise Bug "Function does not exist")

          | trexp {exp = TAbs.IfExp {test, thn, els}, ty} =
            let
		           val test' = trexp test
		           val thn' = trexp thn
            in
            		case els of
                    NONE => Tr.ifThen2IR(test',thn')
            		  | SOME els =>
            		    let
            			     val els' = trexp els
            		    in
            			     Tr.ifThenElse2IR(test',thn',els')
            		    end
            end

          | trexp {exp = TAbs.WhileExp {test, body}, ty} =
            let
            		val ttest = trexp test
            		val done = Tr.newBreakPoint "done_label"
            		val tbody = transExp (venv, {level = #level extra, break = SOME done}) body
	          in
        	      Tr.while2IR(ttest,tbody, done)
            end
    (* using Tr.newBreakPoint, Tr.while2IR *)

          | trexp {exp = aexp as TAbs.RecordExp {fields}, ty} =
      	    let
          		fun transExps (s,e) = trexp e
          		val exps = map transExps fields
          	in
      		    Tr.record2IR(exps)
      	    end

          | trexp {exp = TAbs.SeqExp [], ty} =
            (* ensure there is some expression if the SeqExp is empty *)
            Tr.seq2IR []

          | trexp {exp = TAbs.SeqExp (aexps as (aexp'::aexps')), ty} =
            let
		          val func = case ty of
			           Ty.UNIT => Tr.seq2IR
			           |  _    => Tr.eseq2IR
		          fun transexps [] = []
		            | transexps (x::xs) = trexp x :: transexps xs
	          in
		          func(transexps(aexps))
	          end

          | trexp {exp = TAbs.AssignExp {var, exp}, ty} =
            let
          	  val var' = trvar var
          	  val exp' = trexp exp
            in
              Tr.assign2IR(var', exp') (* using Tr.assign2IR, checkAssignable *)
            end

          | trexp {exp = TAbs.ForExp {var, escape = ref esc, lo, hi, body}, ty} =
            let
              val tlo = trexp lo
              val thi = trexp hi
              val acc = Tr.allocLocal(#level extra) esc
              val var' = Tr.simpleVar (acc, #level extra)
              val venv' = S.enter( venv,var,(E.VarEntry{ access = acc
                                                       , ty = Ty.INT
                                                       , escape = ref esc}))
              val tbody = transExp(venv',extra) body
            in
              Tr.for2IR(var',Tr.newBreakPoint "done", tlo, thi, tbody)
            end

          | trexp {exp = TAbs.BreakExp, ty} =
            let
              val xtra as {level, break = brk} = extra
            in
          		case brk of
          		    SOME sym => Tr.break2IR sym (* using Tr.break2IR *)
          		  | NONE => Tr.break2IR (S.symbol "break") (* Is this right? *)
            end

          | trexp {exp = term as TAbs.LetExp {decls, body}, ty} =
             let
          		 val ({venv = venv'}, decls') = transDecs(venv, decls, extra)
          		 val body' = transExp (venv', extra) body
             in
          		 Tr.let2IR(decls', body')
             end
              (* using transDecs, transExp, Tr.let2IR *)

          | trexp {exp = TAbs.ArrayExp {size, init}, ty} =
        	   let
            	 val tsize = trexp size
            	 val tinit = trexp init
        	   in
        		   Tr.array2IR(tsize,tinit)
        	   end

          | trexp _ = raise Bug "Unknown expression"

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
         *)

        and trvar {var=TAbs.SimpleVar id, ty} : Tr.exp =
  	    (case S.look(venv,id) of
  		      SOME(E.VarEntry {access, ty, escape}) =>
  		        Tr.simpleVar(access, #level extra)
  	      | SOME(E.FunEntry {formals, ...}) =>
  		        raise Bug "should be variable entry"
  	      | NONE => Tr.simpleVar(Tr.allocLocal(#level extra) true, #level extra))

          | trvar {var=TAbs.FieldVar (var as {var = var', ty = ty'}, id), ty} : Tr.exp =
            (* ignore 'mutationRequested': all record fields are mutable *)

            let
		val tvar = trvar var
		val fields = case ty' of
				 Ty.RECORD(f,u) => f
			       | _ => raise Bug "should be record type"
		fun findOffset ([],_) = 0
		  | findOffset ([(s,t)],i) = if(s <> id)
					 then raise Bug "field not in record"
					 else i
		  | findOffset (((s,t)::xs),i) = if(s = id)
					     then i
					     else findOffset(xs,i+1)
		val offset = findOffset(fields,0) (* TODO: Make sure field is actually in list *)

            in
              Tr.fieldVar(tvar, offset) 
            end

          | trvar {var=TAbs.SubscriptVar (var, exp), ty} : Tr.exp =
            (* ignore 'mutationRequested': all array entries are mutable *)
      	    let
          		val tvar = trvar var
          		val texp = trexp exp
      	    in
          		Tr.subscript2IR(tvar,texp)
      	    end
             (* using Tr.subscript2IR *)

      in
          trexp
      end

and transDec ( venv
             , TAbs.VarDec {name,escape=ref esc,ty,init}
             , explist (* accumulate decl elaboration code *)
             , extra) =
    let
        val initExp = transExp (venv,extra) init
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
    let
      val venv' = foldl (fn({name,params,resultTy,body},env) =>
        let
           val nameString = Temp.newLabel(S.name name)
           fun getref (x) = !x
           val newLevel = Tr.newLevel{ parent = #level extra,
                                         name = nameString,
                                      formals = (map getref((map #escape params)))}
           val funEntry = E.FunEntry{ formals = map #ty params,
                                       result = resultTy,
                                        label = nameString,
                                        level = newLevel}
         in
           S.enter(env,name,funEntry)
        end) venv fundecls
        fun iter[] = []
        |   iter({name,params,resultTy,body}::xs) = (
          let
            val E.FunEntry{formals, result, label, level} =
                (case S.look(venv',name) of
                    SOME(e) => e
                  | NONE    => raise Bug "No label")
            val i = ref 0
            fun enterparam ({name,escape,ty},venv) =
    			    S.enter(venv,
                      name,
                      E.VarEntry{escape=escape,
                                 ty=ty,
                                 access=Tr.accessOfFormal level (i := !i + 1; !i) (!escape)
                                 }) (* Another way to count formals? TODO *)
            val venv'' = foldl enterparam venv' params
            val body' = transExp (venv'',{level = level, break = #break extra}) body
            val func = case resultTy of
			   Ty.UNIT => Tr.procEntryExit
			 | _     => Tr.funEntryExit
          in
              (func({level = level,body = body'}))
          end; iter(xs))
    in
	iter(fundecls);
	({venv = venv'}, explist) 
    end

and transDecs (venv, decls, extra) =
    let
	fun visit venv decls result =
	  case decls
	   of [] => ({venv = venv}, result)
	    | (d::ds) =>
	      let
		  val ({venv = venv'}, res) = transDec (venv, d, result, extra)
	      in
		  visit venv' ds res
	      end
    in
	visit venv decls []
    end
fun transProg (tabsyn as {exp,ty}) : Tr.frag list  =
    let
        val exp = transExp ( E.baseVenv
                                    , { break=NONE
                                      , level=E.initLevel}) tabsyn
    in
        if ty=Ty.UNIT
        then Tr.procEntryExit {level = E.initLevel, body = exp }
        else Tr.funEntryExit {level = E.initLevel, body = exp};
        Tr.getResult ()
    end

end (* IRgen *)
