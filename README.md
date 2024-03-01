# Overview of Software Engineering - Group 3

## Our Team
<table align="left">
  <thead>
    <tr>
      <th style="text-align:center">Name</th>
      <th style="text-align:center">Email</th>
      <th style="text-align:center">GitHub Account</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:center">Chris Kerr</td>
      <td style="text-align:center"><a href="mailto:th23780@bristol.ac.uk">th23780@bristol.ac.uk</a></td>
      <td style="text-align:center"><a href="https://github.com/chriskerrc">@chriskerrc</a></td>
    </tr>
    <tr>
      <td style="text-align:center">Florence Rose</td>
      <td style="text-align:center"><a href="mailto:xd23758@bristol.ac.uk">xd23758@bristol.ac.uk</a></td>
      <td style="text-align:center"><a href="https://github.com/frose2024">@frose2024</a></td>
    </tr>
    <tr>
      <td style="text-align:center">Josh Wierszycki</td>
      <td style="text-align:center"><a href="mailto:el20063@bristol.ac.uk">el20063@bristol.ac.uk</a></td>
      <td style="text-align:center"><a href="https://github.com/JWierszycki">@JWierszycki</a></td>
    </tr>
    <tr>
      <td style="text-align:center">Ziyuan Lu</td>
      <td style="text-align:center"><a href="mailto:py23518@bristol.ac.uk">py23518@bristol.ac.uk</a></td>
      <td style="text-align:center"><a href="https://github.com/LzYzL">@LzYzL</a></td>
    </tr>
    <tr>
      <td style="text-align:center">Alexander Fisher</td>
      <td style="text-align:center"><a href="mailto:af17918@bristol.ac.uk">af17918@bristol.ac.uk</a></td>
      <td style="text-align:center"><a href="https://github.com/alexandermfisher">@alexandermfisher</a></td>
    </tr>
    <tr>
      <td style="text-align:center">Jie Fang</td>
      <td style="text-align:center"><a href="mailto:yh23030@bristol.ac.uk">yh23030@bristol.ac.uk</a></td>
      <td style="text-align:center"><a href="https://github.com/Jiebristol">@Jiebristol</a></td>
    </tr>
  </tbody>
</table>

<img src="/group3.jpg" width="522">

<br>

## Game Brief
<br><br>

<br><br>
## Initial Paper Prototyping

**Game Idea 1 : Endless Runner**
<br>
[![](https://res.cloudinary.com/marcomontalbano/image/upload/v1707426687/video_to_markdown/images/youtube--oTml2CcK-2s-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://www.youtube.com/watch?v=oTml2CcK-2s "")

**Game Idea 2 : Survival Game**
<br>
[![](https://res.cloudinary.com/marcomontalbano/image/upload/v1707426766/video_to_markdown/images/youtube--akkWPsFFah0-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://www.youtube.com/watch?v=akkWPsFFah0 "")


## Design Challenges


<br><br>
## External Development Factors
### Stakeholders


<br><br>
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

<br>

### Use-Case Diagram

<img src='/Diagram.png'/>

<br>

### Use-Case Specification
**Actors** - Player

<br>

**Description :**

Survival Snake is a game where the player controls a snake and aims to survive for as long as possible. The snake gets bigger as it eats food, and the player can shoot venom out of the snake's mouth. The game includes moving walls and enemies that pose a threat to the snake. The player can also encircle an enemy to kill them.
<br><br>

**Preconditions :**

The game is launched on a compatible device(Linux/Win/Mac).
The player is familiar with the game controls.
<br><br>

**Postconditions :**

The game ends when the snake collides with a wall or an enemy.
The player's score is recorded and can be displayed.
<br><br>

**Basic Flow :**
1. The player launches the game.
2. The game displays the main menu.
3. The player selects the "Start" option to begin the game.
4. The game generates a snake and places it on the game grid.
5. The player controls the snake's movement using the arrow keys or swipe gestures.
6. As the game starts, food items appear randomly on the grid.
7. The player navigates the snake towards the food items to make it grow.
8. Each time the snake eats a piece of food, its size increases.
9. The player can press a certain key or button to shoot venom from the snake's mouth, eliminating enemies in its path.
10. Moving walls appear periodically, creating obstacles for the snake. The player must navigate carefully to avoid collision.
11. Enemies are introduced, and they start moving towards the snake's head, aiming to eliminate it. Some enemies may prioritize attacking the head, while others may attempt to cut off the snake's tail.
12. The player can encircle an enemy by moving the snake around it. This results in the enemy being killed and removed from the game grid.
13. The game continues as long as the snake avoids collision with walls and enemies.
14. When the snake collides with a wall or an enemy, the game ends.
15. The player's score is recorded and saved for future reference.
16. The player is presented with the option to play again or exit the game.

<br><br>
**Alternate Flow :**

If the player selects the "Exit" option from the main menu, the game will terminate, and the player will be returned to the device's home screen.
<br><br>

**Extension :**

(Optional) Worm mode: The player can activate this mode to change the visual appearance of the snake, without altering the core game mechanics.
<br><br>

## Case Diagram

<br><br>
## Week 2, Our Reflections

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

