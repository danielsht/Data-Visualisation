class CountyData {

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

  public CountyData( String state, String county, float noDrought, float abnormallyDry, float moderateDrought, float severeDrought, float extremeDrought, float exceptionalDrought ) {

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
      maxDrought = map(exceptionalDrought, 0, 100, 185*3, 200*3);
      maxSeverity = 5;
    } else if (extremeDrought != 0) {
      maxDrought = map(extremeDrought, 0, 100, 168*3, 185*3);
      maxSeverity = 4;
    } else if (severeDrought != 0) {
      maxDrought = map(severeDrought, 0, 100, 151*3, 168*3);
      maxSeverity = 3;
    } else if (moderateDrought != 0) {
      maxDrought = map(moderateDrought, 0, 100, 134*3, 151*3);
      maxSeverity = 2;
    } else if (abnormallyDry != 0) {
      maxDrought = map(abnormallyDry, 0, 100, 117*3, 134*3);
      maxSeverity = 1;
    } else {
      maxDrought = map(noDrought, 0, 100, 100*3, 117*3);
      maxSeverity = 0;
    }
  }
}