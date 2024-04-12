public class Highsocre {
    Scoredata[] infor=new Scoredata[num_highsocre];

    public Highsocre() {
        infor[0]=new Scoredata("Shadow",5);
        infor[1]=new Scoredata("Raven",4);
        infor[2]=new Scoredata("Phoenix",3);
        infor[3]=new Scoredata("Wolf",2);
    }
    public void compare(Scoredata s){
        int pos = -1;
        for (int i = 0; i < 4; i++) {
            if (s.score>infor[i].score){
                pos=i;
                break;
            }
        }
        if (pos == -1) {
            return;
        }
        for (int i = num_highsocre-1; i >pos ; i--) {
            infor[i]=infor[i-1];
        }
        infor[pos]=s;
    }
}
