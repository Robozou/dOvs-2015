PROC {name = tigermain, formals = t, locals = 2}
SEQ(
  EXP(
    CONST 0),
  SEQ(
    EXP(
      CONST 0),
    SEQ(
      EXP(
        ESEQ(
          SEQ(
            MOVE(
              MEM(
                BINOP(PLUS,
                  FP,
                  CONST ~4)),
              NAME L1_string),
            MOVE(
              MEM(
                BINOP(PLUS,
                  FP,
                  CONST ~8)),
              ESEQ(
                MOVE(
                  MEM(
                    BINOP(PLUS,
                      FP,
                      CONST ~4)),
                  CALL(
                    NAME L3_rs,
                    FP)),
                CALL(
                  NAME L2_rss,
                  FP)))),
          ESEQ(
            SEQ(
              CJUMP(EQ,
                CALL(
                  NAME stringEqual,
                  MEM(
                    BINOP(PLUS,
                      FP,
                      CONST ~8)),
                  NAME L6_string),
                CONST 0,
                L10_if_else,L9_if_then),
              SEQ(
                LABEL L9_if_then,
                SEQ(
                  EXP(
                    CALL(
                      NAME print,
                      FP,
                      NAME L7_string)),
                  SEQ(
                    JUMP(
                      NAME L11_if_join),
                    SEQ(
                      LABEL L10_if_else,
                      SEQ(
                        EXP(
                          CALL(
                            NAME print,
                            FP,
                            NAME L8_string)),
                        LABEL L11_if_join)))))),
            CONST 0))),
      EXP(
        CONST 0))))

STRING L8_string = "FALSE"

STRING L7_string = "TRUE"

STRING L6_string = "bob"

PROC {name = L3_rs, formals = t, locals = 0}
SEQ(
  EXP(
    CONST 0),
  SEQ(
    EXP(
      CONST 0),
    SEQ(
      MOVE(
        RV,
        NAME L5_string),
      EXP(
        CONST 0))))

STRING L5_string = "lol"

PROC {name = L2_rss, formals = t, locals = 0}
SEQ(
  EXP(
    CONST 0),
  SEQ(
    EXP(
      CONST 0),
    SEQ(
      MOVE(
        RV,
        NAME L4_string),
      EXP(
        CONST 0))))

STRING L4_string = "bob"

STRING L1_string = "lel"

STRING L0_string = "DefaultString"

