functor TigerLexFun (structure Tokens: Tiger_TOKENS)  = struct

    structure yyInput : sig

        type stream
	val mkStream : (int -> string) -> stream
	val fromStream : TextIO.StreamIO.instream -> stream
	val getc : stream -> (Char.char * stream) option
	val getpos : stream -> int
	val getlineNo : stream -> int
	val subtract : stream * stream -> string
	val eof : stream -> bool
	val lastWasNL : stream -> bool

      end = struct

        structure TIO = TextIO
        structure TSIO = TIO.StreamIO
	structure TPIO = TextPrimIO

        datatype stream = Stream of {
            strm : TSIO.instream,
	    id : int,  (* track which streams originated 
			* from the same stream *)
	    pos : int,
	    lineNo : int,
	    lastWasNL : bool
          }

	local
	  val next = ref 0
	in
	fun nextId() = !next before (next := !next + 1)
	end

	val initPos = 2 (* ml-lex bug compatibility *)

	fun mkStream inputN = let
              val strm = TSIO.mkInstream 
			   (TPIO.RD {
			        name = "lexgen",
				chunkSize = 4096,
				readVec = SOME inputN,
				readArr = NONE,
				readVecNB = NONE,
				readArrNB = NONE,
				block = NONE,
				canInput = NONE,
				avail = (fn () => NONE),
				getPos = NONE,
				setPos = NONE,
				endPos = NONE,
				verifyPos = NONE,
				close = (fn () => ()),
				ioDesc = NONE
			      }, "")
	      in 
		Stream {strm = strm, id = nextId(), pos = initPos, lineNo = 1,
			lastWasNL = true}
	      end

	fun fromStream strm = Stream {
		strm = strm, id = nextId(), pos = initPos, lineNo = 1, lastWasNL = true
	      }

	fun getc (Stream {strm, pos, id, lineNo, ...}) = (case TSIO.input1 strm
              of NONE => NONE
	       | SOME (c, strm') => 
		   SOME (c, Stream {
			        strm = strm', 
				pos = pos+1, 
				id = id,
				lineNo = lineNo + 
					 (if c = #"\n" then 1 else 0),
				lastWasNL = (c = #"\n")
			      })
	     (* end case*))

	fun getpos (Stream {pos, ...}) = pos

	fun getlineNo (Stream {lineNo, ...}) = lineNo

	fun subtract (new, old) = let
	      val Stream {strm = strm, pos = oldPos, id = oldId, ...} = old
	      val Stream {pos = newPos, id = newId, ...} = new
              val (diff, _) = if newId = oldId andalso newPos >= oldPos
			      then TSIO.inputN (strm, newPos - oldPos)
			      else raise Fail 
				"BUG: yyInput: attempted to subtract incompatible streams"
	      in 
		diff 
	      end

	fun eof s = not (isSome (getc s))

	fun lastWasNL (Stream {lastWasNL, ...}) = lastWasNL

      end

    datatype yystart_state = 
STRING | COMMENT | ESCAPE | INITIAL | IGNORE
    structure UserDeclarations = 
      struct

(* -*- mode:sml -*- *)

type svalue = Tokens.svalue
type pos = int
type ('a,'b) token = ('a,'b) Tokens.token
type lexresult = (svalue, pos) token

val inString = ref false
val lineNum = ErrorMsg.lineNum
val linePos = ErrorMsg.linePos

val commentLevel = ref 0
val currentString = ref ""

fun err (p1,p2) = ErrorMsg.error p1

fun eof () =
    let
        val pos = hd (!linePos)
    in
    if !commentLevel <> 0 then (ErrorMsg.error pos "unclosed comment")
      else if !inString = true then (inString := false; (ErrorMsg.error pos "unclosed string"))
      else (); commentLevel := 0; Tokens.EOF (pos,pos)
    end


fun s2i t pos =
    let
        val opti = (Int.fromString t)
            handle Overflow =>
                   (ErrorMsg.error pos "Integer too large"; SOME 0)
        fun s2i_aux NONE = (ErrorMsg.error pos "Ill-formed integer"; 0)
          | s2i_aux (SOME n) = n
    in
        s2i_aux opti
    end

fun dopos token yypos yylen = token (yypos, yypos + yylen)
fun dopos3 token value yypos yylen = token (value, yypos, yypos + yylen)



      end

    datatype yymatch 
      = yyNO_MATCH
      | yyMATCH of yyInput.stream * action * yymatch
    withtype action = yyInput.stream * yymatch -> UserDeclarations.lexresult

    local

    val yytable = 
Vector.fromList []
    fun mk yyins = let
        (* current start state *)
        val yyss = ref INITIAL
	fun YYBEGIN ss = (yyss := ss)
	(* current input stream *)
        val yystrm = ref yyins
	(* get one char of input *)
	val yygetc = yyInput.getc
	(* create yytext *)
	fun yymktext(strm) = yyInput.subtract (strm, !yystrm)
        open UserDeclarations
        fun lex 
(yyarg as ()) = let 
     fun continue() = let
            val yylastwasn = yyInput.lastWasNL (!yystrm)
            fun yystuck (yyNO_MATCH) = raise Fail "stuck state"
	      | yystuck (yyMATCH (strm, action, old)) = 
		  action (strm, old)
	    val yypos = yyInput.getpos (!yystrm)
	    val yygetlineNo = yyInput.getlineNo
	    fun yyactsToMatches (strm, [],	  oldMatches) = oldMatches
	      | yyactsToMatches (strm, act::acts, oldMatches) = 
		  yyMATCH (strm, act, yyactsToMatches (strm, acts, oldMatches))
	    fun yygo actTable = 
		(fn (~1, _, oldMatches) => yystuck oldMatches
		  | (curState, strm, oldMatches) => let
		      val (transitions, finals') = Vector.sub (yytable, curState)
		      val finals = map (fn i => Vector.sub (actTable, i)) finals'
		      fun tryfinal() = 
		            yystuck (yyactsToMatches (strm, finals, oldMatches))
		      fun find (c, []) = NONE
			| find (c, (c1, c2, s)::ts) = 
		            if c1 <= c andalso c <= c2 then SOME s
			    else find (c, ts)
		      in case yygetc strm
			  of SOME(c, strm') => 
			       (case find (c, transitions)
				 of NONE => tryfinal()
				  | SOME n => 
				      yygo actTable
					(n, strm', 
					 yyactsToMatches (strm, finals, oldMatches)))
			   | NONE => tryfinal()
		      end)
	    in 
let
fun yyAction0 (strm, lastMatch : yymatch) = (yystrm := strm;
      (lineNum := !lineNum+1;
                                        linePos := yypos :: !linePos;
                                        continue()))
fun yyAction1 (strm, lastMatch : yymatch) = (yystrm := strm; (continue()))
fun yyAction2 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.COMMA yypos 1))
fun yyAction3 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.VAR yypos 3))
fun yyAction4 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.IF yypos 2))
fun yyAction5 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.THEN yypos 4))
fun yyAction6 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.ELSE yypos 4))
fun yyAction7 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.FUNCTION yypos 8))
fun yyAction8 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.BREAK yypos 5))
fun yyAction9 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.OF yypos 2))
fun yyAction10 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.END yypos 3))
fun yyAction11 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.IN yypos 2))
fun yyAction12 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.NIL yypos 3))
fun yyAction13 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.LET yypos 3))
fun yyAction14 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.DO yypos 2))
fun yyAction15 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.TO yypos 2))
fun yyAction16 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.FOR yypos 3))
fun yyAction17 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.WHILE yypos 5))
fun yyAction18 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.ARRAY yypos 5))
fun yyAction19 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.TYPE yypos 4))
fun yyAction20 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.ASSIGN yypos 2))
fun yyAction21 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.OR yypos 2))
fun yyAction22 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.AND yypos 3))
fun yyAction23 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.GT yypos 1))
fun yyAction24 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.GE yypos 2))
fun yyAction25 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.LE yypos 2))
fun yyAction26 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.LT yypos 1))
fun yyAction27 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.NEQ yypos 2))
fun yyAction28 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.EQ yypos 1))
fun yyAction29 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.DIVIDE yypos 1))
fun yyAction30 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.TIMES yypos 1))
fun yyAction31 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.MINUS yypos 1))
fun yyAction32 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.PLUS yypos 1))
fun yyAction33 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.DOT yypos 1))
fun yyAction34 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.RBRACE yypos 1))
fun yyAction35 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.LBRACE yypos 1))
fun yyAction36 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.RBRACK yypos 1))
fun yyAction37 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.LBRACK yypos 1))
fun yyAction38 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.RPAREN yypos 1))
fun yyAction39 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.LPAREN yypos 1))
fun yyAction40 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.SEMICOLON yypos 1))
fun yyAction41 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.COLON yypos 1))
fun yyAction42 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.AND yypos 1))
fun yyAction43 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.OR yypos 1))
fun yyAction44 (strm, lastMatch : yymatch) = (yystrm := strm;
      (dopos Tokens.CARET yypos 1))
fun yyAction45 (strm, lastMatch : yymatch) = (yystrm := strm; (continue()))
fun yyAction46 (strm, lastMatch : yymatch) = (yystrm := strm;
      (commentLevel := !commentLevel + 1; YYBEGIN COMMENT; continue()))
fun yyAction47 (strm, lastMatch : yymatch) = (yystrm := strm;
      (commentLevel := !commentLevel + 1; continue()))
fun yyAction48 (strm, lastMatch : yymatch) = (yystrm := strm;
      (commentLevel := !commentLevel - 1;
                                        if (!commentLevel = 0)
                                        then (YYBEGIN INITIAL; continue())
                                        else continue()))
fun yyAction49 (strm, lastMatch : yymatch) = (yystrm := strm; (continue()))
fun yyAction50 (strm, lastMatch : yymatch) = (yystrm := strm;
      (currentString := ""; inString := true; YYBEGIN STRING; continue()))
fun yyAction51 (strm, lastMatch : yymatch) = (yystrm := strm;
      (inString := false; YYBEGIN INITIAL;
                                        dopos3 Tokens.STRING (!currentString) yypos (size(!currentString))))
fun yyAction52 (strm, lastMatch : yymatch) = (yystrm := strm;
      (YYBEGIN ESCAPE; continue()))
fun yyAction53 (strm, lastMatch : yymatch) = (yystrm := strm;
      (ErrorMsg.error yypos ("Newlines should be put into ignore escape sequence in string"); continue()))
fun yyAction54 (strm, lastMatch : yymatch) = let
      val yytext = yymktext(strm)
      in
        yystrm := strm; (currentString := !currentString ^ yytext; continue())
      end
fun yyAction55 (strm, lastMatch : yymatch) = let
      val yytext = yymktext(strm)
      in
        yystrm := strm;
        (currentString := !currentString ^ "\\" ^ yytext; YYBEGIN STRING; continue())
      end
fun yyAction56 (strm, lastMatch : yymatch) = let
      val yytext = yymktext(strm)
      in
        yystrm := strm;
        (currentString := !currentString ^ "\\" ^ yytext; YYBEGIN STRING; continue())
      end
fun yyAction57 (strm, lastMatch : yymatch) = let
      val yytext = yymktext(strm)
      in
        yystrm := strm;
        (currentString := !currentString ^ "\\" ^ yytext; YYBEGIN STRING; continue())
      end
fun yyAction58 (strm, lastMatch : yymatch) = (yystrm := strm;
      (currentString := !currentString ^ "\\" ^ "\\"; YYBEGIN STRING; continue()))
fun yyAction59 (strm, lastMatch : yymatch) = let
      val yytext = yymktext(strm)
      in
        yystrm := strm;
        (currentString := !currentString ^ "\\" ^ yytext; YYBEGIN STRING; continue())
      end
fun yyAction60 (strm, lastMatch : yymatch) = let
      val yytext = yymktext(strm)
      in
        yystrm := strm;
        (currentString := !currentString ^ "\\" ^ yytext; YYBEGIN STRING; continue())
      end
fun yyAction61 (strm, lastMatch : yymatch) = (yystrm := strm;
      (YYBEGIN IGNORE; continue()))
fun yyAction62 (strm, lastMatch : yymatch) = let
      val yytext = yymktext(strm)
      in
        yystrm := strm;
        (ErrorMsg.error yypos ("Invalid escape character " ^ yytext); continue())
      end
fun yyAction63 (strm, lastMatch : yymatch) = (yystrm := strm; (continue()))
fun yyAction64 (strm, lastMatch : yymatch) = (yystrm := strm;
      (YYBEGIN STRING; continue()))
fun yyAction65 (strm, lastMatch : yymatch) = let
      val yytext = yymktext(strm)
      in
        yystrm := strm;
        (ErrorMsg.error yypos ("Invalid character in ignore. No support for " ^ yytext); continue())
      end
fun yyAction66 (strm, lastMatch : yymatch) = let
      val yytext = yymktext(strm)
      in
        yystrm := strm;
        (dopos3 Tokens.INT (s2i yytext yypos) yypos
                                                 (size yytext))
      end
fun yyAction67 (strm, lastMatch : yymatch) = let
      val yytext = yymktext(strm)
      in
        yystrm := strm; (dopos3 Tokens.ID yytext yypos (size yytext))
      end
fun yyAction68 (strm, lastMatch : yymatch) = let
      val yytext = yymktext(strm)
      in
        yystrm := strm;
        (ErrorMsg.error yypos ("illegal char " ^ yytext);
                                        continue())
      end
fun yyQ123 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction64(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction64(strm, yyNO_MATCH)
      (* end case *))
fun yyQ122 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction63(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"\v"
              then yyAction63(strm, yyNO_MATCH)
            else if inp < #"\v"
              then if inp <= #"\b"
                  then yyAction63(strm, yyNO_MATCH)
                  else yyQ122(strm', yyMATCH(strm, yyAction63, yyNO_MATCH))
            else if inp = #" "
              then yyQ122(strm', yyMATCH(strm, yyAction63, yyNO_MATCH))
              else yyAction63(strm, yyNO_MATCH)
      (* end case *))
fun yyQ121 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction63(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"\v"
              then yyAction63(strm, yyNO_MATCH)
            else if inp < #"\v"
              then if inp <= #"\b"
                  then yyAction63(strm, yyNO_MATCH)
                  else yyQ122(strm', yyMATCH(strm, yyAction63, yyNO_MATCH))
            else if inp = #" "
              then yyQ122(strm', yyMATCH(strm, yyAction63, yyNO_MATCH))
              else yyAction63(strm, yyNO_MATCH)
      (* end case *))
fun yyQ120 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction65(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction65(strm, yyNO_MATCH)
      (* end case *))
fun yyQ4 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE =>
            if yyInput.eof(!(yystrm))
              then UserDeclarations.eof(yyarg)
              else yystuck(lastMatch)
        | SOME(inp, strm') =>
            if inp = #" "
              then yyQ121(strm', lastMatch)
            else if inp < #" "
              then if inp = #"\n"
                  then yyQ122(strm', lastMatch)
                else if inp < #"\n"
                  then if inp = #"\t"
                      then yyQ121(strm', lastMatch)
                      else yyQ120(strm', lastMatch)
                  else yyQ120(strm', lastMatch)
            else if inp = #"\\"
              then yyQ123(strm', lastMatch)
              else yyQ120(strm', lastMatch)
      (* end case *))
fun yyQ66 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction34(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction34(strm, yyNO_MATCH)
      (* end case *))
fun yyQ65 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction43(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction43(strm, yyNO_MATCH)
      (* end case *))
fun yyQ64 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction35(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction35(strm, yyNO_MATCH)
      (* end case *))
fun yyQ67 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction67(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp = #"`"
              then yyAction67(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ71 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction17(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction17(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction17(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction17(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction17, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction17(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction17, yyNO_MATCH))
            else if inp = #"`"
              then yyAction17(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction17, yyNO_MATCH))
                  else yyAction17(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction17, yyNO_MATCH))
              else yyAction17(strm, yyNO_MATCH)
      (* end case *))
fun yyQ70 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"e"
              then yyQ71(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"e"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ69 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"l"
              then yyQ70(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"l"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ68 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"i"
              then yyQ69(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"i"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ63 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"h"
              then yyQ68(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"h"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ73 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction3(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction3(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction3(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction3(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction3, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction3(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction3, yyNO_MATCH))
            else if inp = #"`"
              then yyAction3(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction3, yyNO_MATCH))
                  else yyAction3(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction3, yyNO_MATCH))
              else yyAction3(strm, yyNO_MATCH)
      (* end case *))
fun yyQ72 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"r"
              then yyQ73(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"r"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ62 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"b"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"b"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ72(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ78 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction19(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction19(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction19(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction19(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction19, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction19(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction19, yyNO_MATCH))
            else if inp = #"`"
              then yyAction19(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction19, yyNO_MATCH))
                  else yyAction19(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction19, yyNO_MATCH))
              else yyAction19(strm, yyNO_MATCH)
      (* end case *))
fun yyQ77 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"e"
              then yyQ78(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"e"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ76 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"p"
              then yyQ77(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"p"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ75 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction15(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction15(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction15(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction15(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction15, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction15(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction15, yyNO_MATCH))
            else if inp = #"`"
              then yyAction15(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction15, yyNO_MATCH))
                  else yyAction15(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction15, yyNO_MATCH))
              else yyAction15(strm, yyNO_MATCH)
      (* end case *))
fun yyQ80 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction5(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction5(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction5(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction5(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction5, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction5(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction5, yyNO_MATCH))
            else if inp = #"`"
              then yyAction5(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction5, yyNO_MATCH))
                  else yyAction5(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction5, yyNO_MATCH))
              else yyAction5(strm, yyNO_MATCH)
      (* end case *))
fun yyQ79 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"n"
              then yyQ80(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"n"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ74 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"e"
              then yyQ79(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"e"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ61 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"a"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"a"
              then if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then if inp = #"0"
                      then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp < #"0"
                      then yyAction67(strm, yyNO_MATCH)
                    else if inp <= #"9"
                      then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyAction67(strm, yyNO_MATCH)
                else if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"_"
                  then if inp <= #"Z"
                      then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyAction67(strm, yyNO_MATCH)
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"p"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"p"
              then if inp = #"i"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"i"
                  then if inp = #"h"
                      then yyQ74(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"o"
                  then yyQ75(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp = #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"z"
              then if inp = #"y"
                  then yyQ76(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ82 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction21(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction21(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction21(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction21(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction21, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction21(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction21, yyNO_MATCH))
            else if inp = #"`"
              then yyAction21(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction21, yyNO_MATCH))
                  else yyAction21(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction21, yyNO_MATCH))
              else yyAction21(strm, yyNO_MATCH)
      (* end case *))
fun yyQ81 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction9(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction9(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction9(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction9(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction9, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction9(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction9, yyNO_MATCH))
            else if inp = #"`"
              then yyAction9(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction9, yyNO_MATCH))
                  else yyAction9(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction9, yyNO_MATCH))
              else yyAction9(strm, yyNO_MATCH)
      (* end case *))
fun yyQ60 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"`"
              then yyAction67(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then if inp = #"0"
                      then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp < #"0"
                      then yyAction67(strm, yyNO_MATCH)
                    else if inp <= #"9"
                      then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyAction67(strm, yyNO_MATCH)
                else if inp = #"["
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #"["
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"r"
              then yyQ82(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"r"
              then if inp = #"f"
                  then yyQ81(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ84 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction12(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction12(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction12(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction12(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction12, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction12(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction12, yyNO_MATCH))
            else if inp = #"`"
              then yyAction12(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction12, yyNO_MATCH))
                  else yyAction12(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction12, yyNO_MATCH))
              else yyAction12(strm, yyNO_MATCH)
      (* end case *))
fun yyQ83 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"l"
              then yyQ84(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"l"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ59 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"i"
              then yyQ83(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"i"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ86 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction13(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction13(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction13(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction13(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction13, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction13(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction13, yyNO_MATCH))
            else if inp = #"`"
              then yyAction13(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction13, yyNO_MATCH))
                  else yyAction13(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction13, yyNO_MATCH))
              else yyAction13(strm, yyNO_MATCH)
      (* end case *))
fun yyQ85 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"t"
              then yyQ86(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"t"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ58 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"e"
              then yyQ85(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"e"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ88 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction11(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction11(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction11(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction11(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction11, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction11(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction11, yyNO_MATCH))
            else if inp = #"`"
              then yyAction11(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction11, yyNO_MATCH))
                  else yyAction11(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction11, yyNO_MATCH))
              else yyAction11(strm, yyNO_MATCH)
      (* end case *))
fun yyQ87 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction4(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction4(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction4(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction4(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction4, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction4(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction4, yyNO_MATCH))
            else if inp = #"`"
              then yyAction4(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction4, yyNO_MATCH))
                  else yyAction4(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction4, yyNO_MATCH))
              else yyAction4(strm, yyNO_MATCH)
      (* end case *))
fun yyQ57 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"`"
              then yyAction67(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then if inp = #"0"
                      then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp < #"0"
                      then yyAction67(strm, yyNO_MATCH)
                    else if inp <= #"9"
                      then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyAction67(strm, yyNO_MATCH)
                else if inp = #"["
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #"["
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"n"
              then yyQ88(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"n"
              then if inp = #"f"
                  then yyQ87(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ96 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction7(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction7(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction7(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction7(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction7, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction7(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction7, yyNO_MATCH))
            else if inp = #"`"
              then yyAction7(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction7, yyNO_MATCH))
                  else yyAction7(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction7, yyNO_MATCH))
              else yyAction7(strm, yyNO_MATCH)
      (* end case *))
fun yyQ95 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"n"
              then yyQ96(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"n"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ94 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"o"
              then yyQ95(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"o"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ93 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"i"
              then yyQ94(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"i"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ92 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"t"
              then yyQ93(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"t"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ91 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"c"
              then yyQ92(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"c"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ90 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"n"
              then yyQ91(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"n"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ97 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction16(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction16(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction16(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction16(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction16, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction16(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction16, yyNO_MATCH))
            else if inp = #"`"
              then yyAction16(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction16, yyNO_MATCH))
                  else yyAction16(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction16, yyNO_MATCH))
              else yyAction16(strm, yyNO_MATCH)
      (* end case *))
fun yyQ89 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"r"
              then yyQ97(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"r"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ56 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"`"
              then yyAction67(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then if inp = #"0"
                      then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp < #"0"
                      then yyAction67(strm, yyNO_MATCH)
                    else if inp <= #"9"
                      then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyAction67(strm, yyNO_MATCH)
                else if inp = #"["
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #"["
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"u"
              then yyQ90(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"u"
              then if inp = #"o"
                  then yyQ89(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ100 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction10(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction10(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction10(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction10(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction10, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction10(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction10, yyNO_MATCH))
            else if inp = #"`"
              then yyAction10(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction10, yyNO_MATCH))
                  else yyAction10(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction10, yyNO_MATCH))
              else yyAction10(strm, yyNO_MATCH)
      (* end case *))
fun yyQ99 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"d"
              then yyQ100(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"d"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ102 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction6(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction6(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction6(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction6(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction6, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction6(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction6, yyNO_MATCH))
            else if inp = #"`"
              then yyAction6(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction6, yyNO_MATCH))
                  else yyAction6(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction6, yyNO_MATCH))
              else yyAction6(strm, yyNO_MATCH)
      (* end case *))
fun yyQ101 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"e"
              then yyQ102(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"e"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ98 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"s"
              then yyQ101(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"s"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ55 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"`"
              then yyAction67(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then if inp = #"0"
                      then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp < #"0"
                      then yyAction67(strm, yyNO_MATCH)
                    else if inp <= #"9"
                      then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyAction67(strm, yyNO_MATCH)
                else if inp = #"["
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #"["
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"n"
              then yyQ99(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"n"
              then if inp = #"l"
                  then yyQ98(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ103 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction14(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction14(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction14(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction14(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction14, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction14(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction14, yyNO_MATCH))
            else if inp = #"`"
              then yyAction14(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction14, yyNO_MATCH))
                  else yyAction14(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction14, yyNO_MATCH))
              else yyAction14(strm, yyNO_MATCH)
      (* end case *))
fun yyQ54 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"o"
              then yyQ103(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"o"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ107 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction8(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction8(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction8(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction8(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction8, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction8(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction8, yyNO_MATCH))
            else if inp = #"`"
              then yyAction8(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction8, yyNO_MATCH))
                  else yyAction8(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction8, yyNO_MATCH))
              else yyAction8(strm, yyNO_MATCH)
      (* end case *))
fun yyQ106 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"k"
              then yyQ107(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"k"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ105 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"b"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"b"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ106(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ104 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"e"
              then yyQ105(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"e"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ53 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"r"
              then yyQ104(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"r"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ112 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction18(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction18(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction18(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction18(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction18, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction18(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction18, yyNO_MATCH))
            else if inp = #"`"
              then yyAction18(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction18, yyNO_MATCH))
                  else yyAction18(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction18, yyNO_MATCH))
              else yyAction18(strm, yyNO_MATCH)
      (* end case *))
fun yyQ111 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"y"
              then yyQ112(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"y"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp = #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ110 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"b"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"b"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ111(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ109 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"r"
              then yyQ110(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"r"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ113 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction22(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction22(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction22(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction22(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction22, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction22(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction22, yyNO_MATCH))
            else if inp = #"`"
              then yyAction22(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction22, yyNO_MATCH))
                  else yyAction22(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction22, yyNO_MATCH))
              else yyAction22(strm, yyNO_MATCH)
      (* end case *))
fun yyQ108 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"_"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"_"
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp <= #"Z"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"d"
              then yyQ113(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"d"
              then if inp = #"`"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ52 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"`"
              then yyAction67(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"A"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then if inp = #"0"
                      then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp < #"0"
                      then yyAction67(strm, yyNO_MATCH)
                    else if inp <= #"9"
                      then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyAction67(strm, yyNO_MATCH)
                else if inp = #"["
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #"["
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp = #"r"
              then yyQ109(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"r"
              then if inp = #"n"
                  then yyQ108(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ51 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction44(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction44(strm, yyNO_MATCH)
      (* end case *))
fun yyQ50 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction36(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction36(strm, yyNO_MATCH)
      (* end case *))
fun yyQ49 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction37(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction37(strm, yyNO_MATCH)
      (* end case *))
fun yyQ48 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction67(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction67(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction67(strm, yyNO_MATCH)
                      else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction67(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp = #"`"
              then yyAction67(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyAction67(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyAction67(strm, yyNO_MATCH)
      (* end case *))
fun yyQ114 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction24(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction24(strm, yyNO_MATCH)
      (* end case *))
fun yyQ47 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction23(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"="
              then yyQ114(strm', yyMATCH(strm, yyAction23, yyNO_MATCH))
              else yyAction23(strm, yyNO_MATCH)
      (* end case *))
fun yyQ46 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction28(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction28(strm, yyNO_MATCH)
      (* end case *))
fun yyQ116 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction27(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction27(strm, yyNO_MATCH)
      (* end case *))
fun yyQ115 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction25(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction25(strm, yyNO_MATCH)
      (* end case *))
fun yyQ45 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction26(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #">"
              then yyQ116(strm', yyMATCH(strm, yyAction26, yyNO_MATCH))
            else if inp < #">"
              then if inp = #"="
                  then yyQ115(strm', yyMATCH(strm, yyAction26, yyNO_MATCH))
                  else yyAction26(strm, yyNO_MATCH)
              else yyAction26(strm, yyNO_MATCH)
      (* end case *))
fun yyQ44 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction40(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction40(strm, yyNO_MATCH)
      (* end case *))
fun yyQ117 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction20(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction20(strm, yyNO_MATCH)
      (* end case *))
fun yyQ43 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction41(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"="
              then yyQ117(strm', yyMATCH(strm, yyAction41, yyNO_MATCH))
              else yyAction41(strm, yyNO_MATCH)
      (* end case *))
fun yyQ118 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction66(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction66(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction66(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction66(strm, yyNO_MATCH)
                      else yyQ118(strm', yyMATCH(strm, yyAction66, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction66(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction66, yyNO_MATCH))
            else if inp = #"`"
              then yyAction66(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction66, yyNO_MATCH))
                  else yyAction66(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction66, yyNO_MATCH))
              else yyAction66(strm, yyNO_MATCH)
      (* end case *))
fun yyQ42 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction66(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"["
              then yyAction66(strm, yyNO_MATCH)
            else if inp < #"["
              then if inp = #":"
                  then yyAction66(strm, yyNO_MATCH)
                else if inp < #":"
                  then if inp <= #"/"
                      then yyAction66(strm, yyNO_MATCH)
                      else yyQ118(strm', yyMATCH(strm, yyAction66, yyNO_MATCH))
                else if inp <= #"@"
                  then yyAction66(strm, yyNO_MATCH)
                  else yyQ67(strm', yyMATCH(strm, yyAction66, yyNO_MATCH))
            else if inp = #"`"
              then yyAction66(strm, yyNO_MATCH)
            else if inp < #"`"
              then if inp = #"_"
                  then yyQ67(strm', yyMATCH(strm, yyAction66, yyNO_MATCH))
                  else yyAction66(strm, yyNO_MATCH)
            else if inp <= #"z"
              then yyQ67(strm', yyMATCH(strm, yyAction66, yyNO_MATCH))
              else yyAction66(strm, yyNO_MATCH)
      (* end case *))
fun yyQ119 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction46(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction46(strm, yyNO_MATCH)
      (* end case *))
fun yyQ41 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction29(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"*"
              then yyQ119(strm', yyMATCH(strm, yyAction29, yyNO_MATCH))
              else yyAction29(strm, yyNO_MATCH)
      (* end case *))
fun yyQ40 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction33(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction33(strm, yyNO_MATCH)
      (* end case *))
fun yyQ39 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction31(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction31(strm, yyNO_MATCH)
      (* end case *))
fun yyQ38 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction2(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction2(strm, yyNO_MATCH)
      (* end case *))
fun yyQ37 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction32(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction32(strm, yyNO_MATCH)
      (* end case *))
fun yyQ36 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction30(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction30(strm, yyNO_MATCH)
      (* end case *))
fun yyQ35 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction38(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction38(strm, yyNO_MATCH)
      (* end case *))
fun yyQ34 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction39(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction39(strm, yyNO_MATCH)
      (* end case *))
fun yyQ33 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction42(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction42(strm, yyNO_MATCH)
      (* end case *))
fun yyQ32 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction50(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction50(strm, yyNO_MATCH)
      (* end case *))
fun yyQ31 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction45(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction45(strm, yyNO_MATCH)
      (* end case *))
fun yyQ10 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction0(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction0(strm, yyNO_MATCH)
      (* end case *))
fun yyQ30 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction1(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction1(strm, yyNO_MATCH)
      (* end case *))
fun yyQ29 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction68(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction68(strm, yyNO_MATCH)
      (* end case *))
fun yyQ3 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE =>
            if yyInput.eof(!(yystrm))
              then UserDeclarations.eof(yyarg)
              else yyAction67(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"\\"
              then yyQ29(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"\\"
              then if inp = #"+"
                  then yyQ37(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"+"
                  then if inp = #"\""
                      then yyQ32(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp < #"\""
                      then if inp = #"\v"
                          then yyQ29(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                        else if inp < #"\v"
                          then if inp = #"\t"
                              then yyQ30(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                            else if inp = #"\n"
                              then yyQ10(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                              else yyQ29(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                        else if inp = #" "
                          then yyQ31(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                          else yyQ29(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp = #"("
                      then yyQ34(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp < #"("
                      then if inp = #"&"
                          then yyQ33(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                          else yyQ29(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp = #")"
                      then yyQ35(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyQ36(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #";"
                  then yyQ44(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #";"
                  then if inp = #"/"
                      then yyQ41(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp < #"/"
                      then if inp = #"-"
                          then yyQ39(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                        else if inp = #","
                          then yyQ38(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                          else yyQ40(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp = #":"
                      then yyQ43(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyQ42(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"?"
                  then yyQ29(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"?"
                  then if inp = #"="
                      then yyQ46(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp = #"<"
                      then yyQ45(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyQ47(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"A"
                  then yyQ48(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"A"
                  then yyQ29(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"["
                  then yyQ49(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyQ48(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp = #"l"
              then yyQ58(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"l"
              then if inp = #"c"
                  then yyQ48(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"c"
                  then if inp = #"`"
                      then yyQ29(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp < #"`"
                      then if inp = #"^"
                          then yyQ51(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                        else if inp = #"]"
                          then yyQ50(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                          else yyQ48(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp = #"a"
                      then yyQ52(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyQ53(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"g"
                  then yyQ48(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"g"
                  then if inp = #"e"
                      then yyQ55(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp = #"d"
                      then yyQ54(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyQ56(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"i"
                  then yyQ57(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyQ48(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp = #"v"
              then yyQ62(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"v"
              then if inp = #"p"
                  then yyQ48(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"p"
                  then if inp = #"n"
                      then yyQ59(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                    else if inp = #"m"
                      then yyQ48(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                      else yyQ60(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"t"
                  then yyQ61(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyQ48(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp = #"|"
              then yyQ65(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp < #"|"
              then if inp = #"x"
                  then yyQ48(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp < #"x"
                  then yyQ63(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                else if inp = #"{"
                  then yyQ64(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
                  else yyQ48(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
            else if inp = #"}"
              then yyQ66(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
              else yyQ29(strm', yyMATCH(strm, yyAction67, yyNO_MATCH))
      (* end case *))
fun yyQ24 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction56(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction56(strm, yyNO_MATCH)
      (* end case *))
fun yyQ23 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction55(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction55(strm, yyNO_MATCH)
      (* end case *))
fun yyQ25 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction60(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction60(strm, yyNO_MATCH)
      (* end case *))
fun yyQ22 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction62(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"\\"
              then yyQ25(strm', yyMATCH(strm, yyAction62, yyNO_MATCH))
            else if inp < #"\\"
              then if inp = #"@"
                  then yyQ25(strm', yyMATCH(strm, yyAction62, yyNO_MATCH))
                else if inp < #"@"
                  then yyAction62(strm, yyNO_MATCH)
                else if inp = #"["
                  then yyAction62(strm, yyNO_MATCH)
                  else yyQ25(strm', yyMATCH(strm, yyAction62, yyNO_MATCH))
            else if inp = #"^"
              then yyQ25(strm', yyMATCH(strm, yyAction62, yyNO_MATCH))
            else if inp < #"^"
              then yyAction62(strm, yyNO_MATCH)
            else if inp <= #"_"
              then yyQ25(strm', yyMATCH(strm, yyAction62, yyNO_MATCH))
              else yyAction62(strm, yyNO_MATCH)
      (* end case *))
fun yyQ21 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction58(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction58(strm, yyNO_MATCH)
      (* end case *))
fun yyQ28 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction59(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction59(strm, yyNO_MATCH)
      (* end case *))
fun yyQ27 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yystuck(lastMatch)
        | SOME(inp, strm') =>
            if inp = #"0"
              then yyQ28(strm', lastMatch)
            else if inp < #"0"
              then yystuck(lastMatch)
            else if inp <= #"5"
              then yyQ28(strm', lastMatch)
              else yystuck(lastMatch)
      (* end case *))
fun yyQ26 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yystuck(lastMatch)
        | SOME(inp, strm') =>
            if inp = #"0"
              then yyQ28(strm', lastMatch)
            else if inp < #"0"
              then yystuck(lastMatch)
            else if inp <= #"9"
              then yyQ28(strm', lastMatch)
              else yystuck(lastMatch)
      (* end case *))
fun yyQ20 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction62(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"5"
              then yyQ27(strm', yyMATCH(strm, yyAction62, yyNO_MATCH))
            else if inp < #"5"
              then if inp <= #"/"
                  then yyAction62(strm, yyNO_MATCH)
                  else yyQ26(strm', yyMATCH(strm, yyAction62, yyNO_MATCH))
              else yyAction62(strm, yyNO_MATCH)
      (* end case *))
fun yyQ19 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction62(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"0"
              then yyQ26(strm', yyMATCH(strm, yyAction62, yyNO_MATCH))
            else if inp < #"0"
              then yyAction62(strm, yyNO_MATCH)
            else if inp <= #"9"
              then yyQ26(strm', yyMATCH(strm, yyAction62, yyNO_MATCH))
              else yyAction62(strm, yyNO_MATCH)
      (* end case *))
fun yyQ18 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction57(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction57(strm, yyNO_MATCH)
      (* end case *))
fun yyQ17 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction61(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"\v"
              then yyAction61(strm, yyNO_MATCH)
            else if inp < #"\v"
              then if inp <= #"\b"
                  then yyAction61(strm, yyNO_MATCH)
                  else yyQ17(strm', yyMATCH(strm, yyAction61, yyNO_MATCH))
            else if inp = #" "
              then yyQ17(strm', yyMATCH(strm, yyAction61, yyNO_MATCH))
              else yyAction61(strm, yyNO_MATCH)
      (* end case *))
fun yyQ16 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction61(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"\v"
              then yyAction61(strm, yyNO_MATCH)
            else if inp < #"\v"
              then if inp <= #"\b"
                  then yyAction61(strm, yyNO_MATCH)
                  else yyQ17(strm', yyMATCH(strm, yyAction61, yyNO_MATCH))
            else if inp = #" "
              then yyQ17(strm', yyMATCH(strm, yyAction61, yyNO_MATCH))
              else yyAction61(strm, yyNO_MATCH)
      (* end case *))
fun yyQ15 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction62(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction62(strm, yyNO_MATCH)
      (* end case *))
fun yyQ2 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE =>
            if yyInput.eof(!(yystrm))
              then UserDeclarations.eof(yyarg)
              else yystuck(lastMatch)
        | SOME(inp, strm') =>
            if inp = #"2"
              then yyQ20(strm', lastMatch)
            else if inp < #"2"
              then if inp = #" "
                  then yyQ16(strm', lastMatch)
                else if inp < #" "
                  then if inp = #"\n"
                      then yyQ17(strm', lastMatch)
                    else if inp < #"\n"
                      then if inp = #"\t"
                          then yyQ16(strm', lastMatch)
                          else yyQ15(strm', lastMatch)
                      else yyQ15(strm', lastMatch)
                else if inp = #"#"
                  then yyQ15(strm', lastMatch)
                else if inp < #"#"
                  then if inp = #"!"
                      then yyQ15(strm', lastMatch)
                      else yyQ18(strm', lastMatch)
                else if inp <= #"/"
                  then yyQ15(strm', lastMatch)
                  else yyQ19(strm', lastMatch)
            else if inp = #"_"
              then yyQ15(strm', lastMatch)
            else if inp < #"_"
              then if inp = #"]"
                  then yyQ15(strm', lastMatch)
                else if inp < #"]"
                  then if inp = #"\\"
                      then yyQ21(strm', lastMatch)
                      else yyQ15(strm', lastMatch)
                  else yyQ22(strm', lastMatch)
            else if inp = #"o"
              then yyQ15(strm', lastMatch)
            else if inp < #"o"
              then if inp = #"n"
                  then yyQ23(strm', lastMatch)
                  else yyQ15(strm', lastMatch)
            else if inp = #"t"
              then yyQ24(strm', lastMatch)
              else yyQ15(strm', lastMatch)
      (* end case *))
fun yyQ13 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction47(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction47(strm, yyNO_MATCH)
      (* end case *))
fun yyQ12 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction49(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"*"
              then yyQ13(strm', yyMATCH(strm, yyAction49, yyNO_MATCH))
              else yyAction49(strm, yyNO_MATCH)
      (* end case *))
fun yyQ14 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction48(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction48(strm, yyNO_MATCH)
      (* end case *))
fun yyQ11 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction49(strm, yyNO_MATCH)
        | SOME(inp, strm') =>
            if inp = #"/"
              then yyQ14(strm', yyMATCH(strm, yyAction49, yyNO_MATCH))
              else yyAction49(strm, yyNO_MATCH)
      (* end case *))
fun yyQ9 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction49(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction49(strm, yyNO_MATCH)
      (* end case *))
fun yyQ1 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE =>
            if yyInput.eof(!(yystrm))
              then UserDeclarations.eof(yyarg)
              else yystuck(lastMatch)
        | SOME(inp, strm') =>
            if inp = #"*"
              then yyQ11(strm', lastMatch)
            else if inp < #"*"
              then if inp = #"\n"
                  then yyQ10(strm', lastMatch)
                  else yyQ9(strm', lastMatch)
            else if inp = #"/"
              then yyQ12(strm', lastMatch)
              else yyQ9(strm', lastMatch)
      (* end case *))
fun yyQ8 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction52(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction52(strm, yyNO_MATCH)
      (* end case *))
fun yyQ7 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction51(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction51(strm, yyNO_MATCH)
      (* end case *))
fun yyQ6 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction53(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction53(strm, yyNO_MATCH)
      (* end case *))
fun yyQ5 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE => yyAction54(strm, yyNO_MATCH)
        | SOME(inp, strm') => yyAction54(strm, yyNO_MATCH)
      (* end case *))
fun yyQ0 (strm, lastMatch : yymatch) = (case (yygetc(strm))
       of NONE =>
            if yyInput.eof(!(yystrm))
              then UserDeclarations.eof(yyarg)
              else yystuck(lastMatch)
        | SOME(inp, strm') =>
            if inp = #"\""
              then yyQ7(strm', lastMatch)
            else if inp < #"\""
              then if inp = #"\n"
                  then yyQ6(strm', lastMatch)
                  else yyQ5(strm', lastMatch)
            else if inp = #"\\"
              then yyQ8(strm', lastMatch)
              else yyQ5(strm', lastMatch)
      (* end case *))
in
  (case (!(yyss))
   of STRING => yyQ0(!(yystrm), yyNO_MATCH)
    | COMMENT => yyQ1(!(yystrm), yyNO_MATCH)
    | ESCAPE => yyQ2(!(yystrm), yyNO_MATCH)
    | INITIAL => yyQ3(!(yystrm), yyNO_MATCH)
    | IGNORE => yyQ4(!(yystrm), yyNO_MATCH)
  (* end case *))
end
            end
	  in 
            continue() 	  
	    handle IO.Io{cause, ...} => raise cause
          end
        in 
          lex 
        end
    in
    fun makeLexer yyinputN = mk (yyInput.mkStream yyinputN)
    fun makeLexer' ins = mk (yyInput.mkStream ins)
    end

  end
