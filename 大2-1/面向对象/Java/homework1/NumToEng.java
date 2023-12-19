import java.util.Scanner;
public class NumToEng {
    public static final String[] engNum = {
            "", "one ", "two ", "three ", "four ", "five ", "six ", "seven ", "eight ", "nine ",
            "ten ", "eleven ", "twelve ", "thirteen ", "fourteen ", "fifteen ", "sixteen ", "seventeen ", "eighteen ", "nineteen ",
            "twenty ", "", "", "", "", "", "", "", "", "",
            "thirty ", "", "", "", "", "", "", "", "", "",
            "forty ", "", "", "", "", "", "", "", "", "",
            "fifty ", "", "", "", "", "", "", "", "", "",
            "sixty ", "", "", "", "", "", "", "", "", "",
            "seventy ", "", "", "", "", "", "", "", "", "",
            "eighty ", "", "", "", "", "", "", "", "", "",
            "ninety " };//words which could be used
    public static final String[] engUnit = {"million ","thousand ",""};
    public static void main(String[] args){
        int num;
        int[] num3=new int[3];//num3 is used to storage numbers cut in pieces
        StringBuilder eng=new StringBuilder();//eng is used to storage eng results
        Scanner in = new Scanner(System.in);
        num=in.nextInt();//input
        if(num<0){//add "negative" to negatives
            eng.append("negative ");
            num=-num;
        }
        if(num==0){//add "zero" to 0
            eng.append("zero");
        }
        //cut number into pieces
        num3[0]=num/1000000;
        num3[1]=(num/1000)%1000;
        num3[2]=num%1000;
        //deal with the pieces
        for(int i=0;i<3;i++){
            if(num3[i]!=0){
                if(num3[i]/100!=0){
                    eng.append(engNum[num3[i]/100]).append("hundred ");//add hundreds in each piece
                }
                if(num3[i]%100<20){
                    eng.append(engNum[num3[i]%100]);//<20
                }
                else{
                    eng.append(engNum[num3[i]%100-num3[i]%10]).append(engNum[num3[i]%10]);//>20,tens first then ones
                }
                eng.append(engUnit[i]);//add the unit of piece
            }
        }
        System.out.print(eng);//output
    }
}
