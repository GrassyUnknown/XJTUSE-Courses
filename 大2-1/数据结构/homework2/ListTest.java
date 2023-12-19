import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
public class ListTest {
    public static void main(String[] args) throws FileNotFoundException {
        List<Character> aList = new LinkList<>();
        Scanner test=new Scanner(new File("list_testcase.txt"));
        Scanner result=new Scanner(new File("list_result.txt"));
        while(test.hasNextLine()){
            String[] operates=test.nextLine().split(" ");
            for (String operate : operates) {
                switch (operate) {
                    case "-"-> aList.remove();
                    case "#"-> aList.gotoBeginning();
                    case "*"-> aList.gotoEnd();
                    case ">"-> aList.gotoNext();
                    case "<"-> aList.gotoPrev();
                    case "~"-> aList.clear();
                    default-> {
                        switch (operate.charAt(0)) {
                            case '+' -> aList.insert(operate.charAt(1));
                            case '=' -> aList.replace(operate.charAt(1));
                        }
                    }
                }
            }
            aList.showStructure();
            System.out.println(result.nextLine());
        }
    }
}