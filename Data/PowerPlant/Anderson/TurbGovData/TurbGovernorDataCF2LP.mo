within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataCF2LP
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 172.50/192,
    T_1 = 0.100,
    T_2 = 0.000,
    T_3 = 0.150,
    T_4 = 0.300,
    T_5 = 4.160,
    F = 0.000);
end TurbGovernorDataCF2LP;
