within OpenIPSL.Data.PowerPlant.Anderson.PSSData;
record PSSDataCF1HP
  extends PSSDataTemplate(
                       PSS = "S",
    K_QV = 0.000,
    K_QS = 12.000,
    T_Q = 10.000,
    Tp_Q1 = 1.000,
    T_Q1 = 0.020,
    Tp_Q2 = 0.750,
    T_Q2 = 0.020,
    Tp_Q3 = 0.000,
    T_Q3 = 0.000,
    V_SLIM = 0.050);
end PSSDataCF1HP;
