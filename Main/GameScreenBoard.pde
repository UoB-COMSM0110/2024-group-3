class GameScreenBoard extends ScreenPanel {
  Enemy enemy;
  GenerateFood foodGenerator;
    // Constructor to initialize position and size
    public GameScreenBoard(PApplet game, float x, float y, float width, float height) {
        super(game, x, y, width, height);
        
        int[] enemyStartLocation = new int[]{Main.COLS - 1, 0};
        enemy = new Enemy(game, enemyStartLocation);
        foodGenerator = new GenerateFood(game);
    }

@Override
    public void update() {
      enemy.update();
    }

@Override
    public void draw() {
        game.pushMatrix();
        game.translate(x, y);
        game.fill(80);
        game.rect(0, 0, width, height);
        game.fill(60);
        drawGridLines();
        makeWalls();
        foodGenerator.displayFood(); 
        enemy.fillGridCell(game, enemy.getGridLocation(), game.color(255, 0, 0));
        game.popMatrix();
    }

    private void drawGridLines() {
        game.stroke(100);

        // Draw vertical lines
        for (int i = 0; i <= Main.COLS; i++) {
            float x = i * GridCell.cellSize;
            game.line(x, 0, x, game.height);
        }

        // Draw horizontal lines
        for (int j = 0; j <= Main.ROWS; j++) {
            float y = j * GridCell.cellSize;
            game.line(0, y, game.width, y);
        }
    }

    private void makeWalls() {
        ArrayList<int[]> wallCellLocations = new ArrayList<>();
        wallCellLocations.add(new int[]{0, 0});
        wallCellLocations.add(new int[]{0, 1});
        wallCellLocations.add(new int[]{1, 1});
        wallCellLocations.add(new int[]{1, 2});
        WallObject wall = new WallObject(game, wallCellLocations);
    }
}
