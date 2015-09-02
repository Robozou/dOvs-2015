(* ---------- Initial code for hand-in 1, dOvs 2015: warmup.sml ---------- *)

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

(* ... *)

(* placeholder definitions for not implemented functions *)

exception NotImplemented

fun stringOfBinop (s:G.binop): string = 
  case s of G.Plus  => "+"
          | G.Minus => "-"
	  | G.Times => "x" 
	  | G.Div   => "/"
  and stringOfExp (s:G.exp): string =
  case s of G.NumExp s  => Int.toString(s)
          | G.IdExp s   => s
          | G.OpExp s   => stringOfExp(#1 s) ^ stringOfBinop(#2 s) ^ stringOfExp(#3 s)
          | G.EseqExp s => "(" ^ stringOfStm(#1 s) ^ ", " ^ stringOfExp(#2 s) ^ ")" 		 
  and stringOfList [a] = stringOfExp(a)
          | stringOfList(x::xs) = stringOfExp(x) ^ ", " ^ stringOfList(xs)
  and stringOfStm (s:G.stm): string =
  case s of G.AssignStm s   => (#1 s) ^ " := " ^ stringOfExp(#2 s)
          | G.CompoundStm s => stringOfStm(#1 s) ^ "; " ^ stringOfStm(#2 s)
	  | G.PrintStm s    => "print(" ^ stringOfList(s) ^ ")"

fun buildEnv _    = raise NotImplemented
fun interpStm _   = raise NotImplemented
fun printEnv _    = raise NotImplemented

fun maxArgs (s:G.stm): int =
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
	      
(* ... *)

fun interp (s: G.stm): unit =
    let val _ = print ("Executing: " ^ (stringOfStm s) ^ "\n")
        val env = buildEnv s
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
