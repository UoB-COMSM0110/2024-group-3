import java.io.*;
public class Highsocre {
  Scoredata[] infor=new Scoredata[num_highsocre];
  String datafile = sketchPath("../mapsCSV/highsocre.csv");
  public Highsocre() {
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

    try (BufferedWriter bw = new BufferedWriter(new FileWriter(datafile))) {
      for (int i = 0; i <num_highsocre; i++) {
        bw.write(infor[i].name+","+infor[i].score+"\n");
      }
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
}
