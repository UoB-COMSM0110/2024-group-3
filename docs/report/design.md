
<div align="center">
    <img src="https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/c75424b0-11bb-4a1e-b1ab-8a0418648ae3" alt="Screenshot 2024-04-23 at 20 28 44" style="width: 60%;">
</div>


# 4. Design 

[To do: introduce design section]

# Table of Contents
- [System Architecture](#system-architecture)
- [Class Diagram](#class-diagram)
- [Behavioural Diagrams](#behavioural-diagrams)

--- 

### System Architecture 

Our game in Processing is built upon a modular architecture that facilitates flexibility, extensibility and interpretability. The key design choice behind the entire architecture of the game was creating a grid of cells which are accessible by coordinates (x,y) and is implemented in the GridCell class. Below is an overview of the mapping of grid coordinates to the window. 

<blockquote> Grid is 45 rows by 100 cols where each cell has an index of (x, y) with the following mapping:
     
(0,0) --> top left

(99, 0) --> top right

(44, 0) --> bottom left

(99, 44) --> bottom right </blockquote>

This design choice matches the key idea and mechanism of the orginal snake game. The abstraction that the gridCell class provides in terms of not having to manage indivdual objects dimentions and mapping to window was invaluable to the development of all the components/objects in the game. All objects present in the game are formed as an aggregation of 1 or more gridCells. This architecture enabled walls to be formed and mapped to the sreen, as well as a snake, enemy snakes, and a variety of consumables. In addition it enabled for a relatively trivial manner of introducing the dynamics to the gameplay.

### Entry Point and Control Flow

The core system architecture of Processing apps revolve around the setup() and draw() and update() methods, which control the temporal sequence of method calls. Main.pde is the entry point to the game and is the root controller. Complimenting this structure and enabling the main control flow to be observable from Main.pde the main gameplay conroller 'GameScreen' also has methods setup() and update() which are then called in Main.pde. This structuring massively redcuced the size of Main.pde and increased interpretability. GameScreen thus handles the update logic for the objects it manages however the control is handed back to Main.pde via the need of one method call GameScreen.update(). 

### Modularity and Object-Oriented Design

### Breakdown of Selected Classes

#### Wall

#### Consumables

#### Abstract Snake

---

### Class Diagram

This class diagram was created before we implemented the game, as part of the design process:

<div align="center">
    <img src="/images/class_diagram.png" alt="Early class diagram">
    <p><em>Early class diagram</em></p>
</div>

This class diagram was created once the game was complete, and shows the final game design: 

<div align="center">
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

