within OpenIPSL.Electrical.Loads.PSAT;
model ZIP "ZIP Load"
  extends BaseClasses.baseLoad;
  parameter Types.PerUnit Pz=0.33 "Conductance";
  parameter Types.PerUnit Pi=0.33 "Active current";
  parameter Types.PerUnit Pp=1 - Pz - Pi "Active power";
  parameter Types.PerUnit Qz=0.33 "Susceptance";
  parameter Types.PerUnit Qi=0.33 "Reactive current";
  parameter Types.PerUnit Qp=1 - Qz - Qi "Reactive power";
  Real Percent_Pz,Percent_Pi,Percent_Pp,Percent_Qz,Percent_Qi,Percent_Qp;
protected
  Real a "Auxiliary variable, voltage division";
equation
  a = v/v_0;
  P = P_0/S_b*(Pz*a^2 + Pi*a + Pp);
  Q = Q_0/S_b*(Qz*a^2 + Qi*a + Qp);
  Percent_Pz=P_0/S_b*Pz*a^2/P;
  Percent_Pi=P_0/S_b*Pi*a/P;
  Percent_Pp=P_0/S_b*Pp/P;
  Percent_Qz=Q_0/S_b*Qz*a^2/Q;
  Percent_Qi=Q_0/S_b*Qi*a/Q;
  Percent_Qp=Q_0/S_b*Qp/Q;

  annotation (
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-09</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end ZIP;
