//NOTE: INTI: Intializes 

boolean game=false;            //INTI game screen to false
boolean instructions = false;   //INTI instuctions menu to false



int size = 10;    //INTI the size of the Kobra's to 10
int speed=4;      //INTI default speed to 4
int big = 20;    //INTI how big the snake gets before the tail gets cut off to 20


//Kobra 1 variables (GREEN)
int x,y;                      //Declare x and y coordinates of Kobra 1
boolean first_up = false;    //INTI up direction to false
boolean first_down = false;  //INTI down direction to false
boolean first_left = false;  //INTI left direction to false
boolean first_right = true;  //INTI right direction to true, makes the Kobra move right once the game starts 
boolean lose_p1=false;      //INTI player one losing to false. When it is true it means player one lost
int tail_p1=0;              //INTI player one's tail to 0
int n = 0;                  //INTI the parameter which big references as the zero point


//Kobra 2 variables ( RED)
int h,v;                       //Declare x and y coordinates of Kobra 2
boolean sec_up = false;       //INTI up direction to false
boolean sec_down = false;    //INTI down direction to false
boolean sec_left = true;    //INTI left direction to true. The kobra will move left once the game starts
boolean sec_right = false;  //INTI right direction to false
boolean lose_p2=false;      //INTI player two losing to false. When it is true it means player two lost
int tail_p2=0;               //INTI player two's tail to 0
int m = 0;                  //INTI the parameter which big references as the zero point



//Ball Variables 
int a=350;    //INTI x coordinate of the ball to 350
int b=300;    //INTI y coordinate of the ball to 300

//Counter: Used to determine certain indices from the master array
int counter=-1;    //INTI counter to -1

//Determines whether the game has ended or not. If it is true, the game is over.
boolean end = false;    //INTI end to false

//Speed Level Variables: Control which one is highlighted on the home screen
boolean level_1=false;    //INTI level_1 to false
boolean level_2=true;     //INTI level_2 to true: This tile starts coloured
boolean level_3=false;    //INTI level_3 to false





//Creates a global class
class update
{
  int x_cor,y_cor,h_cor,v_cor;      //The objects within this class called "update". They are the x,y coordinates of Kobra 1 and 2 respectively
}

// Create an array called "all"
update [] all = new update [999999];    //INTI array to a new array of index 999999 of class update




//Image Files
PImage game_over;          //Game over image
PImage intro_screen;       //Hoem Screen image
PImage how_to;             //Instructions logo on the home screen image
PImage play;               //Image of th play button
PImage level;              //Image of the "Speed" logo
PImage manual;             //Instructions image on the Instructions screen

//Audio Files
import ddf.minim.*;        //Import audio player
AudioPlayer player;        //Audio for in game
AudioPlayer player2;       //Audio for game over screen
AudioPlayer intro;        //Audio for the intro screen
Minim minim;
PFont font;                //INTI font used during this program
