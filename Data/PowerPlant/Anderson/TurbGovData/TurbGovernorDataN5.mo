within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataN5
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 951.00/1070,
    T_1 = 0.180,
    T_2 = 0.030,
    T_3 = 0.100,
    T_4 = 0.200,
    T_5 = 6.280,
    F = 0.330);
end TurbGovernorDataN5;
