within OpenIPSL.Examples.IEEE9.Generation_Groups;
model Gen21 "13.8kV/100MVA generation unit connected to bus 3"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Real height_2=1 annotation (Dialog(group="AVR Disturbance"));
  parameter Real tstart_2=1 annotation (Dialog(group="AVR Disturbance"));
  parameter Boolean refdisturb_2=false annotation (Dialog(group="AVR Disturbance"));
  OpenIPSL.Electrical.Machines.PSAT.Order4 gen(
    Sn=100000000,
    Vn=13800,
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    ra=0,
    xd=1.3125,
    x1d=0.1813,
    x1q=0.25,
    T1d0=5.89,
    T1q0=0.6,
    M=6.02,
    D=0,
    xq=1.2578) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={28,14})));
     Electrical.Controls.PSAT.AVR.AVRtypeIII          aVRtypeIII(
    K0=10,
    T1=1,
    T2=1,
    Te=0.0001,
    Tr=0.015,
    vfmax=7,
    vfmin=-6.4)                                                                                                                            annotation (
          Placement(transformation(origin={-92,48},   extent = {{-12, -12}, {12, 12}})));
    Modelica.Blocks.Sources.Constant pss_off(k=0)   annotation (
          Placement(transformation(origin={-128,42},  extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Interfaces.PwPin pwPin
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation

  //P_MW = gen.P*S_b;
  // Q_MVA = gen.Q*S_b;
  connect(gen.p, pwPin) annotation (Line(points={{38,14},{66,14},{66,0},{110,0}},
        color={0,0,255}));
  connect(gen.pm0, gen.pm) annotation (Line(points={{20,3},{20,0},{14,0},{14,9},
          {16,9}}, color={0,0,127}));
    connect(pss_off.y,aVRtypeIII. vs) annotation (
          Line(points={{-117,42},{-103,42}},             color = {0, 0, 127}));
  connect(gen.v, aVRtypeIII.v) annotation (Line(points={{39,17},{50,17},{50,65.5},
          {62,65.5},{62,92},{-46,92},{-46,54},{-103,54}}, color={0,0,127}));
  connect(gen.vf0, aVRtypeIII.vf0) annotation (Line(points={{20,25},{10,25},{10,
          70},{-92,70},{-92,59}}, color={0,0,127}));
  connect(gen.vf, aVRtypeIII.vf)
    annotation (Line(points={{16,19},{-79,48}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(extent={{-100,-100},{100,100}}, lineColor=
           {28,108,200}),Line(points={{-60,-20},{-20,20},{20,-20},{60,20}},
          color={28,108,200}),Text(
          extent={{-34,-32},{38,-52}},
          lineColor={28,108,200},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),Text(
          extent={{62,106},{134,68}},
          lineColor={238,46,47},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("0.0", String(P_MW, significantDigits=3))),
          Text(
          extent={{62,-70},{134,-108}},
          lineColor={0,255,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("0.0", String(Q_MVA, significantDigits=3)))}),
    Documentation(info="<html>
<p>13.8kV/100MVA Generation unit, identified as number 2, connected to bus 3, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: 4th order, from PSAT.</li>
<li><strong>Exciter</strong>: type II, from PSAT.</li>
</ul>
<p>Note that the model allows for a disturbance to be introduced in the voltage reference value for the excitation system.</p>
</html>"));
end Gen21;
