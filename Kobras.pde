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
