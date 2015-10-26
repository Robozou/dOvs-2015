PROC {name = tigermain, formals = t, locals = 1}
SEQ(
  EXP(
    CONST 0),
  SEQ(
    EXP(
      CONST 0),
    SEQ(
      MOVE(
        RV,
        ESEQ(
          MOVE(
            MEM(
              BINOP(PLUS,
                FP,
                CONST ~4)),
            ESEQ(
              SEQ(
                MOVE(
                  TEMP t109,
                  CALL(
                    NAME allocRecord,
                    CONST 2)),
                SEQ(
                  MOVE(
                    MEM(
                      BINOP(PLUS,
                        TEMP t109,
                        CONST 0)),
                    NAME L1_string),
                  MOVE(
                    MEM(
                      BINOP(PLUS,
                        TEMP t109,
                        CONST 4)),
                    CONST 1000))),
              TEMP t109)),
          ESEQ(
            MOVE(
              CONST 0,
              NAME L2_string),
            MEM(
              BINOP(PLUS,
                FP,
                CONST ~4))))),
      EXP(
        CONST 0))))

STRING L2_string = "Somebody"

STRING L1_string = "Nobody"

STRING L0_string = "DefaultString"

