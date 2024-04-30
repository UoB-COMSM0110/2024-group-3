import java.io.*;

//Manages a list of top scores stored in a file.
public class HighScore {
    // Array of ScoreData to store top four highest score
    ScoreData[] infor = new ScoreData[highScoreNumber];
    String datafile;

    public HighScore(String s) {
        datafile = sketchPath(s);
        String line = "";

        // Open the data file to read high scores.
        try (BufferedReader br = new BufferedReader(new FileReader(datafile))) {
            for (int i = 0; i < highScoreNumber; i++) {
                line = br.readLine();
                String[] data = line.split(",");
                infor[i] = new ScoreData(data[0], Integer.parseInt(data[1]));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Compare a new score with existing high scores.
    public void compare(ScoreData s) {
        int pos = -1;
        // Find the position where the new score should be inserted.
        for (int i = 0; i < highScoreNumber; i++) {
            if (s.score > infor[i].score) {
                pos = i;
                break;
            }
        }

        // New score does not qualify as a high score
        if (pos == -1) {
            return;
        }

        // Shift lower scores down in the array to make space for the new high score.
        for (int i = highScoreNumber - 1; i > pos; i--) {
            infor[i] = infor[i - 1];
        }

        // Insert the new score
        infor[pos] = s;

        // Updated high scores
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(datafile))) {
            for (int i = 0; i < highScoreNumber; i++) {
                bw.write(infor[i].name + "," + infor[i].score + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
