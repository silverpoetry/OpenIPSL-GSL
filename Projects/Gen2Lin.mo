within OpenIPSL.Projects;
model Gen2Lin
  extends d_009_mdl_combined;
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100e6, fn=50);

  parameter Real v00= 1.024999976158142;
  parameter Real a00= 0.16196665167808533;
  input Real v0i;
  input Real a0i;
  Real vt = v00+ v0i;
  Real at= a00+a0i;

  // Generators
  Generation_Groups.Gen11 gen1(v_0=1.024999976158142, angle_0=0.16196665167808533, P_0=163000000.0, Q_0=6653660.5, V_b=18000.0) annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));// Loads

  GENPF.NakeBus nakeBus annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={30,60})));
equation

  //connect(gen1.pwPin, B1.p);
 nakeBus.p.vr = vt*cos(at);
  nakeBus.p.vi = vt*sin(at);

  connect(gen1.pwPin, nakeBus.p)
    annotation (Line(points={{-59,60},{20,60}}, color={0,0,255}));
end Gen2Lin;
