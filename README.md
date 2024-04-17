# Overview of Software Engineering - Group 3

## 1. Team

| Name             | Email                     | GitHub Account       |
|------------------|---------------------------|----------------------|
| Chris Kerr       | [th23780@bristol.ac.uk](mailto:th23780@bristol.ac.uk) | [@chriskerrc](https://github.com/chriskerrc) |
| Florence Rose    | [xd23758@bristol.ac.uk](mailto:xd23758@bristol.ac.uk) | [@frose2024](https://github.com/frose2024) |
| Josh Wierszycki  | [el20063@bristol.ac.uk](mailto:el20063@bristol.ac.uk) | [@JWierszycki](https://github.com/JWierszycki) |
| Ziyuan Lu        | [py23518@bristol.ac.uk](mailto:py23518@bristol.ac.uk) | [@LzYzL](https://github.com/LzYzL) |
| Alexander Fisher | [af17918@bristol.ac.uk](mailto:af17918@bristol.ac.uk) | [@alexandermfisher](https://github.com/alexandermfisher) |
| Jie Fang         | [yh23030@bristol.ac.uk](mailto:yh23030@bristol.ac.uk) | [@Jiebristol](https://github.com/Jiebristol) |

<img title="a title" alt="Alt text" src="/images/group3.jpg" width="522">
<br>

## 2. Introduction 
Our game is a take on the classic 'Snake' game called 'Survival Snake'. The overarching principle remains the same - the player's goal is to grow their snake in length by consuming food that appears on the map, whilst also avoiding collisions with the snake itself or the map's borders. But, our game expands upon these principles by incorporating elements of the first person shooter genre into our game. 
The player snake has a finite 'Venom' ability that allows you to destroy walls, collect food to grow your snake, and kill the enemy snakes that spawn into the game. The enemy snakes track the player snake around the map, and will kill the player snake and thus end the game if they manage to catch it. 
Another element we've added to Survival Snake is the creation of custom maps. We have designed 4 possible maps, 2 for each difficulty mode, with each map having its own unique wall placements. In all the maps the player has the ability to 'wrap around', exiting one side of the map to re-appear on the other side, thereby adding another layer to the player snake's movement possibilities. 
<br><br>


## 3. Requirements 


### Initial Paper Prototyping
When we first got together we brainstormed two possible initial ideas - an 'Endless Runner' game or a 'Survival Game'. In our first session we managed to successfully create paper prototypes for both of these ideas : 

**Game Idea 1 : Endless Runner**
<br>
[![](https://res.cloudinary.com/marcomontalbano/image/upload/v1707426687/video_to_markdown/images/youtube--oTml2CcK-2s-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://www.youtube.com/watch?v=oTml2CcK-2s "")

**Game Idea 2 : Survival Game**
<br>
[![](https://res.cloudinary.com/marcomontalbano/image/upload/v1707426766/video_to_markdown/images/youtube--akkWPsFFah0-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://www.youtube.com/watch?v=akkWPsFFah0 "")

However, as discussions continued we decided against pursuing either of these ideas further. The 'Endless Runner' idea seemed somewhat done to death, and we weren't sure how to implement a genuinely exciting and fun to play twist. As for the 'Survival Game' concept, whilst as a group we agreed that it would be a really fun game to create with a substantial amount of potential, we were concerned about the amount of time available to us. Instead, we decided to take some elements from both our initial thoughts - fighting an enemy 'mob' whilst managing resources + suriving for as long as possible whilst traversing a map - and applied them to a game we all knew and loved : Snake. 

**Game Idea 3 : Snake Game**
[![game](https://res.cloudinary.com/marcomontalbano/image/upload/v1713364450/video_to_markdown/images/youtube--BAkjjOerpcU-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://www.youtube.com/watch?v=BAkjjOerpcU&ab_channel=jiefang "game")

<br>
As a pre-cursor to feature implementation we sat down as a team and ran through the requirements stage of our game creation. This required us to consider the following factors : 

### Stakeholders
Player, markers, the development team. 

### User Stories
> "As a player, I want to play a game that gives me nostalgia with a new twist.”

> “As a player, I want to play a game that increases in difficulty over time to keep it interesting.”

> “As a player, I want to see my high scores on this game so that I can improve and try and beat them!”

> “As a player, I want to play a game which is easy to understand but still interesting and varied enough to keep me engaged.”

> “As a player, I want to be able to play a game with multiple difficulty settings so that I can get used to the game at an easier level before choosing more of a challenge".

> “As a player, I want to see a clear control scheme, so I understand exactly what I need to do."

> “As a player, I want to avoid enemy AI while playing, as it will be really cool to tackle this dynamic aspect of the game."

> “As a player, I want to be invested in my score or progress in the game, so that I enjoy playing it more!"

> “As a marker, I want to see a game with a clear twist, so it is clear that this is a novel game."
 
> “As a marker, I want to play this game for a brief period and understand all aspects of the game quickly so that I can judge it fairly.” 

### Use-Case Diagram

<img src='/images/use_case_diagram.png'/>


### Use-Case Specification
**Actors** - Player

**Description**

In Survival Snake the player controls a snake's movements, directing it to eat food so that it may grow whilst trying to survive for as long as possible. The player must avoid obstacles in the map in the form of walls and enemy snakes that track the player snake around the map. The player snake has a Venom ability that allows it to shoot venom at enemy snakes to kill them, whilst the enemy snakes will use  AI tracking to hunt the player snake across the map and attempt to kill it by colliding with it. 

**Preconditions**

The game is launched on a compatible device(Linux/Win/Mac).
The player is familiar with the game controls.

**Postconditions**

The game ends when the snake collides with a wall or an enemy.
The player's score is recorded and can be displayed.

**Basic Flow**

1. The player launches the game.
2. The game displays the main menu.
3. The player selects the "Start" option to begin the game.
4. The game generates a snake and places it on the game grid.
5. The player controls the snake's movement using the arrow keys.
6. As the game starts, food items and Venom powerups will appear on the map. 
7. The player navigates the snake towards the food items to make it grow.
8. Each time the snake eats a piece of food, its size increases.
9. The player can press the spacebar to shoot venom from from the snake's mouth, eliminating enemies in its path.
10. The player must navigate carefully to avoid collision with the map's walls. 
11. Enemies are introduced, and they start moving towards the snake's head, aiming to eliminate it.
12. The game continues as long as the snake avoids collision with walls and enemies.
13. When the snake collides with a wall, an enemy or itself, the game ends.
14. The player's score is recorded and saved for future reference.
15. The player is presented with the option to play again or exit the game.

**Alternate Flows**

If the player selects the "Exit" option from the main menu, the game will terminate, and the player will be returned to the device's home screen.

**Extensions**

(Optional) Worm mode: The player can activate this mode to change the visual appearance of the snake, without altering the core game mechanics.

### Our Inital Reflections

* Difficult to write user stories when the features of the game haven’t been fully clarified
  
* Difficult to work on tasks (e.g. create user stories, list stakeholders) independently, because these tasks depend on each other. Better for everyone to get together and do everything as a group
  
* Doing things as a group also gives people a sense of ownership and allows everyone to contribute to everything. Also makes sure we don’t miss anything or have blindspots
  
* Writing user stories / use cases can highlight areas of ambiguity that need to be clarified in the group, for example (in the use case specification), does the player use arrow keys or swipes to move the snake? What button does the player press to shoot venom?
  
* This task forces us to come up with the name of the game
  
* Task highlighted the need for an agreed workflow for collaborating on the repo (i.e. do we add everything in the README on main branch, or work on separate branches? Do we each have our own branch or dedicated “feature” branches?)
  
* So far we only have two personas in our user stories (player and marker). Does this mean we’re missing something? Is this because the user stories were written independently of the stakeholders list?
  
* Writing user stories can highlight that we want to measure subjective things like enjoyment and experience of nostalgia. This suggests that we need to find ways to measure subjective experience
  
* Use case diagram: 
  * Do we have any relationships other than “extends”?
  * Highlights ambiguity: does the snake die when its tail is cut off, or just shrink, or only die if it loses a certain amount of its tail 


As we narrowed down our 

<br>

## 4. Design 

### Design Challenges
* AI enemies that track the player snake around the map.
* Collision detection.
* Consuming food and growing the snake in length.
* Venom mechanic.
* Map design and difficulty modes.

### Class Diagram

<img src='/images/class_diagram.png'/>




## 5. Implementation
To do
Three areas of challenge :
1. AI Implementation for Enemy Snakes - why did we feel we needed this. What two bugs came up the most often when writing this bit of code? How did you solve them? How did we finally implement them? What kind of player feedback did we get for this feature, how did it change the direction in which our code went?
2. High Score Tracker - what were the challenges associated with incorporating this feature? What kind of player feedback did we get from it? 
3. Venom Mechanic - how integral this is for our game flow. 
<br>

## 6. Evaluation 
Qualitive Evaluation - need Chris to decipher his handwriting.
16.04

Focus Group - Need to transcribe this. 

Quantative Evluation - NASA TLX Scores 
Had a meeting with 5 other groups on 16.04 to collect data. 

Menu Pages Feedback - lots of issues with slider, everyone wants to click a strawberry. Tutorial page moved to being a pop up when the game starts. More clarity as to what food does. Menu bar in game feedback - giving venom a out of sign so you know how much you have, why it's limited to six. More clarity as to what your venom does. Adding points for killing enemies. Making pushable buttons more obvious. 
Game feedback - slower enemy snakes, less enemy snakes. Making easier mode easier and harder mode ramp up in difficulty. Cap on number of enemies. Adding points when killing enemies. 
Accessibility Feedback - transition to red-green colour blindness feature.
<br>

## 7. Process
* Kanban Board
* Weekly scrum meetings 
* Devlop branch and main branch
* Transfer from Java to Processing
* Everyone given little chunks to work on individually
* Software labs useful for testing other games and getting people to test our game
<br>

## 8. Conclusion 
To do

<br>

## Individual Contributions 

| Name             | Contribution | 
|------------------|--------------|
| Chris Kerr       | 1            | 
| Florence Rose    | 1            | 
| Josh Wierszycki  | 1            | 
| Ziyuan Lu        | 1            | 
| Alexander Fisher | 1            | 
| Jie Fang         | 1            | 
