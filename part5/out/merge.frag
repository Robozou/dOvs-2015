PROC {name = tigermain, formals = t, locals = 3}
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
              CALL(
                NAME getchar,
                FP)),
            SEQ(
              MOVE(
                MEM(
                  BINOP(PLUS,
                    FP,
                    CONST ~8)),
                CALL(
                  NAME L28_readlist,
                  FP)),
              MOVE(
                MEM(
                  BINOP(PLUS,
                    FP,
                    CONST ~12)),
                ESEQ(
                  MOVE(
                    MEM(
                      BINOP(PLUS,
                        FP,
                        CONST ~4)),
                    CALL(
                      NAME getchar,
                      FP)),
                  CALL(
                    NAME L28_readlist,
                    FP))))),
          ESEQ(
            EXP(
              CALL(
                NAME L25_printlist,
                FP,
                CALL(
                  NAME L27_merge,
                  FP,
                  MEM(
                    BINOP(PLUS,
                      FP,
                      CONST ~8)),
                  MEM(
                    BINOP(PLUS,
                      FP,
                      CONST ~12))))),
            CONST 0))),
      EXP(
        CONST 0))))

PROC {name = L28_readlist, formals = t, locals = 2}
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
                SEQ(
                  MOVE(
                    TEMP t126,
                    CALL(
                      NAME allocRecord,
                      CONST 1)),
                  MOVE(
                    MEM(
                      BINOP(PLUS,
                        TEMP t126,
                        CONST 0)),
                    CONST 0)),
                TEMP t126)),
            MOVE(
              MEM(
                BINOP(PLUS,
                  FP,
                  CONST ~8)),
              CALL(
                NAME L1_readint,
                MEM(
                  BINOP(PLUS,
                    CONST 8,
                    FP)),
                MEM(
                  BINOP(PLUS,
                    FP,
                    CONST ~4))))),
          ESEQ(
            SEQ(
              CJUMP(EQ,
                ESEQ(
                  SEQ(
                    CJUMP(EQ,
                      MEM(
                        BINOP(PLUS,
                          FP,
                          CONST ~4)),
                      CONST 0,
                      L71_field_nil,L72_field_nonNil),
                    SEQ(
                      LABEL L71_field_nil,
                      SEQ(
                        EXP(
                          CALL(
                            NAME recFieldError)),
                        SEQ(
                          LABEL L72_field_nonNil,
                          MOVE(
                            TEMP t127,
                            BINOP(PLUS,
                              MEM(
                                BINOP(PLUS,
                                  FP,
                                  CONST ~4)),
                              BINOP(MUL,
                                CONST 0,
                                CONST 4))))))),
                  MEM(
                    TEMP t127)),
                CONST 0,
                L74_if_else,L73_if_then),
              SEQ(
                LABEL L73_if_then,
                SEQ(
                  MOVE(
                    TEMP t129,
                    ESEQ(
                      SEQ(
                        MOVE(
                          TEMP t128,
                          CALL(
                            NAME allocRecord,
                            CONST 2)),
                        SEQ(
                          MOVE(
                            MEM(
                              BINOP(PLUS,
                                TEMP t128,
                                CONST 0)),
                            MEM(
                              BINOP(PLUS,
                                FP,
                                CONST ~8))),
                          MOVE(
                            MEM(
                              BINOP(PLUS,
                                TEMP t128,
                                CONST 4)),
                            CALL(
                              NAME L28_readlist,
                              MEM(
                                BINOP(PLUS,
                                  CONST 8,
                                  FP)))))),
                      TEMP t128)),
                  SEQ(
                    JUMP(
                      NAME L75_if_join),
                    SEQ(
                      LABEL L74_if_else,
                      SEQ(
                        MOVE(
                          TEMP t129,
                          CONST 0),
                        LABEL L75_if_join)))))),
            TEMP t129))),
      EXP(
        CONST 0))))

PROC {name = L27_merge, formals = ttt, locals = 0}
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
            CJUMP(EQ,
              MEM(
                BINOP(PLUS,
                  FP,
                  CONST 12)),
              CONST 0,
              L68_if_then,L69_if_else),
            SEQ(
              LABEL L68_if_then,
              SEQ(
                MOVE(
                  TEMP t125,
                  MEM(
                    BINOP(PLUS,
                      FP,
                      CONST 16))),
                SEQ(
                  JUMP(
                    NAME L70_if_join),
                  SEQ(
                    LABEL L69_if_else,
                    SEQ(
                      MOVE(
                        TEMP t125,
                        ESEQ(
                          SEQ(
                            CJUMP(EQ,
                              MEM(
                                BINOP(PLUS,
                                  FP,
                                  CONST 16)),
                              CONST 0,
                              L65_if_then,L66_if_else),
                            SEQ(
                              LABEL L65_if_then,
                              SEQ(
                                MOVE(
                                  TEMP t124,
                                  MEM(
                                    BINOP(PLUS,
                                      FP,
                                      CONST 12))),
                                SEQ(
                                  JUMP(
                                    NAME L67_if_join),
                                  SEQ(
                                    LABEL L66_if_else,
                                    SEQ(
                                      MOVE(
                                        TEMP t124,
                                        ESEQ(
                                          SEQ(
                                            CJUMP(LT,
                                              ESEQ(
                                                SEQ(
                                                  CJUMP(EQ,
                                                    MEM(
                                                      BINOP(PLUS,
                                                        FP,
                                                        CONST 12)),
                                                    CONST 0,
                                                    L50_field_nil,L51_field_nonNil),
                                                  SEQ(
                                                    LABEL L50_field_nil,
                                                    SEQ(
                                                      EXP(
                                                        CALL(
                                                          NAME recFieldError)),
                                                      SEQ(
                                                        LABEL L51_field_nonNil,
                                                        MOVE(
                                                          TEMP t115,
                                                          BINOP(PLUS,
                                                            MEM(
                                                              BINOP(PLUS,
                                                                FP,
                                                                CONST 12)),
                                                            BINOP(MUL,
                                                              CONST 0,
                                                              CONST 4))))))),
                                                MEM(
                                                  TEMP t115)),
                                              ESEQ(
                                                SEQ(
                                                  CJUMP(EQ,
                                                    MEM(
                                                      BINOP(PLUS,
                                                        FP,
                                                        CONST 16)),
                                                    CONST 0,
                                                    L52_field_nil,L53_field_nonNil),
                                                  SEQ(
                                                    LABEL L52_field_nil,
                                                    SEQ(
                                                      EXP(
                                                        CALL(
                                                          NAME recFieldError)),
                                                      SEQ(
                                                        LABEL L53_field_nonNil,
                                                        MOVE(
                                                          TEMP t116,
                                                          BINOP(PLUS,
                                                            MEM(
                                                              BINOP(PLUS,
                                                                FP,
                                                                CONST 16)),
                                                            BINOP(MUL,
                                                              CONST 0,
                                                              CONST 4))))))),
                                                MEM(
                                                  TEMP t116)),
                                              L62_if_then,L63_if_else),
                                            SEQ(
                                              LABEL L62_if_then,
                                              SEQ(
                                                MOVE(
                                                  TEMP t123,
                                                  ESEQ(
                                                    SEQ(
                                                      MOVE(
                                                        TEMP t119,
                                                        CALL(
                                                          NAME allocRecord,
                                                          CONST 2)),
                                                      SEQ(
                                                        MOVE(
                                                          MEM(
                                                            BINOP(PLUS,
                                                              TEMP t119,
                                                              CONST 0)),
                                                          ESEQ(
                                                            SEQ(
                                                              CJUMP(EQ,
                                                                MEM(
                                                                  BINOP(PLUS,
                                                                    FP,
                                                                    CONST 12)),
                                                                CONST 0,
                                                                L54_field_nil,L55_field_nonNil),
                                                              SEQ(
                                                                LABEL L54_field_nil,
                                                                SEQ(
                                                                  EXP(
                                                                    CALL(
                                                                      NAME recFieldError)),
                                                                  SEQ(
                                                                    LABEL L55_field_nonNil,
                                                                    MOVE(
                                                                      TEMP t117,
                                                                      BINOP(PLUS,
                                                                        MEM(
                                                                          BINOP(PLUS,
                                                                            FP,
                                                                            CONST 12)),
                                                                        BINOP(MUL,
                                                                          CONST 0,
                                                                          CONST 4))))))),
                                                            MEM(
                                                              TEMP t117))),
                                                        MOVE(
                                                          MEM(
                                                            BINOP(PLUS,
                                                              TEMP t119,
                                                              CONST 4)),
                                                          CALL(
                                                            NAME L27_merge,
                                                            MEM(
                                                              BINOP(PLUS,
                                                                CONST 8,
                                                                FP)),
                                                            ESEQ(
                                                              SEQ(
                                                                CJUMP(EQ,
                                                                  MEM(
                                                                    BINOP(PLUS,
                                                                      FP,
                                                                      CONST 12)),
                                                                  CONST 0,
                                                                  L56_field_nil,L57_field_nonNil),
                                                                SEQ(
                                                                  LABEL L56_field_nil,
                                                                  SEQ(
                                                                    EXP(
                                                                      CALL(
                                                                        NAME recFieldError)),
                                                                    SEQ(
                                                                      LABEL L57_field_nonNil,
                                                                      MOVE(
                                                                        TEMP t118,
                                                                        BINOP(PLUS,
                                                                          MEM(
                                                                            BINOP(PLUS,
                                                                              FP,
                                                                              CONST 12)),
                                                                          BINOP(MUL,
                                                                            CONST 1,
                                                                            CONST 4))))))),
                                                              MEM(
                                                                TEMP t118)),
                                                            MEM(
                                                              BINOP(PLUS,
                                                                FP,
                                                                CONST 16)))))),
                                                    TEMP t119)),
                                                SEQ(
                                                  JUMP(
                                                    NAME L64_if_join),
                                                  SEQ(
                                                    LABEL L63_if_else,
                                                    SEQ(
                                                      MOVE(
                                                        TEMP t123,
                                                        ESEQ(
                                                          SEQ(
                                                            MOVE(
                                                              TEMP t122,
                                                              CALL(
                                                                NAME allocRecord,
                                                                CONST 2)),
                                                            SEQ(
                                                              MOVE(
                                                                MEM(
                                                                  BINOP(PLUS,
                                                                    TEMP t122,
                                                                    CONST 0)),
                                                                ESEQ(
                                                                  SEQ(
                                                                    CJUMP(EQ,
                                                                      MEM(
                                                                        BINOP(PLUS,
                                                                          FP,
                                                                          CONST 16)),
                                                                      CONST 0,
                                                                      L58_field_nil,L59_field_nonNil),
                                                                    SEQ(
                                                                      LABEL L58_field_nil,
                                                                      SEQ(
                                                                        EXP(
                                                                          CALL(
                                                                            NAME recFieldError)),
                                                                        SEQ(
                                                                          LABEL L59_field_nonNil,
                                                                          MOVE(
                                                                            TEMP t120,
                                                                            BINOP(PLUS,
                                                                              MEM(
                                                                                BINOP(PLUS,
                                                                                  FP,
                                                                                  CONST 16)),
                                                                              BINOP(MUL,
                                                                                CONST 0,
                                                                                CONST 4))))))),
                                                                  MEM(
                                                                    TEMP t120))),
                                                              MOVE(
                                                                MEM(
                                                                  BINOP(PLUS,
                                                                    TEMP t122,
                                                                    CONST 4)),
                                                                CALL(
                                                                  NAME L27_merge,
                                                                  MEM(
                                                                    BINOP(PLUS,
                                                                      CONST 8,
                                                                      FP)),
                                                                  MEM(
                                                                    BINOP(PLUS,
                                                                      FP,
                                                                      CONST 12)),
                                                                  ESEQ(
                                                                    SEQ(
                                                                      CJUMP(EQ,
                                                                        MEM(
                                                                          BINOP(PLUS,
                                                                            FP,
                                                                            CONST 16)),
                                                                        CONST 0,
                                                                        L60_field_nil,L61_field_nonNil),
                                                                      SEQ(
                                                                        LABEL L60_field_nil,
                                                                        SEQ(
                                                                          EXP(
                                                                            CALL(
                                                                              NAME recFieldError)),
                                                                          SEQ(
                                                                            LABEL L61_field_nonNil,
                                                                            MOVE(
                                                                              TEMP t121,
                                                                              BINOP(PLUS,
                                                                                MEM(
                                                                                  BINOP(PLUS,
                                                                                    FP,
                                                                                    CONST 16)),
                                                                                BINOP(MUL,
                                                                                  CONST 1,
                                                                                  CONST 4))))))),
                                                                    MEM(
                                                                      TEMP t121)))))),
                                                          TEMP t122)),
                                                      LABEL L64_if_join)))))),
                                          TEMP t123)),
                                      LABEL L67_if_join)))))),
                          TEMP t124)),
                      LABEL L70_if_join)))))),
          TEMP t125)),
      EXP(
        CONST 0))))

PROC {name = L26_printint, formals = tt, locals = 0}
SEQ(
  EXP(
    CONST 0),
  SEQ(
    EXP(
      CONST 0),
    SEQ(
      SEQ(
        CJUMP(LT,
          MEM(
            BINOP(PLUS,
              FP,
              CONST 12)),
          CONST 0,
          L47_if_then,L48_if_else),
        SEQ(
          LABEL L47_if_then,
          SEQ(
            SEQ(
              EXP(
                CALL(
                  NAME print,
                  FP,
                  NAME L42_string)),
              EXP(
                CALL(
                  NAME L38_f,
                  FP,
                  BINOP(MINUS,
                    CONST 0,
                    MEM(
                      BINOP(PLUS,
                        FP,
                        CONST 12)))))),
            SEQ(
              JUMP(
                NAME L49_if_join),
              SEQ(
                LABEL L48_if_else,
                SEQ(
                  SEQ(
                    CJUMP(GT,
                      MEM(
                        BINOP(PLUS,
                          FP,
                          CONST 12)),
                      CONST 0,
                      L44_if_then,L45_if_else),
                    SEQ(
                      LABEL L44_if_then,
                      SEQ(
                        EXP(
                          CALL(
                            NAME L38_f,
                            FP,
                            MEM(
                              BINOP(PLUS,
                                FP,
                                CONST 12)))),
                        SEQ(
                          JUMP(
                            NAME L46_if_join),
                          SEQ(
                            LABEL L45_if_else,
                            SEQ(
                              EXP(
                                CALL(
                                  NAME print,
                                  FP,
                                  NAME L43_string)),
                              LABEL L46_if_join)))))),
                  LABEL L49_if_join)))))),
      EXP(
        CONST 0))))

STRING L43_string = "0"

STRING L42_string = "-"

PROC {name = L38_f, formals = tt, locals = 0}
SEQ(
  EXP(
    CONST 0),
  SEQ(
    EXP(
      CONST 0),
    SEQ(
      SEQ(
        CJUMP(GT,
          MEM(
            BINOP(PLUS,
              FP,
              CONST 12)),
          CONST 0,
          L40_if_then,L41_if_end),
        SEQ(
          LABEL L40_if_then,
          SEQ(
            SEQ(
              EXP(
                CALL(
                  NAME L38_f,
                  MEM(
                    BINOP(PLUS,
                      CONST 8,
                      FP)),
                  BINOP(DIV,
                    MEM(
                      BINOP(PLUS,
                        FP,
                        CONST 12)),
                    CONST 10))),
              EXP(
                CALL(
                  NAME print,
                  FP,
                  CALL(
                    NAME chr,
                    FP,
                    BINOP(PLUS,
                      BINOP(MINUS,
                        MEM(
                          BINOP(PLUS,
                            FP,
                            CONST 12)),
                        BINOP(MUL,
                          BINOP(DIV,
                            MEM(
                              BINOP(PLUS,
                                FP,
                                CONST 12)),
                            CONST 10),
                          CONST 10)),
                      CALL(
                        NAME ord,
                        FP,
                        NAME L39_string)))))),
            LABEL L41_if_end))),
      EXP(
        CONST 0))))

STRING L39_string = "0"

PROC {name = L25_printlist, formals = tt, locals = 0}
SEQ(
  EXP(
    CONST 0),
  SEQ(
    EXP(
      CONST 0),
    SEQ(
      SEQ(
        CJUMP(EQ,
          MEM(
            BINOP(PLUS,
              FP,
              CONST 12)),
          CONST 0,
          L35_if_then,L36_if_else),
        SEQ(
          LABEL L35_if_then,
          SEQ(
            EXP(
              CALL(
                NAME print,
                FP,
                NAME L29_string)),
            SEQ(
              JUMP(
                NAME L37_if_join),
              SEQ(
                LABEL L36_if_else,
                SEQ(
                  SEQ(
                    EXP(
                      CALL(
                        NAME L26_printint,
                        MEM(
                          BINOP(PLUS,
                            CONST 8,
                            FP)),
                        ESEQ(
                          SEQ(
                            CJUMP(EQ,
                              MEM(
                                BINOP(PLUS,
                                  FP,
                                  CONST 12)),
                              CONST 0,
                              L30_field_nil,L31_field_nonNil),
                            SEQ(
                              LABEL L30_field_nil,
                              SEQ(
                                EXP(
                                  CALL(
                                    NAME recFieldError)),
                                SEQ(
                                  LABEL L31_field_nonNil,
                                  MOVE(
                                    TEMP t113,
                                    BINOP(PLUS,
                                      MEM(
                                        BINOP(PLUS,
                                          FP,
                                          CONST 12)),
                                      BINOP(MUL,
                                        CONST 0,
                                        CONST 4))))))),
                          MEM(
                            TEMP t113)))),
                    SEQ(
                      EXP(
                        CALL(
                          NAME print,
                          FP,
                          NAME L32_string)),
                      EXP(
                        CALL(
                          NAME L25_printlist,
                          MEM(
                            BINOP(PLUS,
                              CONST 8,
                              FP)),
                          ESEQ(
                            SEQ(
                              CJUMP(EQ,
                                MEM(
                                  BINOP(PLUS,
                                    FP,
                                    CONST 12)),
                                CONST 0,
                                L33_field_nil,L34_field_nonNil),
                              SEQ(
                                LABEL L33_field_nil,
                                SEQ(
                                  EXP(
                                    CALL(
                                      NAME recFieldError)),
                                  SEQ(
                                    LABEL L34_field_nonNil,
                                    MOVE(
                                      TEMP t114,
                                      BINOP(PLUS,
                                        MEM(
                                          BINOP(PLUS,
                                            FP,
                                            CONST 12)),
                                        BINOP(MUL,
                                          CONST 1,
                                          CONST 4))))))),
                            MEM(
                              TEMP t114)))))),
                  LABEL L37_if_join)))))),
      EXP(
        CONST 0))))

STRING L32_string = " "

STRING L29_string = "\n"

PROC {name = L1_readint, formals = tt, locals = 1}
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
            CONST 0),
          ESEQ(
            EXP(
              CALL(
                NAME L2_skipto,
                FP)),
            ESEQ(
              MOVE(
                ESEQ(
                  SEQ(
                    CJUMP(EQ,
                      MEM(
                        BINOP(PLUS,
                          FP,
                          CONST 12)),
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
                            TEMP t112,
                            BINOP(PLUS,
                              MEM(
                                BINOP(PLUS,
                                  FP,
                                  CONST 12)),
                              BINOP(MUL,
                                CONST 0,
                                CONST 4))))))),
                  MEM(
                    TEMP t112)),
                CALL(
                  NAME L3_isdigit,
                  FP,
                  MEM(
                    BINOP(PLUS,
                      MEM(
                        BINOP(PLUS,
                          CONST 8,
                          FP)),
                      CONST ~4)))),
              ESEQ(
                SEQ(
                  LABEL L23_while_test,
                  SEQ(
                    CJUMP(EQ,
                      CALL(
                        NAME L3_isdigit,
                        FP,
                        MEM(
                          BINOP(PLUS,
                            MEM(
                              BINOP(PLUS,
                                CONST 8,
                                FP)),
                            CONST ~4))),
                      CONST 0,
                      L21_done_label,L24_while_body),
                    SEQ(
                      LABEL L24_while_body,
                      SEQ(
                        SEQ(
                          MOVE(
                            MEM(
                              BINOP(PLUS,
                                FP,
                                CONST ~4)),
                            BINOP(MINUS,
                              BINOP(PLUS,
                                BINOP(MUL,
                                  MEM(
                                    BINOP(PLUS,
                                      FP,
                                      CONST ~4)),
                                  CONST 10),
                                CALL(
                                  NAME ord,
                                  FP,
                                  MEM(
                                    BINOP(PLUS,
                                      MEM(
                                        BINOP(PLUS,
                                          CONST 8,
                                          FP)),
                                      CONST ~4)))),
                              CALL(
                                NAME ord,
                                FP,
                                NAME L22_string))),
                          MOVE(
                            MEM(
                              BINOP(PLUS,
                                MEM(
                                  BINOP(PLUS,
                                    CONST 8,
                                    FP)),
                                CONST ~4)),
                            CALL(
                              NAME getchar,
                              FP))),
                        SEQ(
                          JUMP(
                            NAME L23_while_test),
                          LABEL L21_done_label))))),
                MEM(
                  BINOP(PLUS,
                    FP,
                    CONST ~4))))))),
      EXP(
        CONST 0))))

STRING L22_string = "0"

PROC {name = L3_isdigit, formals = tt, locals = 0}
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
            CJUMP(GE,
              CALL(
                NAME ord,
                FP,
                MEM(
                  BINOP(PLUS,
                    MEM(
                      BINOP(PLUS,
                        CONST 8,
                        MEM(
                          BINOP(PLUS,
                            CONST 8,
                            FP)))),
                    CONST ~4))),
              CALL(
                NAME ord,
                FP,
                NAME L12_string),
              L14_if_then,L15_if_else),
            SEQ(
              LABEL L14_if_then,
              SEQ(
                MOVE(
                  TEMP t110,
                  ESEQ(
                    SEQ(
                      MOVE(
                        TEMP t111,
                        CONST 1),
                      SEQ(
                        CJUMP(LE,
                          CALL(
                            NAME ord,
                            FP,
                            MEM(
                              BINOP(PLUS,
                                MEM(
                                  BINOP(PLUS,
                                    CONST 8,
                                    MEM(
                                      BINOP(PLUS,
                                        CONST 8,
                                        FP)))),
                                CONST ~4))),
                          CALL(
                            NAME ord,
                            FP,
                            NAME L13_string),
                          L17_unEx_t,L18_unEx_f),
                        SEQ(
                          LABEL L18_unEx_f,
                          SEQ(
                            MOVE(
                              TEMP t111,
                              CONST 0),
                            LABEL L17_unEx_t)))),
                    TEMP t111)),
                SEQ(
                  JUMP(
                    NAME L16_if_join),
                  SEQ(
                    LABEL L15_if_else,
                    SEQ(
                      MOVE(
                        TEMP t110,
                        CONST 0),
                      LABEL L16_if_join)))))),
          TEMP t110)),
      EXP(
        CONST 0))))

STRING L13_string = "9"

STRING L12_string = "0"

PROC {name = L2_skipto, formals = t, locals = 0}
SEQ(
  EXP(
    CONST 0),
  SEQ(
    EXP(
      CONST 0),
    SEQ(
      SEQ(
        LABEL L10_while_test,
        SEQ(
          CJUMP(EQ,
            ESEQ(
              SEQ(
                CJUMP(EQ,
                  CALL(
                    NAME stringEqual,
                    MEM(
                      BINOP(PLUS,
                        MEM(
                          BINOP(PLUS,
                            CONST 8,
                            MEM(
                              BINOP(PLUS,
                                CONST 8,
                                FP)))),
                        CONST ~4)),
                    NAME L4_string),
                  CONST 0,
                  L7_if_else,L6_if_then),
                SEQ(
                  LABEL L6_if_then,
                  SEQ(
                    MOVE(
                      TEMP t109,
                      CONST 1),
                    SEQ(
                      JUMP(
                        NAME L8_if_join),
                      SEQ(
                        LABEL L7_if_else,
                        SEQ(
                          MOVE(
                            TEMP t109,
                            CALL(
                              NAME stringEqual,
                              MEM(
                                BINOP(PLUS,
                                  MEM(
                                    BINOP(PLUS,
                                      CONST 8,
                                      MEM(
                                        BINOP(PLUS,
                                          CONST 8,
                                          FP)))),
                                  CONST ~4)),
                              NAME L5_string)),
                          LABEL L8_if_join)))))),
              TEMP t109),
            CONST 0,
            L9_done_label,L11_while_body),
          SEQ(
            LABEL L11_while_body,
            SEQ(
              MOVE(
                MEM(
                  BINOP(PLUS,
                    MEM(
                      BINOP(PLUS,
                        CONST 8,
                        MEM(
                          BINOP(PLUS,
                            CONST 8,
                            FP)))),
                    CONST ~4)),
                CALL(
                  NAME getchar,
                  FP)),
              SEQ(
                JUMP(
                  NAME L10_while_test),
                LABEL L9_done_label))))),
      EXP(
        CONST 0))))

STRING L5_string = "\n"

STRING L4_string = " "

STRING L0_string = "DefaultString"

