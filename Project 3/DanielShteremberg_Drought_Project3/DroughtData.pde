class DroughtData {

  Table droughtData;

  String state;
  float noDrought;
  float abnormallyDry;
  float moderateDrought;
  float severeDrought;
  float extremeDrought;
  float exceptionalDrought;

  float maxDrought;
  int maxSeverity;

  ArrayList<CountyData> dataArr = new ArrayList<CountyData>();

  public DroughtData( String state, float noDrought, float abnormallyDry, float moderateDrought, float severeDrought, float extremeDrought, float exceptionalDrought ) {

    this.state = state;
    this.noDrought = noDrought;
    this.abnormallyDry = abnormallyDry;
    this.moderateDrought = moderateDrought;
    this.severeDrought = severeDrought;
    this.extremeDrought = extremeDrought;
    this.exceptionalDrought = exceptionalDrought;

    droughtData = loadTable("dm_export_county_20160223.csv", "header");
    for (TableRow row : droughtData.rows()) {

      state = row.getString( "State" );
      String county = row.getString( "County" );
      noDrought = Float.valueOf( row.getString( "Nothing" ) );
      abnormallyDry = Float.valueOf( row.getString( "D0" ) );
      moderateDrought = Float.valueOf( row.getString( "D1" ) );
      severeDrought = Float.valueOf( row.getString( "D2" ) );
      extremeDrought = Float.valueOf( row.getString( "D3" ) );
      exceptionalDrought = Float.valueOf( row.getString( "D4" ) );

      if (this.state.equals(state)) {
        dataArr.add( new CountyData( state, county, noDrought, abnormallyDry, moderateDrought, severeDrought, extremeDrought, exceptionalDrought ) );
      }
    }

    findMax();
  }

  void findMax() {
    if (exceptionalDrought != 0) {
      maxDrought = map(exceptionalDrought, 0, 100, 185, 200);
      maxSeverity = 5;
    } else if (extremeDrought != 0) {
      maxDrought = map(extremeDrought, 0, 100, 168, 185);
      maxSeverity = 4;
    } else if (severeDrought != 0) {
      maxDrought = map(severeDrought, 0, 100, 151, 168);
      maxSeverity = 3;
    } else if (moderateDrought != 0) {
      maxDrought = map(moderateDrought, 0, 100, 134, 151);
      maxSeverity = 2;
    } else if (abnormallyDry != 0) {
      maxDrought = map(abnormallyDry, 0, 100, 117, 134);
      maxSeverity = 1;
    } else {
      maxDrought = map(noDrought, 0, 100, 100, 117);
      maxSeverity = 0;
    }
  }

  void drawCountyViz() {
    background(#FFFFFF); //<>//
    int counterX = 0;
    int counterY = 0;
    float previousSize = 0;
    for ( CountyData cd : dataArr ) {
     if ( ( counterX + cd.maxDrought ) > width ) { 
       counterY += 100;
       counterX = 0;
     }
     fill( colors[cd.maxSeverity] );
     stroke( #FFFFFF );
     rect( counterX, counterY, cd.maxDrought, 100 );
     fill( 0 );
     text( cd.county, ( counterX + 2 ), ( counterY + 15 ) );
     previousSize = cd.maxDrought;
     counterX += previousSize;
    }
  }
}