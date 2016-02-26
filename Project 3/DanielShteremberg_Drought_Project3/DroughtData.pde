class DroughtData {
  
  Table droughtData;

  String state;
  float noDrought;
  float abnormallyDry;
  float moderateDrought;
  float severeDrought;
  float extremeDrought;
  float exceptionalDrought;

  public DroughtData( String fileName ) {
    droughtData = loadTable(fileName, "header");
    
    for (TableRow row : droughtData.rows()) {

    state = row.getString("State");
    noDrought = Float.valueOf(row.getString("Nothing"));
    abnormallyDry = Float.valueOf(row.getString("D0"));
    moderateDrought = Float.valueOf(row.getString("D1"));
    severeDrought = Float.valueOf(row.getString("D2"));
    extremeDrought = Float.valueOf(row.getString("D3"));
    exceptionalDrought = Float.valueOf(row.getString("D4"));
  }
}