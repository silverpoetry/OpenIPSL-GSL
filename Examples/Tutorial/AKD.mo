within OpenIPSL.Examples.Tutorial;
package AKD
  "Small subsystem representing the northern part of the Norwegian power system network"
 extends Modelica.Icons.ExamplesPackage;

  package Components "Set of generation unit models"
    model Gen_no_contr "Generation unit with only a machine model"
      extends OpenIPSL.Electrical.Essentials.pfComponent;
      parameter Types.ApparentPower M_b "Machine base power"
        annotation (Dialog(group="Power flow data"));
      parameter Types.Time Tpd0 "d-axis transient open-circuit time constant"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.Time Tppd0 "d-axis sub-transient open-circuit time constant"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.Time Tppq0 "q-axis transient open-circuit time constant"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.Time H "Inertia constant"
        annotation (Dialog(group="Machine parameters"));
      parameter Real D "Speed damping"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xd "d-axis reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xq "q-axis reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xpd "d-axis transient reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xppd "d-axis sub-transient reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xl "leakage reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit S10 "Saturation factor at 1.0 pu"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit S12 "Saturation factor at 1.2 pu"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit R_a=0 "Armature resistance"
        annotation (Dialog(group="Machine parameters"));
      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        V_b=V_b,
        v_0=v_0,
        angle_0=angle_0,
        P_0=P_0,
        Q_0=Q_0,
        M_b=M_b,
        Tpd0=Tpd0,
        Tppd0=Tppd0,
        Tppq0=Tppq0,
        H=H,
        D=D,
        Xd=Xd,
        Xq=Xq,
        Xpd=Xpd,
        Xppd=Xppd,
        Xppq=Xppd,
        Xl=Xl,
        S10=S10,
        S12=S12,
        R_a=R_a) annotation (Placement(transformation(extent={{14,-20},{53,20}})));
      OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={
                {80,-10},{100,10}}), iconTransformation(extent={{60,-10},{80,10}})));
    equation
      connect(gENSAL.PMECH0, gENSAL.PMECH) annotation (Line(points={{54.95,10},{60,10},
              {60,30},{0,30},{0,12},{10.1,12}}, color={0,0,127}));
      connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{54.95,-10},{60,-10},
              {60,-30},{0,-30},{0,-12},{10.1,-12}}, color={0,0,127}));
      connect(gENSAL.p, pwPin)
        annotation (Line(points={{53,0},{90,0}}, color={0,0,255}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={Ellipse(extent={{-60,60},{60,-60}}, lineColor={0,
              0,255}),Text(
              extent={{-34,24},{32,-28}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="GEN")}),
        Documentation(info="<html>
<p>This generation unit model allows for instantiantions with different parameter sets. The model is composed by:</p>
<ul>
<li><strong>Machine model</strong>: GENSAL, a salient pole synchronous generator model.</li>
</ul>
</html>"));
    end Gen_no_contr;

    model Gen_gov_exc_stab "Generation unit with machine, exciter, turbine-governor, and stabilizer models"
      extends OpenIPSL.Electrical.Essentials.pfComponent;
      parameter Types.ApparentPower M_b "Machine base power"
        annotation (Dialog(group="Power flow data"));
      parameter Types.Time Tpd0 "d-axis transient open-circuit time constant"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.Time Tppd0 "d-axis sub-transient open-circuit time constant"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.Time Tppq0 "q-axis transient open-circuit time constant"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.Time H "Inertia constant"
        annotation (Dialog(group="Machine parameters"));
      parameter Real D "Speed damping"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xd "d-axis reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xq "q-axis reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xpd "d-axis transient reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xppd "d-axis sub-transient reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xl "leakage reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit S10 "Saturation factor at 1.0 pu"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit S12 "Saturation factor at 1.2 pu"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit R_a=0 "Armature resistance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit R=0.05 "Permanent droop";
      parameter Types.PerUnit r=0.3 "Temporary droop";
      parameter Types.Time T_r=5 "Governor time constant";
      parameter Types.Time T_f=0.05 "Filter time constant";
      parameter Types.Time T_g=0.5 "Servo time constant";
      parameter Types.TimeAging VELM=0.2 "Gate open/close velocity limit";
      parameter Types.PerUnit G_MAX=0.9 "Maximum gate limit";
      parameter Types.PerUnit G_MIN=0 "Minimum gate limit";
      parameter Types.Time T_w=1.25 "Water time constant";
      parameter Types.PerUnit A_t=1.2 "Turbine gain";
      parameter Types.PerUnit D_turb=0.2 "Turbine damping";
      parameter Types.PerUnit q_NL=0.08 "Water flow at no load";
      parameter Types.Time T_R=0.02 "Voltage input time constant";
      parameter Types.PerUnit K_A=200.0 "AVR gain";
      parameter Types.Time T_A=0.001 "AVR time constant";
      parameter Types.PerUnit V_RMAX=6.08 "Maximum AVR output";
      parameter Types.PerUnit V_RMIN=-6.08 "Minimum AVR output";
      parameter Types.PerUnit K_E=1 "Exciter field gain";
      parameter Types.Time T_E=0.55 "Exciter time constant";
      parameter Types.PerUnit K_F=0.06 "Rate feedback gain";
      parameter Types.Time T_F1=0.3 "Rate feedback time constant";
      parameter Types.Time T_F2=0.6 "Rate feedback time constant";
      parameter Types.PerUnit E_1=2.85 "Exciter saturation point 1";
      parameter Types.PerUnit S_EE_1=0.3 "Saturation at E_1";
      parameter Types.PerUnit E_2=3.8 "Exciter saturation point 2";
      parameter Types.PerUnit S_EE_2=0.6 "Saturation at E_2";
      parameter Types.Time A_1=3 "Filter Coefficient";
      parameter Real A_2=0 "Filter Coefficient";
      parameter Types.Time A_3=0 "Filter Coefficient";
      parameter Real A_4=0 "Filter Coefficient";
      parameter Types.Time A_5=0 "Filter Coefficient";
      parameter Real A_6=0 "Filter Coefficient";
      parameter Types.Time T_1=0 "Lead Time Constant";
      parameter Types.Time T_2=0 "Lag Time Constant";
      parameter Types.Time T_3=0 "Lead Time Constant";
      parameter Types.Time T_4=0 "Lag Time Constant";
      parameter Types.Time T_5=1.65 "Washout Time Constant";
      parameter Types.Time T_6=1.65 "Washout Time Constant";
      parameter Types.PerUnit K_S=6.2 "Stabilizer Gain";
      parameter Types.PerUnit L_SMAX=0.26 "Output Limits";
      parameter Types.PerUnit L_SMIN=-0.1 "Output Limits";
      parameter Types.PerUnit V_CU=999 "Output Limits";
      parameter Types.PerUnit V_CL=-999 "Output Limits";
      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        V_b=V_b,
        v_0=v_0,
        angle_0=angle_0,
        P_0=P_0,
        Q_0=Q_0,
        M_b=M_b,
        Tpd0=Tpd0,
        Tppd0=Tppd0,
        Tppq0=Tppq0,
        H=H,
        D=D,
        Xd=Xd,
        Xq=Xq,
        Xpd=Xpd,
        Xppd=Xppd,
        Xppq=Xppd,
        Xl=Xl,
        S10=S10,
        S12=S12,
        R_a=R_a) annotation (Placement(transformation(extent={{20,-20},{59,20}})));
      OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{90,-10},
                {110,10}}), iconTransformation(extent={{60,-10},{80,10}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=R,
        r=r,
        T_r=T_r,
        T_f=T_f,
        T_g=T_g,
        VELM=VELM,
        G_MAX=G_MAX,
        G_MIN=G_MIN,
        T_w=T_w,
        A_t=A_t,
        D_turb=D_turb,
        q_NL=q_NL) annotation (Placement(transformation(extent={{0,40},{-20,20}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.IEEET2 iEEET2_1(
        T_R=T_R,
        K_A=K_A,
        T_A=T_A,
        V_RMAX=V_RMAX,
        V_RMIN=V_RMIN,
        K_E=K_E,
        T_E=T_E,
        K_F=K_F,
        T_F1=T_F1,
        T_F2=T_F2,
        E_1=E_1,
        S_EE_1=S_EE_1,
        E_2=E_2,
        S_EE_2=S_EE_2)
        annotation (Placement(transformation(extent={{0,-40},{-20,-20}})));
      OpenIPSL.Electrical.Controls.PSSE.PSS.IEEEST iEEEST(
        A_1=A_1,
        A_2=A_2,
        A_3=A_3,
        A_4=A_4,
        A_5=A_5,
        A_6=A_6,
        T_1=T_1,
        T_2=T_2,
        T_3=T_3,
        T_4=T_4,
        T_5=T_5,
        T_6=T_6,
        K_S=K_S,
        L_SMAX=L_SMAX,
        L_SMIN=L_SMIN,
        V_CU=V_CU,
        V_CL=V_CL)
        annotation (Placement(transformation(extent={{40,-98},{20,-78}})));
      Modelica.Blocks.Sources.Constant disabled_exc_lims(k=0)
        annotation (Placement(transformation(extent={{-40,-72},{-20,-52}})));
      Modelica.Blocks.Sources.Constant disabled_comp_vt(k=0)
        annotation (Placement(transformation(extent={{20,-72},{40,-52}})));
    equation
      connect(gENSAL.p, pwPin)
        annotation (Line(points={{59,0},{100,0}}, color={0,0,255}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{60.95,10},{80,10},
              {80,36},{-2,36}}, color={0,0,127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{60.95,14},{70,14},
              {70,24},{-2,24}}, color={0,0,127}));
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-21,30},{-30,30},
              {-30,12},{16.1,12}}, color={0,0,127}));
      connect(iEEET2_1.EFD, gENSAL.EFD) annotation (Line(points={{-21,-30},{-30,-30},
              {-30,-12},{16.1,-12}}, color={0,0,127}));
      connect(iEEEST.VOTHSG, iEEET2_1.VOTHSG) annotation (Line(points={{19,-88},{10,
              -88},{10,-26},{1,-26}}, color={0,0,127}));
      connect(gENSAL.ETERM, iEEET2_1.ECOMP) annotation (Line(points={{60.95,-6},{80,
              -6},{80,-30},{1,-30}}, color={0,0,127}));
      connect(gENSAL.PELEC, iEEEST.V_S) annotation (Line(points={{60.95,6},{74,6},{74,
              -92},{42,-92}}, color={0,0,127}));
      connect(disabled_comp_vt.y, iEEEST.V_CT) annotation (Line(points={{41,-62},{58,
              -62},{58,-84},{42,-84}}, color={0,0,127}));
      connect(gENSAL.EFD0, iEEET2_1.EFD0) annotation (Line(points={{60.95,-10},{70,-10},
              {70,-34},{1,-34}}, color={0,0,127}));
      connect(gENSAL.XADIFD, iEEET2_1.XADIFD) annotation (Line(points={{60.95,-18},{
              66,-18},{66,-46},{-18,-46},{-18,-41}}, color={0,0,127}));
      connect(disabled_exc_lims.y, iEEET2_1.VOEL)
        annotation (Line(points={{-19,-62},{-10,-62},{-10,-41}}, color={0,0,127}));
      connect(disabled_exc_lims.y, iEEET2_1.VUEL)
        annotation (Line(points={{-19,-62},{-6,-62},{-6,-41}}, color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={Ellipse(extent={{-60,60},{60,-60}}, lineColor={0,
              0,255}),Text(
              extent={{-34,24},{32,-28}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="GEN")}),
        Documentation(info="<html>
<p>This generation unit model allows for instantiantions with different parameter sets. The model is composed by:</p>
<ul>
<li><strong>Machine model</strong>: GENSAL, a salient pole synchronous generator model.</li>
<li><strong>Exciter model</strong>: IEEET2, an IEEE type-2 excitation model.</li>
<li><strong>Turbine-governor model</strong>: HYGOV, a hydro turbine governor model.</li>
<li><strong>Stabilizer model</strong>: IEEEST, an IEEE power system stabilizer model.</li>
</ul>
</html>"));
    end Gen_gov_exc_stab;
  annotation (Documentation(info="<html>
<p>This package contains two generation unit models that are used in the AKD system. These models are:</p>
<ul>
<li><strong>Gen_no_contr</strong>: composed of basically the machine model.</li>
<li><strong>Gen_gov_exc_stab</strong>: composed of machine, exciter, turbine-governor and a stabilizer models.</li>
</ul>
</html>"));
  end Components;

  package System "Power system model for simulation"
    model AKD "Part of the Norwegian transmission system, ready for simulation"
      extends Modelica.Icons.Example;
      Components.Gen_no_contr gen58553(
        V_b=130000,
        M_b=120000000,
        Tpd0=7.34,
        Tppd0=0.05,
        Tppq0=0.25,
        H=2.31,
        D=0,
        Xd=1.2020,
        Xq=0.658,
        Xpd=0.3060,
        Xppd=0.194,
        Xl=0.113,
        S10=0.08,
        S12=0.245,
        R_a=0.004,
        v_0=PF_data.voltages.V58553,
        angle_0=PF_data.voltages.A58553,
        P_0=PF_data.powers.P58553,
        Q_0=PF_data.powers.Q58553)
        annotation (Placement(transformation(extent={{-94,-2},{-70,20}})));
      Components.Gen_no_contr gen58583(
        V_b=130000,
        M_b=120000000,
        Tpd0=7.34,
        Tppd0=0.05,
        Tppq0=0.25,
        H=2.31,
        D=0,
        Xd=1.2020,
        Xq=0.6580,
        Xpd=0.3060,
        Xppd=0.1940,
        Xl=0.113,
        S10=0.08,
        S12=0.245,
        R_a=0.004,
        v_0=PF_data.voltages.V58583,
        angle_0=PF_data.voltages.A58583,
        P_0=PF_data.powers.P58583,
        Q_0=PF_data.powers.Q58583)
        annotation (Placement(transformation(extent={{-34,33},{-10,55}})));
      Components.Gen_gov_exc_stab gen58567(
        V_b=14700,
        M_b=120000000,
        Tpd0=7.9,
        Tppd0=0.05,
        Tppq0=0.25,
        H=2.93,
        D=0,
        Xd=1.13,
        Xq=0.632,
        Xpd=0.31,
        Xppd=0.194,
        Xl=0.123,
        S10=0.0607,
        S12=0.232,
        R_a=0.004,
        R=0.08,
        r=0.4,
        T_r=8,
        T_f=0.05,
        T_g=0.2,
        VELM=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1.2,
        A_t=1.1,
        D_turb=0.3,
        q_NL=0.1,
        T_R=0.06,
        K_A=150,
        T_A=0,
        V_RMAX=4,
        V_RMIN=-4,
        K_E=1,
        T_E=0.04,
        K_F=0.011,
        T_F1=0.4,
        T_F2=0.7,
        E_1=6.5,
        S_EE_1=0.054,
        E_2=8,
        S_EE_2=0.2020,
        A_1=3,
        A_2=0,
        A_3=0,
        A_4=0,
        A_5=0,
        A_6=0,
        T_1=10000,
        T_2=3,
        T_3=1,
        T_4=3,
        T_5=0.001,
        T_6=3,
        K_S=-13.5,
        L_SMAX=0.03,
        L_SMIN=-0.03,
        V_CU=0,
        V_CL=0,
        v_0=PF_data.voltages.V58567,
        angle_0=PF_data.voltages.A58567,
        P_0=PF_data.powers.P58567,
        Q_0=PF_data.powers.Q58567)
        annotation (Placement(transformation(extent={{-102,-46},{-78,-24}})));
      Components.Gen_no_contr gen58573(
        V_b=130000,
        M_b=120000000,
        Tpd0=7.34,
        Tppd0=0.05,
        Tppq0=0.25,
        H=2.31,
        D=0,
        Xd=1.2020,
        Xq=0.658,
        Xpd=0.306,
        Xppd=0.194,
        Xl=0.113,
        S10=0.08,
        S12=0.245,
        R_a=0.004,
        v_0=PF_data.voltages.V58573,
        angle_0=PF_data.voltages.A58573,
        P_0=PF_data.powers.P58573,
        Q_0=PF_data.powers.Q58573)
        annotation (Placement(transformation(extent={{82,4},{60,26}})));
      OpenIPSL.Electrical.Branches.PwLine line_58553_58563(
        R=0.19224,
        X=0.78070,
        G=0,
        B=0.00257*0.5)
        annotation (Placement(transformation(extent={{-36,-10},{-24,-2}})));
      OpenIPSL.Electrical.Branches.PwLine line_58563_58573(
        R=0.37478,
        X=1.52958,
        G=0,
        B=0.00408*0.5)
        annotation (Placement(transformation(extent={{24,-16},{36,-8}})));
      OpenIPSL.Electrical.Branches.PwLine line_58553_58583(
        R=0.22669,
        X=1.30550,
        B=0.00526*0.5,
        G=0) annotation (Placement(transformation(extent={{-36,16},{-24,24}})));
      OpenIPSL.Electrical.Branches.PwLine line_58573_58583(
        R=0.25195,
        X=1.30183,
        G=0,
        B=0.00272*0.5)
        annotation (Placement(transformation(extent={{22,16},{34,24}})));
      Components.Gen_no_contr gen58653(
        V_b=130000,
        M_b=120000000,
        Tpd0=7.34,
        Tppd0=0.05,
        Tppq0=0.25,
        H=2.31,
        D=0,
        Xd=1.2020,
        Xq=0.658,
        Xpd=0.306,
        Xppd=0.194,
        Xl=0.113,
        S10=0.08,
        S12=0.245,
        R_a=0.004,
        v_0=PF_data.voltages.V58653,
        angle_0=PF_data.voltages.A58653,
        P_0=PF_data.powers.P58653,
        Q_0=PF_data.powers.Q58653)
        annotation (Placement(transformation(extent={{120,-11},{98,11}})));
      OpenIPSL.Electrical.Branches.PwLine line_58573_58653(
        G=0,
        R=0.49047,
        X=2.01225,
        B=0.00404*0.5,
        t1=1,
        t2=1.05,
        opening=1) annotation (Placement(transformation(
            extent={{-7,-4.5},{7,4.5}},
            origin={69,-0.5})));
      OpenIPSL.Electrical.Buses.BusExt bus_58583(
        nn=2,
        np=1,
        v_0=PF_data.voltages.V58583,
        angle_0=PF_data.voltages.A58583)
        annotation (Placement(transformation(extent={{-2,30},{0,50}})));
      OpenIPSL.Electrical.Buses.BusExt bus_58553(
        nn=1,
        np=2,
        v_0=PF_data.voltages.V58553,
        angle_0=PF_data.voltages.A58553)
        annotation (Placement(transformation(extent={{-62,-2},{-60,18}})));
      OpenIPSL.Electrical.Buses.BusExt bus_58563(
        np=3,
        nn=2,
        v_0=PF_data.voltages.V58563,
        angle_0=PF_data.voltages.A58563)
        annotation (Placement(transformation(extent={{-2,-50},{0,4}})));
      OpenIPSL.Electrical.Buses.BusExt bus_58567(
        nn=1,
        v_0=PF_data.voltages.V58567,
        angle_0=PF_data.voltages.A58567,
        np=1) annotation (Placement(transformation(extent={{-70,-45},{-68,-25}})));
      OpenIPSL.Electrical.Buses.BusExt bus_58566(
        np=1,
        v_0=PF_data.voltages.V58566,
        angle_0=PF_data.voltages.A58566,
        nn=1) annotation (Placement(transformation(extent={{69,-45},{71,-25}})));
      OpenIPSL.Electrical.Buses.BusExt bus_58573(
        nn=2,
        np=2,
        v_0=PF_data.voltages.V58573,
        angle_0=PF_data.voltages.A58573)
        annotation (Placement(transformation(extent={{50,-12},{52,24}})));
      OpenIPSL.Electrical.Buses.BusExt bus_58653(
        nn=1,
        np=1,
        v_0=PF_data.voltages.V58653,
        angle_0=PF_data.voltages.A58653)
        annotation (Placement(transformation(extent={{88,-12},{90,10}})));
      OpenIPSL.Electrical.Banks.PwCapacitorBank shunt_58553_58563(nsteps=1, B=-0.0005)
        annotation (Placement(transformation(extent={{-46,-22},{-38,-14}})));
      OpenIPSL.Electrical.Banks.PwCapacitorBank shunt_58563_58553(nsteps=1, B=0.0005)
        annotation (Placement(transformation(extent={{-22,-22},{-14,-14}})));
      OpenIPSL.Electrical.Banks.PwCapacitorBank shunt_58563_58573(nsteps=1, B=0.0005)
        annotation (Placement(transformation(extent={{16,-22},{24,-14}})));
      OpenIPSL.Electrical.Banks.PwCapacitorBank shunt_58573_58563(nsteps=1, B=-0.0005)
        annotation (Placement(transformation(extent={{38,-22},{46,-14}})));
      Data.PF_data PF_data
        annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
      inner OpenIPSL.Electrical.SystemBase SysData(S_b=1000000000)
        annotation (Placement(transformation(extent={{60,60},{104,84}})));
      OpenIPSL.Electrical.Loads.PSSE.Load Load_58563(
        V_b=130000,
        P_0=8290000,
        Q_0=0,
        v_0=PF_data.voltages.V58563,
        angle_0=PF_data.voltages.A58563,
        characteristic=2)
        annotation (Placement(transformation(extent={{13,-64},{27,-52}})));
      Components.Gen_gov_exc_stab gen58566(
        V_b=9500,
        M_b=60000000,
        Tpd0=7.34,
        Tppd0=0.05,
        Tppq0=0.25,
        H=2.31,
        D=0,
        Xd=1.202,
        Xq=0.658,
        Xpd=0.306,
        Xppd=0.187,
        Xl=0.113,
        S10=0.08,
        S12=0.245,
        R_a=0.005,
        R=0.08,
        r=0.4,
        T_r=8,
        T_f=0.05,
        T_g=0.2,
        VELM=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1.2,
        A_t=1.1,
        D_turb=0.3,
        q_NL=0.1,
        T_R=0.06,
        K_A=150,
        T_A=0,
        V_RMAX=4,
        V_RMIN=-4,
        K_E=1,
        T_E=0.04,
        K_F=0.011,
        T_F1=0.4,
        T_F2=0.7,
        E_1=6.5,
        S_EE_1=0.054,
        E_2=8,
        S_EE_2=0.202,
        T_1=10000,
        T_2=3,
        T_3=1,
        T_4=3,
        T_5=0.001,
        T_6=3,
        K_S=-13.5,
        L_SMAX=0.03,
        L_SMIN=-0.03,
        V_CU=0,
        V_CL=0,
        v_0=PF_data.voltages.V58566,
        angle_0=PF_data.voltages.A58566,
        P_0=PF_data.powers.P58566,
        Q_0=PF_data.powers.Q58566)
        annotation (Placement(transformation(extent={{112,-46},{90,-24}})));
      OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer(
        R=0.027500,
        X=0.989170,
        G=0,
        B=0,
        t1=1,
        t2=1,
        ANG1=2.61799387799)
        annotation (Placement(transformation(extent={{-30,-38},{-42,-30}})));
      OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
        twoWindingTransformer1(
        G=0,
        B=0,
        t1=1,
        t2=1,
        ANG1=2.61799387799,
        R=0.065,
        X=2.113330)
        annotation (Placement(transformation(extent={{34,-38},{46,-30}})));
    equation
      connect(line_58553_58583.n, bus_58583.n[1]) annotation (Line(
          points={{-24.6,20},{-6,20},{-6,37},{-2,37}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(gen58583.pwPin, bus_58583.n[2]) annotation (Line(
          points={{-13.6,44},{-6.84,44},{-6.84,43},{-2,43}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus_58583.p[1], line_58573_58583.p) annotation (Line(
          points={{0,40},{5,40},{5,20},{22.6,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(gen58553.pwPin, bus_58553.n[1]) annotation (Line(
          points={{-73.6,9},{-66.84,9},{-66.84,8},{-62,8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus_58553.p[1], line_58553_58563.p) annotation (Line(
          points={{-60,5},{-56,5},{-56,-6},{-35.4,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(line_58553_58583.p, bus_58553.p[2]) annotation (Line(
          points={{-35.4,20},{-56,20},{-56,11},{-60,11}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(line_58563_58573.n, bus_58573.n[1]) annotation (Line(
          points={{35.4,-12},{44,-12},{44,0.6},{50,0.6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(line_58573_58583.n, bus_58573.n[2]) annotation (Line(
          points={{33.4,20},{44,20},{44,11.4},{50,11.4}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(line_58573_58653.p, bus_58573.p[1]) annotation (Line(
          points={{62.7,-0.5},{62.7,0.6},{52,0.6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(gen58573.pwPin, bus_58573.p[2]) annotation (Line(
          points={{63.3,15},{56.77,15},{56.77,11.4},{52,11.4}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(line_58573_58653.n, bus_58653.n[1]) annotation (Line(
          points={{75.3,-0.5},{82,-0.5},{82,-1},{88,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus_58653.p[1], gen58653.pwPin) annotation (Line(
          points={{90,-1},{94.77,-1},{94.77,0},{101.3,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(shunt_58553_58563.p, line_58553_58563.p) annotation (Line(
          points={{-42,-14},{-42,-11.48},{-35.4,-11.48},{-35.4,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(shunt_58563_58553.p, line_58553_58563.n) annotation (Line(
          points={{-18,-14},{-18,-11.48},{-24.6,-11.48},{-24.6,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(shunt_58563_58573.p, line_58563_58573.p) annotation (Line(
          points={{20,-14},{20,-12.48},{24.6,-12.48},{24.6,-12}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(shunt_58573_58563.p, line_58563_58573.n) annotation (Line(
          points={{42,-14},{42,-12.48},{35.4,-12.48},{35.4,-12}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(gen58567.pwPin, bus_58567.n[1]) annotation (Line(points={{-81.6,-35},
              {-75.8,-35},{-70,-35}},color={0,0,255}));
      connect(Load_58563.p, bus_58563.p[1]) annotation (Line(points={{20,-52},{20,-38},
              {6,-38},{6,-38},{0,-38},{0,-36},{0,-34},{0,-33.8}}, color={0,0,255}));
      connect(line_58563_58573.p, bus_58563.p[2]) annotation (Line(points={{24.6,-12},
              {12,-12},{12,-23},{0,-23}}, color={0,0,255}));
      connect(line_58553_58563.n, bus_58563.n[1]) annotation (Line(points={{-24.6,-6},
              {-12,-6},{-12,-31.1},{-2,-31.1}}, color={0,0,255}));
      connect(gen58566.pwPin, bus_58566.p[1]) annotation (Line(points={{93.3,-35},{
              82.65,-35},{71,-35}}, color={0,0,255}));
      connect(twoWindingTransformer.n, bus_58567.p[1])
        annotation (Line(points={{-42.6,-34},{-68,-34},{-68,-35}},
                                                                 color={0,0,255}));
      connect(twoWindingTransformer.p, bus_58563.n[2])
        annotation (Line(points={{-29.4,-34},{-2,-34},{-2,-14.9}},
                                                                 color={0,0,255}));
      connect(twoWindingTransformer1.n, bus_58566.n[1])
        annotation (Line(points={{46.6,-34},{69,-34},{69,-35}},
                                                              color={0,0,255}));
      connect(twoWindingTransformer1.p, bus_58563.p[3])
        annotation (Line(points={{33.4,-34},{0,-34},{0,-12.2}},
                                                              color={0,0,255}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                120,100}}), graphics={Text(
              extent={{-12,56},{8,50}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus 58583"),Text(
              extent={{-72,24},{-52,18}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus 58553"),Text(
              extent={{-79,-45},{-59,-51}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus 58567"),Text(
              extent={{60,-46},{80,-52}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus 58566"),Text(
              extent={{-11,-51},{9,-57}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus 58563"),Text(
              extent={{40,30},{60,24}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus 58573"),Text(
              extent={{80,16},{100,10}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus 58653")}),
        Documentation(info="<html>
<p>This example system represents small portion of the Norwegian transmission system, going under the line opening between buses 58573 and 58653, at both ends. The line opens at 1s and the event lasts for 50ms and, after that, the line is reconnected.</p>
<p>The system should be simulated during 10 seconds and the variables of interest are:</p>
<ul>
<li><code>bus_58563.v</code></li>
<li><code>bus_58563.angle</code></li>
</ul>
</html>"),
        experiment(StopTime=10));
    end AKD;
  annotation (Documentation(info="<html>
<p>This package contains the test system to be simulated. More information can be found in the model documentation.</p>
</html>"));
  end System;

  package Data "Package with power flow data records for model initialization"
    record AKD_PF_powers "Record for active and reactive injected powers"
      extends Modelica.Icons.Record;
      parameter Real P58553=20711440;
      parameter Real Q58553=-8735913;
      //
      parameter Real P58566=35110000;
      parameter Real Q58566=-919194;
      //
      parameter Real P58567=0;
      parameter Real Q58567=-2441159;
      //
      parameter Real P58573=-14900000;
      parameter Real Q58573=2100000;
      //
      parameter Real P58583=-45730000;
      parameter Real Q58583=5042366;
      //
      parameter Real P58653=13700000;
      parameter Real Q58653=-8540000;

    end AKD_PF_powers;

    record AKD_PF_voltages "Record for voltage magnitudes and angles"
      extends Modelica.Icons.Record;
      parameter Real V58553=1;
      parameter Real A58553=0;
      //
      parameter Real V58563=1.002415;
      parameter Real A58563=0.00737551881;
      //
      parameter Real V58566=0.9999999;
      parameter Real A58566=-2.53646954863;
      //
      parameter Real V58567=1;
      parameter Real A58567=-2.61055179406;
      //
      parameter Real V58573=1.00003;
      parameter Real A58573=-0.01958552636;
      //
      parameter Real V58583=0.9999999;
      parameter Real A58583=-0.04068425318;
      //
      parameter Real V58653=0.993048;
      parameter Real A58653=0.01141340261;

    end AKD_PF_voltages;

    record PF_data "PSSE complete data record"
      extends Modelica.Icons.Record;
      /* PSSE voltages from power flow solution */
      replaceable record Voltages = Data.AKD_PF_voltages constrainedby
        Data.AKD_PF_voltages "PSSE voltages from power flow solution" annotation (choicesAllMatching);
      Voltages voltages;
      /* PSSE powers from power flow solution */
      replaceable record Powers = Data.AKD_PF_powers constrainedby
        Data.AKD_PF_powers "PSSE powers from power flow solution"
                           annotation (choicesAllMatching);
      Powers powers;
      annotation (Documentation(info="<html>
<p>This record package contains two templates that can be used as replaceable records for changing the operating point in which the system is initialized. The templates are: </p>
<ul>
<li><strong>Voltages</strong>: composed of voltage magnitude, in per unit, and angles, in radians.</li>
<li><strong>Powers</strong>: composed of active and reactive power values in VA and Var, respectively, that are injected in the node.</li>
</ul>
</html>"));
    end PF_data;
  annotation (Documentation(info="<html>
<p>This package contains the power flow data that is used to initialize the dynamic models. The power flow solution was calculated using PSSE.</p>
</html>"));
  end Data;
annotation (Documentation(info="<html>
<p>The AKD test system represents a small transmission grid that is provided by Statnett, the Norwegian Transmission System Operator. The grid represents a subsystem of the Norwegian power network, located in the northern part of the country.</p>
<p>The system is composed of seven buses, six machines and one load center.</p>
<p>The model underwent a software-to-software validation procedure against the PSSE model counterpart. The validation procedure assessed the behavior of the system after different disturbances that were applied to the system.</p>
<p>This package contains three sub-packages:</p>
<ul>
<li><strong>Components</strong>: has basically two models that represent the generation units used in the system.</li>
<li><strong>System</strong>: has the power grid model that can be simulated.</li>
<li><strong>Data</strong>: contains the power flow data that is used to initialize the power grid.</li>
</ul>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Author</p></td>
<td><p>Giuseppe Laera, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigi.vanfretti@gmail.com\">luigi.vanfretti@gmail.com</a></p></td>
</tr>
</table>
</html>"));
end AKD;
