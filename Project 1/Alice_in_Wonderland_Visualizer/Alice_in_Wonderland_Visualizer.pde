BufferedReader reader; //<>// //<>//
final String fileName = "Alice's Adventures in Wonderland.txt";
int line;
int aliceCounter;

int state;
final int DRAW_LETTERS_STATE = 0;
final int DRAW_FREQUENCIES_STATE = 1;

final int LETTERS_IN_ALPHABET = 26;
final int ASCII_OFFSET = 97;
int[] charCounter = new int[LETTERS_IN_ALPHABET];

void setup() {
  size(420, 420);
  aliceCounter = 0;
  prepareFrequencies();
}

void draw() {
  background(255);
  if (state == DRAW_LETTERS_STATE){
    drawLetterVisualization();
  }else{
    drawFrequencyGraph();
  }
}

void mousePressed(){
  state = (state + 1) % 2;
}

void prepareFrequencies() {
  for (int i = 0; i < 26; i++) {
    charCounter[i] = 0;
  } 
  reader = createReader(fileName);
  try {
    while ((line = reader.read()) != -1) {
      SortChars();
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
  if (Character.isAlphabetic(line)){ //<>//
    char letter = (char)Character.toLowerCase(line); //<>//
    charCounter[letter - ASCII_OFFSET]++; //<>//
    if(letter == 'a') checkAlice(); //<>//
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

void drawFrequencyGraph(){ //proccesings map function ***
  background(0);
  text("Bar Graph here.", 100, 100);
}

void drawLetterVisualization(){
  background(0);
  text("Drawing all the letters.", 100, 100);
}