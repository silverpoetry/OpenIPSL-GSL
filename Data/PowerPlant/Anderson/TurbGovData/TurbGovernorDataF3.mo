within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataF3
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.078,
    P_MAX = 53.00/51.20,
    T_1 = 0.200,
    T_2 = 0.000,
    T_3 = 0.300,
    T_4 = 0.090,
    T_5 = 0.000,
    F = 1.000);
end TurbGovernorDataF3;
