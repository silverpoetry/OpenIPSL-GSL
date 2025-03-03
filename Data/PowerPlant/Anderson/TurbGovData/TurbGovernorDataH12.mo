within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataH12
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 171.00/125,
    T_1 = 31.000,
    T_2 = 4.120,
    T_3 = 0.393,
    T_4 = 0.000,
    T_5 = 0.515,
    F = -2.000);
end TurbGovernorDataH12;
