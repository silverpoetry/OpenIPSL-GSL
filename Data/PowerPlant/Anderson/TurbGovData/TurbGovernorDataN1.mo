within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataN1
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 65.00/76.8,
    T_1 = Modelica.Constants.small,
    T_2 = Modelica.Constants.small,
    T_3 = Modelica.Constants.small,
    T_4 = Modelica.Constants.small,
    T_5 = Modelica.Constants.small,
    F = Modelica.Constants.small);
end TurbGovernorDataN1;
