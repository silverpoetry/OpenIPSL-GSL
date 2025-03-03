within OpenIPSL.Projects;
model Gen1Lin
  extends Modelica.Icons.Example;
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100e6, fn=50);

  parameter Real v00= 1.0399999618530273;
  parameter Real a00= 0;
  input Real v0i;
  input Real a0i;
  Real vt = v00+ v0i;
  Real at= a00+a0i;

  // Generators
  Generation_Groups.Gen31 gen1(v_0=1.0399999618530273, angle_0=0.0, P_0=71641024.0, Q_0=27045924.0, V_b=16500.0) annotation(Placement(transformation(extent={{-80,50},
            {-60,70}})));
  // Loads

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
end Gen1Lin;
