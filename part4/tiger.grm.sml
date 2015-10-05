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

(* Convenience functions for creating abstract syntax tree *)

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

fun makeFieldData (idsym, ty, p) =
                { name = idsym
		, escape = ref true
		, typ = ty
		, pos = p} : A.fielddata




end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\000\000\000\000\
\\001\000\001\000\159\000\005\000\159\000\007\000\159\000\009\000\159\000\
\\011\000\159\000\013\000\159\000\017\000\159\000\018\000\159\000\
\\021\000\159\000\022\000\159\000\024\000\159\000\025\000\159\000\
\\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\038\000\019\000\039\000\159\000\040\000\159\000\044\000\159\000\
\\045\000\159\000\046\000\159\000\000\000\
\\001\000\001\000\160\000\005\000\160\000\007\000\160\000\009\000\160\000\
\\011\000\160\000\013\000\160\000\017\000\160\000\018\000\160\000\
\\021\000\160\000\022\000\160\000\024\000\160\000\025\000\160\000\
\\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\038\000\019\000\039\000\160\000\040\000\160\000\044\000\160\000\
\\045\000\160\000\046\000\160\000\000\000\
\\001\000\001\000\161\000\005\000\161\000\007\000\161\000\009\000\161\000\
\\011\000\161\000\013\000\161\000\017\000\161\000\018\000\161\000\
\\021\000\161\000\022\000\161\000\024\000\161\000\025\000\161\000\
\\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\038\000\019\000\039\000\161\000\040\000\161\000\044\000\161\000\
\\045\000\161\000\046\000\161\000\000\000\
\\001\000\001\000\162\000\005\000\162\000\007\000\162\000\009\000\162\000\
\\011\000\162\000\013\000\162\000\017\000\162\000\018\000\162\000\
\\021\000\162\000\022\000\162\000\024\000\162\000\025\000\162\000\
\\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\038\000\019\000\039\000\162\000\040\000\162\000\044\000\162\000\
\\045\000\162\000\046\000\162\000\000\000\
\\001\000\001\000\163\000\005\000\163\000\007\000\163\000\009\000\163\000\
\\011\000\163\000\013\000\163\000\017\000\163\000\018\000\163\000\
\\021\000\163\000\022\000\163\000\024\000\163\000\025\000\163\000\
\\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\038\000\019\000\039\000\163\000\040\000\163\000\044\000\163\000\
\\045\000\163\000\046\000\163\000\000\000\
\\001\000\001\000\164\000\005\000\164\000\007\000\164\000\009\000\164\000\
\\011\000\164\000\013\000\164\000\017\000\164\000\018\000\164\000\
\\021\000\164\000\022\000\164\000\024\000\164\000\025\000\164\000\
\\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\038\000\019\000\039\000\164\000\040\000\164\000\044\000\164\000\
\\045\000\164\000\046\000\164\000\000\000\
\\001\000\002\000\015\000\003\000\014\000\004\000\013\000\008\000\012\000\
\\016\000\011\000\019\000\010\000\020\000\009\000\023\000\008\000\
\\028\000\007\000\042\000\006\000\043\000\005\000\000\000\
\\001\000\002\000\041\000\000\000\
\\001\000\002\000\069\000\000\000\
\\001\000\002\000\070\000\000\000\
\\001\000\002\000\071\000\000\000\
\\001\000\002\000\077\000\000\000\
\\001\000\002\000\103\000\012\000\102\000\015\000\101\000\000\000\
\\001\000\002\000\105\000\000\000\
\\001\000\002\000\125\000\000\000\
\\001\000\002\000\130\000\000\000\
\\001\000\002\000\134\000\000\000\
\\001\000\005\000\098\000\009\000\097\000\000\000\
\\001\000\006\000\086\000\041\000\085\000\000\000\
\\001\000\006\000\119\000\000\000\
\\001\000\006\000\129\000\032\000\128\000\000\000\
\\001\000\007\000\076\000\009\000\075\000\000\000\
\\001\000\007\000\076\000\025\000\099\000\000\000\
\\001\000\008\000\087\000\000\000\
\\001\000\009\000\118\000\000\000\
\\001\000\011\000\096\000\027\000\029\000\028\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\025\000\033\000\024\000\034\000\023\000\
\\035\000\022\000\036\000\021\000\037\000\020\000\038\000\019\000\
\\039\000\018\000\040\000\017\000\000\000\
\\001\000\011\000\122\000\027\000\029\000\028\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\025\000\033\000\024\000\034\000\023\000\
\\035\000\022\000\036\000\021\000\037\000\020\000\038\000\019\000\
\\039\000\018\000\040\000\017\000\000\000\
\\001\000\013\000\094\000\000\000\
\\001\000\013\000\126\000\000\000\
\\001\000\017\000\074\000\027\000\029\000\028\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\025\000\033\000\024\000\034\000\023\000\
\\035\000\022\000\036\000\021\000\037\000\020\000\038\000\019\000\
\\039\000\018\000\040\000\017\000\000\000\
\\001\000\021\000\108\000\027\000\029\000\028\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\025\000\033\000\024\000\034\000\023\000\
\\035\000\022\000\036\000\021\000\037\000\020\000\038\000\019\000\
\\039\000\018\000\040\000\017\000\000\000\
\\001\000\022\000\073\000\027\000\029\000\028\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\025\000\033\000\024\000\034\000\023\000\
\\035\000\022\000\036\000\021\000\037\000\020\000\038\000\019\000\
\\039\000\018\000\040\000\017\000\000\000\
\\001\000\022\000\131\000\027\000\029\000\028\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\025\000\033\000\024\000\034\000\023\000\
\\035\000\022\000\036\000\021\000\037\000\020\000\038\000\019\000\
\\039\000\018\000\040\000\017\000\000\000\
\\001\000\024\000\067\000\000\000\
\\001\000\026\000\115\000\000\000\
\\001\000\032\000\084\000\000\000\
\\001\000\032\000\095\000\000\000\
\\001\000\032\000\137\000\000\000\
\\001\000\041\000\072\000\000\000\
\\001\000\041\000\117\000\000\000\
\\141\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\039\000\018\000\
\\040\000\017\000\000\000\
\\142\000\000\000\
\\143\000\000\000\
\\144\000\000\000\
\\145\000\041\000\016\000\000\000\
\\146\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\000\000\
\\147\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\000\000\
\\148\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\000\000\
\\149\000\018\000\109\000\027\000\029\000\028\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\025\000\033\000\024\000\034\000\023\000\
\\035\000\022\000\036\000\021\000\037\000\020\000\038\000\019\000\000\000\
\\150\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\000\000\
\\151\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\000\000\
\\152\000\000\000\
\\153\000\000\000\
\\154\000\000\000\
\\155\000\000\000\
\\156\000\000\000\
\\157\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\000\000\
\\158\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\000\000\
\\165\000\030\000\027\000\031\000\026\000\038\000\019\000\000\000\
\\166\000\030\000\027\000\031\000\026\000\038\000\019\000\000\000\
\\167\000\038\000\019\000\000\000\
\\168\000\038\000\019\000\000\000\
\\169\000\038\000\019\000\000\000\
\\170\000\038\000\019\000\000\000\
\\171\000\002\000\015\000\003\000\014\000\004\000\013\000\008\000\012\000\
\\016\000\011\000\019\000\010\000\020\000\009\000\023\000\008\000\
\\028\000\007\000\042\000\006\000\043\000\005\000\000\000\
\\172\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\039\000\018\000\
\\040\000\017\000\000\000\
\\173\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\039\000\018\000\
\\040\000\017\000\000\000\
\\174\000\002\000\015\000\003\000\014\000\004\000\013\000\008\000\012\000\
\\016\000\011\000\019\000\010\000\020\000\009\000\023\000\008\000\
\\028\000\007\000\042\000\006\000\043\000\005\000\000\000\
\\175\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\039\000\018\000\
\\040\000\017\000\000\000\
\\176\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\039\000\018\000\
\\040\000\017\000\000\000\
\\177\000\002\000\079\000\000\000\
\\178\000\005\000\123\000\027\000\029\000\028\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\025\000\033\000\024\000\034\000\023\000\
\\035\000\022\000\036\000\021\000\037\000\020\000\038\000\019\000\
\\039\000\018\000\040\000\017\000\000\000\
\\179\000\000\000\
\\180\000\046\000\038\000\000\000\
\\181\000\000\000\
\\182\000\044\000\040\000\000\000\
\\183\000\044\000\040\000\045\000\039\000\046\000\038\000\000\000\
\\184\000\000\000\
\\185\000\000\000\
\\186\000\000\000\
\\187\000\000\000\
\\188\000\000\000\
\\189\000\000\000\
\\190\000\000\000\
\\191\000\002\000\107\000\000\000\
\\192\000\005\000\135\000\000\000\
\\193\000\000\000\
\\194\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\039\000\018\000\
\\040\000\017\000\000\000\
\\195\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\039\000\018\000\
\\040\000\017\000\000\000\
\\196\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\039\000\018\000\
\\040\000\017\000\000\000\
\\197\000\027\000\029\000\028\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\035\000\022\000\
\\036\000\021\000\037\000\020\000\038\000\019\000\039\000\018\000\
\\040\000\017\000\000\000\
\\198\000\000\000\
\\199\000\000\000\
\\200\000\000\000\
\\201\000\008\000\050\000\010\000\049\000\012\000\048\000\014\000\047\000\000\000\
\\201\000\010\000\093\000\014\000\047\000\000\000\
\\201\000\010\000\093\000\014\000\047\000\026\000\113\000\000\000\
\\202\000\000\000\
\\203\000\000\000\
\"
val actionRowNumbers =
"\007\000\045\000\041\000\043\000\
\\052\000\007\000\077\000\008\000\
\\007\000\007\000\068\000\044\000\
\\042\000\095\000\007\000\007\000\
\\007\000\007\000\007\000\007\000\
\\007\000\007\000\007\000\007\000\
\\007\000\007\000\007\000\007\000\
\\064\000\076\000\092\000\075\000\
\\074\000\080\000\034\000\077\000\
\\009\000\010\000\011\000\039\000\
\\032\000\030\000\022\000\069\000\
\\094\000\012\000\071\000\007\000\
\\065\000\046\000\057\000\058\000\
\\063\000\003\000\005\000\002\000\
\\004\000\006\000\001\000\061\000\
\\062\000\059\000\060\000\093\000\
\\081\000\068\000\078\000\036\000\
\\019\000\024\000\007\000\007\000\
\\007\000\054\000\007\000\096\000\
\\028\000\037\000\026\000\018\000\
\\066\000\023\000\013\000\007\000\
\\014\000\085\000\031\000\050\000\
\\049\000\070\000\098\000\007\000\
\\055\000\007\000\097\000\056\000\
\\007\000\053\000\079\000\035\000\
\\085\000\082\000\088\000\040\000\
\\025\000\020\000\007\000\007\000\
\\027\000\072\000\099\000\007\000\
\\067\000\015\000\029\000\007\000\
\\021\000\016\000\033\000\048\000\
\\096\000\071\000\047\000\084\000\
\\083\000\089\000\007\000\017\000\
\\086\000\007\000\073\000\090\000\
\\038\000\085\000\051\000\007\000\
\\087\000\091\000\000\000"
val gotoT =
"\
\\001\000\138\000\002\000\002\000\015\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\028\000\015\000\001\000\000\000\
\\006\000\035\000\007\000\034\000\008\000\033\000\009\000\032\000\
\\012\000\031\000\013\000\030\000\014\000\029\000\000\000\
\\000\000\
\\002\000\040\000\015\000\001\000\000\000\
\\002\000\041\000\015\000\001\000\000\000\
\\002\000\043\000\004\000\042\000\015\000\001\000\000\000\
\\000\000\
\\000\000\
\\016\000\044\000\000\000\
\\002\000\049\000\015\000\001\000\000\000\
\\002\000\050\000\015\000\001\000\000\000\
\\002\000\051\000\015\000\001\000\000\000\
\\002\000\052\000\015\000\001\000\000\000\
\\002\000\053\000\015\000\001\000\000\000\
\\002\000\054\000\015\000\001\000\000\000\
\\002\000\055\000\015\000\001\000\000\000\
\\002\000\056\000\015\000\001\000\000\000\
\\002\000\057\000\015\000\001\000\000\000\
\\002\000\058\000\015\000\001\000\000\000\
\\002\000\059\000\015\000\001\000\000\000\
\\002\000\060\000\015\000\001\000\000\000\
\\002\000\061\000\015\000\001\000\000\000\
\\002\000\062\000\015\000\001\000\000\000\
\\000\000\
\\013\000\063\000\000\000\
\\000\000\
\\000\000\
\\008\000\064\000\000\000\
\\000\000\
\\000\000\
\\006\000\035\000\007\000\066\000\008\000\033\000\009\000\032\000\
\\012\000\031\000\013\000\030\000\014\000\029\000\000\000\
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
\\002\000\078\000\015\000\001\000\000\000\
\\002\000\080\000\003\000\079\000\015\000\001\000\000\000\
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
\\002\000\043\000\004\000\081\000\015\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\086\000\015\000\001\000\000\000\
\\002\000\087\000\015\000\001\000\000\000\
\\002\000\088\000\015\000\001\000\000\000\
\\000\000\
\\002\000\089\000\015\000\001\000\000\000\
\\016\000\090\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\010\000\098\000\000\000\
\\002\000\102\000\015\000\001\000\000\000\
\\000\000\
\\011\000\104\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\108\000\015\000\001\000\000\000\
\\000\000\
\\002\000\109\000\015\000\001\000\000\000\
\\016\000\110\000\000\000\
\\000\000\
\\002\000\112\000\015\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\011\000\114\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\118\000\015\000\001\000\000\000\
\\002\000\119\000\015\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\122\000\015\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\125\000\015\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\016\000\110\000\000\000\
\\005\000\130\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\131\000\015\000\001\000\000\000\
\\000\000\
\\000\000\
\\002\000\134\000\015\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\011\000\136\000\000\000\
\\000\000\
\\002\000\137\000\015\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\"
val numstates = 139
val numrules = 63
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
 | ID of unit ->  (string)
 | lvalue_p of unit ->  (lvaluePartSpec list)
 | lvalue of unit ->  (A.var)
 | fundecls of unit ->  (A.fundecldata list)
 | fundecl of unit ->  (A.fundecldata)
 | vardecl of unit ->  (A.vardecldata)
 | tyfields of unit ->  (A.fielddata list) | ty of unit ->  (A.ty)
 | tydecls of unit ->  (A.tydecldata list)
 | tydecl of unit ->  (A.tydecldata) | decls of unit ->  (A.decl list)
 | decl of unit ->  (A.decl)
 | recfields of unit ->  ( ( S.symbol * A.exp * pos )  list)
 | seqexp of unit ->  ( ( A.exp * pos )  list)
 | exps of unit ->  ( ( A.exp * pos )  list) | exp of unit ->  (A.exp)
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
fn (T 18) => true | (T 19) => true | (T 20) => true | (T 41) => true
 | (T 22) => true | (T 23) => true | (T 24) => true | (T 43) => true
 | (T 44) => true | (T 45) => true | (T 14) => true | (T 15) => true
 | (T 16) => true | (T 17) => true | (T 21) => true | (T 25) => true
 | (T 42) => true | _ => false
val preferred_change : (term list * term list) list = 
(nil
,nil
 $$ (T 16))::
(nil
,nil
 $$ (T 15))::
(nil
,nil
 $$ (T 17))::
(nil
,nil
 $$ (T 7))::
(nil
,nil
 $$ (T 8))::
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
  | (T 14) => "ARRAY"
  | (T 15) => "IF"
  | (T 16) => "THEN"
  | (T 17) => "ELSE"
  | (T 18) => "WHILE"
  | (T 19) => "FOR"
  | (T 20) => "TO"
  | (T 21) => "DO"
  | (T 22) => "LET"
  | (T 23) => "IN"
  | (T 24) => "END"
  | (T 25) => "OF"
  | (T 26) => "PLUS"
  | (T 27) => "MINUS"
  | (T 28) => "UMINUS"
  | (T 29) => "TIMES"
  | (T 30) => "DIVIDE"
  | (T 31) => "EQ"
  | (T 32) => "NEQ"
  | (T 33) => "LT"
  | (T 34) => "LE"
  | (T 35) => "GT"
  | (T 36) => "GE"
  | (T 37) => "CARET"
  | (T 38) => "AND"
  | (T 39) => "OR"
  | (T 40) => "ASSIGN"
  | (T 41) => "BREAK"
  | (T 42) => "NIL"
  | (T 43) => "FUNCTION"
  | (T 44) => "VAR"
  | (T 45) => "TYPE"
  | (T 46) => "DEC"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn (T 1) => MlyValue.ID(fn () => ("bogus")) | 
(T 2) => MlyValue.INT(fn () => (1)) | 
(T 3) => MlyValue.STRING(fn () => ("")) | 
_ => MlyValue.VOID
end
val terms : term list = nil
 $$ (T 46) $$ (T 45) $$ (T 44) $$ (T 43) $$ (T 42) $$ (T 41) $$ (T 40)
 $$ (T 39) $$ (T 38) $$ (T 37) $$ (T 36) $$ (T 35) $$ (T 34) $$ (T 33)
 $$ (T 32) $$ (T 31) $$ (T 30) $$ (T 29) $$ (T 28) $$ (T 27) $$ (T 26)
 $$ (T 25) $$ (T 24) $$ (T 23) $$ (T 22) $$ (T 21) $$ (T 20) $$ (T 19)
 $$ (T 18) $$ (T 17) $$ (T 16) $$ (T 15) $$ (T 14) $$ (T 13) $$ (T 12)
 $$ (T 11) $$ (T 10) $$ (T 9) $$ (T 8) $$ (T 7) $$ (T 6) $$ (T 5) $$ 
(T 4) $$ (T 0)end
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
 MlyValue.exp exp1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, (IDleft as 
ID1left), _)) :: rest671)) => let val  result = MlyValue.exp (fn _ =>
 let val  (ID as ID1) = ID1 ()
 val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (makeArExp(S.symbol(ID),exp1,exp2,IDleft))
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
recfields1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, (IDleft as ID1left)
, _)) :: rest671)) => let val  result = MlyValue.exp (fn _ => let val 
 (ID as ID1) = ID1 ()
 val  (recfields as recfields1) = recfields1 ()
 in (makeRecExp(recfields, S.symbol(ID), IDleft))
end)
 in ( LrTable.NT 1, ( result, ID1left, RBRACE1right), rest671)
end
|  ( 15, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.exps exps1,
 _, _)) :: _ :: ( _, ( MlyValue.ID ID1, (IDleft as ID1left), _)) :: 
rest671)) => let val  result = MlyValue.exp (fn _ => let val  (ID as 
ID1) = ID1 ()
 val  (exps as exps1) = exps1 ()
 in (makeCallExp(S.symbol(ID),exps,IDleft))
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
|  ( 31, ( ( _, ( MlyValue.exp exp1, (expleft as exp1left), exp1right)
) :: rest671)) => let val  result = MlyValue.exps (fn _ => let val  (
exp as exp1) = exp1 ()
 in ([(exp, expleft)])
end)
 in ( LrTable.NT 2, ( result, exp1left, exp1right), rest671)
end
|  ( 32, ( ( _, ( MlyValue.exp exp1, expleft, exp1right)) :: _ :: ( _,
 ( MlyValue.exps exps1, exps1left, _)) :: rest671)) => let val  result
 = MlyValue.exps (fn _ => let val  (exps as exps1) = exps1 ()
 val  (exp as exp1) = exp1 ()
 in (exps@[(exp,expleft)])
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
|  ( 37, ( ( _, ( MlyValue.exp exp1, expleft, exp1right)) :: _ :: ( _,
 ( MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = 
MlyValue.recfields (fn _ => let val  (ID as ID1) = ID1 ()
 val  (exp as exp1) = exp1 ()
 in ([(S.symbol(ID),exp, expleft)])
end)
 in ( LrTable.NT 4, ( result, ID1left, exp1right), rest671)
end
|  ( 38, ( ( _, ( MlyValue.recfields recfields1, _, recfields1right))
 :: _ :: ( _, ( MlyValue.exp exp1, expleft, _)) :: _ :: ( _, ( 
MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = 
MlyValue.recfields (fn _ => let val  (ID as ID1) = ID1 ()
 val  (exp as exp1) = exp1 ()
 val  (recfields as recfields1) = recfields1 ()
 in (recfields @ [(S.symbol(ID),exp, expleft)])
end)
 in ( LrTable.NT 4, ( result, ID1left, recfields1right), rest671)
end
|  ( 39, ( ( _, ( MlyValue.tydecls tydecls1, tydecls1left, 
tydecls1right)) :: rest671)) => let val  result = MlyValue.decl (fn _
 => let val  (tydecls as tydecls1) = tydecls1 ()
 in (A.TypeDec(tydecls))
end)
 in ( LrTable.NT 5, ( result, tydecls1left, tydecls1right), rest671)

end
|  ( 40, ( ( _, ( MlyValue.vardecl vardecl1, vardecl1left, 
vardecl1right)) :: rest671)) => let val  result = MlyValue.decl (fn _
 => let val  (vardecl as vardecl1) = vardecl1 ()
 in (A.VarDec(vardecl))
end)
 in ( LrTable.NT 5, ( result, vardecl1left, vardecl1right), rest671)

end
|  ( 41, ( ( _, ( MlyValue.fundecls fundecls1, fundecls1left, 
fundecls1right)) :: rest671)) => let val  result = MlyValue.decl (fn _
 => let val  (fundecls as fundecls1) = fundecls1 ()
 in (A.FunctionDec(fundecls))
end)
 in ( LrTable.NT 5, ( result, fundecls1left, fundecls1right), rest671)

end
|  ( 42, ( rest671)) => let val  result = MlyValue.decls (fn _ => ([])
)
 in ( LrTable.NT 6, ( result, defaultPos, defaultPos), rest671)
end
|  ( 43, ( ( _, ( MlyValue.decls decls1, _, decls1right)) :: ( _, ( 
MlyValue.decl decl1, decl1left, _)) :: rest671)) => let val  result = 
MlyValue.decls (fn _ => let val  (decl as decl1) = decl1 ()
 val  (decls as decls1) = decls1 ()
 in ([decl] @ decls)
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
|  ( 45, ( ( _, ( MlyValue.tydecl tydecl1, tydecl1left, tydecl1right))
 :: rest671)) => let val  result = MlyValue.tydecls (fn _ => let val 
 (tydecl as tydecl1) = tydecl1 ()
 in ([tydecl])
end)
 in ( LrTable.NT 8, ( result, tydecl1left, tydecl1right), rest671)
end
|  ( 46, ( ( _, ( MlyValue.tydecl tydecl1, _, tydecl1right)) :: ( _, (
 MlyValue.tydecls tydecls1, tydecls1left, _)) :: rest671)) => let val 
 result = MlyValue.tydecls (fn _ => let val  (tydecls as tydecls1) = 
tydecls1 ()
 val  (tydecl as tydecl1) = tydecl1 ()
 in ([tydecl] @ tydecls)
end)
 in ( LrTable.NT 8, ( result, tydecls1left, tydecl1right), rest671)

end
|  ( 47, ( ( _, ( MlyValue.ID ID1, (IDleft as ID1left), ID1right)) :: 
rest671)) => let val  result = MlyValue.ty (fn _ => let val  (ID as 
ID1) = ID1 ()
 in (A.NameTy(S.symbol(ID),IDleft))
end)
 in ( LrTable.NT 9, ( result, ID1left, ID1right), rest671)
end
|  ( 48, ( ( _, ( _, _, RBRACE1right)) :: ( _, ( MlyValue.tyfields 
tyfields1, _, _)) :: ( _, ( _, LBRACE1left, _)) :: rest671)) => let
 val  result = MlyValue.ty (fn _ => let val  (tyfields as tyfields1) =
 tyfields1 ()
 in (A.RecordTy(tyfields))
end)
 in ( LrTable.NT 9, ( result, LBRACE1left, RBRACE1right), rest671)
end
|  ( 49, ( ( _, ( MlyValue.ID ID1, IDleft, ID1right)) :: _ :: ( _, ( _
, ARRAY1left, _)) :: rest671)) => let val  result = MlyValue.ty (fn _
 => let val  (ID as ID1) = ID1 ()
 in (A.ArrayTy(S.symbol(ID),IDleft))
end)
 in ( LrTable.NT 9, ( result, ARRAY1left, ID1right), rest671)
end
|  ( 50, ( rest671)) => let val  result = MlyValue.tyfields (fn _ => (
nil))
 in ( LrTable.NT 10, ( result, defaultPos, defaultPos), rest671)
end
|  ( 51, ( ( _, ( MlyValue.ID ID2, ID2left, ID2right)) :: _ :: ( _, ( 
MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = 
MlyValue.tyfields (fn _ => let val  ID1 = ID1 ()
 val  ID2 = ID2 ()
 in ([makeFieldData(S.symbol(ID1), (S.symbol(ID2),ID2left),ID1left)])

end)
 in ( LrTable.NT 10, ( result, ID1left, ID2right), rest671)
end
|  ( 52, ( ( _, ( MlyValue.tyfields tyfields1, _, tyfields1right)) ::
 _ :: ( _, ( MlyValue.ID ID2, ID2left, _)) :: _ :: ( _, ( MlyValue.ID 
ID1, ID1left, _)) :: rest671)) => let val  result = MlyValue.tyfields
 (fn _ => let val  ID1 = ID1 ()
 val  ID2 = ID2 ()
 val  (tyfields as tyfields1) = tyfields1 ()
 in (
[makeFieldData(S.symbol(ID1),
									       (S.symbol(ID2),ID2left),
									       ID1left)] @ tyfields
)
end)
 in ( LrTable.NT 10, ( result, ID1left, tyfields1right), rest671)
end
|  ( 53, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: ( _, ( 
MlyValue.ID ID1, _, _)) :: ( _, ( _, (VARleft as VAR1left), _)) :: 
rest671)) => let val  result = MlyValue.vardecl (fn _ => let val  (ID
 as ID1) = ID1 ()
 val  (exp as exp1) = exp1 ()
 in (makeVarDec(S.symbol(ID),NONE,exp,VARleft))
end)
 in ( LrTable.NT 11, ( result, VAR1left, exp1right), rest671)
end
|  ( 54, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: ( _, ( 
MlyValue.ID ID2, ID2left, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _))
 :: ( _, ( _, (VARleft as VAR1left), _)) :: rest671)) => let val  
result = MlyValue.vardecl (fn _ => let val  ID1 = ID1 ()
 val  ID2 = ID2 ()
 val  (exp as exp1) = exp1 ()
 in (
makeVarDec(S.symbol(ID1),
									   SOME (S.symbol(ID2),ID2left),
									   exp,
									   VARleft)
)
end)
 in ( LrTable.NT 11, ( result, VAR1left, exp1right), rest671)
end
|  ( 55, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: _ :: ( _, 
( MlyValue.tyfields tyfields1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1,
 _, _)) :: ( _, ( _, (FUNCTIONleft as FUNCTION1left), _)) :: rest671))
 => let val  result = MlyValue.fundecl (fn _ => let val  (ID as ID1) =
 ID1 ()
 val  (tyfields as tyfields1) = tyfields1 ()
 val  (exp as exp1) = exp1 ()
 in (
makeFundecl(S.symbol(ID),
									    tyfields,
									    NONE,
									    exp,
									    FUNCTIONleft)
)
end)
 in ( LrTable.NT 12, ( result, FUNCTION1left, exp1right), rest671)
end
|  ( 56, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: ( _, ( 
MlyValue.ID ID2, ID2left, _)) :: _ :: _ :: ( _, ( MlyValue.tyfields 
tyfields1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _,
 (FUNCTIONleft as FUNCTION1left), _)) :: rest671)) => let val  result
 = MlyValue.fundecl (fn _ => let val  ID1 = ID1 ()
 val  (tyfields as tyfields1) = tyfields1 ()
 val  ID2 = ID2 ()
 val  (exp as exp1) = exp1 ()
 in (
makeFundecl(S.symbol(ID1),
									    tyfields,
									    SOME (S.symbol(ID2),ID2left),
									    exp,
									    FUNCTIONleft)
)
end)
 in ( LrTable.NT 12, ( result, FUNCTION1left, exp1right), rest671)
end
|  ( 57, ( ( _, ( MlyValue.fundecl fundecl1, fundecl1left, 
fundecl1right)) :: rest671)) => let val  result = MlyValue.fundecls
 (fn _ => let val  (fundecl as fundecl1) = fundecl1 ()
 in ([fundecl])
end)
 in ( LrTable.NT 13, ( result, fundecl1left, fundecl1right), rest671)

end
|  ( 58, ( ( _, ( MlyValue.fundecl fundecl1, _, fundecl1right)) :: ( _
, ( MlyValue.fundecls fundecls1, fundecls1left, _)) :: rest671)) =>
 let val  result = MlyValue.fundecls (fn _ => let val  (fundecls as 
fundecls1) = fundecls1 ()
 val  (fundecl as fundecl1) = fundecl1 ()
 in ([fundecl] @ fundecls)
end)
 in ( LrTable.NT 13, ( result, fundecls1left, fundecl1right), rest671)

end
|  ( 59, ( ( _, ( MlyValue.lvalue_p lvalue_p1, _, lvalue_p1right)) :: 
( _, ( MlyValue.ID ID1, (IDleft as ID1left), _)) :: rest671)) => let
 val  result = MlyValue.lvalue (fn _ => let val  (ID as ID1) = ID1 ()
 val  (lvalue_p as lvalue_p1) = lvalue_p1 ()
 in (
makeLvaluePartSpec(A.SimpleVar(S.symbol(ID),IDleft),
										   IDleft,
										   lvalue_p)
)
end)
 in ( LrTable.NT 14, ( result, ID1left, lvalue_p1right), rest671)
end
|  ( 60, ( rest671)) => let val  result = MlyValue.lvalue_p (fn _ => (
[]))
 in ( LrTable.NT 15, ( result, defaultPos, defaultPos), rest671)
end
|  ( 61, ( ( _, ( MlyValue.lvalue_p lvalue_p1, _, lvalue_p1right)) :: 
( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _, DOT1left, _)) :: rest671))
 => let val  result = MlyValue.lvalue_p (fn _ => let val  (ID as ID1)
 = ID1 ()
 val  (lvalue_p as lvalue_p1) = lvalue_p1 ()
 in (Field(S.symbol(ID))::lvalue_p)
end)
 in ( LrTable.NT 15, ( result, DOT1left, lvalue_p1right), rest671)
end
|  ( 62, ( ( _, ( MlyValue.lvalue_p lvalue_p1, _, lvalue_p1right)) ::
 _ :: ( _, ( MlyValue.exp exp1, _, _)) :: ( _, ( _, LBRACK1left, _))
 :: rest671)) => let val  result = MlyValue.lvalue_p (fn _ => let val 
 (exp as exp1) = exp1 ()
 val  (lvalue_p as lvalue_p1) = lvalue_p1 ()
 in (Subscript(exp)::lvalue_p)
end)
 in ( LrTable.NT 15, ( result, LBRACK1left, lvalue_p1right), rest671)

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
fun ARRAY (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(
ParserData.MlyValue.VOID,p1,p2))
fun IF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(
ParserData.MlyValue.VOID,p1,p2))
fun THEN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(
ParserData.MlyValue.VOID,p1,p2))
fun ELSE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(
ParserData.MlyValue.VOID,p1,p2))
fun WHILE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(
ParserData.MlyValue.VOID,p1,p2))
fun FOR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(
ParserData.MlyValue.VOID,p1,p2))
fun TO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(
ParserData.MlyValue.VOID,p1,p2))
fun DO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(
ParserData.MlyValue.VOID,p1,p2))
fun LET (p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(
ParserData.MlyValue.VOID,p1,p2))
fun IN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(
ParserData.MlyValue.VOID,p1,p2))
fun END (p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(
ParserData.MlyValue.VOID,p1,p2))
fun OF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(
ParserData.MlyValue.VOID,p1,p2))
fun PLUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(
ParserData.MlyValue.VOID,p1,p2))
fun MINUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(
ParserData.MlyValue.VOID,p1,p2))
fun UMINUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(
ParserData.MlyValue.VOID,p1,p2))
fun TIMES (p1,p2) = Token.TOKEN (ParserData.LrTable.T 29,(
ParserData.MlyValue.VOID,p1,p2))
fun DIVIDE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 30,(
ParserData.MlyValue.VOID,p1,p2))
fun EQ (p1,p2) = Token.TOKEN (ParserData.LrTable.T 31,(
ParserData.MlyValue.VOID,p1,p2))
fun NEQ (p1,p2) = Token.TOKEN (ParserData.LrTable.T 32,(
ParserData.MlyValue.VOID,p1,p2))
fun LT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 33,(
ParserData.MlyValue.VOID,p1,p2))
fun LE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 34,(
ParserData.MlyValue.VOID,p1,p2))
fun GT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 35,(
ParserData.MlyValue.VOID,p1,p2))
fun GE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 36,(
ParserData.MlyValue.VOID,p1,p2))
fun CARET (p1,p2) = Token.TOKEN (ParserData.LrTable.T 37,(
ParserData.MlyValue.VOID,p1,p2))
fun AND (p1,p2) = Token.TOKEN (ParserData.LrTable.T 38,(
ParserData.MlyValue.VOID,p1,p2))
fun OR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 39,(
ParserData.MlyValue.VOID,p1,p2))
fun ASSIGN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 40,(
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
fun DEC (p1,p2) = Token.TOKEN (ParserData.LrTable.T 46,(
ParserData.MlyValue.VOID,p1,p2))
end
end
