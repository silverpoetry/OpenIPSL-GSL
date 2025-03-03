within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataF15
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 390.00/448,
    T_1 = 0.100,
    T_2 = 0.000,
    T_3 = 0.300,
    T_4 = 0.050,
    T_5 = 10.000,
    F = 0.250);
end TurbGovernorDataF15;
