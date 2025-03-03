within OpenIPSL.Data.PowerPlant.IEEE421.ESData.AC;
record AC7B3
  "Type AC7B ES Sample Data (Table H.15 in IEEE Std 421.5-2016)"
  extends ACxBTemplate(
    Type = "AC7C",
    T_R = 0,
    K_PR = 40,
    K_IR = 5.6,
    K_DR = 0,
    T_DR = 1,
    K_PA = 112,
    K_IA = 0,
    V_AMAX = 65.2,
    V_AMIN = -54,
    K_P = 1,
    T_E = 1.2,
    V_FEMAX = 23.2,
    K_L = 0,
    K_F1 = 0,
    K_F2 = 0.08,
    K_F3 = 0.01,
    T_F3 = 1,
    K_C = 0.12,
    K_D = 3.3,
    K_E = 1,
    E_1 = 13.6,
    E_2 = 10.2,
    S_EE_1 = 3.74,
    S_EE_2 = 0.32,
    V_RMAX = 3.2,
    V_RMIN = -3.2,
    V_EMIN = 0);
end AC7B3;
