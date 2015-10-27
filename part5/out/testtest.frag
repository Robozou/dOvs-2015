PROC {name = tigermain, formals = t, locals = 0}
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
          SEQ(
            MOVE(
              TEMP t109,
              CONST 1),
            SEQ(
              SEQ(
                CJUMP(LT,
                  CONST 1,
                  CONST 5,
                  L1_if_then,L2_if_else),
                SEQ(
                  LABEL L1_if_then,
                  SEQ(
                    CJUMP(GT,
                      CONST 2,
                      CONST 1,
                      L4_unEx_t,L5_unEx_f),
                    SEQ(
                      LABEL L2_if_else,
                      CJUMP(LT,
                        CONST 2,
                        CONST 1,
                        L4_unEx_t,L5_unEx_f))))),
              SEQ(
                LABEL L5_unEx_f,
                SEQ(
                  MOVE(
                    TEMP t109,
                    CONST 0),
                  LABEL L4_unEx_t)))),
          TEMP t109)),
      EXP(
        CONST 0))))

STRING L0_string = "DefaultString"

