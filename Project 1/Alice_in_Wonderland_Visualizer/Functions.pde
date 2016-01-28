void prepareFrequencies() {
  for (int i = 0; i < 26; i++) {
    charCounter[i] = 0;
  } 
  reader = createReader(fileName);
  try {
    while ((line = reader.read()) != -1) {
      SortChars();
      pixelPosition++;
    }
    println(charCounter);
    println("Alice Total: " + aliceCounter);
  } 
  catch(IOException e) {
    e.printStackTrace();
    line = 0;
  }
}

void SortChars() {
  if (Character.isAlphabetic(line)){
    char letter = (char)Character.toLowerCase(line);
    charCounter[letter - ASCII_OFFSET]++;
    placePixel(letter);
    if(letter == 'a') checkAlice();
  }
}

void checkAlice() {
  int temp;
  try {
    reader.mark(4);
    temp = reader.read();
    if (temp == 108 || temp == 76) {
      temp = reader.read();
      if (temp == 105 || temp == 73) {
        temp = reader.read();
        if (temp == 99 || temp == 67) {
          temp = reader.read();
          if (temp == 101 || temp == 69) {
            aliceCounter++;
          }
        }
      }
    }
    reader.reset();
  }
  catch(IOException e) {
    e.printStackTrace();
  }
}

void preparePixels(){
  letterViz = createImage(420, 420, RGB);
  letterViz.loadPixels();
}

void placePixel(char letter){
  letterViz.pixels[pixelPosition] = pallete[letter - ASCII_OFFSET];
  letterViz.updatePixels();
}

void drawFrequencyGraph(){ //proccesings map function ***
  background(0);
  text("Bar Graph here.", 100, 100);
}

void drawLetterVisualization(){
  background(0);
  image(letterViz, 0, 0);
}

void preparePallete(){
  pallete[0] = color(153, 0, 0);
  pallete[1] = color(255, 51, 51);
  pallete[2] = color(153, 76, 0);
  pallete[3] = color(255, 153, 51);
  pallete[4] = color(153, 153, 0);
  pallete[5] = color(255, 255, 51);
  pallete[6] = color(76, 153, 0);
  pallete[7] = color(153, 255, 51);
  pallete[8] = color(0, 153, 0);
  pallete[9] = color(51, 255, 51);
  pallete[10] = color(0, 153, 76);
  pallete[11] = color(51, 255, 153);
  pallete[12] = color(0, 153, 153);
  pallete[13] = color(51, 255, 255);
  pallete[14] = color(0, 76, 153);
  pallete[15] = color(51, 153, 255);
  pallete[16] = color(0, 0, 153);
  pallete[17] = color(102, 102, 255);
  pallete[18] = color(76, 0, 153);
  pallete[19] = color(153, 51, 255);
  pallete[20] = color(153, 0, 153);
  pallete[21] = color(255, 102, 255);
  pallete[22] = color(153, 0, 76);
  pallete[23] = color(255, 51, 153);
  pallete[24] = color(64, 64, 64);
  pallete[25] = color(192, 192, 192);
}