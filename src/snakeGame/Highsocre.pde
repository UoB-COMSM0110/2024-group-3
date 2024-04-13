import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
public class Highsocre {
  Scoredata[] infor=new Scoredata[num_highsocre];

  public Highsocre() {
    String datafile = sketchPath("../mapsCSV/highsocre.csv");
    String line = "";
    try (BufferedReader br = new BufferedReader(new FileReader(datafile))) {
      for (int i = 0; i < num_highsocre; i++) {
        line = br.readLine();
        String[] data = line.split(",");
        infor[i] = new Scoredata(data[0], Integer.parseInt(data[1]));
      }
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
  public void compare(Scoredata s) {
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
    for (int i = num_highsocre-1; i >pos; i--) {
      infor[i]=infor[i-1];
    }
    infor[pos]=s;
  }
}
