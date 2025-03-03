within OpenIPSL.Examples.KundurSMIB;
model SMIB "Single-Machine-Infinite-Bus system with generation unit composed of Machine"
  extends Modelica.Icons.Example;
  extends SMIB_Partial;
  parameter Real xd_0=1.81,xq_0=1.76,T1d0=8,x1d=0.3;
  Generation_Groups.Generator G1(v_0 = 1, P_0 = 0.899999999997135 * S_b, Q_0 = 0.436002238696658 * S_b, angle_0 = 0.494677176989155,xd=xd_0,xq=xq_0,T1d0=T1d0,x1d=x1d) annotation(Placement(transformation(extent = {{-82, -10}, {-62, 10}})));
protected
  parameter Real S_b = SysData.S_b;
equation
  connect(G1.pwPin, B1.p) annotation(Line(points = {{-61, 0}, {-52, 0}}, color = {0, 0, 255}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false), graphics={  Text(extent = {{-110, 68}, {110, 48}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 15, textStyle = {TextStyle.Bold}, textString = "(Constant Efd)")}), experiment(StopTime = 10, Interval = 0.01, Tolerance = 1e-06, StartTime = 0), Documentation(info = "<html>
<p>This example system represents an SMIB system with generation unit composed only of a machine. The system should be simulated during 10 seconds.</p>
<p>Variables of interest are:</p>
<ul>
<li><code>B1.v</code></li>
<li><code>G1.machine.delta</code></li>
</ul>
<p>Note that the system is unstable. Compare these variables with the ones obtained when simulating <code>SMIB_AVR</code> and <code>SMIB_AVR_PSS</code> for 10 seconds.</p>
</html>"));
end SMIB;
