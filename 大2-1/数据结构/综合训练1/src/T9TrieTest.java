import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class T9TrieTest {
    public static void main(String[] args) throws FileNotFoundException {
        T9Trie test= new T9Trie();
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter “exit” to quit.");
        int index=0;
        for(ArrayList<String> words=null;;){
            System.out.print("Enter Key Sequence (or “#” for next word):\n>");
            String operation=scanner.next();
            if (operation.equals("exit"))break;//退出
            else if (operation.equals("#"))index++;
            else {
                index=0;
                words=test.getWords(operation);
            };
            if(words==null|| words.size()==0){
                System.out.println("Not found in current dictionary.");
            }
            else if (words.size()<=index) {
                System.out.println("There are no more T9 words.");
            } else {
                System.out.println("\'"+words.get(index)+"\'");
            }
        }
    }
}
