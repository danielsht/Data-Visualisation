DroughtData dData; //<>// //<>// //<>//
Table droughtData;

final String stateFile = "dm_export_state_20160223.csv";
final String countyFile = "dm_export_county_20160223.csv";

ArrayList<DroughtData> dataArr = new ArrayList<DroughtData>();

void setup() {
  size(800, 800);
  droughtData = loadTable( stateFile, "header" );

  for (TableRow row : droughtData.rows()) {

    String state = row.getString( "State" );
    float noDrought = Float.valueOf(row.getString( "Nothing" ));
    float abnormallyDry = Float.valueOf(row.getString( "D0" ));
    float moderateDrought = Float.valueOf(row.getString( "D1" ));
    float severeDrought = Float.valueOf(row.getString( "D2" ));
    float extremeDrought = Float.valueOf(row.getString( "D3" ));
    float exceptionalDrought = Float.valueOf(row.getString( "D4" ));

    dataArr.add( new DroughtData( state, noDrought, abnormallyDry, moderateDrought, severeDrought, extremeDrought, exceptionalDrought ) );
  }

  for (DroughtData dd : dataArr) {
    println(dd.state);
  }
}

void draw() {
  background(0);
  int counter = 0;
  for ( DroughtData dd : dataArr ){
    fill( #BC0D0D );
    rect( counter , 0, 10, 10 ); //<>//
    counter += 10;
  }
  counter = 0;
  
}