within OpenIPSL;
package GENPF
  model GeneratorVT "Generator model composed by PSAT components"
      extends OpenIPSL.Interfaces.Generator;
      Types.PerUnit v(start=v_0) "Bus voltage magnitude";
      Types.Angle angle(start=angle_0) "Bus voltage angle";
  equation

    pwPin.vr = v_0*cos(angle_0);
    pwPin.vi = v_0*sin(angle_0);
    v = sqrt(pwPin.vr^2 + pwPin.vi^2);
    angle = atan2(pwPin.vi, pwPin.vr);
      annotation (Dialog(group="Power flow data", enable=enableangle_0));
  end GeneratorVT;

  model GeneratorPV "Generator model composed by PSAT components"
      extends OpenIPSL.Interfaces.Generator;
      Types.PerUnit v(start=v_0) "Bus voltage magnitude";
      Types.Angle angle(start=angle_0) "Bus voltage angle";
  equation

    v_0 =sqrt( pwPin.vr*pwPin.vr+ pwPin.vi* pwPin.vi);
    P_0 = -(pwPin.vr*pwPin.ir + pwPin.vi*pwPin.ii)*S_b;
    v = sqrt(pwPin.vr^2 + pwPin.vi^2);
    angle = atan2(pwPin.vi, pwPin.vr);
  end GeneratorPV;

  model GeneratorPQ "Generator model composed by PSAT components"
      extends OpenIPSL.Interfaces.Generator;
      Types.PerUnit v(start=v_0) "Bus voltage magnitude";
      Types.Angle angle(start=angle_0) "Bus voltage angle";
  equation
    v = sqrt(pwPin.vr^2 + pwPin.vi^2);
    angle = atan2(pwPin.vi, pwPin.vr);
    P_0 = -(pwPin.vr*pwPin.ir + pwPin.vi*pwPin.ii)*S_b;
    Q_0 = -(pwPin.vi*pwPin.ir - pwPin.vr*pwPin.ii)*S_b;
  end GeneratorPQ;

  model NakeBus "PSAT Infinite Bus"

    Interfaces.PwPin p
      annotation (Placement(transformation(extent={{90,-10},{110,10}})));

  equation



    annotation (
      Icon(coordinateSystem(
          extent={{-100,-100},{100,100}},
          preserveAspectRatio=false,
          grid={2,2}), graphics={Rectangle(
            extent={{-100,-100},{100,100}},
            lineColor={0,0,0},
            fillColor={241,241,241},
            fillPattern=FillPattern.Solid),Text(
            visible=displayPF,
            extent={{-80,100},{80,20}},
            lineColor={255,0,0},
            textString=DynamicSelect("0.0 MW",
              OpenIPSL.NonElectrical.Functions.displayPower(P, " MW"))),Polygon(
            visible=displayPF,
            points=DynamicSelect({{-20,30},{-20,10},{20,20},{-20,30}}, if P >= 0
               then {{-20,30},{-20,10},{20,20},{-20,30}} else {{20,30},{20,10},{-20,
              20},{20,30}}),
            lineColor={255,0,0},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid),Text(
            visible=displayPF,
            extent={{-80,-20},{80,-100}},
            lineColor={0,255,0},
            textString=DynamicSelect("0.0 Mvar",
              OpenIPSL.NonElectrical.Functions.displayPower(Q, " Mvar"))),Polygon(
            visible=displayPF,
            points=DynamicSelect({{-20,-30},{-20,-10},{20,-20},{-20,-30}}, if Q
               >= 0 then {{-20,-30},{-20,-10},{20,-20},{-20,-30}} else {{20,-30},
              {20,-10},{-20,-20},{20,-30}}),
            lineColor={0,255,0},
            fillColor={0,255,0},
            fillPattern=FillPattern.Solid),Text(
            extent={{-100,160},{100,120}},
            lineColor={0,0,255},
            textString="%name")}),
      Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Last update</p></td>
<td><p>2015-12-14</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
  end NakeBus;
end GENPF;
