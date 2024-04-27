# 6. Evaluation 
As part of our game development process we engaged in both quantitative and qualitative analysis. This was a really rewarding experience, allowing us to get user feedback in an actionable form that could direct the development of our game as well as identify bugs that we could iron out. 

## Qualitative Analysis
On 11.03 we used our lab session to obtain some initial Think-Aloud feedback for our game. Florence divided this feedback into 4 categories; positive, negative, potential features and bugs. We chose the Think-Aloud method because of how quick it was to perform, and because we timed it for a lab session we had a sizable quantity of participants to perform it with. 

### Positive Feedback
> Participant 1 - "Shooting venom is really fun."

> Participant 2 - "Visually it's really cool."

> Participant 2 - (On dying with zero score) "why am I not on the high scoreboard."

> Participant 3 - "I really like the tutorial page."

> Participant 4 - "Movement is really clean."

> Participant 5 - "I like this."

> Participant 9 - "I like the feature and the bar."

> Participant 7 - "Well it's addictive."


### Negative Feedback
> Participant 3 - "It's not obvious to me what's harder about the hard mode."

No changes, as we received a lot of comments that the hard mode was too hard and decided that increasing the difficulty may be counterproductive.

> Participant 2 - "What are the pink things, are they venom?."

More information on the help page and signage on the menu bar in the game.

A lot of users tried to click the strawberry on the menu page to toggle the differences

<div align="center">
    <img src="https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/042cd1eb-8023-46d2-baa3-39ccf6c82fd6" alt="Animated GIF example">
    <p><em>Difficulty Slider</em></p>
</div>

Added a button next to the difficulty slider to better indicate where the user should click.

> Participant 4 - "Easy mode could be dialled down in terms of speed."

> Participant 7 - "Easy seems pretty hard already."

> Participant 5 - "It's already pretty tough."

> Participant 3 - "Easy is enough of a challenge."

Reduced the framerate on easy mode.

> Participant 1 - "The Snake title looks like it might be a button too."

Added lines around the buttons on the main menu page to make it clear what was clickable.

### Potential Features
> Participant 1 - "Could you implement a colour-blindness feature?"

We strongly considered this, as having a setting that could toggle the colour of the enemy snakes and user snake would be a really satisfying way to advocate for functionality within the game. Unfortunately, we ran out of time to implement this feature. 

> Participant 3 - "Having your previous score visible on the game screen would make things more competitive"

Added a high score tracking for the difficulty mode to the game screen.

> Participant 2 - "Mac users may prefer to use the WASD keys rather than the keyboard"
We added this feature so that the player snake's movement responds to both the arrow keys and WASD keys.

> Participant 1 - "You could load up help on game start or call it 'how to play', not help"

Added a pop up tutorial page that triggers after the user presses 'play'. 

> Participant 7 - "For high score does it matter if it's easy or hard - shouldn't it be separate?"

Tweaked the high score tracker so that it differentiates between hard and easy mode. Separate lists for each difficulty.

### Bugs
> "When you're on hard, when you fire venom, it doesn't react quick enough".

Fixed this bug. 

> User went through the wall without it disappearing.

Fixed this bug.
<br><br>

## Heuristic Analysis
On 12.04 we conducted a heuristic analysis, which touched upon a lot of the same issues we identified during the Think-Aloud evaluation. Chris and Florence performed this evaluation on members from 5 other groups, with 8 participants in total. Ideally we would have had 10 > participants, but time constraints prevented this. Florence subsequently analysed this data and compiled the below table. She gave each issue its own unique ID and asking our evaluators how they would rate its impact, frequency and persistence, and then added these values together to give the overall severity of the problem. 

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



## Quantitative Analysis
On the 14.04 Chris and Florence put together a meeting between our group and 5 other groups. Combined we all took turns playing one another's games and recording feedback for both the quantitative and qualitative testing components of our code. For the quantitative testing we used the NASA TLX questionnaire to make sure that our game's two difficulty modes varied substantially in ease of play :

### Easy Mode
body
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
Using these results Florence was able to calculate the perceived difference in workload. First she used the formula  _(x - 1) * 5_ [where __x__ = score)  to calculate the participant's perceived demand for each dimension. Using these scores she then calculated the total perceived workload for each participant, using the formula  _(sum of each dimension) / 6_  to calculate their overall rating, as given in the final column of both tables. 

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

She then used the Wilcoxon Signed Rank Test to find the calculated W test statistic. _N_ was 10 as that was the number of participants, and she set the significance at 0.05. Since the test had 10 participants the W test statistic generated would need to be less than 8 for there to be a statistically significant difference in our game's difficulty levels. 

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