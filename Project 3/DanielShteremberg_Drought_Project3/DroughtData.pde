class DroughtData {

  Table droughtData;

  String state;
  float noDrought;
  float abnormallyDry;
  float moderateDrought;
  float severeDrought;
  float extremeDrought;
  float exceptionalDrought;

  public DroughtData( String state, float noDrought, float abnormallyDry, float moderateDrought, float severeDrought, float extremeDrought, float exceptionalDrought ) {

    this.state = state;
    this.noDrought = noDrought;
    this.abnormallyDry = abnormallyDry;
    this.moderateDrought = moderateDrought;
    this.severeDrought = severeDrought;
    this.extremeDrought = extremeDrought;
    this.exceptionalDrought = exceptionalDrought;
    
  }
  
  
}