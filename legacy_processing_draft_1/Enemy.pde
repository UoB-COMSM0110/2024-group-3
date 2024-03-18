// Waiting for wall implementation to add wall avoidance

class Enemy extends GridCell {
    PVector target;

    public Enemy(PApplet game, int[] gridLocation) {
        super(game, gridLocation);
        // Target is centre of the screen for now
        this.target = new PVector(Main.COLS / 2, Main.ROWS / 2);
    }

    public void update() {
        int[] currentLocation = getGridLocation();
        PVector currentPosition = new PVector(currentLocation[0], currentLocation[1]);
        float minDistance = Float.MAX_VALUE;
        PVector bestMove = currentPosition;
        
        // Check all 8 directions
        int[][] directions = {
            {0, 1}, {1, 0}, {0, -1}, {-1, 0}, // U, D, L, R
            {1, 1}, {-1, -1}, {1, -1}, {-1, 1} // diags
        };

        for (int[] direction : directions) {
            PVector newPosition = new PVector(currentPosition.x + direction[0], currentPosition.y + direction[1]);
            float newDistance = PVector.dist(newPosition, target);
            
            if (newDistance < minDistance) {
                minDistance = newDistance;
                bestMove = newPosition;
            }
        }

        if (!bestMove.equals(currentPosition)) {
            setGridLocation((int)bestMove.x, (int)bestMove.y);
        }
    }

    @Override
    protected void fillGridCell(PApplet game, int[] gridLocation, int colour) {
        super.fillGridCell(game, gridLocation, game.color(255, 0, 0));
    }

    private void setGridLocation(int x, int y) {
        int[] loc = getGridLocation();
        loc[0] = x;
        loc[1] = y;
    }
}
