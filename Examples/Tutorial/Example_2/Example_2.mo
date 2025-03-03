within OpenIPSL.Examples.Tutorial.Example_2;
model Example_2 "Fully assembled single-machine-infinite-bus (SMIB) example system with a Power System Stabilizer"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus B1(displayPF=false)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  OpenIPSL.Electrical.Buses.Bus B2(displayPF=false)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.Electrical.Buses.Bus B3(displayPF=false)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Tutorial.Example_2.Generator.Generator G1(
    V_b=400000,
    v_0=1,
    P_0=1997999999.9936396,
    Q_0=967924969.9065775,
    angle_0=0.494677176989154)
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Transformer(
    Sn=2220000000,
    V_b=400000,
    Vn=400000,
    rT=0,
    xT=0.15) annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  OpenIPSL.Electrical.Branches.PwLine line_1(
    R=0,
    G=0,
    B=0,
    X=0.5*100/2220,
    S_b=100000000) annotation (Placement(transformation(extent={{20,10},{40,30}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infinite_bus(
    v_0=0.90081,
    P_0=-1998000000,
    Q_0=87066000) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={100,0})));
  OpenIPSL.Electrical.Events.PwFault fault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=0.01*100/2220)
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  OpenIPSL.Electrical.Branches.PwLine line_2(
    R=0,
    G=0,
    B=0,
    S_b=100000000,
    X=0.93*100/2220)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{60,-100},{120,-60}})));
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-89,0},{-89,0},{-70,0}}, color={0,0,255}));
  connect(B1.p, Transformer.p)
    annotation (Line(points={{-70,0},{-70,0},{-51,0}}, color={0,0,255}));
  connect(Transformer.n, B2.p)
    annotation (Line(points={{-29,0},{-20,0},{-10,0}}, color={0,0,255}));
  connect(B2.p, line_1.p) annotation (Line(points={{-10,0},{-10,0},{10,0},{10,
          20},{21,20}}, color={0,0,255}));
  connect(B3.p, infinite_bus.p) annotation (Line(points={{70,0},{70,0},{90,0},{
          90,1.33227e-15}}, color={0,0,255}));
  connect(B3.p, line_1.n) annotation (Line(points={{70,0},{70,0},{60,0},{60,20},
          {39,20}}, color={0,0,255}));
  connect(line_2.n, line_1.n) annotation (Line(points={{39,-20},{60,-20},{60,20},
          {39,20}}, color={0,0,255}));
  connect(B2.p, line_2.p) annotation (Line(points={{-10,0},{10,0},{10,-20},{21,
          -20}}, color={0,0,255}));
  connect(fault.p, B2.p) annotation (Line(points={{18.3333,-50},{10,-50},{10,0},
          {-10,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-120,-100},{120,100}},
        preserveAspectRatio=false), graphics={Text(
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-100,100},{100,80}},
          textString=
            "Example 2: Single-machine infinite bus model with the PSS*",
          fontSize=15,
          textStyle={TextStyle.Bold}),Text(
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-120,-80},{40,-100}},
          textString=
            "*P. Kundur, \"Power System Stability and Control\", Example 13.2",
          fontSize=12)}),
    experiment(
      StartTime=0,
      StopTime=10,
      Tolerance=1e-6,
      Interval=1e-4),
    Documentation(info="<html>
<p>This example system represents the resulting model after one has followed the steps to assemble the generation unit with the tuned Power System Stabilizer for improving the system's transient stability condition. The system must be simulated during 10 seconds.</p>
<p>Variables of interest are:</p>
<ul>
<li><code>B1.v</code></li>
<li><code>B2.v</code></li>
<li><code>G1.machine.delta</code></li>
</ul>
<p>Compare these curvess with the ones obtained in Example 1. Note that with a properly tuned stabilizer, the before unstable behavior is now fixed and the growing oscillations have now a proper damping.</p>
</html>"));
end Example_2;
