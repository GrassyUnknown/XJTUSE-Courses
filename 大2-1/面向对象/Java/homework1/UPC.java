import java.util.Scanner;
public class UPC{
    public static void main(String[] args){
        long upcIn=0,temp=0;
        int evenSum=0,oddSum=0;
        int checkBit=-1;
        Scanner in = new Scanner(System.in);
        try{//"try...catch" to deal with invalid input
            upcIn=in.nextLong();//Scan the input
            if(upcIn>99999999999l){
                throw new Exception("Too big input");
            }
            //Sum the even bits and the odd bits
            temp=upcIn;
            for(int i=2;i<13;i++){
                if(i%2==1){
                    oddSum+=temp%10;
                }
                else{
                    evenSum+=temp%10;
                }
                temp/=10;
            }
            //Calculate the check bit
            for(int j=1;checkBit<0;j++){
                checkBit=10*j-3*evenSum-oddSum;
            }
            //Print the code
            System.out.printf("%011d%d",upcIn,checkBit);
        }catch(Exception e){
            System.out.print("Invalid input");
        }
    }
}
