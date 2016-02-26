Table droughtData;

void setup() {
  droughtData = loadTable("dm_export_state_20160223.csv", "header");

  println(droughtData.getRowCount() + " total rows in table"); 

  for (TableRow row : droughtData.rows()) {

    String state = row.getString("State");
    float noDrought = Float.valueOf(row.getString("Nothing"));
    float abnormallyDry = Float.valueOf(row.getString("D0"));
    float moderateDrought = Float.valueOf(row.getString("D1"));
    float severeDrought = Float.valueOf(row.getString("D2"));
    float extremeDrought = Float.valueOf(row.getString("D3"));
    float exceptionalDrought = Float.valueOf(row.getString("D4"));

    println(state + " (" + noDrought + ") is " + abnormallyDry + "% Abnormally Dry, " 
      + moderateDrought + "% Moderate Drought, " + severeDrought + "% Severe Drought, " 
      + extremeDrought + "% Extreme Drought, " + exceptionalDrought + "% Exceptional Drought");
  }
}

void draw() {
}