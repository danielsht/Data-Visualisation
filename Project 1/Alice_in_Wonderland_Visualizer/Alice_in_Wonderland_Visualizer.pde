//Daniel Shteremberg Project 1 Alice in Wonderland Visualizer:  //<>//
//click on the screen to see the second vizualization/the frequency of the characters.

BufferedReader reader; //<>//
final String fileName = "Alice's Adventures in Wonderland.txt";
int line;
int aliceCounter = 0;
int pixelPosition = 0;

int state;
final int DRAW_LETTERS_STATE = 0;
final int DRAW_FREQUENCIES_STATE = 1;

final int LETTERS_IN_ALPHABET = 26;
final int ASCII_OFFSET = 97;
int[] charCounter = new int[LETTERS_IN_ALPHABET];

PImage letterViz;
color[] pallete = new color[LETTERS_IN_ALPHABET];
int isAlice = 0;

void setup() {
  size(400, 400);
  preparePixels();
  preparePallete();
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
} //<>// //<>// //<>// //<>//