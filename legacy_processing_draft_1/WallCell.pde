class WallCell extends GridCell {
    public WallCell(PApplet game, int[] gridLocation, int colour) {
            super(game, gridLocation, colour);
	        }
		    public void draw() {
		            fillGridCell(getGame(), getGridLocation(), getColour());
			        }
				}