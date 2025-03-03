within OpenIPSL.Electrical.ThreePhase.Branches.Transformer.TransfConnection;
function Y_Y "Calculation of impedance matrices for a wye-wye-connected three-phase transformer."
  extends Modelica.Icons.Function;
  input Real X;
  input Real R;
  input Real tap;
  output Real[12, 12] PiMatrix;
protected
  parameter Real sGser=((1/tap)/3)*(2*R/(R*R + X*X));
  parameter Real sBser=((1/tap)/3)*(-2*X/(R*R + X*X));
  parameter Real mGser=((1/tap)/3)*(-R/(R*R + X*X));
  parameter Real mBser=((1/tap)/3)*(X/(R*R + X*X));
  parameter Real sGshk=((1 - tap)/(3*tap*tap))*(2*R/(R*R + X*X));
  parameter Real sBshk=((1 - tap)/(3*tap*tap))*(-2*X/(R*R + X*X));
  parameter Real mGshk=((1 - tap)/(3*tap*tap))*(-R/(R*R + X*X));
  parameter Real mBshk=((1 - tap)/(3*tap*tap))*(X/(R*R + X*X));

  //Writing the Y_ser matrix according to Simulight
  parameter Real[6, 6] Y_ser=[sGser, -sBser, mGser, -mBser, mGser, -mBser;
      sBser, sGser, mBser, mGser, mBser, mGser; mGser, -mBser, sGser, -sBser,
      mGser, -mBser; mBser, mGser, sBser, sGser, mBser, mGser; mGser, -mBser,
      mGser, -mBser, sGser, -sBser; mBser, mGser, mBser, mGser, sBser, sGser];

  //Writing the Y_sht_k matrix according to Simulight
  parameter Real[6, 6] Yshtk=[sGshk, -sBshk, mGshk, -mBshk, mGshk, -mBshk;
      sBshk, sGshk, mBshk, mGshk, mBshk, mGshk; mGshk, -mBshk, sGshk, -sBshk,
      mGshk, -mBshk; mBshk, mGshk, sBshk, sGshk, mBshk, mGshk; mGshk, -mBshk,
      mGshk, -mBshk, sGshk, -sBshk; mBshk, mGshk, mBshk, mGshk, sBshk, sGshk];

  //Writing the Y_sht_m matrix according to Simulight
  parameter Real[6, 6] Yshtm=zeros(6, 6);

  //Calculating the parameters for the Transformer
  //Writing the matrix A (Yser1+Yshtk)
  parameter Real[6, 6] A=Y_ser + Yshtk;

  //Writing the matrix B (-Yser1)
  parameter Real[6, 6] B=-Y_ser;

  //Writing the matrix MC (-Yser2)
  parameter Real[6, 6] C=-Y_ser;

  //Writing the matrix D (Yser2+Yshtm)
  parameter Real[6, 6] D=Y_ser + Yshtm;
algorithm
  PiMatrix := [A, B; C, D];
annotation (
Documentation(info="<html>
<p>This function calculates impedance matrices of a three-phase transformer modeled as a pi-equivalent.</p>
<p>The transformer that uses this function should have its primary and secondary windings connected in wye (star).</p>
</html>"));
end Y_Y;
