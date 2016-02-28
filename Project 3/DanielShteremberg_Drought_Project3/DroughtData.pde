class DroughtData {

  Table droughtData;

  String state;
  String county;
  float noDrought;
  float abnormallyDry;
  float moderateDrought;
  float severeDrought;
  float extremeDrought;
  float exceptionalDrought;

  float maxDrought;
  int maxSeverity;

  public DroughtData( String state, float noDrought, float abnormallyDry, float moderateDrought, float severeDrought, float extremeDrought, float exceptionalDrought ) {

    this.state = state;
    county = null;
    this.noDrought = noDrought;
    this.abnormallyDry = abnormallyDry;
    this.moderateDrought = moderateDrought;
    this.severeDrought = severeDrought;
    this.extremeDrought = extremeDrought;
    this.exceptionalDrought = exceptionalDrought;
    
    findMax();
  }

  public DroughtData( String state, String county, float noDrought, float abnormallyDry, float moderateDrought, float severeDrought, float extremeDrought, float exceptionalDrought ) {

    this.state = state;
    this.county = county;
    this.noDrought = noDrought;
    this.abnormallyDry = abnormallyDry;
    this.moderateDrought = moderateDrought;
    this.severeDrought = severeDrought;
    this.extremeDrought = extremeDrought;
    this.exceptionalDrought = exceptionalDrought;
    
    findMax();
  }

  void findMax() {
    if (exceptionalDrought != 0) {
      maxDrought = map(exceptionalDrought, 0, 100, 85, 100);
      maxSeverity = 5;
    } else if (extremeDrought != 0) {
      maxDrought = map(extremeDrought, 0, 100, 68, 85);
      maxSeverity = 4;
    } else if (severeDrought != 0) {
      maxDrought = map(severeDrought, 0, 100, 51, 68);
      maxSeverity = 3;
    } else if (moderateDrought != 0) {
      maxDrought = map(moderateDrought, 0, 100, 34, 51);
      maxSeverity = 2;
    } else if (abnormallyDry != 0) {
      maxDrought = map(abnormallyDry, 0, 100, 17, 34);
      maxSeverity = 1;
    } else {
      maxDrought = map(noDrought, 0, 100, 0, 17);
      maxSeverity = 0;
    }
  }
}