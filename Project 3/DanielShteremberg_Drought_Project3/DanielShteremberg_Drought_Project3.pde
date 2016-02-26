Table droughtData;
Table countyDroughtData;

DroughtData dData;

ArrayList<DroughtData> dataArr = new ArrayList<DroughtData>();

void setup() {
  droughtData = loadTable("dm_export_state_20160223.csv", "header");
  countyDroughtData = loadTable("dm_export_county_20160223.csv", "header");

  for (TableRow row : droughtData.rows()) {

    String state = row.getString("State");
    float noDrought = Float.valueOf(row.getString("Nothing"));
    float abnormallyDry = Float.valueOf(row.getString("D0"));
    float moderateDrought = Float.valueOf(row.getString("D1"));
    float severeDrought = Float.valueOf(row.getString("D2"));
    float extremeDrought = Float.valueOf(row.getString("D3"));
    float exceptionalDrought = Float.valueOf(row.getString("D4"));

    //dataArr.add( new DroughtData( state, noDrought, abnormallyDry, moderateDrought, severeDrought, extremeDrought, exceptionalDrought ) );
  }
}

void draw() {
}