within OpenIPSL.Data.PowerPlant.Anderson.MachineData;
record MachineDataH2
  extends MachineDataTemplate( M_b = 17500000,
    V_b = 7330,
    P_f = 0.80,
    SCR = Modelica.Constants.small,
    Xppd=0.330,
    Xpd=Modelica.Constants.small,
    Xd=1.070,
    Xppq=0.330,
    Xpq=0.660,
    Xq=0.660,
    R_a=0.003,
    Xl=0.310,
    Tppd0=Modelica.Constants.small,
    Tpd0=5.400,
    Tppq0=Modelica.Constants.small,
    Tpq0=Modelica.Constants.small,
    H=6.686,
    S10=0.064,
    S12=1.018,
    Efdfl=2.130,
    D=2.000);
end MachineDataH2;
