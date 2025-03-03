within OpenIPSL.Data.PowerPlant.IEEE421.ESData.AC;
record AC2A1
  "Type AC2A ES Sample Data (Table H.6 in IEEE Std 421.5-2005 / Table H.9 in IEEE Std 421.5-2016)"
  extends ACxATemplate(
    Type = "AC2A",
    T_R = 0,
    T_B = 0,
    T_C = 0,
    K_A = 400,
    T_A = 0.01,
    V_AMAX = 8.0,
    V_AMIN = -8.0,
    K_B = 25,
    T_E = 0.6,
    V_FEMAX = 4.4,
    K_H = 1.0,
    K_F = 0.03,
    T_F = 1.0,
    K_C = 0.28,
    K_D = 0.35,
    K_E = 1.0,
    E_1 = 4.4,
    E_2 = 3.3,
    S_EE_1 = 0.037,
    S_EE_2 = 0.012,
    V_RMAX = 105,
    V_RMIN = -95);
end AC2A1;
