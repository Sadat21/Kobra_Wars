//This function contains the screen size variables
void setup_size_variables()
{
  //size(700,700);      // Set's the size of the screen
  background(0);      //Turns background black
  x = width/2 + size;    // initial x coordinate of Kobra 1
  y = height/2;          // Initial y coordinate of Kobra 1
  h = width/2 - size;    // initial x coordinate of Kobra 2
  v = height/2;         // Initial y coordinate of Kobra 2
}

//This function intializes all the image files into variables and one font is stored in a variable
void setup_images()
{
  intro_screen = loadImage("Wars.jpg");        //Main screen image background is intialized
  game_over = loadImage("gameover.jpg");    //Gameover screen image is intialized
  how_to = loadImage("Instructions.png");    // Instuctions image background screen is intialized
  play = loadImage("play.jpg");      //play button image is intialized
  level = loadImage("speed.png");    // "speed" button image is intialized
  manual = loadImage("manual.png");    // Instuctions button image is intialized
  font = loadFont("Broadway-40.vlw");   // font is loaded
}

//This function stores audio files in variables
void setup_audio ()
{
  minim = new Minim(this);      //Audio Library
  player = minim.loadFile("death.mp3",2048);        //Game over audio
  player2 = minim.loadFile("mainmusic.mp3",2048);    //Game audio
  intro = minim.loadFile("crazy_train.mp3",2048);     //Main screen audio
}