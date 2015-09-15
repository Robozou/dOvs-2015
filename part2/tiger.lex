type pos = int
type lexresult = Tokens.token

val inString = ref false
val curString = ref ""
val commCount = ref 0
val lineNum = ErrorMsg.lineNum
val linePos = ErrorMsg.linePos

val commentLevel = ref 0
val currentString = ref ""

fun err (p1,p2) = ErrorMsg.error p1

fun eof () =
    let
        val pos = hd (!linePos)
    in
    if !commCount <> 0 then (ErrorMsg.error pos "unclosed comment")
      else if !inString = true then (ErrorMsg.error pos "unclosed string")
      else (); commCount := 0; Tokens.EOF (pos,pos)
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

%%
letter=[a-zA-Z];
digits=[0-9]+;
idchars=[a-zA-Z0-9_]*;
ignore=[\t\ ]+|\n;
control=\^[@A-Z\\_\^];
ascii=[0-255];
%s [COMMENT STRING ESCAPE IGNORE];
%%

<INITIAL,COMMENT>"\n"	            => (lineNum := !lineNum+1;
                                        linePos := yypos :: !linePos;
                                        continue());
<INITIAL>"\t"                       => (continue());
<INITIAL>","                        => (dopos Tokens.COMMA yypos 1);
<INITIAL>"var"                      => (dopos Tokens.VAR yypos 3);
<INITIAL>"if"                       => (dopos Tokens.IF yypos 2);
<INITIAL>"then"                     => (dopos Tokens.THEN yypos 4);
<INITIAL>"else"                     => (dopos Tokens.ELSE yypos 4);
<INITIAL>"function"                 => (dopos Tokens.FUNCTION yypos 8);
<INITIAL>"break"                    => (dopos Tokens.BREAK yypos 5);
<INITIAL>"of"                       => (dopos Tokens.OF yypos 2);
<INITIAL>"end"                      => (dopos Tokens.END yypos 3);
<INITIAL>"in"                       => (dopos Tokens.IN yypos 2);
<INITIAL>"nil"                      => (dopos Tokens.NIL yypos 3);
<INITIAL>"let"                      => (dopos Tokens.LET yypos 3);
<INITIAL>"do"                       => (dopos Tokens.DO yypos 2);
<INITIAL>"to"                       => (dopos Tokens.TO yypos 2);
<INITIAL>"for"                      => (dopos Tokens.FOR yypos 3);
<INITIAL>"while"                    => (dopos Tokens.WHILE yypos 5);
<INITIAL>"array"                    => (dopos Tokens.ARRAY yypos 5);
<INITIAL>":="                       => (dopos Tokens.ASSIGN yypos 2);
<INITIAL>"or"                       => (dopos Tokens.OR yypos 2);
<INITIAL>"and"                      => (dopos Tokens.AND yypos 3);
<INITIAL>">"                        => (dopos Tokens.GT yypos 1);
<INITIAL>">="                       => (dopos Tokens.GE yypos 2);
<INITIAL>"<="                       => (dopos Tokens.LE yypos 2);
<INITIAL>"<"                        => (dopos Tokens.LT yypos 1);
<INITIAL>"<>"                       => (dopos Tokens.NEQ yypos 2);
<INITIAL>"="                        => (dopos Tokens.EQ yypos 1);
<INITIAL>"/"                        => (dopos Tokens.DIVIDE yypos 1);
<INITIAL>"*"                        => (dopos Tokens.TIMES yypos 1);
<INITIAL>"-"                        => (dopos Tokens.MINUS yypos 1);
<INITIAL>"+"                        => (dopos Tokens.PLUS yypos 1);
<INITIAL>"."                        => (dopos Tokens.DOT yypos 1);
<INITIAL>"}"                        => (dopos Tokens.RBRACE yypos 1);
<INITIAL>"{"                        => (dopos Tokens.LBRACE yypos 1);
<INITIAL>"]"                        => (dopos Tokens.RBRACK yypos 1);
<INITIAL>"["                        => (dopos Tokens.LBRACK yypos 1);
<INITIAL>")"                        => (dopos Tokens.RPAREN yypos 1);
<INITIAL>"("                        => (dopos Tokens.LPAREN yypos 1);
<INITIAL>";"                        => (dopos Tokens.SEMICOLON yypos 1);
<INITIAL>":"                        => (dopos Tokens.COLON yypos 1);
<INITIAL>" "                        => (continue());
<INITIAL>"/*"                       => (commCount := !commCount + 1; YYBEGIN COMMENT; continue());
<INITIAL>"^"                        => (dopos Tokens.CARET yypos 1);


<COMMENT>"/*"                       => (commCount := !commCount + 1; continue());
<COMMENT>"*/"                       => (commCount := !commCount - 1;
                                        if (!commCount = 0)
                                        then (YYBEGIN INITIAL; continue())
                                        else continue());
<COMMENT>.                          => (continue());

<INITIAL>\"                         => (curString := ""; inString := true; YYBEGIN STRING; continue());

<STRING>\"                          => (inString := false; YYBEGIN INITIAL; dopos3 Tokens.STRING (!curString) yypos (size(!curString)));

<STRING>"\\"                        => (YYBEGIN ESCAPE; continue());
<STRING>.                           => (curString := !curString ^ yytext; continue());

<ESCAPE>"n"                         => (curString := !curString ^ "\\" ^ yytext; YYBEGIN STRING; continue());
<ESCAPE>"t"                         => (curString := !curString ^ "\\" ^ yytext; YYBEGIN STRING; continue());
<ESCAPE>"\""                        => (curString := !curString ^ "\\" ^ yytext; YYBEGIN STRING; continue());
<ESCAPE>"\\"                        => (curString := !curString ^ "\\" ^ "\\"; YYBEGIN STRING; continue());
<ESCAPE>{ascii}                     => (curString := !curString ^ "\\" ^ yytext; YYBEGIN STRING; continue());
<ESCAPE>{control}                   => (curString := !curString ^ "\\" ^ yytext; YYBEGIN STRING; continue());
<ESCAPE>{ignore}                    => (YYBEGIN IGNORE; continue());
<ESCAPE>.                           => (ErrorMsg.error yypos ("Invalid escape character " ^ yytext); eof());


<IGNORE>{ignore}                    => (continue()); 
<IGNORE>"\\"                        => (YYBEGIN STRING; continue());
<IGNORE>.                           => (ErrorMsg.error yypos ("Invalid character in ignore. No support for " ^ yytext); eof());


<INITIAL>{digits}                   => (dopos3 Tokens.INT (s2i yytext yypos) yypos
                                                 (size yytext));
<INITIAL>{idchars}                  => (dopos3 Tokens.ID yytext yypos (size yytext));

.                          => (ErrorMsg.error yypos ("illegal char " ^ yytext);
                               continue());

