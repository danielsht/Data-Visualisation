//Daniel Shteremberg
//Project 3 
//All csv files came from http://droughtmonitor.unl.edu/MapsAndData/GISData.aspx
//The purpose of this project was to show the state the USA's drought situation. 
//The first visualization shows the country as a whole and the general situation of each state while the second shows each states counties 
//situation. To access the second visualisation just click on the state the you want to investigate further. 

DroughtData dData;
Table droughtData;

final String stateFile = "dm_export_state_20160223.csv";

ArrayList<DroughtData> dataArr = new ArrayList<DroughtData>();
color[] colors = new color[6]; 
String[] droughtText = new String[6]; 

int state;
final int DRAW_COUNTY_STATE = 1;
final int DRAW_STATES_STATE = 0;

void setup() {
  size( 1200, 750 );
  droughtData = loadTable( stateFile, "header" );

  for (TableRow row : droughtData.rows()) {

    String state = row.getString( "State" );
    float noDrought = Float.valueOf( row.getString( "Nothing" ) );
    float abnormallyDry = Float.valueOf( row.getString( "D0" ) );
    float moderateDrought = Float.valueOf( row.getString( "D1" ) );
    float severeDrought = Float.valueOf( row.getString( "D2" ) );
    float extremeDrought = Float.valueOf( row.getString( "D3" ) );
    float exceptionalDrought = Float.valueOf( row.getString( "D4" ) );

    dataArr.add( new DroughtData( state, noDrought, abnormallyDry, moderateDrought, severeDrought, extremeDrought, exceptionalDrought ) );
  }

  colors[0] = color( #6F6D6D );
  colors[1] = color( #fcd37f );
  colors[2] = color( #ffff00 );
  colors[3] = color( #ffaa00 );
  colors[4] = color( #730000 );
  colors[5] = color( #e60000 );

  droughtText[0] = "No Drought";
  droughtText[1] = "Abnormally Dry";
  droughtText[2] = "Moderate Drought";
  droughtText[3] = "Severe Drought";
  droughtText[4] = "Extreme Drought";
  droughtText[5] = "Exceptional Drought";
}

void draw() {

  background(0);
  int counterX = 0;
  int counterY = 50;
  float previousSize = 0;

  textAlign(CENTER);
  fill(#FFC755);
  text("Drought in the USA!", width/2, 25);
  for ( int i = 0; i < 6; i++ ) {
    fill( colors[i] );
    rect( ( ( i + 2 ) * ( height/6 ) ), height - 50, 10, 10 );
    fill(#FFFFFF);
    text( droughtText[i], ( ( i + 2 ) * ( height/6 ) + 10), height - 50 );
  }
  for ( DroughtData dd : dataArr ) {
    if ( ( counterX + dd.maxDrought ) > width ) { 
      counterY += 100;
      counterX = 0;
    } 
    if ( overRect( counterX, counterY, dd.maxDrought, 100 ) ) {
      fill( colors[dd.maxSeverity], 127 );
      if (state == DRAW_COUNTY_STATE) {
        dd.drawCountyViz();
        noLoop();
        break;
      } else {
        stroke( #FFFFFF );
        rect( counterX, counterY, dd.maxDrought, 100 );
        fill( 0 );
        textAlign(BASELINE);
        text( dd.state, ( counterX + 2 ), ( counterY + 15 ) );
        previousSize = dd.maxDrought;
        counterX += previousSize;
      }
    } else {
      fill( colors[dd.maxSeverity] );
      stroke( #FFFFFF );
      rect( counterX, counterY, dd.maxDrought, 100 );
      fill( 0 );
      textAlign(BASELINE);
      text( dd.state, ( counterX + 2 ), ( counterY + 15 ) );
      previousSize = dd.maxDrought;
      counterX += previousSize;
    }
  }
}

boolean overRect( int x, int y, float width, int height ) {
  if ( mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height ) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
  state = (state + 1) % 2;
  if ( state == DRAW_STATES_STATE) {
    loop();
  }
}