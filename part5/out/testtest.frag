PROC {name = tigermain, formals = t, locals = 2}
SEQ(
  EXP(
    CONST 0),
  SEQ(
    EXP(
      CONST 0),
    SEQ(
      LABEL L3_mtseq,
      EXP(
        CONST 0))))

PROC {name = L2_lel, formals = tttt, locals = 0}
SEQ(
  EXP(
    CONST 0),
  SEQ(
    EXP(
      CONST 0),
    SEQ(
      MOVE(
        RV,
        BINOP(PLUS,
          MEM(
            BINOP(PLUS,
              FP,
              CONST ~4)),
          MEM(
            BINOP(PLUS,
              FP,
              CONST ~8)))),
      EXP(
        CONST 0))))

STRING L0_string = "DefaultString"

