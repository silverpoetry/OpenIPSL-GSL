within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataF9
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 175.00/192,
    T_1 = 0.083,
    T_2 = 0.000,
    T_3 = 0.200,
    T_4 = 0.050,
    T_5 = 8.000,
    F = 0.271);
end TurbGovernorDataF9;
