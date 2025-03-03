within OpenIPSL.Electrical.ThreePhase.Buses;
model Bus_3Ph "Three-phase bus"
  extends ThreePhaseComponent;
  OpenIPSL.Interfaces.PwPin p1(vr(start=V_A*cos(angle_A)),
                               vi(start=V_A*sin(angle_A)))
    annotation (Placement(transformation(extent={{-10,80},{10,100}})));
  OpenIPSL.Interfaces.PwPin p2(vr(start=V_B*cos(angle_B)),
                               vi(start=V_B*sin(angle_B)))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Interfaces.PwPin p3(vr(start=V_C*cos(angle_C)),
                               vi(start=V_C*sin(angle_C)))
    annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));

  parameter Types.PerUnit V_A=1 "Voltage magnitude for phase A"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit V_B=1 "Voltage magnitude for phase B"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit V_C=1 "Voltage magnitude for phase C"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle angle_A=0 "Voltage angle for phase A"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle angle_B=-2*C.pi/3 "Voltage angle for phase B"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle angle_C=2*C.pi/3 "Voltage angle for phase C"
    annotation (Dialog(group="Power flow data"));
  Types.PerUnit Va(start=V_A) "Bus voltage magnitude for phase A";
  Types.Angle angle_a(start=angle_A)
    "Bus voltage angle for phase A";
  Types.PerUnit Vb(start=V_B) "Bus voltage magnitude for phase B";
  Types.Angle angle_b(start=angle_B)
    "Bus voltage angle for phase B";
  Types.PerUnit Vc(start=V_C) "Bus voltage magnitude for phase C";
  Types.Angle angle_c(start=angle_C)
    "Bus voltage angle for phase C";

protected
  Real[1, 6] Vin=[p1.vr, p1.vi, p2.vr, p2.vi, p3.vr, p3.vi];

equation
  Va = sqrt(Vin[1, 1]^2 + Vin[1, 2]^2);
  angle_a = atan2(Vin[1, 2], Vin[1, 1]);
  Vb = sqrt(Vin[1, 3]^2 + Vin[1, 4]^2);
  angle_b = atan2(Vin[1, 4], Vin[1, 3]);
  Vc = sqrt(Vin[1, 5]^2 + Vin[1, 6]^2);
  angle_c = atan2(Vin[1, 6], Vin[1, 5]);
  p1.ir = 0;
  p1.ii = 0;
  p2.ir = 0;
  p2.ii = 0;
  p3.ir = 0;
  p3.ii = 0;

  annotation (Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true,
        grid={2,2}), graphics={Rectangle(
          fillPattern=FillPattern.Solid,
          extent={{-10.0,-100.0},{10.0,100.0}}),Text(
          origin={0.9738,119.0625},
          fillPattern=FillPattern.Solid,
          extent={{-39.0262,-16.7966},{39.0262,16.7966}},
          textString="%name",
          fontName="Arial"),Text(
          origin={0.9738,-114.937},
          fillPattern=FillPattern.Solid,
          extent={{-39.0262,-16.7966},{39.0262,16.7966}},
          fontName="Arial",
          textString=DynamicSelect("0.0", "%Va"),
          lineColor={238,46,47}),Text(
          origin={0.9738,-140.937},
          fillPattern=FillPattern.Solid,
          extent={{-39.0262,-16.7966},{39.0262,16.7966}},
          fontName="Arial",
          textString=DynamicSelect("0.0", String(Vb, significantDigits=3)),
          lineColor={238,46,47})}),
          Documentation(info="<html>
<p>This is a three-phase bus model.</p>
<p>A bus represents a node in a power system. Therefore, this model can be used to verify voltage magnitude and angle in the three-phase nodes of the system.</p>
<p>Although it is not necessary, it is extremely recommended to connect one bus model between two other three-phase models.</p>
<p>Please, check if this bus model is the appropriate one for your system. For the connection of two- or single-phase models, two- or single-phase buses might be a better fit.</p>
</html>"));
end Bus_3Ph;
