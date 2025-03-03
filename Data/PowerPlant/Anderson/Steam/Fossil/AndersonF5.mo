within OpenIPSL.Data.PowerPlant.Anderson.Steam.Fossil;
record AndersonF5 "Anderson Fossil Steam Unit 5 (100 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataF5  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataF5  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataF5  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataND  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonF5;
