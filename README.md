# Overview of Software Engineering - Group 3

# 1. Team

<p align="center">
   <img title="a title" alt="Alt text" src="/images/group3.jpg" width="522">
</p>

<div align="center">
 
| Name             | Email                     | GitHub Account       |
|------------------|---------------------------|----------------------|
| Chris Kerr       | [th23780@bristol.ac.uk](mailto:th23780@bristol.ac.uk) | [@chriskerrc](https://github.com/chriskerrc) |
| Florence Rose    | [xd23758@bristol.ac.uk](mailto:xd23758@bristol.ac.uk) | [@frose2024](https://github.com/frose2024) |
| Josh Wierszycki  | [el20063@bristol.ac.uk](mailto:el20063@bristol.ac.uk) | [@JWierszycki](https://github.com/JWierszycki) |
| Ziyuan Lu        | [py23518@bristol.ac.uk](mailto:py23518@bristol.ac.uk) | [@LzYzL](https://github.com/LzYzL) |
| Alexander Fisher | [af17918@bristol.ac.uk](mailto:af17918@bristol.ac.uk) | [@alexandermfisher](https://github.com/alexandermfisher) |
| Jie Fang         | [yh23030@bristol.ac.uk](mailto:yh23030@bristol.ac.uk) | [@Jiebristol](https://github.com/Jiebristol) |
</div>

<br>

# 2. Introduction 
Our game is a take on the classic 'Snake' game called 'Survival Snake'. The overarching principle remains the same - the player's goal is to grow their snake in length by consuming food that appears on the map, whilst also avoiding collisions with the snake itself or the map's borders. But, our game expands upon these principles by incorporating elements of the first-person shooter genre into our game. 

The player snake has a finite 'Venom' ability that allows you to destroy walls, collect food to grow your snake and kill the enemy snakes that spawn into the game. The enemy snakes track the player snake around the map and will kill the player snake, thus ending the game if they manage to catch it. 

Another element we've added to Survival Snake is the creation of custom maps. We have designed 4 possible maps, 2 for each difficulty mode, with each map having unique wall placements. In all the maps the player has the ability to 'wrap around', exiting one side of the map to re-appear on the other side, thereby adding another layer to the player snake's movement possibilities. 

<p align="center">
<img width="800" alt="Screenshot 2024-04-18 at 17 15 10" src="https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/25c9f921-3caf-48fd-a917-f5de49dd245b">
</p>

<br>

# 3. Requirements 


### Initial Paper Prototyping
When we first got together we brainstormed two possible initial ideas - an 'Endless Runner' game or a 'Survival Game'. In our first session we managed to successfully create paper prototypes for both of these ideas : 

**Game Idea 1 : Endless Runner**
<br>
[![](https://res.cloudinary.com/marcomontalbano/image/upload/v1707426687/video_to_markdown/images/youtube--oTml2CcK-2s-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://www.youtube.com/watch?v=oTml2CcK-2s "")

**Game Idea 2 : Survival Game**
<br>
[![](https://res.cloudinary.com/marcomontalbano/image/upload/v1707426766/video_to_markdown/images/youtube--akkWPsFFah0-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://www.youtube.com/watch?v=akkWPsFFah0 "")

**Game Idea 3 : Snake Game**

However, as discussions continued we decided against pursuing either of these ideas further. The 'Endless Runner' idea seemed somewhat done to death, and we weren't sure how to implement a genuinely exciting and fun to play twist. As for the 'Survival Game' concept, whilst as a group we agreed that it would be a really fun game to create with a substantial amount of potential, we were concerned about the amount of time available to us. Instead, we decided to take some elements from both our initial thoughts - fighting an enemy 'mob' whilst managing resources + suriving for as long as possible whilst traversing a map - and applied them to a game we all knew and loved : Snake. 

[![game](https://res.cloudinary.com/marcomontalbano/image/upload/v1713364450/video_to_markdown/images/youtube--BAkjjOerpcU-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://www.youtube.com/watch?v=BAkjjOerpcU&ab_channel=jiefang "game")

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

> “As a player, I want to avoid enemy snakes while playing, as it will be really cool to tackle this dynamic aspect of the game."

> “As a player, I want to be invested in my score or progress in the game, so that I enjoy playing it more!"

> “As a marker, I want to see a game with a clear twist, so it is clear that this is a novel game."
 
> “As a marker, I want to play this game for a brief period and understand all aspects of the game quickly so that I can judge it fairly.” 

### Use-Case Diagram

<img src='/images/use_case_diagram.png'/>


### Use-Case Specification
**Actors** - Player

**Description**

In Survival Snake the player controls a snake's movements, directing it to eat food so that it may grow whilst trying to survive for as long as possible. The player must avoid obstacles on the map in the form of walls and enemy snakes that track the player snake around the map. The player snake has a venom ability that allows it to shoot venom at enemy snakes to kill them, whilst the enemy snakes will use pathfinding to hunt the player snake across the map and attempt to kill it by colliding with it. 

**Preconditions**

The game is launched on a compatible device(Linux/Win/Mac).
The player is familiar with the game controls.

**Postconditions**

The game ends when the user snake collides with a wall or an enemy.
The player's score is recorded and can be displayed.

**Basic Flow**
1. The player launches the game.
2. The game displays the main menu page.
3. The player choose which difficulty they wish to play on.
4. The player selects the 'play' button to start the game.
5. The game randomy decides between which two maps it will launch with.
6. The map loads and the player snake is placed on the grid.
7. The player controls the snake's movements using the arrow keys or WASD keys.
8. The player navigates towards food, and can either collide with it or use its venom to consume the food.
9. The player snake grows in size whenever food is consumed.
10. The player can use the spacebar to shoot venom from the snake's head.
11. The player must navigate carefully to avoid collision with the map's walls. 
12. Enemies are introduced, and they start moving towards the player's snake.
13. The game continues as long as the snake avoids collision with walls and enemies.
14. When the snake collides with a wall, an enemy or itself, the game ends.
15. The player's score is recorded and saved for future reference.
16. The player can enter their name to save their score.
17. The player returns to the main menu page. 
    
**Alternate Flows**
Need to do better me thinks. 

<br>

# 4. Design 

### Design Challenges
System architecture, class diagrams, behavioural diagrams. 

### Class Diagram

<img src='/images/class_diagram.png'/>




# 5. Implementation
During our game's implementation there were some features that we were certain we wanted to include in our game. From these we identified three specific areas of challenge; the enemy snake pathfinding, the venom mechanic and the highscore tracker.  


### Enemy Snake Pathfinding
We knew from the start that we needed the enemy snakes (ESs) to pose a real challenge to the player. This meant creating ESs that responded to in-game obstacles, tracked the player snake around the map and moved towards the player snake in a way that felt logical and intuitive to the player. The ESs use pathfinding to track the player snake around the map by finding the square that reduces the distance to the player snake's head the most.

Originally the ESs weren't a part of the map grid that we track our game's objects on (walls, food, venom etc.), and this made managing the interactions of the ESs with our game's objects really tricky. As a consequence we tweaked the ES implemention to make use of the framework Alex created for the game grid, allowing us to impose limitations on the ESs movements so they couldn't move through walls, food, their own bodies or one another. This second attempt led to problems as well, causing the ESs to freeze in place when they had no square to occupy. Josh created a hierarchy, where the ESs find the best (closet to player snake) free cell that it could move to, and if there were no free cells then the ESs would move identify the best cell by whether it was occupied by another snake, and then food or consumables. The ESs are designed to avoid moving over these things wherever possible, but they will if there is absolutely no other move available to them.

![Pathfinding-ezgif com-resize](https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/ea6279d2-a9bc-449d-9309-801cd57508de)

   
### Venom Mechanic
The venom mechanic was one of the foundational parts of our game. Overall the implementation process was relatively smooth sailing, and the greatest challenges were with edge cases dealing with the borders of the map and walls. Our evaluation process was helpful here, as we found that the increased play time by a lot of different users was great at identifiying bugs and potential issues. 

The venom mechanic's functionality was written primarily via the 'Venom' class. This class is responsible for modelling the venom projectile that the snake uses to interact with the environment and to target enemies. Initally venom was only going to be used offensively, but during development we decided that it would be more fun for the player if venom could be used to collect food and destroy walls as well. The venom class makes use of a PVector to determine the venom's direction and velocity, with its starting position determined by the location of the player snake's head. This information is handled by the class' constructor, which creates the initial set of venom cells and positions them in the game grid. We created a 'handleCollusion(PVector position)' method that manages the effects when venom collides with other game objects like walls or enemy snakes, and an 'updateGridData()' method that update's the game grid to reflect the current position of venom cells.

![Venom-ezgif com-resize-2](https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/edb750d7-9c50-4273-9b2b-aa43c29a884d)



### High Score Tracker
This was added via two classes; a 'ScoreData' class and a 'HighScore' class. The 'ScoreData' class is a simple data structure that holds the player's score and name. During runtime, the constructor of this class would initialise this data with the values provided by the user when they saved their score at the end of the game. 

The 'HighScore' class was designed to manage a list of the top scores in the form of a .csv file that we stored in our Map folder. This was done through an array that would store all saved high scores, and a constructor that read the saved scores in the .csv file. Then, the 'compare' method takes the given values from the 'ScoreData' class and compares them against the scores already saved in the array. This would be looped through until all the array's cells were checked, and if the method found an instance where the 'ScoreData' value was greater than the value saved in the array it would replace it. At this point, the updated list of scores is written back to the .csv file.

Initially, we did this using just one list of high scores for the game, but after user feedback, we decided to create two separate lists for each difficulty mode. We felt this made the high scores more of a goal for the player, and by including the high score in the menu bar of the game as well we felt it was worked better as a goal for the players. 

<p align="center">
<img width="800" alt="Screenshot 2024-04-18 at 17 15 01" src="https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/c4903af2-1361-4acd-a28d-e42ea46a0cbd">
</p>

<p align="center">
<img width="800" alt="Screenshot 2024-04-18 at 17 14 58" src="https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/9e85e4f6-b3b2-4789-805c-f22b36ebd97f">
</p>

As our game developed we were continously checking for bugs and adding new features. The UI was created in photoshop by Jie and Ziyuan, who did an outstanding job at both creating the game's overall aesthetic and menu functionality. Our tutuorial page was originally behind a button on the main menu called 'help', but after some user feedback we decided to create a pop up tutorial page that would launch when the game started and could be navigated away from by pressing any key. We felt that this was a good way to increase the visibility of the game's help information wihtout interrupting the flow of starting and playing the game. 

<p align="center">
<img width="800" alt="Screenshot 2024-04-19 at 13 44 02" src="https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/67139394-8530-494c-8383-b91b041c8ea2">
</p>

<br>

# 6. Evaluation 
As part of our game development process we engaged in both quantitative and qualitative analysis. This was a really rewarding experience, allowing us to get user feedback in an actionable form that could direct the development of our game as well as identify bugs that we could iron out. 

## Qualitative Analysis
On 11.03 we used our lab session to obtain some initial Think-Aloud feedback for our game. We then repeated this process on 14.04, and the below data is an amalgamation of both of these sessions' feedback and the steps they directed us to take :

### Positive Feedback
> "Shooting venom is really fun."

> "Visually it's really cool."

> On dying with zero score - "why am I not on the high scoreboard."

> "I really like the tutorial page."

> "Movement is really clean."

> "I like this."

> "I like the feature and the bar."

> "Well it's addictive."


### Negative Feedback
> "It's not obvious to me what's harder about the hard mode."

No changes, as we received a lot of comments that the hard mode was too hard and decided that increasing the difficulty may be counterproductive.

> "What are the pink things, are they venom?."

More information on the help page and signage on the menu bar in the game.

A lot of users tried to click the strawberry on the menu page to toggle the differences

![ezgif-7-a072d64fbc](https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/042cd1eb-8023-46d2-baa3-39ccf6c82fd6)

Added a button next to the difficulty slider to better indicate where the user should click.

> "Easy mode could be dialled down in terms of speed."

> "Easy seems pretty hard already."

> "It's already pretty tough."

> "Easy is enough of a challenge."

Reduced the framerate on easy mode.

> "The Snake title looks like it might be a button too."

Added lines around the buttons on the main menu page to make it clear what was clickable.

### Potential Features
> "Could you implement a colour-blindness feature?"

We strongly considered this, as having a setting that could toggle the colour of the enemy snakes and user snake would be a really satisfying way to advocate for functionality within the game. Unfortunately, we ran out of time to implement this feature. 

> "Having your previous score visible on the game screen would make things more competitive"

Added a high score tracking for the difficulty mode to the game screen.

> "Mac users may prefer to use the WASD keys rather than the keyboard"
We added this feature so that the player snake's movement responds to both the arrow keys and WASD keys.

> "You could load up help on game start or call it 'how to play', not help"

Added a pop up tutorial page that triggers after the user presses 'play'. 

> "For high score does it matter if it's easy or hard - shouldn't it be separate?"

Tweaked the high score tracker so that it differentiates between hard and easy mode. Separate lists for each difficulty.

### Bugs
> "When you're on hard, when you fire venom, it doesn't react quick enough".

Fixed this bug. 

> User went through the wall without it disappearing.

Fixed this bug.
<br><br>

## Heuristic Analysis
We conducted a heuristic analysis as well, which touched upon a lot of the same issues we identified during the Think-Aloud evaluation. We compiled this data in the below table by, giving each issue its own unique ID and asking our participants how they would rate its impact, frequency and persistence. We then added these values together to give us the overall severity of the problem. 

| ID | Game Component | Heuristic | Description of Issue | Impact (0-3) | Frequency (0-3) | Persistence (0-3) | Overall Severity (0-9) | Recommendations |
|----|----------------|-----------|----------------------|--------------|-----------------|--------------------|------------------------|-----------------|
| 1  | Game Modes     | Visibility of System Status | Unclear difficulty distinction in game modes. | 2 | 2 | 2 | 6 | No changes made; feedback on increased difficulty was noted as counterproductive.
| 2  | Help Menu      | Recognition Rather Than Recall | Confusion about game elements (e.g., pink things). | 2 | 2 | 3 | 7 | Added detailed descriptions and visual indicators on the help page and menu bar.
| 3  | Main Menu      | User Control and Freedom | Difficulty selection was confusing; users mistook a decoration for a button. | 3 | 3 | 3 | 9 | Added a clear, labeled button next to the difficulty slider.
| 4  | Easy Mode      | Flexibility and Efficiency of Use | Easy mode perceived as too challenging. | 3 | 3 | 3 | 9 | Reduced framerate in easy mode to adjust game speed. | Various |
| 5  | UI: Main Menu  | Consistency and Standards | Misleading UI elements that looked clickable but were not. | 2 | 3 | 2 | 7 | Enhanced UI clarity with distinct lines around buttons.
| 6  | Accessibility  | Aesthetic and Minimalist Design | Lack of a color-blindness feature. | 1 | 1 | 3 | 5 | Planned but not implemented due to time constraints. | Various |
| 7  | Game Screen    | Help Users Recognize, Diagnose, and Recover from Errors | No visible tracking for previous scores on game screen. | 2 | 3 | 3 | 8 | Added high score tracking visible on the game screen.
| 8  | High Scores    | Consistency and Standards | High score tracking did not differentiate between game difficulties. | 3 | 2 | 3 | 8 | Modified high score system to differentiate between easy and hard modes.
| 9  | Gameplay: Hard Mode | Visibility of System Status | Slow reaction when firing venom in hard mode. | 3 | 2 | 3 | 8 | Improved responsiveness of venom firing in hard mode. | 
| 10 | Gameplay       | Error Prevention | Players could move through walls due to a bug. | 3 | 1 | 1 | 5 | Fixed collision detection to prevent going through walls.|



## Quantative Evluation
On the 14.04 we put together a meeting between our group and 5 other groups. Combined we all took turns playing one another's games and recording feedback for both the quantitative and qualitative testing components of our code. For the quantitative testing we used the NASA TLX questionnaire to record feedback in 6 dimensions for both the easy and hard modes of the game : 

### Easy Mode

| Participant # | Mental Demand | Physical Demand | Temporal Demand | Performance | Effort | Frustration |
|-------------  |---------------|---------------|-------------------|-------------|--------|-------------|
|        1      |       25      |       5       |      70           |    45       |   55   |      55     |
|        2      |       70      |      10       |      30           |    60       |   70   |      70     |
|        3      |       60      |      45       |      55           |    45       |   65   |      65     |
|        4      |       25      |      45       |      50           |    55       |   45   |      45     |
|        5      |       30      |      35       |      20           |    55       |   15   |      15     |
|        6      |       65      |      75       |      70           |    60       |   35   |      35     |
|        7      |       65      |      85       |      30           |    75       |   80   |      80     |
|        8      |       35      |      35       |      70           |    35       |   5    |      5      |
|        9      |       70      |      80       |      65           |    60       |   55   |      55     |
|       10      |       15      |      15       |      30           |    20       |   20   |      10     |
----------------------------------------------------------------------------------------------------------

### Hard Mode

| Participant # | Mental Demand | Physical Demand | Temporal Demand | Performance | Effort | Frustration |
|-------------  |---------------|---------------|-------------------|-------------|--------|-------------|
|        1      |       45      |       5       |      80           |    75       |   60   |      65     |
|        2      |       10      |      10       |      70           |    35       |   60   |      70     |
|        3      |       10      |      10       |      70           |    85       |   15   |      75     |
|        4      |       45      |      45       |      70           |    70       |   70   |      70     |
|        5      |       25      |      25       |      65           |    45       |   85   |      45     |
|        6      |       45      |      45       |      95           |    90       |   70   |      40     |
|        7      |      100      |     100       |     100           |    85       |   100  |      95     |
|        8      |       5       |      5        |      65           |    55       |   55   |      0      |
|        9      |       45      |      45       |      90           |    75       |   80   |      65     |
|       10      |       50      |      40       |      65           |    65       |   60   |      60     |
----------------------------------------------------------------------------------------------------------

### Interpreting the Results
Using these results we are able to calculate the perceived difference in workload. First we used the formula  _(x - 1) * 5_ [where __x__ = score)  to calculate the participant's perceived demand for each dimension. Using these scores we can calculate the total perceived workload for each participant, using the formula  _(sum of each dimension) / 6_  to calculate their overall rating, as given in the final column of both tables. 

Comparing the two sets of data gave us this information :

<div align="center">
 
| Participant # | Easy Workload | Hard Workload | Difference |
|---------------|---------------|---------------|------------|
|       1       |      45       |      55       |    -10     |
|       2       |      49       |      53       |    -4      |
|       3       |      46       |      58       |    -12     |    
|       4       |      43       |      62       |    -19     |
|       5       |      26       |      56       |    -30     |
|       6       |      55       |      69       |    -14     |
|       7       |      72       |      94       |    -22     |
|       8       |      30       |      40       |    -10     |
|       9       |      61       |      73       |    -12     |  
|       10      |      18       |      57       |    -39     |
---------------------------------------------------------------
</div>

With this data we used the Wilcoxon Signed Rank Test to find the calculated W test statistic. _N_ was 10 as that was the number of participants, and we set the significance at 0.05. Since we had 10 participants the W test statistic generated would need to be less than 8 for there to be a statistically significant difference in our game's difficulty levels. 

<div align="center">
 
|  Difference | Rank | Signed Rank |
|-------------|------|-------------|
|     -4      |  1   |     -1      |
|     -10     |  2   |     -2      |
|     -10     |  3   |     -3      |
|     -12     |  4   |     -4      |
|     -12     |  5   |     -5      |
|     -14     |  6   |     -6      |
|     -19     |  7   |     -7      |
|     -22     |  8   |     -8      |
|     -30     |  9   |     -9      |
|     -39     |  10  |     -10     |
-----------------------------------
</div>

Ranks 2,3 and 4,5 have the same value differences. Fortunately, because they are of the same sign, this doesn't impact the test's results. The sum of our positive ranks is 0 and the sum of our negative ranks is 55, with the W test statistic coming out as 0. Since this is well below the maximum value of 8 as specified above, we can say with confidence that there is a statistically significant difference in our easy and hard difficulty modes. 

### Testing
Black Box
White Box

<br>

# 7. Process
As a group, we've come away from this project feeling satisfied and proud of our team's communication and cohesiveness. 

Our communication has overall been stellar. We made a group chat using WhatsApp during the first week of this term, and it has proven invaluable for organising our time and sharing ideas. Being able to share media with one another, discuss feedback and identify goals via a platform that allows virtually instantaneous communication has been invaluable. However, face-to-face meetings were also integral. Our lab sessions on Monday were very helpful for this, partially in how they facilitated discussion with other groups, but also in the opportunity they gave to plan approximately 1-2 other face-to-face meetings each week. In these meetings we tended to adopt a scrum/stand-up style approach, with Alex often taking the role of the scrum leader. We discussed as a group how our personal areas of code were progressing, and if there were any features we wanted to suggest exploring. Depending on our respective schedules we'd then try to work on our respective parts of the code together in the labs. This was helpful because it meant we could show one another the areas of challenging/interesting code in person, as it can be somewhat tricky to discuss coding issues without being able to see the code in question. On a few occasions we took advantage of Teams' video call feature to meet face-to-face virtually if a team member was unable to make it to the labs that day. 

An initial snag we did encounter in our project was the transition from using IntelliJ and Java rather than the Processing IDE. In the beginning we thought that IntelliJ's increased functionality, specifically in areas such as code quality and testing, would prove it to be advantageous over Processing. However, after discussion with other groups and our module leads our group concluded that Processing would better serve the game's development. Fortunately, we weren't too far along in our code's lifespan when we made this decision, so the actual amount of code we had to translate from one environment to another wasn't too arduous. The aesthetic and user interface for our game was created through a combination of Photoshop and Processing, a task which Ziyuan headed up and executed wonderfully. 

As a whole, we found using GitHub to be relatively straightforward. Our team encountered some instances of merge conflicts that we had to solve, but an early decision to split our repository into two branches - Main and Develop - allowed us to stagger the rate at which code was pushed to our Main branch. Uncompleted/potentially buggy features would be limited to the Develop branch, ensuring that the Main branch stayed free of broken or uncompleted code. GitHub did provide us with an integral part of our development process, namely the Kanban Board. We found our Kanban Board to be incredibly helpful because it functioned as simultaneously an accessible to-do list, planning tool, and way to dispense the workload. Chris fulfilled the role of project manager in this department, adding tasks to the Kanban Board and assigning them to members of the team as needed.

<p align="center">
<img width="800" alt="Screenshot 2024-04-20 at 13 31 26" src="https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/7ec558fb-076f-49cf-88c2-913c3a56122c">
</p>


Our team also created a Git Convention documentation that detailed the acceptable way for our commits to be structured. It required that our commits be formatted __"[type]:[title] [body] [footer]__ . This encouraged us to be specific with our commit messages, ensuring that the relevant information as to what the new/altered code did was contained within the message itself. The use of a <type> system was particularly helpful in categorising our commits, ensuring that our repo has a very coherent and simple commit history that can understood and searched through with ease. 

We would also like to mention the map creating software that Alex wrote for our game. Using Processing Alex created a piece of code that allows you to create and save maps for our game in a .csv format. The user draws maps onto the canvas using the mouse, and increments the map counter for each wall they create. Once their map is created it can be named and saved, with the .csv suffix added automatically by the program. We store the created maps in a relevant folder in our game code, and they can subsequently loaded into the game with ease, with in-game walls being placed in the same locations as chosen during the map creation process. This allowed us to create unique maps with ease, thereby helping us to differentiate between the easy and difficult modes of our game in a way that the player can immediately appreciate. 
<p align="center">
<img width="800" alt="Screenshot 2024-04-20 at 13 44 42" src="https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/976cc2db-7692-4488-8f1b-0bdbb3de2bad">
</p>

<p align="center">
  <img width="430" alt="Screenshot 2024-04-20 at 13 47 16" src="https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/c39480e2-4e99-4599-9540-12094ded20f1">
</p>



# 8. Conclusion 
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
