import java.io.*;
public class HighScore {
  ScoreData[] infor=new ScoreData[highScoreNumber];
  String datafile;
  public HighScore(String s) {
    datafile = sketchPath(s);
    String line = "";
    try (BufferedReader br = new BufferedReader(new FileReader(datafile))) {
      for (int i = 0; i < highScoreNumber; i++) {
        line = br.readLine();
        String[] data = line.split(",");
        infor[i] = new ScoreData(data[0], Integer.parseInt(data[1]));
      }
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
  public void compare(ScoreData s) {
    int pos = -1;
    for (int i = 0; i < 4; i++) {
      if (s.score>infor[i].score) {
        pos=i;
        break;
      }
    }
    if (pos == -1) {
      return;
    }
    for (int i = highScoreNumber-1; i >pos; i--) {
      infor[i]=infor[i-1];
    }
    infor[pos]=s;

    try (BufferedWriter bw = new BufferedWriter(new FileWriter(datafile))) {
      for (int i = 0; i < highScoreNumber; i++) {
        bw.write(infor[i].name+","+infor[i].score+"\n");
      }
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
}
