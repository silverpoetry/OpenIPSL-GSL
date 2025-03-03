within OpenIPSL.Projects;
model d_009_mdl_combined
  extends Modelica.Icons.Example;
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100e6, fn=60);

  // Buses
  OpenIPSL.Electrical.Buses.Bus B1(v_0=1.0399999618530273, angle_0=0.0, V_b=16500, displayPF=true) annotation(Placement(transformation(extent={{-254,82},
            {-234,102}})));
  OpenIPSL.Electrical.Buses.Bus B2(v_0=1.0250000240382715, angle_0=0.1619666397712473, V_b=18000.0) annotation(Placement(transformation(extent={{-244,82},
            {-224,102}})));
  OpenIPSL.Electrical.Buses.Bus B3(v_0=1.024999978932658, angle_0=0.08141526975519796, V_b=13800.0) annotation(Placement(transformation(extent={{-236,82},
            {-216,102}})));
  OpenIPSL.Electrical.Buses.Bus B4(v_0=1.025788392146095, angle_0=-0.038690245973569, V_b=230000.0) annotation(Placement(transformation(extent={{-230,80},
            {-210,100}})));
  OpenIPSL.Electrical.Buses.Bus B5(v_0=0.995630833537789, angle_0=-0.06961778712996383, V_b=230000.0) annotation(Placement(transformation(extent={{-222,80},
            {-202,100}})));
  OpenIPSL.Electrical.Buses.Bus B6(v_0=1.0126542971713695, angle_0=-0.06435720422511516, V_b=230000.0) annotation(Placement(transformation(extent={{-214,80},
            {-194,100}})));
  OpenIPSL.Electrical.Buses.Bus B7(v_0=1.0257693628529898, angle_0=0.06492103322769895, V_b=230000.0) annotation(Placement(transformation(extent={{-204,78},
            {-184,98}})));
  OpenIPSL.Electrical.Buses.Bus B8(v_0=1.0158826121440723, angle_0=0.01269789920808342, V_b=230000.0) annotation(Placement(transformation(extent={{-192,78},
            {-172,98}})));
  OpenIPSL.Electrical.Buses.Bus B9(v_0=1.0323529638809064, angle_0=0.03432567162060416, V_b=230000.0) annotation(Placement(transformation(extent={{-166,78},
            {-146,98}})));
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
  Generation_Groups.Gen31 gen1(v_0=1.0399999618530273, angle_0=0.0, P_0=71641024.0, Q_0=27045924.0, V_b=16500.0) annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  Generation_Groups.Gen11 gen2(v_0=1.024999976158142, angle_0=0.16196665167808533, P_0=163000000.0, Q_0=6653660.5, V_b=18000.0) annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  Generation_Groups.Gen21 gen3(v_0=1.024999976158142, angle_0=0.08141527324914932, P_0=85000000.0, Q_0=-10859709.0, V_b=13800.0) annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
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
end d_009_mdl_combined;
