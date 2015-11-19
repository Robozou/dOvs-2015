PROC {name = tigermain, formals = t, locals = 4}
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
              MEM(
                BINOP(PLUS,
                  FP,
                  CONST ~4)),
              ESEQ(
                EXP(
                  CALL(
                    NAME print,
                    FP,
                    NAME L1_string)),
                CONST 3)),
            SEQ(
              MOVE(
                MEM(
                  BINOP(PLUS,
                    FP,
                    CONST ~8)),
                ESEQ(
                  SEQ(
                    MOVE(
                      TEMP t109,
                      CALL(
                        NAME allocRecord,
                        CONST 1)),
                    MOVE(
                      MEM(
                        BINOP(PLUS,
                          TEMP t109,
                          CONST 0)),
                      CONST 7)),
                  TEMP t109)),
              SEQ(
                MOVE(
                  MEM(
                    BINOP(PLUS,
                      FP,
                      CONST ~12)),
                  CALL(
                    NAME initArray,
                    CONST 5,
                    MEM(
                      BINOP(PLUS,
                        FP,
                        CONST ~8)))),
                MOVE(
                  MEM(
                    BINOP(PLUS,
                      FP,
                      CONST ~16)),
                  CALL(
                    NAME initArray,
                    CONST 7,
                    NAME L2_string))))),
          ESEQ(
            EXP(
              CALL(
                NAME print,
                FP,
                NAME L3_string)),
            ESEQ(
              EXP(
                CALL(
                  NAME print,
                  FP,
                  ESEQ(
                    SEQ(
                      MOVE(
                        TEMP t110,
                        CONST 2),
                      SEQ(
                        MOVE(
                          TEMP t111,
                          MEM(
                            BINOP(PLUS,
                              FP,
                              CONST ~16))),
                        SEQ(
                          MOVE(
                            TEMP t113,
                            MEM(
                              BINOP(MINUS,
                                TEMP t111,
                                CONST 4))),
                          SEQ(
                            CJUMP(GE,
                              TEMP t110,
                              CONST 0,
                              L5_subs_nneg,L4_subs_neg),
                            SEQ(
                              LABEL L4_subs_neg,
                              SEQ(
                                EXP(
                                  CALL(
                                    NAME arrInxError,
                                    TEMP t110)),
                                SEQ(
                                  LABEL L5_subs_nneg,
                                  SEQ(
                                    CJUMP(LT,
                                      TEMP t110,
                                      TEMP t113,
                                      L7_subs_novf,L6_subs_ovf),
                                    SEQ(
                                      LABEL L6_subs_ovf,
                                      SEQ(
                                        EXP(
                                          CALL(
                                            NAME arrInxError,
                                            TEMP t110)),
                                        SEQ(
                                          LABEL L7_subs_novf,
                                          MOVE(
                                            TEMP t112,
                                            BINOP(PLUS,
                                              TEMP t111,
                                              BINOP(MUL,
                                                TEMP t110,
                                                CONST 4)))))))))))))),
                    MEM(
                      TEMP t112)))),
              ESEQ(
                EXP(
                  CALL(
                    NAME flush,
                    FP)),
                ESEQ(
                  MOVE(
                    ESEQ(
                      SEQ(
                        CJUMP(EQ,
                          ESEQ(
                            SEQ(
                              MOVE(
                                TEMP t114,
                                CONST 1),
                              SEQ(
                                MOVE(
                                  TEMP t115,
                                  MEM(
                                    BINOP(PLUS,
                                      FP,
                                      CONST ~12))),
                                SEQ(
                                  MOVE(
                                    TEMP t117,
                                    MEM(
                                      BINOP(MINUS,
                                        TEMP t115,
                                        CONST 4))),
                                  SEQ(
                                    CJUMP(GE,
                                      TEMP t114,
                                      CONST 0,
                                      L9_subs_nneg,L8_subs_neg),
                                    SEQ(
                                      LABEL L8_subs_neg,
                                      SEQ(
                                        EXP(
                                          CALL(
                                            NAME arrInxError,
                                            TEMP t114)),
                                        SEQ(
                                          LABEL L9_subs_nneg,
                                          SEQ(
                                            CJUMP(LT,
                                              TEMP t114,
                                              TEMP t117,
                                              L11_subs_novf,L10_subs_ovf),
                                            SEQ(
                                              LABEL L10_subs_ovf,
                                              SEQ(
                                                EXP(
                                                  CALL(
                                                    NAME arrInxError,
                                                    TEMP t114)),
                                                SEQ(
                                                  LABEL L11_subs_novf,
                                                  MOVE(
                                                    TEMP t116,
                                                    BINOP(PLUS,
                                                      TEMP t115,
                                                      BINOP(MUL,
                                                        TEMP t114,
                                                        CONST 4)))))))))))))),
                            MEM(
                              TEMP t116)),
                          CONST 0,
                          L12_field_nil,L13_field_nonNil),
                        SEQ(
                          LABEL L12_field_nil,
                          SEQ(
                            EXP(
                              CALL(
                                NAME recFieldError)),
                            SEQ(
                              LABEL L13_field_nonNil,
                              MOVE(
                                TEMP t118,
                                BINOP(PLUS,
                                  ESEQ(
                                    SEQ(
                                      MOVE(
                                        TEMP t114,
                                        CONST 1),
                                      SEQ(
                                        MOVE(
                                          TEMP t115,
                                          MEM(
                                            BINOP(PLUS,
                                              FP,
                                              CONST ~12))),
                                        SEQ(
                                          MOVE(
                                            TEMP t117,
                                            MEM(
                                              BINOP(MINUS,
                                                TEMP t115,
                                                CONST 4))),
                                          SEQ(
                                            CJUMP(GE,
                                              TEMP t114,
                                              CONST 0,
                                              L9_subs_nneg,L8_subs_neg),
                                            SEQ(
                                              LABEL L8_subs_neg,
                                              SEQ(
                                                EXP(
                                                  CALL(
                                                    NAME arrInxError,
                                                    TEMP t114)),
                                                SEQ(
                                                  LABEL L9_subs_nneg,
                                                  SEQ(
                                                    CJUMP(LT,
                                                      TEMP t114,
                                                      TEMP t117,
                                                      L11_subs_novf,L10_subs_ovf),
                                                    SEQ(
                                                      LABEL L10_subs_ovf,
                                                      SEQ(
                                                        EXP(
                                                          CALL(
                                                            NAME arrInxError,
                                                            TEMP t114)),
                                                        SEQ(
                                                          LABEL L11_subs_novf,
                                                          MOVE(
                                                            TEMP t116,
                                                            BINOP(PLUS,
                                                              TEMP t115,
                                                              BINOP(MUL,
                                                                TEMP t114,
                                                                CONST 4)))))))))))))),
                                    MEM(
                                      TEMP t116)),
                                  BINOP(MUL,
                                    CONST 0,
                                    CONST 4))))))),
                      MEM(
                        TEMP t118)),
                    CONST 23),
                  ESEQ(
                    EXP(
                      CALL(
                        NAME print,
                        FP,
                        NAME L14_string)),
                    ESEQ(
                      EXP(
                        CALL(
                          NAME flush,
                          FP)),
                      ESEQ(
                        SEQ(
                          CJUMP(EQ,
                            ESEQ(
                              SEQ(
                                MOVE(
                                  TEMP t119,
                                  CONST 1),
                                SEQ(
                                  MOVE(
                                    TEMP t120,
                                    MEM(
                                      BINOP(PLUS,
                                        FP,
                                        CONST ~12))),
                                  SEQ(
                                    MOVE(
                                      TEMP t122,
                                      MEM(
                                        BINOP(MINUS,
                                          TEMP t120,
                                          CONST 4))),
                                    SEQ(
                                      CJUMP(GE,
                                        TEMP t119,
                                        CONST 0,
                                        L16_subs_nneg,L15_subs_neg),
                                      SEQ(
                                        LABEL L15_subs_neg,
                                        SEQ(
                                          EXP(
                                            CALL(
                                              NAME arrInxError,
                                              TEMP t119)),
                                          SEQ(
                                            LABEL L16_subs_nneg,
                                            SEQ(
                                              CJUMP(LT,
                                                TEMP t119,
                                                TEMP t122,
                                                L18_subs_novf,L17_subs_ovf),
                                              SEQ(
                                                LABEL L17_subs_ovf,
                                                SEQ(
                                                  EXP(
                                                    CALL(
                                                      NAME arrInxError,
                                                      TEMP t119)),
                                                  SEQ(
                                                    LABEL L18_subs_novf,
                                                    MOVE(
                                                      TEMP t121,
                                                      BINOP(PLUS,
                                                        TEMP t120,
                                                        BINOP(MUL,
                                                          TEMP t119,
                                                          CONST 4)))))))))))))),
                              MEM(
                                TEMP t121)),
                            CONST 0,
                            L19_field_nil,L20_field_nonNil),
                          SEQ(
                            LABEL L19_field_nil,
                            SEQ(
                              EXP(
                                CALL(
                                  NAME recFieldError)),
                              SEQ(
                                LABEL L20_field_nonNil,
                                MOVE(
                                  TEMP t123,
                                  BINOP(PLUS,
                                    ESEQ(
                                      SEQ(
                                        MOVE(
                                          TEMP t119,
                                          CONST 1),
                                        SEQ(
                                          MOVE(
                                            TEMP t120,
                                            MEM(
                                              BINOP(PLUS,
                                                FP,
                                                CONST ~12))),
                                          SEQ(
                                            MOVE(
                                              TEMP t122,
                                              MEM(
                                                BINOP(MINUS,
                                                  TEMP t120,
                                                  CONST 4))),
                                            SEQ(
                                              CJUMP(GE,
                                                TEMP t119,
                                                CONST 0,
                                                L16_subs_nneg,L15_subs_neg),
                                              SEQ(
                                                LABEL L15_subs_neg,
                                                SEQ(
                                                  EXP(
                                                    CALL(
                                                      NAME arrInxError,
                                                      TEMP t119)),
                                                  SEQ(
                                                    LABEL L16_subs_nneg,
                                                    SEQ(
                                                      CJUMP(LT,
                                                        TEMP t119,
                                                        TEMP t122,
                                                        L18_subs_novf,L17_subs_ovf),
                                                      SEQ(
                                                        LABEL L17_subs_ovf,
                                                        SEQ(
                                                          EXP(
                                                            CALL(
                                                              NAME arrInxError,
                                                              TEMP t119)),
                                                          SEQ(
                                                            LABEL L18_subs_novf,
                                                            MOVE(
                                                              TEMP t121,
                                                              BINOP(PLUS,
                                                                TEMP t120,
                                                                BINOP(MUL,
                                                                  TEMP t119,
                                                                  CONST 4)))))))))))))),
                                      MEM(
                                        TEMP t121)),
                                    BINOP(MUL,
                                      CONST 0,
                                      CONST 4))))))),
                        MEM(
                          TEMP t123)))))))))),
      EXP(
        CONST 0))))

STRING L14_string = "2"

STRING L3_string = "0"

STRING L2_string = "Strings"

STRING L1_string = "first"

STRING L0_string = "DefaultString"

