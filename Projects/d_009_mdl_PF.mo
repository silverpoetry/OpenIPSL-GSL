within OpenIPSL.Projects;
model d_009_mdl_PF
  extends Modelica.Icons.Example;
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100e6, fn=60);

  // Buses
  OpenIPSL.Electrical.Buses.Bus B1(V_b=16500, displayPF=true)
                                                annotation(Placement(transformation(extent={{-68,8},
            {-48,28}})));
  OpenIPSL.Electrical.Buses.Bus B2(V_b=18000, displayPF=true)
                                                annotation(Placement(transformation(extent={{-58,8},
            {-38,28}})));
  OpenIPSL.Electrical.Buses.Bus B3(V_b=13800.0) annotation(Placement(transformation(extent={{-50,8},
            {-30,28}})));
  OpenIPSL.Electrical.Buses.Bus B4(V_b=230000.0) annotation(Placement(transformation(extent={{-44,6},
            {-24,26}})));
  OpenIPSL.Electrical.Buses.Bus B5(V_b=230000.0) annotation(Placement(transformation(extent={{-36,6},
            {-16,26}})));
  OpenIPSL.Electrical.Buses.Bus B6(V_b=230000.0) annotation(Placement(transformation(extent={{-28,6},
            {-8,26}})));
  OpenIPSL.Electrical.Buses.Bus B7(V_b=230000.0) annotation(Placement(transformation(extent={{-18,4},
            {2,24}})));
  OpenIPSL.Electrical.Buses.Bus B8(V_b=230000.0) annotation(Placement(transformation(extent={{-6,4},{
            14,24}})));
  OpenIPSL.Electrical.Buses.Bus B9(V_b=230000.0) annotation(Placement(transformation(extent={{20,4},{
            40,24}})));

  // Lines and Transformers
  OpenIPSL.Electrical.Branches.PwLine line_9_8(
    R=0.0119, X=0.1008, G=0, B=0.1045);
  OpenIPSL.Electrical.Branches.PwLine line_7_8(
    R=0.0085, X=0.072, G=0, B=0.0745);
  OpenIPSL.Electrical.Branches.PwLine line_9_6(
    R=0.039, X=0.17, G=0, B=0.179);
  OpenIPSL.Electrical.Branches.PwLine line_7_5(
    R=0.032, X=0.161, G=0, B=0.153);
  OpenIPSL.Electrical.Branches.PwLine line_5_4(
    R=0.01, X=0.085, G=0, B=0.088);
  OpenIPSL.Electrical.Branches.PwLine line_6_4(
    R=0.017, X=0.092, G=0, B=0.079);
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer xfmr_2_7(
    V_b=18000.0, Vn=18000.0, rT=0.0, xT=0.0625);
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer xfmr_3_9(
    V_b=13800.0, Vn=13800.0, rT=0.0, xT=0.0586);
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer xfmr_1_4(
    V_b=16500.0, Vn=16500.0, rT=0.0, xT=0.0576);

  // Generators
  OpenIPSL.GENPF.GeneratorVT gen1(
    V_b=16500,                                 v_0=1.04,
    P_0=9900000000,
    Q_0=-9900000000,                                                                          angle_0=0,
    displayPF=true)                                                                                      annotation(Placement(transformation(extent={{-106,80},
            {-86,100}})));
  OpenIPSL.GENPF.GeneratorPV gen2(V_b=18000.0, v_0=1.025, P_0=163000000.0, Q_0=0, angle_0=0) annotation(Placement(transformation(extent={{-54,54},
            {-34,74}})));
  OpenIPSL.GENPF.GeneratorPV gen3(
    V_b=13800,                                 v_0=1.025,
    P_0=85000000,                                                         Q_0=0, angle_0=0,
    displayPF=true)                                                                         annotation(Placement(transformation(extent={{-104,40},
            {-84,60}})));
  // Loads
  OpenIPSL.Electrical.Loads.PSAT.PQ load6(
    P_0=90000000.0, Q_0=30000000.0) annotation(Placement(transformation(extent = {{0, 80}, {20, 100}})));
  OpenIPSL.Electrical.Loads.PSAT.PQ load8(
    P_0=100000000.0, Q_0=35000000.0) annotation(Placement(transformation(extent = {{0, 80}, {20, 100}})));
  OpenIPSL.Electrical.Loads.PSAT.PQ load5(
    P_0=125000000.0, Q_0=50000000.0) annotation(Placement(transformation(extent = {{0, 80}, {20, 100}})));

equation
  connect(line_9_8.p, B9.p);
  connect(line_9_8.n, B8.p);
  connect(line_7_8.p, B7.p);
  connect(line_7_8.n, B8.p);
  connect(line_9_6.p, B9.p);
  connect(line_9_6.n, B6.p);
  connect(line_7_5.p, B7.p);
  connect(line_7_5.n, B5.p);
  connect(line_5_4.p, B5.p);
  connect(line_5_4.n, B4.p);
  connect(line_6_4.p, B6.p);
  connect(line_6_4.n, B4.p);
  connect(xfmr_2_7.p, B2.p);
  connect(xfmr_2_7.n, B7.p);
  connect(xfmr_3_9.p, B3.p);
  connect(xfmr_3_9.n, B9.p);
  connect(xfmr_1_4.p, B1.p);
  connect(xfmr_1_4.n, B4.p);
  connect(gen1.pwPin, B1.p);
  connect(gen2.pwPin, B2.p);
  connect(gen3.pwPin, B3.p);
  connect(load6.p, B6.p);
  connect(load8.p, B8.p);
  connect(load5.p, B5.p);
end d_009_mdl_PF;
