# ELM15
A simple implementation of the puzzle game "15" in ELM.

  The purpose of this project was to give us some experience regarding functional programming languages. We had to code our own implementation of the "15 puzzle" game (Here is an example of the game https://15puzzle.netlify.app/). Given my lack of experience in functional programming, I decided mine would not be too complicated.
  
  The theory behind my implementation is simple: there are 2 arrays, each containing 17 elements. The first 16 elements are the data that each button will represent, ranging from the number 1 to 15, and finally 0 (representing the "empty" box). The 17th element holds the current index of the "empty" box so that we may keep track of it when it is swapped later on. 
  
The way these values are held in the array si within tuples. Each tuple has 2 values: the value that a button is supposed to hold, and the value that the button is actually holding. The game will be completed when both values in every single tuple are the same. This "completed" state is what is held in the second array.

As for the front-end of the game, it works via buttons. Each button is assigned an index of the main array. The text that each button shows is the first value being held in the tuple within their index. Whenever a button is clicked, it sends a unique message to the system that contains the index of the array that that button represents. That index is then used to calculate whether the current button is adjacent to the "empty" box (in this case adjacency is defined as index +- 1 or index +- 4). Should the two boxes be adjacent, the first value of their respective tuples will be swapped, and the 17th element of the array will be updated with the new location of the "empty" box. Afterwards, the current array will be compared with the "completed" array, if they are the same the game will print a "Game Over" text.
