(* ---------- Initial code for hand-in 1, dOvs 2015: warmup.sml ---------- *)
structure Table = struct

type intTable = string -> int option

fun emptyTable (x:string) = NONE: int option


fun updateTable (t: intTable, y:string, v:int) x =
  if x = y then SOME v
  else t x


(*fun updateEnv (e:env, y:string, v:int) =*)

fun matchstring (p:string * int option , s:string) = 
  if #1 p = s then #2 p
              else NONE
  
fun lookup (e:(string * int option) list, y:string) =
  case e of [] => NONE
         |  (x::xs) => matchstring (x, y)

fun updateEnv (e:(string * int option) list, y:string, v:int option) =
  case lookup (e,y) of NONE => (y,v)::e


end


structure SLgrammar = struct

type id = string

datatype binop = Plus | Minus | Times | Div

datatype stm = CompoundStm of stm * stm
	         | AssignStm of id * exp
	         | PrintStm of exp list
     and exp = IdExp of id
     	     | NumExp of int
             | OpExp of exp * binop * exp
             | EseqExp of stm * exp

end (* SLgrammar *)

(* ----- Fill in: Interpret SLgrammar as specified ----- *)

structure G = SLgrammar
structure T = Table
(* ... *)

(* placeholder definitions for not implemented functions *)

exception NotImplemented

fun stringOfBinop (s:G.binop): string = 
  case s of G.Plus  => "+"
          | G.Minus => "-"
	  | G.Times => "x" 
	  | G.Div   => "/"
  and stringOfList [a] = stringOfExp(a)
          | stringOfList(x::xs) = stringOfExp(x) ^ ", " ^ stringOfList(xs)
  and stringOfExp (s:G.exp): string =
  case s of G.NumExp s  => Int.toString(s)
          | G.IdExp s   => s
          | G.OpExp s   => stringOfExp(#1 s) ^ stringOfBinop(#2 s) ^ stringOfExp(#3 s)
          | G.EseqExp s => "(" ^ stringOfStm(#1 s) ^ "," ^ stringOfExp(#2 s) ^ ")"
  and stringOfStm (s:G.stm): string =
  case s of G.AssignStm s   => (#1 s) ^ " := " ^ stringOfExp(#2 s)
          | G.CompoundStm s => stringOfStm(#1 s) ^ "; " ^ stringOfStm(#2 s)
	  | G.PrintStm s    => "print(" ^ stringOfList(s) ^ ")"


fun buildEnv (s:G.stm) (t:(string * int option) list) =
  case s of G.AssignStm s => T.updateEnv(t, #1 s, NONE)
	  | G.CompoundStm s => let 
	                          val t2 = buildEnv (#1 s) t
			       in
				   buildEnv (#2 s) t2
			       end
	  | G.PrintStm s => T.updateEnv(t, "", NONE)





fun interpStm (s:G.stm, (env:(string * int option) list)) = 
  case s of G.CompoundStm s => let
                                  val env' = interpStm (#1 s, env)
			       in
                                  interpStm (#2 s, env')
                               end
	  | G.AssignStm s => T.updateEnv(env, #1 s, interpExp(#2 s, env))
	  | G.PrintStm s  => interpPrintList(s, env)
  and interpExp (e:G.exp, (env:(string * int option) list)) = 
      case e of G.IdExp e => valOf(T.lookup (env, e))
	      | G.NumExp e =>  e
	      | G.OpExp e => interpOpExp(G.OpExp(e),env)
	      | G.EseqExp e => let val env' = interpStm(#1 e, env)
                               in
                                   valOf(interpExp(#2 e, env'))
                               end
  and interpPrintList (el: G.exp list, (env:(string * int option) list)) =
      case el of [] => (print("\n"); env)
              |  (x::xs) => (print(Int.toString(valOf((interpExp(x, env)))) ^ " "); interpPrintList(xs, env))
  and interpOpExp (G.OpExp(e1,b,e2), (env:(string * int option) list)) =
      let val ls = interpExp(e1, env)
          val rs = interpExp(e2, env)
      in
          evalBinop(valOf(ls),valOf(rs),b)
      end
  and evalBinop (ls:int,rs:int,b:G.binop) =
      case b of G.Plus  => ls + rs
              | G.Minus => ls - rs
	      | G.Times => ls * rs
	      | G.Div   => ls div rs
                            
                            

                            

(*Hard coded currently*)
fun printEnv (e:(string * int option) list) = print("[(\"a\"," ^ Int.toString(valOf(T.lookup (e,"a"))) ^ ")," ^ "(\"b\","^ Int.toString(valOf(T.lookup(e ,"b"))) ^ ")],")




(*WRONG IMPLEMENTATION*)
fun maxArgs (s:G.stm) =
    case s of G.PrintStm s    => 1 + maxArgsOfExpList(s)
	    | G.CompoundStm s => maxArgs(#1 s) + maxArgs(#2 s)
	    | G.AssignStm s   => 0 + maxArgsExp(#2 s)
    and maxArgsOfExpList [] = 0
            | maxArgsOfExpList(x::xs) = maxArgsExp(x) + maxArgsOfExpList (xs)
    and maxArgsExp (s:G.exp): int =
    case s of G.IdExp s       => 0
	    | G.NumExp s      => 0
	    | G.OpExp s       => 0
	    | G.EseqExp s     => maxArgs(#1 s) + 0
(*WRONG IMPLEMENTATION*)

	      
(* ... *)

fun interp (s: G.stm): unit =
    let val _ = print ("Executing: " ^ (stringOfStm s) ^ "\n")
        val env = buildEnv s []
        val env' = interpStm (s, env)
    in printEnv env'
    end

(* ----- Example for testing ----- *)

val prog =
  (* a := 5+3; b := (print(a,a-1), 10*a); print(b) *)
  G.CompoundStm (
    G.AssignStm ("a", G.OpExp (G.NumExp 5, G.Plus, G.NumExp 3)),
    G.CompoundStm (
      G.AssignStm ("b", G.EseqExp (
        G.PrintStm [G.IdExp "a", G.OpExp (G.IdExp "a", G.Minus, G.NumExp 1)],
        G.OpExp (G.NumExp 10, G.Times, G.IdExp "a"))),
      G.PrintStm [G.IdExp "b"]))

val prog2 =
    G.CompoundStm(
	G.PrintStm[G.EseqExp(
			G.PrintStm[G.EseqExp(G.AssignStm("a", G.IdExp "b"), G.IdExp "a")],
			G.IdExp "a")],
	G.PrintStm[G.EseqExp(
			G.PrintStm[G.EseqExp(G.AssignStm("a", G.IdExp "b"), G.IdExp "a")],
			G.IdExp "a")])		


(* ... *)

(* Calling the interpreter on the example program. Uncomment to proceed
   -- default implementation will raise NotImplemented exception *)

(* val _ = interp prog *)
