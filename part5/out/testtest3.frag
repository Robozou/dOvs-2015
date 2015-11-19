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
            CALL(
              NAME initArray,
              CONST 5,
              CONST 0)),
          ESEQ(
            SEQ(
              MOVE(
                TEMP t109,
                CONST 2),
              SEQ(
                MOVE(
                  TEMP t110,
                  MEM(
                    BINOP(PLUS,
                      FP,
                      CONST ~4))),
                SEQ(
                  MOVE(
                    TEMP t112,
                    MEM(
                      BINOP(MINUS,
                        TEMP t110,
                        CONST 4))),
                  SEQ(
                    CJUMP(GE,
                      TEMP t109,
                      CONST 0,
                      L2_subs_nneg,L1_subs_neg),
                    SEQ(
                      LABEL L1_subs_neg,
                      SEQ(
                        EXP(
                          CALL(
                            NAME arrInxError,
                            TEMP t109)),
                        SEQ(
                          LABEL L2_subs_nneg,
                          SEQ(
                            CJUMP(LT,
                              TEMP t109,
                              TEMP t112,
                              L4_subs_novf,L3_subs_ovf),
                            SEQ(
                              LABEL L3_subs_ovf,
                              SEQ(
                                EXP(
                                  CALL(
                                    NAME arrInxError,
                                    TEMP t109)),
                                SEQ(
                                  LABEL L4_subs_novf,
                                  MOVE(
                                    TEMP t111,
                                    BINOP(PLUS,
                                      TEMP t110,
                                      BINOP(MUL,
                                        TEMP t109,
                                        CONST 4)))))))))))))),
            MEM(
              TEMP t111)))),
      EXP(
        CONST 0))))

STRING L0_string = "DefaultString"

