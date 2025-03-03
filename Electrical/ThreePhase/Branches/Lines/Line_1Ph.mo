within OpenIPSL.Electrical.ThreePhase.Branches.Lines;
model Line_1Ph "Single-phase line modeled as a PI-equivalent device"
  extends Branches.BaseClasses.baseLine;

  OpenIPSL.Interfaces.PwPin Ain
    annotation (Placement(transformation(extent={{-140,-10},{-120,10}})));
  OpenIPSL.Interfaces.PwPin Aout
    annotation (Placement(transformation(extent={{120,-10},{140,10}})));
  parameter Types.PerUnit Gser=0 "Series conductance" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bser=-10 "Series susceptance" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bsht=0 "Shunt half susceptance" annotation (Dialog(group="Power flow data"));

  //Writing the Y_ser matrix for the pi model
protected
  parameter Real[2, 2] Y_ser=[Gser, -Bser; Bser, Gser];

  //Writing the Y_sht matrix for the pi model
  parameter Real[2, 2] Y_sht=[zero, -Bsht; Bsht, zero];

  //Calculating the parameters for the Transformer
  //Writing the matrix A (Yser1+Yshtk)
  parameter Real[2, 2] A=Y_ser + Y_sht;

  //Writing the matrix B (-Yser1)
  parameter Real[2, 2] B=-Y_ser;

  // Writing matrix for voltages (in and out)
  Real[2, 1] Vin=[Ain.vr; Ain.vi];
  Real[2, 1] Vout=[Aout.vr; Aout.vi];
  // Writing matrix for currents (in and out)
  Real[2, 1] Iin=[Ain.ir; Ain.ii];
  Real[2, 1] Iout=[Aout.ir; Aout.ii];

equation
  // Equations according to pi model
  Iin = A*Vin + B*Vout;
  Iout = B*Vin + A*Vout;

  annotation (
    Icon(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true), graphics={Line(points={{-90,0},{-130,0}}, color={0,0,
          255}),Line(points={{90,0},{130,0}}, color={0,0,255})}),
    Diagram(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true)),
    Documentation(info="<html>
<p>This model was design to represent single-phase power line, modeled as a pi-element.</p>
<p>The user should input the series conductance and susceptance, and half shunt susceptance (line charging).</p>
<p>Based on this set of parameters, the pi-equivalent impedance matrices are calculated and the power line equation is assembled.</p>
</html>"));
end Line_1Ph;
