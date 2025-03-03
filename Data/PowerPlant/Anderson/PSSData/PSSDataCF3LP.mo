within OpenIPSL.Data.PowerPlant.Anderson.PSSData;
record PSSDataCF3LP
  extends PSSDataTemplate(
                       PSS = "S",
    K_QV = 0.000,
    K_QS = 10.000,
    T_Q = 10.000,
    Tp_Q1 = 0.700,
    T_Q1 = 0.020,
    Tp_Q2 = 0.450,
    T_Q2 = 0.020,
    Tp_Q3 = 0.000,
    T_Q3 = 0.000,
    V_SLIM = 0.050);
end PSSDataCF3LP;
