within OpenIPSL.Data.PowerPlant.IEEE421.ESData.AC;
record AC7B1
  "Type AC7B ES Sample Data (Table H.11 in IEEE Std 421.5-2005)"
  extends ACxBTemplate(
    Type = "AC7B",
    T_R = 0,
    K_PR = 4.24,
    K_IR = 4.24,
    K_DR = 0,
    T_DR = 0,
    K_PA = 65.36,
    K_IA = 59.69,
    V_AMAX = 1.0,
    V_AMIN = -0.95,
    K_P = 4.96,
    T_E = 1.1,
    V_FEMAX = 6.9,
    K_L = 10.0,
    K_F1 = 0.212,
    K_F2 = 0,
    K_F3 = 0,
    T_F3 = 0,
    K_C = 0.18,
    K_D = 0.02,
    K_E = 1.0,
    E_1 = 6.3,
    E_2 = 4.725,
    S_EE_1 = 0.44,
    S_EE_2 = 0.075,
    V_RMAX = 5.79,
    V_RMIN = -5.79,
    V_EMIN = -99);
end AC7B1;
