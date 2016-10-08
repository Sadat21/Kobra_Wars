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
