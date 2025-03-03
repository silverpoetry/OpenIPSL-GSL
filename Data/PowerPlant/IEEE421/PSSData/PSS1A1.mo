within OpenIPSL.Data.PowerPlant.IEEE421.PSSData;
record PSS1A1
  "PSS1A Data for Type DC1A Sample Data (Table H.1 in IEEE Std 421.5-2005 / Table H.3 in IEEE Std 421.5-2016)"
  extends PSS1ATemplate(
    K_S=3.15,
    T_1=0.76,
    T_2=0.1,
    T_3=0.76,
    T_4=0.1,
    T_5=0.0,
    T_6=0.0,
    V_STMAX=0.09,
    V_STMIN=-0.09);
end PSS1A1;
