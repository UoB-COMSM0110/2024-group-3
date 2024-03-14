public void makeWalls() {
    Random rand = new Random();
        int numberOfWalls = 25; // Number of walls
	    final int BORDER_SIZE = 3;
	        int menuBarRows = (int) Math.ceil(40.0 / CELL_SIZE) + BORDER_SIZE; // Menu bar height and top border
		    int maxHorizontalLength = COLS - 2 * BORDER_SIZE; // Max length for horizontal walls considering border
		        int maxVerticalLength = ROWS - menuBarRows - BORDER_SIZE; // Max length for vertical walls considering border

    for (int i = 0; i < numberOfWalls; i++) {
            boolean isHorizontal = rand.nextBoolean();
	            int maxLength = isHorizontal ? maxHorizontalLength : maxVerticalLength;
		            int minLength = 3; // Minimum wall length
			            maxLength = Math.min(maxLength, 10); // Maximum wall length

        int length = rand.nextInt(maxLength - minLength + 1) + minLength; // Length between 3 and 10, respecting maximum length

        int startX, startY;

        if (isHorizontal) {
	            startX = rand.nextInt(COLS - length - BORDER_SIZE) + BORDER_SIZE;
		                startY = rand.nextInt(ROWS - 2 * BORDER_SIZE - menuBarRows) + menuBarRows;
				        } else {
					            startX = rand.nextInt(COLS - 2 * BORDER_SIZE) + BORDER_SIZE;
						                startY = rand.nextInt(ROWS - length - menuBarRows - BORDER_SIZE) + menuBarRows;
								        }

        ArrayList<int[]> wallCellLocations = new ArrayList<>();

        for (int j = 0; j < length; j++) {
	            int[] cellLocation = isHorizontal ? new int[]{startX + j, startY} : new int[]{startX, startY + j};
		                wallCellLocations.add(cellLocation);
				        }

        WallObject wall = new WallObject(this, wallCellLocations);
	        walls.add(wall);
		    }
		    }