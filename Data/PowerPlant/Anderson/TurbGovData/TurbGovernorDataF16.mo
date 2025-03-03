within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataF16
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 460.00/512,
    T_1 = 0.150,
    T_2 = 0.050,
    T_3 = 0.300,
    T_4 = 0.260,
    T_5 = 8.000,
    F = 0.270);
end TurbGovernorDataF16;
