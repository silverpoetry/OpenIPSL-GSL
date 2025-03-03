within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
model LoadLimiterDU "GE General GGOV1DU Governor/Turbine Temperature Control"
  parameter Types.PerUnit Kturb = 1.5 "Turbine gain";
  parameter Types.PerUnit Kpload = 2 "Load limiter proportional gain for PI controller";
  parameter Types.TimeAging Kiload = 0.67 "Load limiter integral gain for PI controller";
  parameter Types.PerUnit Dm = 0 "Mechanical damping coefficient";
  parameter Types.PerUnit Wfnl = 0.2 "No load fuel flow";
  parameter Types.PerUnit Vmax = 1 "Maximum valve position limit";
  parameter Types.PerUnit Vmin = 0.15 "Minimum valve position limit";
  Modelica.Blocks.Math.Gain KPLOAD(k = Kpload) annotation (
    Placement(transformation(extent = {{-48, -80}, {-28, -60}})));
  Modelica.Blocks.Continuous.Integrator s6(k = 1, y_start = s60, initType = Modelica.Blocks.Types.Init.InitialState) annotation (
    Placement(transformation(origin = {-40, -34}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Math.Add LoadlimiterPI annotation (
    Placement(transformation(extent = {{20, -50}, {40, -30}})));
  Modelica.Blocks.Math.Add diff(k2 = -1) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {0, 0})));
  Modelica.Blocks.Math.Gain gain(k = 1 / Kturb) annotation (
    Placement(transformation(extent = {{-60, 20}, {-40, 40}})));
  Modelica.Blocks.Nonlinear.Limiter maxLimiter(uMax = 1, uMin = -Modelica.Constants.inf) annotation (
    Placement(transformation(extent = {{60, -50}, {80, -30}})));
  Modelica.Blocks.Math.Add tlim annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, origin = {0, 36})));
  Modelica.Blocks.Math.Gain Gain(k = Kiload) annotation (
    Placement(transformation(origin = {-70, -34}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealOutput FSRT "Controller Output" annotation (
    Placement(transformation(extent = {{100, -50}, {120, -30}}), iconTransformation(extent = {{100, -70}, {120, -50}})));
  Modelica.Blocks.Interfaces.RealInput LDREF "Load Limiter reference value (pu)" annotation (
    Placement(transformation(extent = {{-140, -20}, {-100, 20}}), iconTransformation(extent = {{-140, -20}, {-100, 20}})));
  Modelica.Blocks.Interfaces.RealInput TEXM "Measured Exhaust Temperature" annotation (
    Placement(transformation(extent = {{140, 20}, {100, 60}}), iconTransformation(extent = {{140, 20}, {100, 60}})));
  Modelica.Blocks.Interfaces.RealInput PELEC "Machine electrical power (pu)" annotation (
    Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -120}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -120})));
  Modelica.Blocks.Sources.Constant const(k = Wfnl) annotation (
    Placement(transformation(extent = {{-60, 60}, {-40, 80}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=Vmax, uMin=Vmin) annotation (Placement(transformation(origin={-10,-34}, extent={{-10,-10},{10,10}})));
protected
  parameter Types.PerUnit Pmech0(fixed = false);
  parameter Types.PerUnit s60(fixed = false);
  parameter Types.PerUnit fsr0(fixed = false);
initial equation
  Pmech0 = PELEC;
  s60 = fsr0;
  fsr0 = (Pmech0 + Dm) / Kturb + Wfnl;
equation
  connect(gain.y, tlim.u2) annotation (
    Line(points = {{-39, 30}, {-12, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(KPLOAD.y, LoadlimiterPI.u2) annotation (
    Line(points = {{-27, -70}, {10, -70}, {10, -46}, {18, -46}}, color = {0, 0, 127}));
  connect(LoadlimiterPI.y, maxLimiter.u) annotation (
    Line(points = {{41, -40}, {58, -40}}, color = {0, 0, 127}));
  connect(maxLimiter.y, FSRT) annotation (
    Line(points = {{81, -40}, {110, -40}}, color = {0, 0, 127}));
  connect(gain.u, LDREF) annotation (
    Line(points = {{-62, 30}, {-92, 30}, {-92, 0}, {-120, 0}}, color = {0, 0, 127}));
  connect(const.y, tlim.u1) annotation (
    Line(points = {{-39, 70}, {-20, 70}, {-20, 42}, {-12, 42}}, color = {0, 0, 127}));
  connect(s6.u, Gain.y) annotation (
    Line(points = {{-52, -34}, {-59, -34}}, color = {0, 0, 127}));
  connect(Gain.u, diff.y) annotation (
    Line(points = {{-82, -34}, {-88, -34}, {-88, 8.88178e-16}, {-11, 8.88178e-16}}, color = {0, 0, 127}));
  connect(limiter.u, s6.y) annotation (
    Line(points = {{-22, -34}, {-29, -34}}, color = {0, 0, 127}));
  connect(limiter.y, LoadlimiterPI.u1) annotation (
    Line(points = {{1, -34}, {18, -34}}, color = {0, 0, 127}));
  connect(tlim.y, diff.u1) annotation (
    Line(points = {{11, 36}, {20, 36}, {20, 6}, {12, 6}}, color = {0, 0, 127}));
  connect(TEXM, diff.u2) annotation (
    Line(points = {{120, 40}, {80, 40}, {80, -6}, {12, -6}}, color = {0, 0, 127}));
  connect(diff.y, KPLOAD.u) annotation (
    Line(points = {{-11, 8.88178e-16}, {-88, 8.88178e-16}, {-88, -70}, {-50, -70}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={ Rectangle(lineColor = {0, 0, 255}, extent = {{-100, 100}, {100, -100}}), Text(
          lineColor={28,108,200},
          extent={{-90,10},{-58,-10}},
          textString="LDREF"), Text(
          lineColor={28,108,200},
          extent={{60,50},{90,28}},
          textString="TEXM"), Text(
          lineColor={28,108,200},
          extent={{60,-50},{90,-70}},
          textString="FSRT"), Text(
          lineColor={28,108,200},
          extent={{-60,40},{60,-40}},
          textString="Load
Limiter"), Text(
          lineColor={28,108,200},
          extent={{-20,-80},{20,-100}},
          textString="PELEC")}),
    Documentation(info = "<html>
<p>The following documentation is adapted from
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-Models], chapter 7.13</a>:</p>
<blockquote>
<p>
Load limiter and temperature control system for the general purpose Turbine/Governor model GGOV1DU.
</p>
</blockquote>
</html>", revisions = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Models</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-11-22</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/maguilerac\">@maguilerac</a>,
       <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a>
   </p>
</td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end LoadLimiterDU;
