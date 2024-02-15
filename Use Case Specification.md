## Use Case Specification

Actors

- Player

Description
- Survival Snake is a game where the player controls a snake and aims to survive for as long as possible. The snake gets bigger as it eats food, and the player can shoot venom out of the snake's mouth. The game includes moving walls and enemies that pose a threat to the snake. The player can also encircle an enemy to kill them.

Preconditions

- The game is launched on a compatible device(Linux/Win/Mac).
- The player is familiar with the game controls.

Postconditions

- The game ends when the snake collides with a wall or an enemy.
- The player's score is recorded and can be displayed.

Basic Flow

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

Alternate Flows

- If the player selects the "Exit" option from the main menu, the game will terminate, and the player will be returned to the device's home screen.

Extensions

- (Optional) Worm mode: The player can activate this mode to change the visual appearance of the snake, without altering the core game mechanics.
