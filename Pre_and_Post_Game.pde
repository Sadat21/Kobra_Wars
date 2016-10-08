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
