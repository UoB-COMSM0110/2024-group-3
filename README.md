<div align="center">
    <img src="https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/c75424b0-11bb-4a1e-b1ab-8a0418648ae3" alt="Screenshot 2024-04-23 at 20 28 44" style="width: 100%;">
</div>


# Table of Contents
- [1. Team](#1-team)
- [2. Introduction](#2-introduction)
- [3. Requirements](#3-requirements)
- [4. Design](#4-design)
- [5. Implementation](#5-implementation)
- [6. Evaluation](#6-evaluation)
- [7. Process](#7-process)
- [8. Conclusion](#8-conclusion)
- [9. Installation](#9-installation)


# 1. Team

<div align="center">
    <img title="a title" alt="Alt text" src="/images/group3.jpg" width="522">
    <p><em>The team</em></p>
</div>

<div align="center">
 
| Name             | Role                           | Email                                                 | GitHub Account                                            |
|------------------|--------------------------------|-------------------------------------------------------|-----------------------------------------------------------|
| Chris Kerr       | Project Manager / Developer    | [th23780@bristol.ac.uk](mailto:th23780@bristol.ac.uk) | [@chriskerrc](https://github.com/chriskerrc)              |
| Florence Rose    | Map Designer / Tester          | [xd23758@bristol.ac.uk](mailto:xd23758@bristol.ac.uk) | [@frose2024](https://github.com/frose2024)                |
| Josh Wierszycki  | Lead Developer                 | [el20063@bristol.ac.uk](mailto:el20063@bristol.ac.uk) | [@JWierszycki](https://github.com/JWierszycki)            |
| Ziyuan Lu        | UI Developer                   | [py23518@bristol.ac.uk](mailto:py23518@bristol.ac.uk) | [@LzYzL](https://github.com/LzYzL)                        |
| Alexander Fisher | Lead Developer                 | [af17918@bristol.ac.uk](mailto:af17918@bristol.ac.uk) | [@alexandermfisher](https://github.com/alexandermfisher)  |
| Jie Fang         | UI Developer                   | [yh23030@bristol.ac.uk](mailto:yh23030@bristol.ac.uk) | [@Jiebristol](https://github.com/Jiebristol)              |
</div>

<br>

# 2. Introduction 
Our game is a take on the classic 'Snake' game called 'Survival Snake'. The overarching principle remains the same - the player's goal is to grow their snake in length by consuming food that appears on the map, whilst also avoiding collisions with the snake itself or the map's borders. But, our game expands upon these principles by incorporating elements of the first-person shooter genre into our game. 

The player snake has a finite 'Venom' ability that allows you to destroy walls, collect food to grow your snake and kill the enemy snakes that spawn into the game. The enemy snakes track the player snake around the map and will kill the player snake, thus ending the game if they manage to catch it. 

Another element we've added to Survival Snake is the creation of custom maps. We have designed 4 possible maps, 2 for each difficulty mode, with each map having unique wall placements. In all the maps the player has the ability to 'wrap around', exiting one side of the map to re-appear on the other side, thereby adding another layer to the player snake's movement possibilities. 

<div align="center">
    <img width="800" alt="Screenshot 2024-04-18 at 17 15 10" src="https://github.com/UoB-COMSM0110/2024-group-3/assets/157360200/25c9f921-3caf-48fd-a917-f5de49dd245b">
    <p><em>Survival Snake, Main Page</em></p>
</div>


<br>



---

# Requirements

Refer to our [requirement document](/docs/report/requirements.md) to see our:
- Initial Paper Prototyping
- Use-Case Diagram
- User-Case Specification

---

# Design

Refer to our [design document](/docs/report/design.md) to see our:
- System Architecture
- Class Diagram
- Behavioural Diagrams

---

# Implementation

Refer to our [implementation document](/docs/report/implementation.md) to see our:
- Challenge 1 - Enemy Snake Pathfinding
- Challenge 2 - Venom Mechanic
- Challenge 3 - High Score Tracker

---

# Evaluation

Refer to our [evaluation document](/docs/report/evaluation.md) to see our:
- Qualitative Analysis
- Heuristic Analysis
- Quantitative Analysis

---

# Process

Refer to our [process document](/docs/report/process.md) to see our:
- TODO: Add subcategories

---

# 8. Conclusion 
TODO:

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

---

# 9. Installation

1. Download processing from the following link: [download here](https://processing.org/download).
      This downloads the graphical library and integrated development environment that the game will run on.

1. Download and extract the following ZIP file: [Survival Sanke]()   TODO ADD LINK WHEN GAME IS FINISHED.
      This downloads the game program.

1. Run Processing and then open the game by clicking: **File -> Open -> {root_dir_game}/src/snakeGame/main.pde** 

1. Install the following libraries using the package manager accessed by clicking **Tools -> Import Libra... -> Manage Libraries...**
      - Sound

1. Click the 'Play' button located to the top-left of the ide window to run the game.

