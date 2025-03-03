within OpenIPSL.Projects.Generation_Groups;
model Gen11 "18kV/100MVA generation unit connected to bus 2"
  extends OpenIPSL.Electrical.Essentials.pfComponent;



  OpenIPSL.Electrical.Machines.PSAT.Order2 gen(
    Sn=100000000,
    Vn=18000,
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    ra=0,
    x1d=0.1198,
    M=12.8,
    D=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={28,14})));
   // xd=0.8958,
   // xq=0.8645,
   // x1q=0.1969,
   // T1d0=6,
   // T1q0=0.5350,
  OpenIPSL.Interfaces.PwPin pwPin;

equation

  //P_MW = gen.P*S_b;
  // Q_MVA = gen.Q*S_b;
  connect(gen.p, pwPin) annotation (Line(points={{38,14},{66,14},{66,0},{110,0}},
        color={0,0,255}));
  connect(gen.pm0, gen.pm) annotation (Line(points={{20,3},{20,0},{14,0},{14,9},
          {16,9}}, color={0,0,127}));
  connect(gen.vf0, gen.vf) annotation (Line(points={{20,25},{10,25},{10,70},{16,
          70},{16,19}},           color={0,0,127}));

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
<p>18kV/100MVA Generation unit, identified as number 1, connected to bus 2, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: 4th order, from PSAT.</li>
<li><strong>Exciter</strong>: type II, from PSAT.</li>
</ul>
<p>Note that the model allows for a disturbance to be introduced in the voltage reference value for the excitation system.</p>
</html>"));
end Gen11;
