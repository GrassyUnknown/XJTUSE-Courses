import java.io.File;//needed for file input
import java.util.Scanner;
public class Histogram {
    public static void main(String[] args) throws Exception {
        String[] nameOfGroup={" 0 -  9","10 - 19","20 - 29","30 - 39","40 - 49","50 - 59","60 - 69","70 - 79","80 - 89","90 -100"};
        int[] numOfGroup=new int[11];//Storage how many elements each group has
        Scanner in=new Scanner(new File("HistogramIn.txt"));
        while(in.hasNext()){
            numOfGroup[in.nextInt()/10]++;//Scan the data and divide into groups
        }
        numOfGroup[9]+=numOfGroup[10];//When data is 100,it adds to numOfGroup[10]
        //print row histogram
        for(int i=0;i<10;i++){
            System.out.printf("%s:",nameOfGroup[i]);//Print name
            for(int j=0;j<numOfGroup[i];j++) {
                System.out.print("*");//Print "*"
            }
            System.out.println();
        }
        //print column histogram
        for(int j=getMax(numOfGroup);j>0;j--){
            System.out.print("  ");
            for(int k=0;k<10;k++){
                if(numOfGroup[k]>=j){//Confirm the printing for each group
                    System.out.print("*");
                }
                else{
                    System.out.print(" ");
                }
                System.out.print("     ");
            }
            System.out.println();
        }
        System.out.print("0-9  10-19 20-29 30-39 40-49 50-59 60-69 70-79 80-89 90-100");
    }
    public static int getMax(int[] array){
        int max=0;
        for(int i=0;i<10;i++){
            if(array[i]>max){
                max=array[i];
            }
        }
        return max;
    }
}