class WallObject {
    private final ArrayList<WallCell> wallCells;

    public WallObject(PApplet game, ArrayList<int[]> wallCellLocations) {
        this.wallCells = new ArrayList<>();

        for (int[] cellLocation : wallCellLocations) {
            this.wallCells.add(new WallCell(game, cellLocation, game.color(128, 128, 128)));
        }
    }
}
