
<div align="center">
    <img width="800" src="../../images/titleDes.png" alt="Screenshot 2024-04-23 at 20 28 44" style="width: 100%;">
</div>

<br> 

# 4. Design
In this section, we will outline the design process for our game. With comprehensive and clearly defined requirements in place, the design phase involved crafting the system architecture and modeling the core objects and their relationships in preparation for the implementation stage.

# Table of Contents
- [System Architecture](#system-architecture)
- [Class Diagram](#class-diagram)
- [Behavioural Diagrams](#behavioural-diagrams)

---

## System Architecture 

Our game in Processing is built on a modular architecture that facilitates flexibility, extensibility and interpretability. The key design choice behind the game was creating a grid of cells which are accessible by coordinates (x,y) and are implemented by the `GridCell` class.

<blockquote> Grid is 45 rows by 100 cols where each cell has an index of (x, y) with the following mapping:
     
(0,0) --> top left

(99, 0) --> top right

(44, 0) --> bottom left

(99, 44) --> bottom right </blockquote>

This design choice matches the key idea and mechanisms of the original "Snake". The abstraction that the `gridCell` class provides means that we don't have to handle indivdual object's dimensions and their mapping to the game screen. All objects in the game are formed as an aggregation of one or more `gridCells`. This architecture enables static objects (i.e. walls and consumables) to be made. It also allows for a simple way to introduce the gameplay dynamics.

## Modularity and Object-Oriented Design

Our game is structured in a typical object-oriented way with separate classes used to define each of the game enitites. Our use of abstract classes has resulted in 'DRY' code that is more interpretable, maintaninable, and flexible. This modularity is evident in the [class diagram](#final-class-diagram) with the use of containers which wrap around related classes. Below we've broken down the key classes of our game:


## Breakdown of Selected Classes

### Wall

Walls are implemented as an aggregation of `WallCells`. This idea is implemented as an array of `WallCells` where a `WallCell` inherits from `GridCell`. A simplified version of the Wall class is shown below. The `addWallCell` and `removeWallCell` methods enable construction of walls and removal of individual cells during gameplay without destroying the entire wall/object.

```
public class Wall {
    private ArrayList<WallCell> wallCells;
    private int colour;
  
    public Wall(int colour) {}
    
    public void addWallCell(int x, int y) {}
    
    public void removeWallCell(PVector location) {}
    
    public void renderWall() {}
}
```


### Consumables

Consumables are implemented as an aggregation of one or more grid cells. Our game includes two subclasses `Food` and `Powerup`. These abstract classes are realised in concrete implementations `Melon`, `Banana`, `Apple`, and `VenomRefiller`. This layered abstraction, beginning at `GridCell`,  allowed for incremental development due to the independence of objects. The structures and architecture are designed for the quick development of features that can inherit parts of existing code, thus reducing the code required to add new features. If we added an additional powerup it would build off the existing structures by directly inheriting from `PowerUp`.

### Abstract Snake

The abstract class is the parent class for all the snakes in the game. It's similar to previously discussed classes because `Snake` is also an aggregation of `SnakeCells`. The dynamic mechanic is implemented by removing one cell and adding another. The natural data structure for this behaviour is a linked list where `SnakeCells` are added to one end and removed from the other, as shown in the code below. 

```
abstract class AbstractSnake {
      protected LinkedList<SnakeCell> snakeCells;
      protected PVector velocity;
      protected int colour;
      protected GameScreen game;
    
      public AbstractSnake(GameScreen game, int colour) {
        this.snakeCells = new LinkedList<>();
        this.velocity = new PVector(0, -1); 
        this.colour = colour;
        this.game = game;
      }
}
```

## Overview of Collision Detection

The objects discussed above form game entities, but they alone do not create a playable game. To bring the components together a 'controller' class has been implemented, called `GameScreen`. `GameScreen` combines these objects to create gameplay by managing interactions, updates, and rendering of game entities. This class instantiates all available entities in the game via setup and constructor methods, and then manages the update of the game state between frames. Below is a snippet from `GameScreen` which highlights the entities it manages:

```
private Object[][] mapGridObjectData;
      
//inanimate objects
private ArrayList<Wall> walls;
private Apple apple;
private Banana banana;
private Melon melon;
private VenomRefiller venomRefillerTwo;

//dynamic objects:
private Snake snake;
private ArrayList<EnemySnake> enemySnakes;
private ArrayList<Venom> venom;

```
The attribute `mapGridObjectData` is integral for our game's collision detection. It's a 2D array of object references that encapsulates the current game state. For each iteration, dynamic objects are mapped to their new grid locations. This provides an efficient "lookup" to determine which object occupies a specific grid cell. If the player snake moves into a wall, this collision is detected and the game ends. Alternatively, if the player snake moves into a `grid cell` containing a consumable, the appropriate action is taken to increase body length, score, or venom available, and the game continues. The aggregation of cells to make the objects allows each grid to be tracked, while still letting objects interact. This means that if an object is an aggregation of multiple cells, then each cell references the same object. This ensures that if venom kills an enemy snake, the whole snake dies and not just the cell where the collision was detected. 

To illustrate collision detection, a snippet of code from the `Snake` class is shown below. Note the conditionals that check for the presence of an object in its new head location. If the `gridCell` contains a `Wall` or the `Snake` itself, then the game state is over. The consumables food and powerup are also handled in the same way.

```
// gets curerent object that occupies where the new snake head position will be
// if cell is empty null will be returned indicating no collision

Object gridObject = game.getMapGridObjectData(headPosition);

if (gridObject instanceof Wall || gridObject instanceof Snake && !isSnakeCellWithinFirstThree(headPosition)) {
    gameState = GameState.OVER;
    return;
}

SnakeCell newHead = new SnakeCell(headPosition, colour);
snakeCells.add(newHead);
game.setMapGridObjectData(headPosition, this);

if (gridObject instanceof Food ) {
    // when snake eats food, move the food
    // add new head but dont remove tail: snake grows when it eats
}

if (hasVenomHitFood == true) {
    // return early to add new head but not remove tail: snake grows when it eats (via venom)
}

if (gridObject instanceof Powerup) {
    //move the powerup
    //replenish venom
    // add new head and remove tail: snake doesn't grow
}

```
<br>

---

### Class Diagram

This class diagram was created before we implemented the game, as part of the design process:

<div align="center">
    <img src="/images/class_diagram.png" alt="Early class diagram">
    <p><em>Early class diagram</em></p>
</div>

This class diagram was created once the game was complete, and shows the final game design: 
For a larger version of this diagram click [here](https://raw.githubusercontent.com/UoB-COMSM0110/2024-group-3/8d870d0a43221233c5dd77c008d40066b09cd375/images/class_diagram_final.svg).

<div id=final-class-diagram align="center">
    <img src="/images/class_diagram_final.svg" alt="Final Class Diagram">
    <p><em>Final Class Diagram</em></p>
</div>
  
The final version of the class diagram provides a solid foundation for understanding the objects and architecture of the game. By modeling the objects and their relationships, we were able to organize our ideas and divide the work. All game entities inherit from the `GridCell` class and are utilized in the `GameScreen`. The `GUI` class is segregated from the game logic and is positioned towards the right of the diagram. It is evident that our original diagram encapsulates the core ideas present in the final diagram, indicating a consistent and well-conceived design process. 

---

### Behavioural diagrams 

In contrast to the class diagram, the following sequence diagram provides a dynamic view of the looping events in the game. The Game Screen contains all the game objects, so it exists for the duration of the game, alongside the player snake. Other objects like wall cells, enemy snakes, food and powerups come and go as they are destroyed, killed or consumed. The game screen and the player snake initiate and receive the majority of the messages. This diagram demonsrates the complexity of collision detection in the game. 

<div align="center">
    <img src="/images/sequence_diagram.png" alt="Sequence diagram">
    <p><em>Sequence diagram</em></p>
</div>

