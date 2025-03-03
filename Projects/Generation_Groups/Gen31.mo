within OpenIPSL.Projects.Generation_Groups;
model Gen31 "16.5kV/100MVA generation unit connected to bus 1"
  extends OpenIPSL.Electrical.Essentials.pfComponent;

  OpenIPSL.Electrical.Machines.PSAT.Order2 gen(
    Sn=100000000,
    ra=0,
    x1d=0.0608,
    V_b=V_b,
    v_0=v_0,
    P_0=P_0,
    Q_0=Q_0,
    M=47.28,
    D=8,
    Vn=16500,
    angle_0=angle_0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={28,14})));
   // xd=0.1460,
   // xq=0.0969,
    //x1q=0.0969,
   // T1d0=8.96,
   // T1q0=0.310,

  OpenIPSL.Interfaces.PwPin pwPin
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation

  //P_MW = gen.P*S_b;
  // Q_MVA = gen.Q*S_b;
  connect(gen.p, pwPin) annotation (Line(points={{38,14},{66,14},{66,0},{110,0}},
        color={0,0,255}));
  connect(gen.pm0, gen.pm) annotation (Line(points={{20,3},{20,0},{14,0},{14,9},
          {16,9}}, color={0,0,127}));

  connect(gen.vf, gen.vf0)
    annotation (Line(points={{16,19},{20,25}},  color={0,0,127}));
                                                                   annotation (Line(points={{-6,-2},{-8,-2},{-8,-10},{-94,
          -10},{-94,42},{20,42},{20,25}},             color={0,0,127}),
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
<p>16.5kV/100MVA Generation unit, identified as number 3, connected to bus 1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: 4th order, from PSAT.</li>
<li><strong>Exciter</strong>: type II, from PSAT.</li>
</ul>
<p>Note that the model allows for a disturbance to be introduced in the voltage reference value for the excitation system.</p>
</html>"));
end Gen31;
