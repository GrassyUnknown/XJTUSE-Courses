import java.util.Random;
public class MonteCarloSimulation {
    public static void main(String[] args){
        Random r=new Random();
        double x,y;
        int timesInArea=0,times=100000;
        for(int i=0;i<times;i++){
            x=r.nextDouble()*2-1;
            y=r.nextDouble()*2-1;//Generate random x,y
            //Area 1
            if(x<0){
                timesInArea++;
            }
            //Area 3
            else if(x>0 && y>0 && x+y<1){
                timesInArea++;
            }
        }
        System.out.printf("%.2f%%",(float)timesInArea/(float)times*100);
    }
}
