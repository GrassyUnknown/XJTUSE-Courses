
import java.io.File;//needed for file input
import java.io.FileNotFoundException;
import java.util.Scanner;
public class SubMaxProduct {
    public static void main(String[] args) throws FileNotFoundException {
        String nums;
        int n;//n is the length of sub string
        int maxProduct= 0;
        int product;
        Scanner in=new Scanner(new File("in.txt"));
        Scanner sysin=new Scanner(System.in);
        nums=in.next();//file input
        n=sysin.nextInt();//n input
        for(int i=n-1;i<nums.length();i++){
            product=1;
            for(int j=0;j<n;j++){//Calculate each product
                product*=Integer.parseInt(nums.substring(i-j,i-j+1));
            }
            if(product>maxProduct){//If the result is bigger than the max, replace the max
                maxProduct=product;
            }
        }
        System.out.print(maxProduct);//output
    }
}
