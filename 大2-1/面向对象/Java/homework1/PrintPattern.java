import java.util.Scanner;
public class PrintPattern {
    public static void main(String[] args) {
        String type;
        int size;
        Scanner in = new Scanner(System.in);
        type = in.next();//scan type
        size = in.nextInt();//scan size
        char[] charByType = switch (type) {//decide char output in positions
            case "a" -> new char[]{'#', ' ', ' ' };
            case "b" -> new char[]{' ', '#', ' ' };
            case "c" -> new char[]{' ', ' ', '#' };
            case "d" -> new char[]{' ', '#', '#' };
            case "e" -> new char[]{'#', '#', '#' };
            default->new char[]{' ', ' ', ' ' };
        };
        //First line:
        for (int i = 1; i < size; i++) {
            System.out.print("# ");
        }
        System.out.println();
        //Middle line:
        for (int row = 2; row < size - 1; row++) {
            System.out.print(charByType[0]);
            for (int i = 1; i < Math.min(2*row-2, 2*(size-row-1)); i++) {
                System.out.print(" ");
            }
            if(row - 1 != size - row - 1){//normal
                if(2*row-2<2*(size-row-1)){
                    System.out.print(charByType[1]);
                }
                else{
                    System.out.print(charByType[2]);
                }
                for (int i = Math.min(2*row-2, 2*(size-row-1)) + 1; i < Math.max(2*row-2, 2*(size-row-1)); i++) {
                    System.out.print(" ");
                }
                if(2*row-2<2*(size-row-1)){
                    System.out.print(charByType[2]);
                }
                else{
                    System.out.print(charByType[1]);
                }
            }
            else{//position of charByType[1]=position of charByType[2]
                if(charByType[2]=='#'||charByType[1]=='#'){
                    System.out.print('#');
                }
                else{
                    System.out.print(' ');
                }
            }
            for (int i = Math.max(2*row-2, 2*(size-row-1)) + 1; i < 2*size - 4; i++) {
                System.out.print(" ");
            }
            System.out.print(charByType[0]);
            System.out.println();
        }
        //Last line:
        for (int i = 1; i < size; i++) {
            System.out.print("# ");
        }
    }
}