functor TigerLrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : Tiger_TOKENS
   end
 = 
struct
structure ParserData=
struct
structure Header = 
struct
structure A = Absyn
structure S = Symbol

(* [these functions and similar ones may be convenient
 * for the creation of abstract syntax trees] *)

datatype lvaluePartSpec = Field of S.symbol
                        | Subscript of A.exp

fun makeLvaluePartSpec (v, pos, l::r) =
  (case l
    of Field idsym =>
       makeLvaluePartSpec (A.FieldVar (v, idsym, pos), pos, r)
     | Subscript exp =>
       makeLvaluePartSpec (A.SubscriptVar (v, exp, pos), pos,r))
  | makeLvaluePartSpec (v, _, nil) = v

fun makeBinop (e1, bop, e2, p) =
    A.OpExp  { left = e1
             , oper = bop
             , right = e2
             , pos = p}

fun makeIf (et, en, el, p) =
    A.IfExp  { test = et
             , thn = en
             , els = el
             , pos = p}

fun makeVarDec (idsym, ty, e, p) =
             { name = idsym
             , escape = ref true
             , typ = ty
             , init = e
             , pos = p} : A.vardecldata

fun makeFundecl (idsym, ps, rty, e, p) =
             { name = idsym
             , params = ps
             , result = rty
             , body = e
             , pos = p} : A.fundecldata

fun makeTyDec (idsym, t, p) =
	     { name = idsym
	     , ty = t
	     , pos = p} : A.tydecldata

fun makeForExp (idsym, el, eh, eb, p) =
    A.ForExp { var = idsym
	     , escape = ref true
	     , lo = el
	     , hi = eh
	     , body = eb
	     , pos = p}

fun makeWhileExp (et, eb, p) =
    A.WhileExp { test = et
	       , body = eb
	       , pos = p}

fun makeLetExp (decs, eb, p) =
    A.LetExp { decls = decs
	     , body = eb
	     , pos = p}

fun makeCallExp (fnc, ags, p) =
    A.CallExp { func = fnc
	      , args = ags
	      , pos = p}

fun makeArExp (ty, sz, ini, p) =
    A.ArrayExp { typ = ty
	       , size = sz
	       , init = ini
	       , pos = p}

fun makeAssign (idsym, e, p) =
    A.AssignExp { var = idsym
		, exp = e
		, pos = p}

fun makeRecExp (flds, ty, p) =
    A.RecordExp { fields = flds
		, typ = ty
		, pos = p}



end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\000\000\000\000\
\\001\000\001\000\142\000\005\000\142\000\007\000\142\000\009\000\142\000\
\\011\000\142\000\013\000\142\000\015\000\032\000\016\000\031\000\
\\018\000\030\000\019\000\029\000\026\000\022\000\027\000\142\000\
\\028\000\142\000\032\000\142\000\033\000\142\000\036\000\142\000\
\\037\000\142\000\039\000\142\000\040\000\142\000\044\000\142\000\
\\045\000\142\000\046\000\142\000\000\000\
\\001\000\001\000\143\000\005\000\143\000\007\000\143\000\009\000\143\000\
\\011\000\143\000\013\000\143\000\015\000\032\000\016\000\031\000\
\\018\000\030\000\019\000\029\000\026\000\022\000\027\000\143\000\
\\028\000\143\000\032\000\143\000\033\000\143\000\036\000\143\000\
\\037\000\143\000\039\000\143\000\040\000\143\000\044\000\143\000\
\\045\000\143\000\046\000\143\000\000\000\
\\001\000\001\000\145\000\005\000\145\000\007\000\145\000\009\000\145\000\
\\011\000\145\000\013\000\145\000\015\000\032\000\016\000\031\000\
\\018\000\030\000\019\000\029\000\026\000\022\000\027\000\145\000\
\\028\000\145\000\032\000\145\000\033\000\108\000\036\000\145\000\
\\037\000\145\000\039\000\145\000\040\000\145\000\044\000\145\000\
\\045\000\145\000\046\000\145\000\000\000\
\\001\000\001\000\146\000\005\000\146\000\007\000\146\000\009\000\146\000\
\\011\000\146\000\013\000\146\000\015\000\032\000\016\000\031\000\
\\018\000\030\000\019\000\029\000\026\000\022\000\027\000\146\000\
\\028\000\146\000\032\000\146\000\033\000\146\000\036\000\146\000\
\\037\000\146\000\039\000\146\000\040\000\146\000\044\000\146\000\
\\045\000\146\000\046\000\146\000\000\000\
\\001\000\001\000\147\000\005\000\147\000\007\000\147\000\009\000\147\000\
\\011\000\147\000\013\000\147\000\015\000\032\000\016\000\031\000\
\\018\000\030\000\019\000\029\000\026\000\022\000\027\000\147\000\
\\028\000\147\000\032\000\147\000\033\000\147\000\036\000\147\000\
\\037\000\147\000\039\000\147\000\040\000\147\000\044\000\147\000\
\\045\000\147\000\046\000\147\000\000\000\
\\001\000\001\000\155\000\005\000\155\000\007\000\155\000\009\000\155\000\
\\011\000\155\000\013\000\155\000\015\000\032\000\016\000\031\000\
\\018\000\030\000\019\000\029\000\026\000\022\000\027\000\155\000\
\\028\000\155\000\032\000\155\000\033\000\155\000\036\000\155\000\
\\037\000\155\000\039\000\155\000\040\000\155\000\044\000\155\000\
\\045\000\155\000\046\000\155\000\000\000\
\\001\000\001\000\156\000\005\000\156\000\007\000\156\000\009\000\156\000\
\\011\000\156\000\013\000\156\000\015\000\032\000\016\000\031\000\
\\018\000\030\000\019\000\029\000\026\000\022\000\027\000\156\000\
\\028\000\156\000\032\000\156\000\033\000\156\000\036\000\156\000\
\\037\000\156\000\039\000\156\000\040\000\156\000\044\000\156\000\
\\045\000\156\000\046\000\156\000\000\000\
\\001\000\001\000\157\000\005\000\157\000\007\000\157\000\009\000\157\000\
\\011\000\157\000\013\000\157\000\015\000\032\000\016\000\031\000\
\\018\000\030\000\019\000\029\000\026\000\022\000\027\000\157\000\
\\028\000\157\000\032\000\157\000\033\000\157\000\036\000\157\000\
\\037\000\157\000\039\000\157\000\040\000\157\000\044\000\157\000\
\\045\000\157\000\046\000\157\000\000\000\
\\001\000\001\000\158\000\005\000\158\000\007\000\158\000\009\000\158\000\
\\011\000\158\000\013\000\158\000\015\000\032\000\016\000\031\000\
\\018\000\030\000\019\000\029\000\026\000\022\000\027\000\158\000\
\\028\000\158\000\032\000\158\000\033\000\158\000\036\000\158\000\
\\037\000\158\000\039\000\158\000\040\000\158\000\044\000\158\000\
\\045\000\158\000\046\000\158\000\000\000\
\\001\000\001\000\159\000\005\000\159\000\007\000\159\000\009\000\159\000\
\\011\000\159\000\013\000\159\000\015\000\032\000\016\000\031\000\
\\018\000\030\000\019\000\029\000\026\000\022\000\027\000\159\000\
\\028\000\159\000\032\000\159\000\033\000\159\000\036\000\159\000\
\\037\000\159\000\039\000\159\000\040\000\159\000\044\000\159\000\
\\045\000\159\000\046\000\159\000\000\000\
\\001\000\001\000\160\000\005\000\160\000\007\000\160\000\009\000\160\000\
\\011\000\160\000\013\000\160\000\015\000\032\000\016\000\031\000\
\\018\000\030\000\019\000\029\000\026\000\022\000\027\000\160\000\
\\028\000\160\000\032\000\160\000\033\000\160\000\036\000\160\000\
\\037\000\160\000\039\000\160\000\040\000\160\000\044\000\160\000\
\\045\000\160\000\046\000\160\000\000\000\
\\001\000\002\000\016\000\003\000\015\000\004\000\014\000\008\000\013\000\
\\016\000\012\000\031\000\011\000\034\000\010\000\035\000\009\000\
\\038\000\008\000\042\000\007\000\043\000\006\000\000\000\
\\001\000\002\000\041\000\000\000\
\\001\000\002\000\051\000\000\000\
\\001\000\002\000\069\000\000\000\
\\001\000\002\000\070\000\000\000\
\\001\000\002\000\071\000\000\000\
\\001\000\002\000\077\000\000\000\
\\001\000\002\000\102\000\012\000\101\000\030\000\100\000\000\000\
\\001\000\002\000\104\000\000\000\
\\001\000\002\000\121\000\000\000\
\\001\000\002\000\126\000\000\000\
\\001\000\002\000\130\000\000\000\
\\001\000\005\000\097\000\009\000\096\000\000\000\
\\001\000\006\000\087\000\029\000\086\000\000\000\
\\001\000\006\000\116\000\000\000\
\\001\000\006\000\125\000\020\000\124\000\000\000\
\\001\000\007\000\076\000\009\000\075\000\000\000\
\\001\000\007\000\076\000\040\000\098\000\000\000\
\\001\000\008\000\088\000\000\000\
\\001\000\009\000\115\000\000\000\
\\001\000\011\000\083\000\015\000\032\000\016\000\031\000\018\000\030\000\
\\019\000\029\000\020\000\028\000\021\000\027\000\022\000\026\000\
\\023\000\025\000\024\000\024\000\025\000\023\000\026\000\022\000\
\\027\000\021\000\028\000\020\000\000\000\
\\001\000\011\000\095\000\015\000\032\000\016\000\031\000\018\000\030\000\
\\019\000\029\000\020\000\028\000\021\000\027\000\022\000\026\000\
\\023\000\025\000\024\000\024\000\025\000\023\000\026\000\022\000\
\\027\000\021\000\028\000\020\000\000\000\
\\001\000\013\000\093\000\000\000\
\\001\000\013\000\122\000\000\000\
\\001\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\027\000\021\000\
\\028\000\020\000\032\000\074\000\000\000\
\\001\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\027\000\021\000\
\\028\000\020\000\036\000\107\000\000\000\
\\001\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\027\000\021\000\
\\028\000\020\000\037\000\073\000\000\000\
\\001\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\027\000\021\000\
\\028\000\020\000\037\000\127\000\000\000\
\\001\000\020\000\085\000\000\000\
\\001\000\020\000\094\000\000\000\
\\001\000\020\000\133\000\000\000\
\\001\000\029\000\072\000\000\000\
\\001\000\029\000\114\000\000\000\
\\001\000\039\000\067\000\000\000\
\\001\000\041\000\112\000\000\000\
\\137\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\027\000\021\000\
\\028\000\020\000\000\000\
\\138\000\000\000\
\\139\000\000\000\
\\140\000\000\000\
\\141\000\029\000\019\000\000\000\
\\144\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\026\000\022\000\000\000\
\\148\000\000\000\
\\149\000\000\000\
\\150\000\000\000\
\\151\000\000\000\
\\152\000\000\000\
\\153\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\000\000\
\\154\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\000\000\
\\161\000\018\000\030\000\019\000\029\000\026\000\022\000\000\000\
\\162\000\018\000\030\000\019\000\029\000\026\000\022\000\000\000\
\\163\000\026\000\022\000\000\000\
\\164\000\026\000\022\000\000\000\
\\165\000\026\000\022\000\000\000\
\\166\000\000\000\
\\167\000\002\000\016\000\003\000\015\000\004\000\014\000\008\000\013\000\
\\016\000\012\000\031\000\011\000\034\000\010\000\035\000\009\000\
\\038\000\008\000\042\000\007\000\043\000\006\000\000\000\
\\168\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\027\000\021\000\
\\028\000\020\000\000\000\
\\169\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\027\000\021\000\
\\028\000\020\000\000\000\
\\170\000\002\000\016\000\003\000\015\000\004\000\014\000\008\000\013\000\
\\016\000\012\000\031\000\011\000\034\000\010\000\035\000\009\000\
\\038\000\008\000\042\000\007\000\043\000\006\000\000\000\
\\171\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\027\000\021\000\
\\028\000\020\000\000\000\
\\172\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\027\000\021\000\
\\028\000\020\000\000\000\
\\173\000\002\000\079\000\000\000\
\\174\000\005\000\119\000\015\000\032\000\016\000\031\000\018\000\030\000\
\\019\000\029\000\020\000\028\000\021\000\027\000\022\000\026\000\
\\023\000\025\000\024\000\024\000\025\000\023\000\026\000\022\000\
\\027\000\021\000\028\000\020\000\000\000\
\\175\000\000\000\
\\176\000\000\000\
\\177\000\000\000\
\\178\000\000\000\
\\179\000\044\000\040\000\045\000\039\000\046\000\038\000\000\000\
\\180\000\000\000\
\\181\000\000\000\
\\182\000\000\000\
\\183\000\000\000\
\\184\000\000\000\
\\185\000\002\000\106\000\000\000\
\\186\000\005\000\131\000\000\000\
\\187\000\000\000\
\\188\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\027\000\021\000\
\\028\000\020\000\000\000\
\\189\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\027\000\021\000\
\\028\000\020\000\000\000\
\\190\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\027\000\021\000\
\\028\000\020\000\000\000\
\\191\000\015\000\032\000\016\000\031\000\018\000\030\000\019\000\029\000\
\\020\000\028\000\021\000\027\000\022\000\026\000\023\000\025\000\
\\024\000\024\000\025\000\023\000\026\000\022\000\027\000\021\000\
\\028\000\020\000\000\000\
\\192\000\008\000\050\000\010\000\049\000\012\000\048\000\014\000\047\000\000\000\
\\193\000\010\000\018\000\014\000\017\000\000\000\
\\194\000\000\000\
\\195\000\000\000\
\\196\000\000\000\
\\197\000\041\000\110\000\000\000\
\"
val actionRowNumbers =
"\012\000\092\000\051\000\047\000\
\\049\000\053\000\078\000\013\000\
\\012\000\012\000\012\000\069\000\
\\050\000\048\000\091\000\014\000\
\\012\000\012\000\012\000\012\000\
\\012\000\012\000\012\000\012\000\
\\012\000\012\000\012\000\012\000\
\\012\000\012\000\012\000\077\000\
\\076\000\075\000\045\000\078\000\
\\015\000\016\000\017\000\043\000\
\\038\000\036\000\065\000\028\000\
\\070\000\018\000\072\000\012\000\
\\066\000\094\000\032\000\001\000\
\\058\000\059\000\064\000\008\000\
\\010\000\007\000\009\000\011\000\
\\006\000\062\000\063\000\060\000\
\\061\000\069\000\079\000\040\000\
\\025\000\030\000\012\000\012\000\
\\012\000\055\000\012\000\093\000\
\\034\000\041\000\033\000\024\000\
\\067\000\095\000\029\000\019\000\
\\012\000\020\000\084\000\037\000\
\\004\000\003\000\071\000\056\000\
\\012\000\096\000\057\000\012\000\
\\054\000\080\000\046\000\084\000\
\\081\000\087\000\044\000\031\000\
\\026\000\012\000\012\000\073\000\
\\012\000\068\000\021\000\035\000\
\\012\000\027\000\022\000\039\000\
\\052\000\072\000\002\000\083\000\
\\082\000\088\000\012\000\023\000\
\\085\000\012\000\074\000\089\000\
\\042\000\084\000\005\000\012\000\
\\086\000\090\000\000\000"
val gotoT =
"\
\\001\000\134\000\002\000\003\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\006\000\035\000\007\000\034\000\008\000\033\000\011\000\032\000\
\\012\000\031\000\000\000\
\\000\000\
\\002\000\040\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\041\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\042\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\044\000\004\000\043\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\050\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\051\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\052\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\053\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\054\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\055\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\056\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\057\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\058\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\059\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\060\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\061\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\062\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\063\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\064\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\006\000\035\000\007\000\066\000\008\000\033\000\011\000\032\000\
\\012\000\031\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\005\000\076\000\000\000\
\\002\000\078\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\080\000\003\000\079\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\044\000\004\000\082\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\087\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\088\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\089\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\002\000\090\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\009\000\097\000\000\000\
\\002\000\101\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\010\000\103\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\107\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\000\000\
\\002\000\109\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\010\000\111\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\115\000\013\000\002\000\014\000\001\000\000\000\
\\002\000\116\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\002\000\118\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\121\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\005\000\126\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\127\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\000\000\
\\002\000\130\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\010\000\132\000\000\000\
\\000\000\
\\002\000\133\000\013\000\002\000\014\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\"
val numstates = 135
val numrules = 61
val s = ref "" and index = ref 0
val string_to_int = fn () => 
let val i = !index
in index := i+2; Char.ord(String.sub(!s,i)) + Char.ord(String.sub(!s,i+1)) * 256
end
val string_to_list = fn s' =>
    let val len = String.size s'
        fun f () =
           if !index < len then string_to_int() :: f()
           else nil
   in index := 0; s := s'; f ()
   end
val string_to_pairlist = fn (conv_key,conv_entry) =>
     let fun f () =
         case string_to_int()
         of 0 => EMPTY
          | n => PAIR(conv_key (n-1),conv_entry (string_to_int()),f())
     in f
     end
val string_to_pairlist_default = fn (conv_key,conv_entry) =>
    let val conv_row = string_to_pairlist(conv_key,conv_entry)
    in fn () =>
       let val default = conv_entry(string_to_int())
           val row = conv_row()
       in (row,default)
       end
   end
val string_to_table = fn (convert_row,s') =>
    let val len = String.size s'
        fun f ()=
           if !index < len then convert_row() :: f()
           else nil
     in (s := s'; index := 0; f ())
     end
local
  val memo = Array.array(numstates+numrules,ERROR)
  val _ =let fun g i=(Array.update(memo,i,REDUCE(i-numstates)); g(i+1))
       fun f i =
            if i=numstates then g i
            else (Array.update(memo,i,SHIFT (STATE i)); f (i+1))
          in f 0 handle General.Subscript => ()
          end
in
val entry_to_action = fn 0 => ACCEPT | 1 => ERROR | j => Array.sub(memo,(j-2))
end
val gotoT=Array.fromList(string_to_table(string_to_pairlist(NT,STATE),gotoT))
val actionRows=string_to_table(string_to_pairlist_default(T,entry_to_action),actionRows)
val actionRowNumbers = string_to_list actionRowNumbers
val actionT = let val actionRowLookUp=
let val a=Array.fromList(actionRows) in fn i=>Array.sub(a,i) end
in Array.fromList(List.map actionRowLookUp actionRowNumbers)
end
in LrTable.mkLrTable {actions=actionT,gotos=gotoT,numRules=numrules,
numStates=numstates,initialState=STATE 0}
end
end
local open Header in
type pos = int
type arg = unit
structure MlyValue = 
struct
datatype svalue = VOID | ntVOID of unit ->  unit
 | STRING of unit ->  (string) | INT of unit ->  (int)
 | ID of unit ->  (string) | lvalue_p of unit ->  (A.exp)
 | lvalue of unit ->  (A.var) | fundecl of unit ->  (A.fundecldata)
 | vardecl of unit ->  (A.vardecldata)
 | tyfields of unit ->  (A.fielddata list) | ty of unit ->  (A.ty)
 | tydecl of unit ->  (A.tydecldata) | decls of unit ->  (A.decl list)
 | decl of unit ->  (A.decl)
 | recfields of unit ->  ( ( S.symbol * A.exp * pos )  list)
 | seqexp of unit ->  ( ( A.exp * pos )  list)
 | exps of unit ->  (A.exp list) | exp of unit ->  (A.exp)
 | program of unit ->  (A.exp)
end
type svalue = MlyValue.svalue
type result = A.exp
end
structure EC=
struct
open LrTable
infix 5 $$
fun x $$ y = y::x
val is_keyword =
fn (T 33) => true | (T 34) => true | (T 35) => true | (T 41) => true
 | (T 37) => true | (T 38) => true | (T 39) => true | (T 43) => true
 | (T 44) => true | (T 45) => true | (T 29) => true | (T 30) => true
 | (T 31) => true | (T 32) => true | (T 36) => true | (T 40) => true
 | (T 42) => true | _ => false
val preferred_change : (term list * term list) list = 
(nil
,nil
 $$ (T 31))::
(nil
,nil
 $$ (T 32))::
(nil
,nil
 $$ (T 7))::
nil
val noShift = 
fn (T 0) => true | _ => false
val showTerminal =
fn (T 0) => "EOF"
  | (T 1) => "ID"
  | (T 2) => "INT"
  | (T 3) => "STRING"
  | (T 4) => "COMMA"
  | (T 5) => "COLON"
  | (T 6) => "SEMICOLON"
  | (T 7) => "LPAREN"
  | (T 8) => "RPAREN"
  | (T 9) => "LBRACK"
  | (T 10) => "RBRACK"
  | (T 11) => "LBRACE"
  | (T 12) => "RBRACE"
  | (T 13) => "DOT"
  | (T 14) => "PLUS"
  | (T 15) => "MINUS"
  | (T 16) => "UMINUS"
  | (T 17) => "TIMES"
  | (T 18) => "DIVIDE"
  | (T 19) => "EQ"
  | (T 20) => "NEQ"
  | (T 21) => "LT"
  | (T 22) => "LE"
  | (T 23) => "GT"
  | (T 24) => "GE"
  | (T 25) => "CARET"
  | (T 26) => "AND"
  | (T 27) => "OR"
  | (T 28) => "ASSIGN"
  | (T 29) => "ARRAY"
  | (T 30) => "IF"
  | (T 31) => "THEN"
  | (T 32) => "ELSE"
  | (T 33) => "WHILE"
  | (T 34) => "FOR"
  | (T 35) => "TO"
  | (T 36) => "DO"
  | (T 37) => "LET"
  | (T 38) => "IN"
  | (T 39) => "END"
  | (T 40) => "OF"
  | (T 41) => "BREAK"
  | (T 42) => "NIL"
  | (T 43) => "FUNCTION"
  | (T 44) => "VAR"
  | (T 45) => "TYPE"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn (T 1) => MlyValue.ID(fn () => ("bogus")) | 
(T 2) => MlyValue.INT(fn () => (1)) | 
(T 3) => MlyValue.STRING(fn () => ("")) | 
_ => MlyValue.VOID
end
val terms : term list = nil
 $$ (T 45) $$ (T 44) $$ (T 43) $$ (T 42) $$ (T 41) $$ (T 40) $$ (T 39)
 $$ (T 38) $$ (T 37) $$ (T 36) $$ (T 35) $$ (T 34) $$ (T 33) $$ (T 32)
 $$ (T 31) $$ (T 30) $$ (T 29) $$ (T 28) $$ (T 27) $$ (T 26) $$ (T 25)
 $$ (T 24) $$ (T 23) $$ (T 22) $$ (T 21) $$ (T 20) $$ (T 19) $$ (T 18)
 $$ (T 17) $$ (T 16) $$ (T 15) $$ (T 14) $$ (T 13) $$ (T 12) $$ (T 11)
 $$ (T 10) $$ (T 9) $$ (T 8) $$ (T 7) $$ (T 6) $$ (T 5) $$ (T 4) $$ 
(T 0)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( MlyValue.exp exp1, exp1left, exp1right)) :: rest671)
) => let val  result = MlyValue.program (fn _ => let val  (exp as exp1
) = exp1 ()
 in (exp)
end)
 in ( LrTable.NT 0, ( result, exp1left, exp1right), rest671)
end
|  ( 1, ( ( _, ( MlyValue.INT INT1, INT1left, INT1right)) :: rest671))
 => let val  result = MlyValue.exp (fn _ => let val  (INT as INT1) = 
INT1 ()
 in (A.IntExp INT)
end)
 in ( LrTable.NT 1, ( result, INT1left, INT1right), rest671)
end
|  ( 2, ( ( _, ( _, NIL1left, NIL1right)) :: rest671)) => let val  
result = MlyValue.exp (fn _ => (A.NilExp))
 in ( LrTable.NT 1, ( result, NIL1left, NIL1right), rest671)
end
|  ( 3, ( ( _, ( MlyValue.STRING STRING1, (STRINGleft as STRING1left),
 STRING1right)) :: rest671)) => let val  result = MlyValue.exp (fn _
 => let val  (STRING as STRING1) = STRING1 ()
 in (A.StringExp (STRING, STRINGleft))
end)
 in ( LrTable.NT 1, ( result, STRING1left, STRING1right), rest671)
end
|  ( 4, ( ( _, ( MlyValue.lvalue lvalue1, lvalue1left, lvalue1right))
 :: rest671)) => let val  result = MlyValue.exp (fn _ => let val  (
lvalue as lvalue1) = lvalue1 ()
 in (A.VarExp(lvalue))
end)
 in ( LrTable.NT 1, ( result, lvalue1left, lvalue1right), rest671)
end
|  ( 5, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: ( _, ( 
MlyValue.lvalue lvalue1, (lvalueleft as lvalue1left), _)) :: rest671))
 => let val  result = MlyValue.exp (fn _ => let val  (lvalue as 
lvalue1) = lvalue1 ()
 val  (exp as exp1) = exp1 ()
 in (makeAssign(lvalue,exp,lvalueleft))
end)
 in ( LrTable.NT 1, ( result, lvalue1left, exp1right), rest671)
end
|  ( 6, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: _ :: ( _, (
 MlyValue.exp exp1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, ID1left, _)
) :: rest671)) => let val  result = MlyValue.exp (fn _ => let val  ID1
 = ID1 ()
 val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in ()
end)
 in ( LrTable.NT 1, ( result, ID1left, exp2right), rest671)
end
|  ( 7, ( ( _, ( MlyValue.exp exp3, _, exp3right)) :: _ :: ( _, ( 
MlyValue.exp exp2, _, _)) :: _ :: ( _, ( MlyValue.exp exp1, _, _)) :: 
( _, ( _, (IFleft as IF1left), _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 val  exp3 = exp3 ()
 in (makeIf(exp1,exp2,SOME exp3,IFleft))
end)
 in ( LrTable.NT 1, ( result, IF1left, exp3right), rest671)
end
|  ( 8, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, _, _)) :: ( _, ( _, (IFleft as IF1left), _)) :: 
rest671)) => let val  result = MlyValue.exp (fn _ => let val  exp1 = 
exp1 ()
 val  exp2 = exp2 ()
 in (makeIf(exp1,exp2,NONE,IFleft))
end)
 in ( LrTable.NT 1, ( result, IF1left, exp2right), rest671)
end
|  ( 9, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, _, _)) :: ( _, ( _, (WHILEleft as WHILE1left), _))
 :: rest671)) => let val  result = MlyValue.exp (fn _ => let val  exp1
 = exp1 ()
 val  exp2 = exp2 ()
 in (makeWhileExp(exp1,exp2,WHILEleft))
end)
 in ( LrTable.NT 1, ( result, WHILE1left, exp2right), rest671)
end
|  ( 10, ( ( _, ( MlyValue.exp exp3, _, exp3right)) :: _ :: ( _, ( 
MlyValue.exp exp2, _, _)) :: _ :: ( _, ( MlyValue.exp exp1, _, _)) ::
 _ :: ( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _, (FORleft as FOR1left
), _)) :: rest671)) => let val  result = MlyValue.exp (fn _ => let
 val  (ID as ID1) = ID1 ()
 val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 val  exp3 = exp3 ()
 in (makeForExp(S.symbol(ID),exp1,exp2,exp3,FORleft))
end)
 in ( LrTable.NT 1, ( result, FOR1left, exp3right), rest671)
end
|  ( 11, ( ( _, ( _, (BREAKleft as BREAK1left), BREAK1right)) :: 
rest671)) => let val  result = MlyValue.exp (fn _ => (
A.BreakExp BREAKleft))
 in ( LrTable.NT 1, ( result, BREAK1left, BREAK1right), rest671)
end
|  ( 12, ( ( _, ( _, _, END1right)) :: ( _, ( MlyValue.seqexp seqexp1,
 _, _)) :: _ :: ( _, ( MlyValue.decls decls1, _, _)) :: ( _, ( _, (
LETleft as LET1left), _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  (decls as decls1) = decls1 ()
 val  (seqexp as seqexp1) = seqexp1 ()
 in (makeLetExp(decls,A.SeqExp(seqexp),LETleft))
end)
 in ( LrTable.NT 1, ( result, LET1left, END1right), rest671)
end
|  ( 13, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.seqexp 
seqexp1, _, _)) :: ( _, ( _, LPAREN1left, _)) :: rest671)) => let val 
 result = MlyValue.exp (fn _ => let val  (seqexp as seqexp1) = seqexp1
 ()
 in (A.SeqExp(seqexp))
end)
 in ( LrTable.NT 1, ( result, LPAREN1left, RPAREN1right), rest671)
end
|  ( 14, ( ( _, ( _, _, RBRACE1right)) :: ( _, ( MlyValue.recfields 
recfields1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, ID1left, _)) :: 
rest671)) => let val  result = MlyValue.exp (fn _ => let val  ID1 = 
ID1 ()
 val  recfields1 = recfields1 ()
 in ()
end)
 in ( LrTable.NT 1, ( result, ID1left, RBRACE1right), rest671)
end
|  ( 15, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.exps exps1,
 _, _)) :: _ :: ( _, ( MlyValue.ID ID1, ID1left, _)) :: rest671)) =>
 let val  result = MlyValue.exp (fn _ => let val  ID1 = ID1 ()
 val  exps1 = exps1 ()
 in ()
end)
 in ( LrTable.NT 1, ( result, ID1left, RPAREN1right), rest671)
end
|  ( 16, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeIf(exp1,A.IntExp(1),SOME exp2,exp1left))
end)
 in ( LrTable.NT 1, ( result, exp1left, exp2right), rest671)
end
|  ( 17, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeIf(exp1,exp2,SOME (A.IntExp(0)),exp1left))
end)
 in ( LrTable.NT 1, ( result, exp1left, exp2right), rest671)
end
|  ( 18, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeBinop(exp1,A.EqOp,exp2,exp1left))
end)
 in ( LrTable.NT 1, ( result, exp1left, exp2right), rest671)
end
|  ( 19, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeBinop(exp1,A.LeOp,exp2,exp1left))
end)
 in ( LrTable.NT 1, ( result, exp1left, exp2right), rest671)
end
|  ( 20, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeBinop(exp1,A.GeOp,exp2,exp1left))
end)
 in ( LrTable.NT 1, ( result, exp1left, exp2right), rest671)
end
|  ( 21, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeBinop(exp1,A.LtOp,exp2,exp1left))
end)
 in ( LrTable.NT 1, ( result, exp1left, exp2right), rest671)
end
|  ( 22, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeBinop(exp1,A.GtOp,exp2,exp1left))
end)
 in ( LrTable.NT 1, ( result, exp1left, exp2right), rest671)
end
|  ( 23, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeBinop(exp1,A.NeqOp,exp2,exp1left))
end)
 in ( LrTable.NT 1, ( result, exp1left, exp2right), rest671)
end
|  ( 24, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeBinop(exp1,A.MinusOp,exp2,exp1left))
end)
 in ( LrTable.NT 1, ( result, exp1left, exp2right), rest671)
end
|  ( 25, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeBinop(exp1,A.PlusOp,exp2,exp1left))
end)
 in ( LrTable.NT 1, ( result, exp1left, exp2right), rest671)
end
|  ( 26, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeBinop(exp1,A.DivideOp,exp2,exp1left))
end)
 in ( LrTable.NT 1, ( result, exp1left, exp2right), rest671)
end
|  ( 27, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeBinop(exp1,A.TimesOp,exp2,exp1left))
end)
 in ( LrTable.NT 1, ( result, exp1left, exp2right), rest671)
end
|  ( 28, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeBinop(exp1,A.ExponentOp,exp2,exp1left))
end)
 in ( LrTable.NT 1, ( result, exp1left, exp2right), rest671)
end
|  ( 29, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: ( _, ( _, (
MINUSleft as MINUS1left), _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  (exp as exp1) = exp1 ()
 in (makeBinop(A.IntExp(0),A.MinusOp,exp,MINUSleft))
end)
 in ( LrTable.NT 1, ( result, MINUS1left, exp1right), rest671)
end
|  ( 30, ( rest671)) => let val  result = MlyValue.exps (fn _ => ([]))
 in ( LrTable.NT 2, ( result, defaultPos, defaultPos), rest671)
end
|  ( 31, ( ( _, ( MlyValue.exp exp1, exp1left, exp1right)) :: rest671)
) => let val  result = MlyValue.exps (fn _ => let val  (exp as exp1) =
 exp1 ()
 in ([exp])
end)
 in ( LrTable.NT 2, ( result, exp1left, exp1right), rest671)
end
|  ( 32, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: ( _, ( 
MlyValue.exps exps1, exps1left, _)) :: rest671)) => let val  result = 
MlyValue.exps (fn _ => let val  (exps as exps1) = exps1 ()
 val  (exp as exp1) = exp1 ()
 in (exps@[exp])
end)
 in ( LrTable.NT 2, ( result, exps1left, exp1right), rest671)
end
|  ( 33, ( rest671)) => let val  result = MlyValue.seqexp (fn _ => ([]
))
 in ( LrTable.NT 3, ( result, defaultPos, defaultPos), rest671)
end
|  ( 34, ( ( _, ( MlyValue.exp exp1, (expleft as exp1left), exp1right)
) :: rest671)) => let val  result = MlyValue.seqexp (fn _ => let val 
 (exp as exp1) = exp1 ()
 in ([(exp,expleft)])
end)
 in ( LrTable.NT 3, ( result, exp1left, exp1right), rest671)
end
|  ( 35, ( ( _, ( MlyValue.exp exp1, expleft, exp1right)) :: _ :: ( _,
 ( MlyValue.seqexp seqexp1, seqexp1left, _)) :: rest671)) => let val  
result = MlyValue.seqexp (fn _ => let val  (seqexp as seqexp1) = 
seqexp1 ()
 val  (exp as exp1) = exp1 ()
 in (seqexp@[(exp,expleft)])
end)
 in ( LrTable.NT 3, ( result, seqexp1left, exp1right), rest671)
end
|  ( 36, ( rest671)) => let val  result = MlyValue.recfields (fn _ =>
 ([]))
 in ( LrTable.NT 4, ( result, defaultPos, defaultPos), rest671)
end
|  ( 37, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: ( _, ( 
MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = 
MlyValue.recfields (fn _ => let val  ID1 = ID1 ()
 val  exp1 = exp1 ()
 in ()
end)
 in ( LrTable.NT 4, ( result, ID1left, exp1right), rest671)
end
|  ( 38, ( ( _, ( MlyValue.recfields recfields1, _, recfields1right))
 :: _ :: ( _, ( MlyValue.exp exp1, _, _)) :: _ :: ( _, ( MlyValue.ID 
ID1, ID1left, _)) :: rest671)) => let val  result = MlyValue.recfields
 (fn _ => let val  ID1 = ID1 ()
 val  exp1 = exp1 ()
 val  recfields1 = recfields1 ()
 in ()
end)
 in ( LrTable.NT 4, ( result, ID1left, recfields1right), rest671)
end
|  ( 39, ( ( _, ( MlyValue.tydecl tydecl1, tydecl1left, tydecl1right))
 :: rest671)) => let val  result = MlyValue.decl (fn _ => let val  
tydecl1 = tydecl1 ()
 in ()
end)
 in ( LrTable.NT 5, ( result, tydecl1left, tydecl1right), rest671)
end
|  ( 40, ( ( _, ( MlyValue.vardecl vardecl1, vardecl1left, 
vardecl1right)) :: rest671)) => let val  result = MlyValue.decl (fn _
 => let val  vardecl1 = vardecl1 ()
 in ()
end)
 in ( LrTable.NT 5, ( result, vardecl1left, vardecl1right), rest671)

end
|  ( 41, ( ( _, ( MlyValue.fundecl fundecl1, fundecl1left, 
fundecl1right)) :: rest671)) => let val  result = MlyValue.decl (fn _
 => let val  fundecl1 = fundecl1 ()
 in ()
end)
 in ( LrTable.NT 5, ( result, fundecl1left, fundecl1right), rest671)

end
|  ( 42, ( rest671)) => let val  result = MlyValue.decls (fn _ => (nil
))
 in ( LrTable.NT 6, ( result, defaultPos, defaultPos), rest671)
end
|  ( 43, ( ( _, ( MlyValue.decls decls1, _, decls1right)) :: ( _, ( 
MlyValue.decl decl1, decl1left, _)) :: rest671)) => let val  result = 
MlyValue.decls (fn _ => let val  (decl as decl1) = decl1 ()
 val  (decls as decls1) = decls1 ()
 in (decls @ [decl])
end)
 in ( LrTable.NT 6, ( result, decl1left, decls1right), rest671)
end
|  ( 44, ( ( _, ( MlyValue.ty ty1, _, ty1right)) :: _ :: ( _, ( 
MlyValue.ID ID1, _, _)) :: ( _, ( _, (TYPEleft as TYPE1left), _)) :: 
rest671)) => let val  result = MlyValue.tydecl (fn _ => let val  (ID
 as ID1) = ID1 ()
 val  (ty as ty1) = ty1 ()
 in (makeTyDec(S.symbol(ID),ty,TYPEleft))
end)
 in ( LrTable.NT 7, ( result, TYPE1left, ty1right), rest671)
end
|  ( 45, ( ( _, ( MlyValue.ID ID1, (IDleft as ID1left), ID1right)) :: 
rest671)) => let val  result = MlyValue.ty (fn _ => let val  (ID as 
ID1) = ID1 ()
 in (A.NameTy(S.symbol(ID),IDleft))
end)
 in ( LrTable.NT 8, ( result, ID1left, ID1right), rest671)
end
|  ( 46, ( ( _, ( _, _, RBRACE1right)) :: ( _, ( MlyValue.tyfields 
tyfields1, _, _)) :: ( _, ( _, LBRACE1left, _)) :: rest671)) => let
 val  result = MlyValue.ty (fn _ => let val  (tyfields as tyfields1) =
 tyfields1 ()
 in (A.RecordTy(tyfields))
end)
 in ( LrTable.NT 8, ( result, LBRACE1left, RBRACE1right), rest671)
end
|  ( 47, ( ( _, ( MlyValue.ID ID1, IDleft, ID1right)) :: _ :: ( _, ( _
, ARRAY1left, _)) :: rest671)) => let val  result = MlyValue.ty (fn _
 => let val  (ID as ID1) = ID1 ()
 in (A.ArrayTy(S.symbol(ID),IDleft))
end)
 in ( LrTable.NT 8, ( result, ARRAY1left, ID1right), rest671)
end
|  ( 48, ( rest671)) => let val  result = MlyValue.tyfields (fn _ => (
nil))
 in ( LrTable.NT 9, ( result, defaultPos, defaultPos), rest671)
end
|  ( 49, ( ( _, ( MlyValue.ID ID2, _, ID2right)) :: _ :: ( _, ( 
MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = 
MlyValue.tyfields (fn _ => let val  ID1 = ID1 ()
 val  ID2 = ID2 ()
 in ()
end)
 in ( LrTable.NT 9, ( result, ID1left, ID2right), rest671)
end
|  ( 50, ( ( _, ( MlyValue.tyfields tyfields1, _, tyfields1right)) ::
 _ :: ( _, ( MlyValue.ID ID2, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, 
ID1left, _)) :: rest671)) => let val  result = MlyValue.tyfields (fn _
 => let val  ID1 = ID1 ()
 val  ID2 = ID2 ()
 val  tyfields1 = tyfields1 ()
 in ()
end)
 in ( LrTable.NT 9, ( result, ID1left, tyfields1right), rest671)
end
|  ( 51, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: ( _, ( 
MlyValue.ID ID1, _, _)) :: ( _, ( _, (VARleft as VAR1left), _)) :: 
rest671)) => let val  result = MlyValue.vardecl (fn _ => let val  (ID
 as ID1) = ID1 ()
 val  (exp as exp1) = exp1 ()
 in (makeVarDec(S.symbol(ID),NONE,exp,VARleft))
end)
 in ( LrTable.NT 10, ( result, VAR1left, exp1right), rest671)
end
|  ( 52, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: ( _, ( 
MlyValue.ID ID2, ID2left, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _))
 :: ( _, ( _, (VARleft as VAR1left), _)) :: rest671)) => let val  
result = MlyValue.vardecl (fn _ => let val  ID1 = ID1 ()
 val  ID2 = ID2 ()
 val  (exp as exp1) = exp1 ()
 in (
makeVarDec(S.symbol(ID1), SOME (S.symbol(ID2),ID2left), exp, VARleft))

end)
 in ( LrTable.NT 10, ( result, VAR1left, exp1right), rest671)
end
|  ( 53, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: _ :: ( _, 
( MlyValue.tyfields tyfields1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1,
 _, _)) :: ( _, ( _, FUNCTION1left, _)) :: rest671)) => let val  
result = MlyValue.fundecl (fn _ => let val  ID1 = ID1 ()
 val  tyfields1 = tyfields1 ()
 val  exp1 = exp1 ()
 in ()
end)
 in ( LrTable.NT 11, ( result, FUNCTION1left, exp1right), rest671)
end
|  ( 54, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: ( _, ( 
MlyValue.ID ID2, _, _)) :: _ :: _ :: ( _, ( MlyValue.tyfields 
tyfields1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _, 
FUNCTION1left, _)) :: rest671)) => let val  result = MlyValue.fundecl
 (fn _ => let val  ID1 = ID1 ()
 val  tyfields1 = tyfields1 ()
 val  ID2 = ID2 ()
 val  exp1 = exp1 ()
 in ()
end)
 in ( LrTable.NT 11, ( result, FUNCTION1left, exp1right), rest671)
end
|  ( 55, ( ( _, ( MlyValue.ID ID1, (IDleft as ID1left), ID1right)) :: 
rest671)) => let val  result = MlyValue.lvalue (fn _ => let val  (ID
 as ID1) = ID1 ()
 in (A.SimpleVar(S.symbol(ID),IDleft))
end)
 in ( LrTable.NT 12, ( result, ID1left, ID1right), rest671)
end
|  ( 56, ( ( _, ( MlyValue.lvalue_p lvalue_p1, lvalue_p1left, 
lvalue_p1right)) :: rest671)) => let val  result = MlyValue.lvalue (fn
 _ => let val  (lvalue_p as lvalue_p1) = lvalue_p1 ()
 in (lvalue_p)
end)
 in ( LrTable.NT 12, ( result, lvalue_p1left, lvalue_p1right), rest671
)
end
|  ( 57, ( ( _, ( MlyValue.ID ID2, _, ID2right)) :: _ :: ( _, ( 
MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = 
MlyValue.lvalue_p (fn _ => let val  ID1 = ID1 ()
 val  ID2 = ID2 ()
 in ()
end)
 in ( LrTable.NT 13, ( result, ID1left, ID2right), rest671)
end
|  ( 58, ( ( _, ( MlyValue.ID ID1, _, ID1right)) :: _ :: ( _, ( 
MlyValue.lvalue_p lvalue_p1, lvalue_p1left, _)) :: rest671)) => let
 val  result = MlyValue.lvalue_p (fn _ => let val  lvalue_p1 = 
lvalue_p1 ()
 val  ID1 = ID1 ()
 in ()
end)
 in ( LrTable.NT 13, ( result, lvalue_p1left, ID1right), rest671)
end
|  ( 59, ( ( _, ( _, _, RBRACK1right)) :: ( _, ( MlyValue.exp exp1, _,
 _)) :: _ :: ( _, ( MlyValue.lvalue_p lvalue_p1, lvalue_p1left, _)) ::
 rest671)) => let val  result = MlyValue.lvalue_p (fn _ => let val  
lvalue_p1 = lvalue_p1 ()
 val  exp1 = exp1 ()
 in ()
end)
 in ( LrTable.NT 13, ( result, lvalue_p1left, RBRACK1right), rest671)

end
|  ( 60, ( ( _, ( _, _, RBRACK1right)) :: ( _, ( MlyValue.exp exp1, _,
 _)) :: _ :: ( _, ( MlyValue.ID ID1, ID1left, _)) :: rest671)) => let
 val  result = MlyValue.lvalue_p (fn _ => let val  ID1 = ID1 ()
 val  exp1 = exp1 ()
 in ()
end)
 in ( LrTable.NT 13, ( result, ID1left, RBRACK1right), rest671)
end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.program x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a ()
end
end
structure Tokens : Tiger_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(
ParserData.MlyValue.VOID,p1,p2))
fun ID (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(
ParserData.MlyValue.ID (fn () => i),p1,p2))
fun INT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(
ParserData.MlyValue.INT (fn () => i),p1,p2))
fun STRING (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(
ParserData.MlyValue.STRING (fn () => i),p1,p2))
fun COMMA (p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(
ParserData.MlyValue.VOID,p1,p2))
fun COLON (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(
ParserData.MlyValue.VOID,p1,p2))
fun SEMICOLON (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(
ParserData.MlyValue.VOID,p1,p2))
fun LPAREN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(
ParserData.MlyValue.VOID,p1,p2))
fun RPAREN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(
ParserData.MlyValue.VOID,p1,p2))
fun LBRACK (p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(
ParserData.MlyValue.VOID,p1,p2))
fun RBRACK (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(
ParserData.MlyValue.VOID,p1,p2))
fun LBRACE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(
ParserData.MlyValue.VOID,p1,p2))
fun RBRACE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(
ParserData.MlyValue.VOID,p1,p2))
fun DOT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(
ParserData.MlyValue.VOID,p1,p2))
fun PLUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(
ParserData.MlyValue.VOID,p1,p2))
fun MINUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(
ParserData.MlyValue.VOID,p1,p2))
fun UMINUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(
ParserData.MlyValue.VOID,p1,p2))
fun TIMES (p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(
ParserData.MlyValue.VOID,p1,p2))
fun DIVIDE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(
ParserData.MlyValue.VOID,p1,p2))
fun EQ (p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(
ParserData.MlyValue.VOID,p1,p2))
fun NEQ (p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(
ParserData.MlyValue.VOID,p1,p2))
fun LT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(
ParserData.MlyValue.VOID,p1,p2))
fun LE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(
ParserData.MlyValue.VOID,p1,p2))
fun GT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(
ParserData.MlyValue.VOID,p1,p2))
fun GE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(
ParserData.MlyValue.VOID,p1,p2))
fun CARET (p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(
ParserData.MlyValue.VOID,p1,p2))
fun AND (p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(
ParserData.MlyValue.VOID,p1,p2))
fun OR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(
ParserData.MlyValue.VOID,p1,p2))
fun ASSIGN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(
ParserData.MlyValue.VOID,p1,p2))
fun ARRAY (p1,p2) = Token.TOKEN (ParserData.LrTable.T 29,(
ParserData.MlyValue.VOID,p1,p2))
fun IF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 30,(
ParserData.MlyValue.VOID,p1,p2))
fun THEN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 31,(
ParserData.MlyValue.VOID,p1,p2))
fun ELSE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 32,(
ParserData.MlyValue.VOID,p1,p2))
fun WHILE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 33,(
ParserData.MlyValue.VOID,p1,p2))
fun FOR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 34,(
ParserData.MlyValue.VOID,p1,p2))
fun TO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 35,(
ParserData.MlyValue.VOID,p1,p2))
fun DO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 36,(
ParserData.MlyValue.VOID,p1,p2))
fun LET (p1,p2) = Token.TOKEN (ParserData.LrTable.T 37,(
ParserData.MlyValue.VOID,p1,p2))
fun IN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 38,(
ParserData.MlyValue.VOID,p1,p2))
fun END (p1,p2) = Token.TOKEN (ParserData.LrTable.T 39,(
ParserData.MlyValue.VOID,p1,p2))
fun OF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 40,(
ParserData.MlyValue.VOID,p1,p2))
fun BREAK (p1,p2) = Token.TOKEN (ParserData.LrTable.T 41,(
ParserData.MlyValue.VOID,p1,p2))
fun NIL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 42,(
ParserData.MlyValue.VOID,p1,p2))
fun FUNCTION (p1,p2) = Token.TOKEN (ParserData.LrTable.T 43,(
ParserData.MlyValue.VOID,p1,p2))
fun VAR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 44,(
ParserData.MlyValue.VOID,p1,p2))
fun TYPE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 45,(
ParserData.MlyValue.VOID,p1,p2))
end
end
