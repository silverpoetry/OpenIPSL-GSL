within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataF14
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 367.00/410,
    T_1 = 0.180,
    T_2 = 0.000,
    T_3 = 0.040,
    T_4 = 0.250,
    T_5 = 8.000,
    F = 0.267);
end TurbGovernorDataF14;
