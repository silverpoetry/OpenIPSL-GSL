within OpenIPSL.Tests.Renewable.PSSE;
model PVPlant
  "PV source in a SMIB system to test functionality of REPCA plant controller model"
  extends BaseClasses.SMIBRenewable(SysData(fn=60), freq(k=SysData.fn));
  Electrical.Renewables.PSSE.PV pV(
    P_0=1500000,
    Q_0=-5665800,
    v_0=1,
    angle_0(displayUnit="deg") = 0.02574992,
    QFunctionality=4,
    PFunctionality=0,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECB1
      RenewableController(vref0=1),
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(pV.pwPin, GEN1.p)
    annotation (Line(points={{-40,0},{-30,0}}, color={0,0,255}));
  connect(freq.y, pV.FREQ)
    annotation (Line(points={{-75,0},{-62,0}}, color={0,0,127}));
  connect(pwVoltage.vi, pV.regulate_vi)
    annotation (Line(points={{-36.6,30},{-44,30},{-44,10}}, color={0,0,127}));
  connect(pwVoltage.vr, pV.regulate_vr) annotation (Line(points={{-36.6,33.6},{
          -56,33.6},{-56,10}}, color={0,0,127}));
  connect(pV.branch_ir, pwCurrent.ir) annotation (Line(points={{-44,-10},{-44,
          -16},{-17.6,-16},{-17.6,-6.6}}, color={0,0,127}));
  connect(pwCurrent.ii, pV.branch_ii) annotation (Line(points={{-14,-6.6},{-14,
          -20},{-56,-20},{-56,-10}}, color={0,0,127}));
  annotation (experiment(
      StopTime=5,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
Simulate for 5 seconds.
</p>
<p>This test system aims to show how to use the renewable PV plant component in all the possible control options. The model was developed following the
modeling template from the WECC PV Power Plant Dynamic Modeling Guide and PSSE manuals.</p>
<p>There are a total of eight reactive power control options (Constant local PF control, Constant local Q control, Local V control, Local coordinated
 V/Q control, Plant level Q control, Plant level V control, Plant level Q control + local coordinated V/Q control, Plant level V control + local
coordinated V/Q control), 2 active power options (No governor response, Governor response with up and down regulation).</p>
<p>Variables of interest:</p>
<ul>
<li><code>pV.RenewableGenerator.Pgen</code></li>
<li><code>pV.RenewableGenerator.Qgen</code></li>
<li><code>GEN1.v</code></li>
<li><code>FAULT.v</code></li>
<li><code>GEN2.v</code></li>
</ul>
</html>"));
end PVPlant;
