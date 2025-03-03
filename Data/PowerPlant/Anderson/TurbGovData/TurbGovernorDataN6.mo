within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataN6
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 1216.00/1280,
    T_1 = 0.150,
    T_2 = 0.000,
    T_3 = 0.210,
    T_4 = 0.814,
    T_5 = 2.460,
    F = 0.340);
end TurbGovernorDataN6;
