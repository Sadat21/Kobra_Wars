// Kobra_Wars.pde
//Author: Sadat Islam
//Date: December 1, 2015

//NOTE: FFI: Function found in

/* This program is a 2 player game of snake(kobra). This is for my ENGG 233 final design project.
    This is setup and draw of my game. I make function calls throughout.
*/

void setup()                    //All functions that are called are found in "Setup_Functions" tab
{
  frameRate(120);              //Cycles of Draw per second.
  setup_size_variables();      //Function intializes kobra locations
  setup_images();              //Intializes image files
  setup_audio();               //Intializes audio files
}

/* Runs in a continous loop
*/

void draw()
{
                           
  if (game==false && instructions==false)    //If variables game and instructions are false
    {                                        // Then the main home screen appears
      home_screen();                   //FFI: "Home_Screen" tab
    }
  if(instructions)                           //If instructions is ever true, the instructions screen appears
    {
     instructions(width,height);             //FFI: "Instructions_Screen" tab.
    }
  if(game)                // If game is ever true, the game starts
    {
     
     pre_game();     //FFI: "Pre_and_Post_Game" tab      Pre_game starts the audio and creats a new storage array
     if(end)              
     {
       result();      //If end is true, this function displays the winner of the game
       restart();
     }
     else                  //If end is not true, the game continues
     {
       border(x,y,h,v,width,height);      //FFI: Death_Error    Function responsible for causing a game over if any kobra hits the border
       user_control();                    //FFI: User_Control    Controls user controls for both players
       update_locations (all,x,y,h,v);    //FFI: Array_Storage    Updates the locations of each Kobra
       counter++;                         // counter variable plus 1
       error(x,y,h,v);                    //FFI: Death_Error    Possible errors that result in game over
       create_snake(x,y,h,v);             //FFI: Kobras    Creates each kobra
       tail();                            //FFI: Kobras    Deletes the tail
       create_ball();                     //FFI: Ball Functions    Creates the gold ball
       new_ball(x,y,h,v,width,height);    //FFI: Ball_Functions    Generates new cordinates for the new ball
     }
     
    }
}




 

 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  

  

//Creates a new class 'update' in each element of an update array

void new_array_storage ( update [] a )    //Requires an array as an argument
{
  for (int i=0; i < a.length; i++)        //Cycles through each index of the array until it reaches the last index
      {
        a[i]= new update();               //Fills the index with a new class of 'update'
      }
}




/* This function takes the current coordinates of each 
   Kobra and stores them in an array
*/
void update_locations (update [] a,int x, int y, int h, int v)    //Takes the arguments of each x,y coordinates of each Kobra
{
  a[counter].x_cor = x;    //Takse the x coordinate of Kobra 1 and stores it in x_cor
  a[counter].y_cor = y;    //Takse the y coordinate of Kobra 1 and stores it in y_cor
  a[counter].h_cor = h;    //Takse the x coordinate of Kobra 2 and stores it in h_cor
  a[counter].v_cor = v;    //Takse the x coordinate of Kobra 2 and stores it in v_cor
}
//This function displays a golden ball on the screen 
void create_ball()
{
  fill(#FCFF4D);        //Fill the ball yellow
  ellipse(a,b,size*2,size*2);    //Create an ellipse with the given arugments    
}  


/*This function controls what happens when a kobra eats a gold ball
  This creates new coordinates for the ball as well as notifies that the kobra that eats the ball gets larger
*/
void new_ball(int x, int y, int h, int v, int hor, int ver)      //Arguments: x,y coordinates of first kobra, x,y cooridnates of second kobra, horizontal size of screen, vertical size of screen
{
      if ( x - size/2 <= a + size && x + size/2 >= a - size && y - size/2 <= b + size && y + size/2 >= b - size)    //If Kobra 1's radius of the head is within the radius of the ball the following code happens
      { 
        
        fill(0);      //Fill the original ball location black
        n = counter;  //Intitalize n to the value of counter at this point (See "Kobras" tab to see reprucussions)
        rect(a-size,b-size,size*2,size*2);    //Fill the original ball location with a black rectangle over it
        do
        {                                          
          a = (int)random(size, hor - size);    //Select a random value and intialize it to a. The random value will be between the x-axis minus the radius of the size of a kobra
          b = (int)random(size, ver - size);    //Same as above but for y coordinates.
        }
        while (ball_point (all, a, b));        //While ball point returns true, keep choosing random values
      }
      
      if ( h - size/2 <= a + size && h + size/2 >= a - size && v - size/2 <= b + size && v + size/2 >= b - size)
      { 
        
        fill(0);
        m = counter;
        rect(a-size,b-size,size*2,size*2);                        //Same as above as a whole. Just for Kobra 2
        
        do
        {
          a = (int)random(size, hor - size);
          b = (int)random(size, ver - size);
        }
        while (ball_point (all, a, b)); 
  
      }
}

//This function creates new coordinates for the ball
boolean ball_point ( update [] all, int a, int b)          //Takes an array and the x and y coordinates of the ball
{
  boolean result=false;                                    //Intialises the variable to false
  for (int i=tail_p1; i < counter - 1; i++)                // This will check through index values in the master array from the tail value to the head value of both Kobra 1 and 2
  {
    if ( all[i].x_cor + size > a && a > all[i].x_cor - size && all[i].y_cor + size < b && all[i].y_cor - size > b )        //If the new value of a is within the x axis radius of either Kobra, result will be true
    result = true;
  }
  
  for (int i=tail_p2; i < counter - 1; i++)            // This will check through index values in the master array from the tail value to the head value of both Kobra 1 and 2
  {
    if ( all[i].h_cor + size > a && all[i].h_cor - size < a && all[i].v_cor + size < b && all[i].v_cor - size > b )        //If the new value of b is within the y axis radius of either Kobra, result will be true
    result = true;
  }
    
  
  if (result)      //True means the value of either a or b is within the body of a Kobra. 
  return true;
  
  else                      //False means that a and b pass the test.
  return false;
  
}  
//This function checks to see if a Kobra hits the screen walls which will result in a game over
void border(int x,int y, int h, int v, int hor, int ver)      //Takes the x,y coordinates of each Kobra and also the width and height of the screen
{
  if(x - size/2 <= 0 || x + size/2 >= hor || y - size/2 <=0 || y + size/2 >= ver)    //If Kobra 1 hits the screen walls
         {                                                                           //  The game ends and player one loses thus lose_p1 turns to true
          end = true;
          lose_p1 =true;
         } 
        
      if (h - size/2 <= 0 || h + size/2 >= hor || v - size/2 <=0 || v + size/2 >= ver)    //If Kobra 2 hits the screen walls
         {
          end = true;                                                                      //  The game ends and player two loses thus lose_p2 turns to true
          lose_p2 =true;
         }
}

//This function checks to see if either Kobras hit each other or themselves and reports a game over
void error (int x, int y, int h, int v)        //Takes the x,y coordinates of each Kobra respectively
{
  if ( keyCode==UP || keyCode==DOWN || keyCode==LEFT || keyCode==RIGHT || key=='w' || key=='s' || key== 'a' || key=='d')    //Once someone moves, there is the chance for the end result to not be a draw
      {
        for (int j = 0; j < counter-1; j++)        //Going to check each index of the array from 0 to one less than the current index. Head on collisions result in a draw.
        {
          if ( all[j].x_cor == x && all[j].y_cor == y)    //If the head of Kobra 1 hits a previous part of it's own body given in the array, 
         {                                                // the game ends 
          end = true;                                     // and player one loses
          lose_p1 = true;
         }
         if ( all[j].x_cor + size/2 > h - size/2 && all[j].x_cor - size/2 < h + size/2 && all[j].y_cor + size/2 > v - size/2 && all[j].y_cor - size/2 < v + size/2)
         {                                                                                        //If the radius of the head of Kobra 2 touches the radius of Kobra 1's body, 
          end = true;                                                                             // the game ends
          lose_p2=true;                                                                           // and player two loses
         }
         if ( all[j].h_cor == h && all[j].v_cor == v)    //If the head of Kobra 2 hits a previous part of it's own body given in the array, 
         {                                            
          end = true;                                    //the game ends,
          lose_p2 =true;                                 //and player two loses
         }
         if ( all[j].h_cor + size/2 > x - size/2 && all[j].h_cor - size/2 < x + size/2 && all[j].v_cor + size/2 > y - size/2 && all[j].v_cor - size/2 < y + size/2 )
         {                                                              //If the radius of the head of Kobra 2 touches the radius of Kobra 1's body,
          end = true;                                                   // the game ends
          lose_p1 =true;                                                // and player one loses
          
         }
        }
        
         
      }
}  

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
//This function creates all aspects of the home screen
void home_screen()   
{
    
    image(intro_screen,0,0,width,height);      //Puts image of the intro screen at the given coordinates
    intro.play();          //Start the home screen music
          
    
    image(level,width/3,height -100,width/3,50);      //Puts the image of "SPEED" on the home screen
    
    
    //Level 1
    fill(#C2D1D0);  //Fill the rectangle blue            
    rect(0,height - 50,width/3,50);      //Print rectangle to the bottom left of the screen
    fill(0);    //Colour of font
    textFont(font,32);    //Font style and size
    text("Slow",75,height - 15);    //Prints "Slow" to the screen in the rectangle 
    if( 0 < mouseX && mouseX < width/3 && height - 50 < mouseY && mouseX < height && mousePressed)    //If the mouse is on the rectangle and the mouse is pressed
    {
      speed = 2;        //spped gets intialized to 2
      fill(250,0,0);    //Colour of the rectangle
      rect(0,height - 50,width/3,50);    //Prints rectangle to the screen that disapears after mouse is released
      level_1=true;        //Re-assigns these values
      level_2=false;
      level_3=false;
    }
    
    //Level 2
    fill(#C2D1D0);   //Colour of rectangle                     
    rect(width/3,height -50,width/3,50);      //Prints rectangle in the center of the bottom part of the screen
    fill(0);    //Colour of font
    textSize(32);  //Size of text
    text("Normal",290,height - 15);    //Prints "Normal" within the rectangle
    if( width/3 < mouseX && mouseX < width/3*2 && height - 50 < mouseY && mouseY < height && mousePressed)    //If the mosue coordinates are within the rectangle and mouse is pressed
    {
      speed = 4;    //Speed is re-assigned to 4
      fill(250,0,0);    //Colour of the rectangle
      rect(width/3,height -50,width/3,50);      //Red rectangle flashes 
      level_1=false;    //Re-assigns these variables
      level_2=true;
      level_3=false;
    }
    
    
    //Level 3
    fill(#C2D1D0);     //Colour of rectangle is blue
    rect(width/3*2,height - 50 ,width/3,50);    //Draw rectangle in the bottom right of the screen
    fill(0);     //Colour of font
    textSize(32);    //Size of font 
    text("Fast",550,height - 15);      //Write "Fast" within the rectangle
    if( width/3*2 < mouseX && mouseX < width && height - 50 < mouseY && mouseY < height && mousePressed)      //If the mosue coordinates are within the rectangle and mouse is pressed
    {
      speed = 6;    //Speed is re-assigned to 4
      fill(250,0,0);    //Colour of the rectangle
      rect(width/3*2,height - 50 ,width/3,50);      //Red rectangle flashes 
      level_1=false;        //Re-assigns these variables
      level_2=false;
      level_3=true;
    }
    
    if (level_2)      //If level_2 is true
    {
      fill(250,0,0,90);                          //Fill that rectangle with a tinted red tint 
      rect(width/3,height -50,width/3,50);
    }
    else if (level_1)        //Else do above for level_1 and level_2 respectively based on which variable is true
    {
      fill(250,0,0,90);
      rect(0,height -50,width/3,50);
    }
    else if (level_3)
    {
      fill(250,0,0,90);
      rect(width/3*2,height - 50 ,width/3,50);
    }
    
    
    //Instructions Button
    rect(width/3,0,width/3,50);    //Draw rectangle at the top of the screen
    image(manual,width/3 +1,0,width/3-1,50+1);    //Image of instructions logo
    if( width/3 < mouseX && mouseX < width/3 + width/3 && mouseY < 50 && mousePressed)     //If the bouse cursor is over the instructions button and pressed
    {
     instructions = true;      //The instructions button appears
    }
    else if( width/3 < mouseX && mouseX < width/3 + width/3 && mouseY < 50)         //If the cursor is over it but no button is pressed
    {
     fill(255,0,0,65);    //Red tint
     rect(width/3,0,width/3,50);    //Fill rectangle when cursor is over it
    }  
    
    
    
    //Play Button
    rect(232,300,234,50);      //Rectangle for the play button   
    stroke(250,0,0);          //Outlines the rectangle in red
    image(play,width/3,280,width/3,90);      //Image of the play button
    if( 232 < mouseX && mouseX < 466 && 280 < mouseY && mouseY < 370 && mousePressed)    //If the mouse is over the button and pressed
     {
      background(0);    //Change background to black
      game = true;      //Game = true
     }
    else if( 232 < mouseX && mouseX < 466 && 280 < mouseY && mouseY < 370 )     //IF the mouse is over the button
     {
      fill(250,0,0,65);      //Tint red
      rect(232,300,234,50);    //Create a rectangle over the button
     }
    
    
      
}


//This function creates the instructions menu
void instructions(int x,int y)    //Takes the width and height of the screen as parameters
{
  image(how_to,0,0,x,y);    //Prints the image of the instructions on the screem
    fill(0);  //Fill black
    noStroke();   //Take away the red stroke outline
    rect(0,y-75,x,75);  //Create a rectangle at the bottom of the screen
    fill(255);  //Font colour
    text("Back", 300,y-40);    //Print "Back" in the rectangle
    if( y-75 < mouseY && mousePressed)    //If the mouse is over the rectangle and pressed
    {
     instructions = false;    //Instuctions turn false therefore it goes back to the home screen
    }
    else if( y-75 < mouseY)    //If the mouse is just over the rectangle
    {
     fill(255,0,0,65);    //Red tint
     rect(0,y-75,x,75);    //Tint the rectangle red
    }
}
//This function creates the Kobras
void create_snake(int x, int y, int h, int v)    //Takes the x,y coordinates of both Kobra's as arguments
{
  if (counter== 3)          //This delays from the start of the game so that the players have time to get ready
  {
    delay(3000);
  }
  noStroke();    //Removes the stroke outline from the Kobra's
  //Kobra 1
  fill(#51EA15);    //Fill next shape Green
  ellipse(x,y,size,size);   //Create head of Kobra 1
  
  //Kobra 2
  fill(#F53011);   //Fill next shape Red          
  ellipse(h,v,size,size);    //Create head of Kobra 2
}  

//This function erases the tail of the Kobra's  
void tail()
{
     if( 0==counter%1 && counter> big + n)    //If the modulus of counter divided by 1 is zero and counter is bigger than the variable big and n
      {
        fill(0);  //Fill black
        ellipse(all[tail_p1].x_cor,all[tail_p1].y_cor,size+1,size+1);    //Draw a black ellipse over the last part of Kobra 1
        
        all[tail_p1].x_cor=-100;      //Change the x_cor and y_cor value at that index to -100
        all[tail_p1].y_cor=-100;
        tail_p1++;
        fill(#51EA15);                            //This fills the following shape green
        for(int i = tail_p1; i <= counter; i++)    //Goes through the array from the tail to the counter value
        {
          ellipse( all[i].x_cor,all[i].y_cor,size,size);      //Recreates an ellispe to cover up a part the tail might cause to disapear
        }
        
      }
      if( 0==counter%1 && counter> big + m)      //Same as above but for Kobra 2
      {
        fill(0);
        ellipse(all[tail_p2].h_cor,all[tail_p2].v_cor,size+1,size+1);
        all[tail_p2].h_cor=-100;
        all[tail_p2].v_cor=-100;
        tail_p2++;
        fill(#F53011);
        for(int i = tail_p2; i < counter - 1; i++)
        {
          ellipse( all[i].h_cor,all[i].v_cor,size,size);
        }
      }
     
     
} 
//This function creates new classes in each array index as well as start the game music
void pre_game()
{  
    intro.close();    //Truns off home screen music
    int song = (int)random(1,3);
    
    player2.play();     //Starts game music
    if (counter == -1 )  //If counter is -1
    {
      new_array_storage ( all );  //Call the new_array_storage, found in Array_Storage tab
      counter++;    //Add counter + 1
    } 
}


//This function prints the results to the end screen
void result()    
{
      image(game_over,0,0,width,height);      //Displays the game over image
      player2.close();    //Turns off game music
      player.play();    //Turns on game over music
      if (lose_p1 && lose_p2)        //The case if both players lose by either hitting the wall at the same time or having a head on collision 
        {
        textSize(32);      //Size of text
        fill(255);        //Colour of text
        text("It's a draw!",250,height*2/3);    //Prints "It's a draw"      The bottom two are the same as this
        }
      else if (lose_p2)        //If player 2 loses 
        {
        textSize(32);
        fill(255);
        text("Player 1 Wins!",220,height*2/3);
        
        }
      else if (lose_p1)    //If player 1 loses 
        {
        textSize(32);
        fill(255);
        text("Player 2 wins!",220,height*2/3);
        }
}
//This function restarts the whole game
//It's just a duplicate of the "Global_Variables" tab to restart the game to it's intital stage.
//IT also copies the audio files from "Setup_Functions" to restart the audio
void restart()
{
  fill(0);  //Fill black
    noStroke();   //Take away the red stroke outline
    rect(0,height-75,width,75);  //Create a rectangle at the bottom of the screen
    fill(255);  //Font colour
    text("Back", 300,height-40);    //Print "Back" in the rectangle
  if( height-75 < mouseY &&  mousePressed)
    {
     game=false;            //INTI game screen to false
     instructions = false;   //INTI instuctions menu to false
      
      
      
      size = 10;    //INTI the size of the Kobra's to 10
      speed=4;      //INTI default speed to 4
      big = 20;    //INTI how big the snake gets before the tail gets cut off to 20
      
      
       //Kobra 1 variables (GREEN)
       x=width/2 + size;
       y=height/2;                      //Declare x and y coordinates of Kobra 1
       first_up = false;    //INTI up direction to false
       first_down = false;  //INTI down direction to false
       first_left = false;  //INTI left direction to false
       first_right = true;  //INTI right direction to true, makes the Kobra move right once the game starts 
       lose_p1=false;      //INTI player one losing to false. When it is true it means player one lost
       tail_p1=0;              //INTI player one's tail to 0
       n = 0;                  //INTI the parameter which big references as the zero point
      
      
       //Kobra 2 variables ( RED)
       h=width/2-size;
       v=height/2;                       //Declare x and y coordinates of Kobra 2
       sec_up = false;       //INTI up direction to false
       sec_down = false;    //INTI down direction to false
       sec_left = true;    //INTI left direction to true. The kobra will move left once the game starts
       sec_right = false;  //INTI right direction to false
       lose_p2=false;      //INTI player two losing to false. When it is true it means player two lost
       tail_p2=0;               //INTI player two's tail to 0
       m = 0;                  //INTI the parameter which big references as the zero point    
          
          
       //Ball Variables 
       a=350;    //INTI x coordinate of the ball to 350
       b=300;    //INTI y coordinate of the ball to 300
      
       //Counter: Used to determine certain indices from the master array
       counter=-1;    //INTI counter to -1
      
       //Determines whether the game has ended or not. If it is true, the game is over.
       end = false;    //INTI end to false
       //Speed Level Variables: Control which one is highlighted on the home screen
       level_1=false;    //INTI level_1 to false
       level_2=true;     //INTI level_2 to true: This tile starts coloured
       level_3=false;    //INTI level_3 to false
      
      
      
      // Create an array called "all"
      update [] all = new update [999999];    //INTI array to a new array of index 999999 of class update
      
      minim = new Minim(this);      //Audio Library
      player = minim.loadFile("death.mp3",2048);        //Game over audio
      player2 = minim.loadFile("mainmusic.mp3",2048);    //Game audio
      intro = minim.loadFile("crazy_train.mp3",2048);     //Main screen audio

         
    } 
  else if( height-75 < mouseY)    //If the mouse is just over the rectangle
    {
     fill(255,0,0,65);    //Red tint
     rect(0,height-75,width,75);    //Tint the rectangle red
    }
  
    
  
}


//This function contains the screen size variables
void setup_size_variables()
{
  size(700,700);      // Set's the size of the screen
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
//This function contains the user controls for both Kobras
void user_control()
{
  //First Player Control Start          Both codes are nearly identical. Only will comment for Player 1
  if(key==CODED)            //If key is a coded key    
      {
        if(keyCode==UP)        //If it is up
        {
          if (first_down)        //If the Kobra is going down intially, and someone presses up, nothing will happen
          {}
          else
           {
            first_up = true;          //Else, up boolean turns truw and everything else turns false
            first_down = false;
            first_left = false;
            first_right = false;
           }
        }
        else if(keyCode==DOWN)            //Same as aboave
        {
          if (first_up)
          {}
          else
          {
            first_up = false;
            first_down = true;
            first_left = false;
            first_right = false;
          }
           }
        else if(keyCode==LEFT)          //Same as above
        {
          if (first_right)
          {}
          else
          {
            first_up = false;
            first_down = false;
            first_left = true;
            first_right = false;
           }
        }
        else if(keyCode==RIGHT)          //Same as above
        {
          if (first_left)
          {}
          else
          {
            first_up = false;
            first_down = false;
            first_left = false;
            first_right = true;
           }
        }
  
      }
      
      if (first_right)                //Whatever boolean is true at this stage, the x or y coordinate will increase by a factor of the variable speed
          {  x+=speed;  }
      else if (first_left)
          {  x-=speed;  }
      else if(first_up)
          {  y-=speed;  }
      else if(first_down) 
          {  y+=speed;  }                  
      //First Player Control End
      
      
      
      //Second Player Controls Start              //See Player 1 for reference
      if(key=='w' || key=='W')                    
        {
          if(sec_down){}
          else
          { sec_right = false;
            sec_left = false;
            sec_up = true;
            sec_down = false;
          } 
        }
      else if(key=='s' || key=='S')
       {
         if(sec_up){}
         else
        { sec_right = false;
          sec_left = false;
          sec_up = false;
          sec_down = true; 
        }
       }
      else if(key=='a' || key=='A')
       {
        if(sec_right){}
        else
        { sec_right = false;
          sec_left = true;
          sec_up = false;
          sec_down = false; 
        }
       }
      else if(key=='d' || key=='D')
       {
        if(sec_left){}
        else 
        { sec_right = true;
          sec_left = false;
          sec_up = false;
          sec_down = false; 
        }
       }
        
      
      if (sec_right)
          {  h+=speed;  }
      else if (sec_left)
          {  h-=speed;  }
      else if(sec_up)
          {  v-=speed;  }
      else if(sec_down) 
          {  v+=speed;  }
      //Second Player Control Ends    
}

