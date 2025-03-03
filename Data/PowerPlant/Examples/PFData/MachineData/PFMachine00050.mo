within OpenIPSL.Data.PowerPlant.Examples.PFData.MachineData;
record PFMachine00050
  "Record for power flow solutions in machines - Pload = 50 MW"
  extends MachineTemplate(
    PG1=1e06*(40.000000000000),
    QG1=1e06*(5.416582036620),
    PG2=1e06*(10.017115630375),
    QG2=1e06*(8.006544038288));

  // MACHINE: '1_1'
  // Bus: B01'

  // MACHINE: '2_1'
  // Bus: B02'

end PFMachine00050;
