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
  case s of G.Plus => "+"
          | G.Minus => "-"
	  | G.Times => "x" 
	  | G.Div => "/"

fun stringOfExp (s:G.exp): string =
  case s of G.NumExp s => Int.toString(s)
          | G.IdExp s => s
          | G.OpExp s => stringOfExp(#1 s) ^ stringOfBinop(#2 s) ^ stringOfExp(#3 s)
          | G.EseqExp s => stringOfStm(#1 s) ^ ", " ^ stringOfExp(#2 s) 		  


fun stringOfPrnt [] = ""
          | stringOfPrnt(x::xs) = stringOfExp(x) ^ ", " ^ stringOfPrnt(xs)


fun stringOfStm (s:G.stm): string =
  case s of G.AssignStm s => (#1 s) ^ " := " ^ stringOfExp(#2 s)
          | G.CompoundStm s => stringOfStm(#1 s) ^ " " ^ stringOfStm(#2 s)
	  | G.PrintStm s => "print(" ^ stringOfPrnt(s) ^ ")"




fun buildEnv _    = raise NotImplemented
fun interpStm _   = raise NotImplemented
fun printEnv _    = raise NotImplemented

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



(* ... *)

(* Calling the interpreter on the example program. Uncomment to proceed
   -- default implementation will raise NotImplemented exception *)

(* val _ = interp prog *)

