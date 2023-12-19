import java.io.FileNotFoundException;
import java.util.Scanner;

public class DictionaryTrieTest {
    public static void main(String[] args) throws FileNotFoundException {
        DictionaryTrie test=new DictionaryTrie();
        Scanner scanner = new Scanner(System.in);
        while (true){
            String operation=scanner.next();
            switch (operation.charAt(0)){
                case '+'-> test.insert(operation.substring(1));
                case '-'-> test.remove(operation.substring(1));
                case '#' -> {return;}
                default -> System.out.println(test.getWords(operation));
            }
        }
    }
}
