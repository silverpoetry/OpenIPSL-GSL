within OpenIPSL.Examples.PSATSystems.TwoAreaOld;
model ThirdOrder_AVRII "5-bus system with 3rd-order machine and AVR Type II"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses.BaseOrder3;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Ka=7.04,
    Ta=0.4,
    Kf=1,
    Tf=0.05,
    Ke=1,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-142,4},{-122,24}})));
equation
  connect(aVRTypeII.vf, order3.vf) annotation (Line(points={{-120,14},{-117.75,
          14},{-117.75,5},{-114,5}}, color={0,0,127}));
  connect(aVRTypeII.v, order3.v) annotation (Line(points={{-144,8},{-140,8},{-140,
          2},{-142,2},{-142,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
  connect(order3.vf0, aVRTypeII.vf0) annotation (Line(points={{-110,11},{-110,
          42},{-154,42},{-154,-4},{-132,-4},{-132,2}}, color={0,0,127}));
  connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-132,26},{
          -132,32},{-150,32},{-150,20},{-144,20}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=
            false)),
    experiment(
      StopTime=20),
Documentation(info="<html>
<p>This system tests the third order machine with a type 2 AVR, from PSAT. Simulate the system for 20 seconds.</p>
<p>Variables of interest are related to the (non-)coherency observed between the synchronous machines:</p>
<ul>
<li><code>order2.w</code></li>
<li><code>order3.w</code></li>
</ul>
<p>Note that the oscillations, which have low damping, have opposing phases, meaning that one machine is swinging against the other, in a clear example of non-coherent machines. In addition, plot:</p>
<ul>
<li><code>bus4.v</code></li>
<li><code>bus5.v</code></li>
</ul>
<p>Note that these voltages present oscillations with opposing phases as well. Compare these results with the ones from the other example systems within the <strong>TwoAreaOld</strong> subpackage.</p>
</html>"));
end ThirdOrder_AVRII;
