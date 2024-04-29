
<div align="center">
    <img width="800" src="../../images/titleDes.png" alt="Screenshot 2024-04-23 at 20 28 44" style="width: 100%;">
</div>
<br>

[To do: introduce design section]



# Table of Contents
- [System Architecture](#system-architecture)
- [Class Diagram](#class-diagram)
- [Behavioural Diagrams](#behavioural-diagrams)

---

## System Architecture 

Our game in Processing is built upon a modular architecture that facilitates flexibility, extensibility and interpretability. The key design choice behind the game was creating a grid of cells which are accessible by coordinates (x,y) and are implemented by the 'GridCell' class. Below is an overview of the mapping of grid coordinates to the window. 

<blockquote> Grid is 45 rows by 100 cols where each cell has an index of (x, y) with the following mapping:
     
(0,0) --> top left

(99, 0) --> top right

(44, 0) --> bottom left

(99, 44) --> bottom right </blockquote>

This choice matches the key idea and mechanism of the OG Snake game. The abstraction that the 'gridCell' class provides means that we don't have to handle indivdual object's dimensions, and mapping to window underpins all the components/objects in the game. All objects in the game are formed as an aggregation of 1 or more 'gridCells'. This architecture enables static objects (i.e. walls and consumables) to be made. It also allows for a relatively simple manner of introducing the dynamics of the gameplay.

## Entry Point and Control Flow

The core system architecture of Processing revolves around the 'setup()' and 'draw()' methods. These control the temporal sequence of method calls. 'Main.pde' is the root controller and entry point to the game. The main gameplay conroller 'GameScreen' has the methods setup() and update(), which are then called in 'Main.pde' and fascilitate the observation of 'Main.pde's' control flow. This structuring redcuced the size of 'Main.pde' and increased interpretability. 'GameScreen' thus handles the update logic for the objects it manages, however the control is handed back to 'Main.pde' via the method call 'GameScreen.update()'. 

## Modularity and Object-Oriented Design

Our game is structured in a typical object-oriented fashion with separate classes used to define each of the game enitites. Our use of bstract classes has resulted in 'DRY' code that is more interpretable, maintaninable, and flexible. This modularity is evident and in the [class diagram](#final-class-diagram) with the use of containers which wrap around related classes. Below is a brief outline of some key classes which form the main object/entites in the game. 


## Breakdown of Selected Classes

### Wall

Walls are implemented as an aggregation of 'WallCells'. This idea is imlpemented as an array of 'WallCells' where a 'WallCell' inherits from 'GridCell'. A stripped version of the Wall class is shown below to demonstrate the implementation. You can also see that there are 'addWallCell' and 'removeWallCell' methods. These allow the construction of walls as well as the removal of individual cells during gameplay without completely destroying the entire wall/object.

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

Consumables are implemented as an aggregation of 1 or more grid cells. The current version of the game includes two subclasses **Food** and **Powerup**. These are abstract and are realised in concrete implementations **Melon**, **Banana**, **Apple**, and **VenomRefiller**. This layered abstraction beginning at 'GridCell' has allowed for incremental development due to the independence of objects. In addition, the structures and architecture is designed for the quick development of features that can inherit large parts of existing code, thus reducing the code required to add new features. If an additional powerup were to be added it would piggy back off the existing structures by directly inheriting from 'PowerUp'.

### Abstract Snake

The abstract class is the parent class for the snakes in the game. It's similar to the previously discussed classes because 'snake' is also an aggregation of 'SnakeCells' (which is a child of 'GridCell'). The dynamic mechanic is implemented by removing one cell and adding another (assuming the snake hasn't eaten food and isn't in a state of growth). The natural data structure for this behaviour is a linked list where 'SnakeCells' are added to one end and removed from the other, as shown in the code below. 

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

The objects discussed above form the entities in the game, but they alone do not create a playable game. To bring the components together a 'controller' class has been implemented in 'GameScreen'. 'GameScreen' combines and utilises these objects to create gameplay by managing interactions, updates, and rendering of game entities. This class instantiates all available entities in the game via setup and constructor methods, and then manages the update of the game state between each frame. Below is a snippet from 'GameScreen' which highlights the entities it manages that form the game.

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
The attribute 'mapGridObjectData' is integral for our game's collision detection. This is a 2D array of object references which encapsulates the current state of the game. For each iteration of the game dynamic objects are mapped to their new grid locations. This provides an efficient "lookup" to determine which object occupies a specific grid. If the player snake moves into a wall, this collision is detected and the game will end. Alternatively, if the player snake moves into a grid cell containing a consumable, the appropriate action will be taken to increase body length, score, or venom available, and the game will continue. The aggregation of cells to make the objects is a key component that allows each grid to be tracked, whilst still have objects interact with others as a whole. This means that if an object is an aggregation of multiple cells, then each cell references the same object. This ensures that if an enemy snake is killed by the venom the whole enemy snake dies and not just the first cell, or the cell where the collision was detected.

To illustrate this design/implementation of collision detection, a snippet of code from the Snake class is shown below. Note the conditionals which check for the presence of an object in its new head location. If the 'gridCell' contains a 'Wall' or the 'Snake' itself, then the game state is over in accordance with the rules of the game. The consumables food and powerup are also handled in the same way.

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

<div id=final-class-diagram align="center">
    <img src="/images/class_diagram_final.svg" alt="Final Class Diagram">
    <p><em>Final Class Diagram</em></p>
</div>

Compare and contrast...

---

### Behavioural diagrams 

[Add text introducing the sequence diagram]

<div align="center">
    <img src="/images/sequence_diagram.png" alt="Sequence diagram">
    <p><em>Sequence diagram</em></p>
</div>

