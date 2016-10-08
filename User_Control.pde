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
