within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataH1
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 8.60/9,
    T_1 = 48.440,
    T_2 = 4.634,
    T_3 = 0.000,
    T_4 = 0.000,
    T_5 = 0.579,
    F = -2.000);
end TurbGovernorDataH1;
