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
    for ( TableRow row : droughtData.rows() ) {

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
    background( 0 );
    int textX = 0;
    int textY = 10;
    int circleWidth = width / 2;
    int circleHeight = height / 2;

    textAlign(CENTER);
    fill(#FFC755);
    text("Drought in the USA!", width/2, 25);
    for ( int i = 0; i < 6; i++ ) {
      fill( colors[i] );
      rect( ( ( i + 2 ) * ( height/6 ) ), height - 50, 10, 10 );
      fill(#FFFFFF);
      text( droughtText[i], ( ( i + 2 ) * ( height/6 ) + 10), height - 50 );
    }
    textAlign(BASELINE);
    for ( CountyData cd : dataArr ) {
      noFill();
      stroke( colors[cd.maxSeverity] );
      ellipse( circleWidth, circleHeight, cd.maxDrought, cd.maxDrought );
      fill( colors[cd.maxSeverity], 127 );
      if ( ( textY + 10 ) > height ) { 
        textY = 0;
        textX += 150 ;
      } 
      text( cd.county, textX, textY );
      textY += 10;
    }
  }
}