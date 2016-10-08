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

