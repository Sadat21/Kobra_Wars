
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
