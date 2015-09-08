(* ---------- Initial code for hand-in 1, dOvs 2015: warmup.sml ---------- *)
structure Table = struct

exception UninitializedVar

fun matchstring (p:string * int option , s:string) = 
  if #1 p = s then #2 p
              else NONE
  
fun lookup (e:(string * int option) list, y:string) =
    case e of [] => NONE
         |  (x::xs) => let val match = matchstring (x, y)
		       in
			   case match of NONE => lookup(xs, y)
				       | _    => match
                       end


(* Function used for splitting lists into a pair of two.
   Input is the full list, the string to split by and an empty list for accumulating
   Returns af pair of the two lists split by the input string *)
fun split (inp:(string * int option) list, y:string, spl:(string * int option) list) =
    case y of "" => (spl, inp)
	   |  _  => case inp of []        => (spl, inp)
			     |  (s,i)::xs => if s = y then ((s,i)::spl, xs)
						      else split (xs, y, (s,i)::spl)

fun updateEnv (e:(string * int option) list, y:string, v:int option) =
    case y of "" => e
	   |  _  => case lookup (e,y) of NONE => (y,v)::e
                                      |  _    => let val res = split(e,y,[])
					         in
						     List.concat([(y,v)::List.tl(#1 res), #2 res])
					         end
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
	  | G.Times => "*" 
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
	  | G.PrintStm s => t





fun interpStm (s:G.stm, (env:(string * int option) list)) = 
  case s of G.CompoundStm s => let
                                  val env' = interpStm (#1 s, env)
			       in
                                  interpStm (#2 s, env')
                               end
	  | G.AssignStm s =>   let
	                          val res = interpExp(#2 s, env)
			       in
				  T.updateEnv(#2 res, #1 s, #1 res)
			       end
	  | G.PrintStm s  => #2 (interpPrintList(s, env))
  and interpExp (e:G.exp, env:(string * int option) list) = 
      case e of G.IdExp e => (T.lookup (env, e), env)
	      | G.NumExp e => (SOME e, env)
	      | G.OpExp e => interpOpExp(G.OpExp(e),env)
	      | G.EseqExp e => let val env' = interpStm(#1 e, env)
                               in
                                   interpExp(#2 e, env')
                               end
  and interpPrintList (el: G.exp list, (env:(string * int option) list)) =
      case el of [] => (print("\n"); (NONE, env))
              |  (x::xs) => let val res = interpExp(x, env)		               
                            in                               
				(print(Int.toString(valOf(#1 res)) ^ " "); interpPrintList(xs, #2 res))
                            end
  and interpOpExp (G.OpExp(e1,b,e2), (env:(string * int option) list)) =
      let val res = interpExp(e1, env)
	  val ls = #1 res
	  val res' = interpExp(e2, #2 res)
          val rs = #1 res'
      in
          (evalBinop(valOf(ls),valOf(rs),b), #2 res')
      end
  and evalBinop (ls:int,rs:int,b:G.binop) =
      case b of G.Plus  => SOME (ls + rs)
              | G.Minus => SOME (ls - rs)
	      | G.Times => SOME (ls * rs)
	      | G.Div   => SOME (ls div rs)
                            
(*Loops through environment to create string representation
  Used in the printEnv function further down

  Based on how we create our environment we need to do another case pattern matching 
  to check if the integer exists*)                            
fun envToString (e:(string * int option) list) = 
    case e of [] => "]\n"
  | (x,y)::xs => case y of NONE => "" ^ envToString(xs)
                        |  _ => "(\"" ^ x ^ "\"," ^ Int.toString(valOf(y)) ^ ")" ^ envToString(xs)
     
                            
fun printEnv (e:(string * int option) list) = 
    print("[" ^ envToString(e))

fun maxArgs (s:G.stm) =
    case s of G.PrintStm s    => Int.max(length s,maxArgsOfExpList(s)) 
	    | G.CompoundStm s => Int.max(maxArgs(#1 s), maxArgs(#2 s))
	    | G.AssignStm s   => 0 + maxArgsExp(#2 s)
    and maxArgsOfExpList [] = 0
            | maxArgsOfExpList(x::xs) = maxArgsExp(x) + maxArgsOfExpList (xs)
    and maxArgsExp (e:G.exp): int =
    case e of G.IdExp e         => 0
	    | G.NumExp e        => 0
	    | G.OpExp (e1,_,e2) => Int.max(maxArgsExp(e1), maxArgsExp(e2)) 
	    | G.EseqExp (st,ex) => Int.max(maxArgs(st), maxArgsExp(ex))
    and length [] = 0
            | length (x::xs) = 1 + length xs
	      
(* ... *)

fun interp (s: G.stm): unit =
    let val _ = print ("Executing: " ^ (stringOfStm s) ^ ";\n")
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


(* print((print((a := 17, a)), a)); print((print((b := 23, b)), b)) *)
val prog2 =
    G.CompoundStm(
	G.PrintStm[G.EseqExp(
			G.PrintStm[G.EseqExp(G.AssignStm("a", G.NumExp 17), G.IdExp "a")],
			G.IdExp "a")],
	G.PrintStm[G.EseqExp(
			G.PrintStm[G.EseqExp(G.AssignStm("b", G.NumExp 23), G.IdExp "b")],
			G.IdExp "b")])		

(* b := 7; a := 19; b := a - b; print(a,b); *)

val prog3 =
    G.CompoundStm (
	G.AssignStm ("b", G.NumExp 7),
	G.CompoundStm (
	    G.AssignStm ("a", G.NumExp 19), G.CompoundStm(
		G.AssignStm("b", G.OpExp (G.IdExp "a", G.Minus, G.IdExp "b")),
		G.PrintStm[G.IdExp "a", G.IdExp "b"])))

(* a := 8; print(a, a-a); *)

val prog4 =
    G.CompoundStm (
	G.AssignStm ("a", G.NumExp 8),
	G.PrintStm[G.IdExp "a", G.OpExp (G.IdExp "a", G.Minus, G.IdExp "a")])


val prog5 =
    G.CompoundStm (
	G.AssignStm ("b", G.NumExp 7),
	G.CompoundStm (
	    G.AssignStm ("a", G.NumExp 19),
	    G.AssignStm("b", G.OpExp (G.IdExp "a", G.Minus, G.IdExp "b"))))
		
val prog6 =
    G.PrintStm[G.NumExp 5, G.NumExp 4, G.NumExp 7, G.NumExp 8]
	

		
(* ... *)

(* Calling the interpreter on the example program. Uncomment to proceed
   -- default implementation will raise NotImplemented exception *)

(* val _ = interp prog *)
