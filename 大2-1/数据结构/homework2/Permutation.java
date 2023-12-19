import java.util.Scanner;

public class Permutation {
    private static final int MOVE = 1;
    private static final int OPERATION = 2;
    public static void main(String[] args){
        Scanner in = new Scanner(System.in);
        String input = in.next();
        permutationByRecursion(input.toCharArray(),0);
        System.out.println();
        permutationByNoRecursion(input.toCharArray());
        System.out.println();
        permutationVariant1(input.toCharArray(),0);
        System.out.println();
        permutationVariant2(input.toCharArray(),0,in.nextInt());
        System.out.println();
    }
    private static void swap(char[] array,int a,int b){
        char temp=array[a];
        array[a]=array[b];
        array[b]=temp;
    }
    private static void permutationByRecursion(char[] array,int k){
        if(array.length-1==k){
            for(int i=0;i< array.length;i++){
                System.out.print(array[i]);
            }
            System.out.print(" ");
        }
        for(int i=k;i<array.length;i++){
            swap(array,i,k);
            permutationByRecursion(array,k+1);
            swap(array,i,k);
        }
    }
    private static void permutationByNoRecursion(char[] array){
        AStack<Operation> aStack=new AStack<>(100);
        for(int i=array.length-1;i>=0;i--){
            aStack.push(new Operation(MOVE,0,i));
            aStack.push(new Operation(OPERATION,1,0));
            aStack.push(new Operation(MOVE,0,i));
        }
        while (!aStack.isEmpty()){
            Operation operation = aStack.pop();
            if(operation.getType()==MOVE){
                swap(array, operation.getIndex1(), operation.getIndex2());
            }
            else if(operation.getType()==OPERATION){
                if(operation.getIndex1()==array.length-1){//输出
                    for(int i=0;i< array.length;i++){
                        System.out.print(array[i]);
                    }
                    System.out.print(" ");
                }
                else {
                    for(int i=array.length-1;i>=operation.getIndex1();i--){
                        aStack.push(new Operation(MOVE,operation.getIndex1(),i));
                        aStack.push(new Operation(OPERATION, operation.getIndex1()+1, 0));
                        aStack.push(new Operation(MOVE, operation.getIndex1(), i));
                    }
                }
            }
        }
    }
    private static void permutationVariant1(char[] array,int k){
        if(array.length-1==k){
            for(int i=0;i< array.length;i++){
                System.out.print(array[i]);
            }
            System.out.print(" ");
            return;
        }
        for(int i=k;i<array.length;i++){
            if(array[i]!=array[k]||i==k) {//只有二者不相等或二者下标相同时调用
                swap(array, i, k);
                permutationVariant1(array, k + 1);
                swap(array, i, k);
            }
        }
    }
    private static void permutationVariant2(char[] array,int k,int m){
        if(m==0){
            for(int i=0;i<k;i++){
                System.out.print(array[i]);
            }
            System.out.print(" ");
            return;
        }
        for(int i=k;i<array.length;i++){
                swap(array, i, k);
                permutationVariant2(array, k + 1,m-1);
                swap(array, i, k);
        }
    }
}
