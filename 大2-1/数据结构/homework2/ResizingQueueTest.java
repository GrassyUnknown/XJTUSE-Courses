import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class ResizingQueueTest {
    public static void main(String[] args) throws FileNotFoundException {
        ResizingQueue<Integer> queue = new ResizingQueue<>();
        Scanner test=new Scanner(new File("test5000.txt"));
        Scanner result=new Scanner(new File("result5000.txt"));
        while (test.hasNext()){
            if(test.hasNextInt()){queue.enqueue(test.nextInt());}
            else{
                switch (test.next()) {
                    case "-" -> queue.dequeue();
                    case "?" -> {
                        String results = result.nextLine() + "\n" + result.nextLine();
                        System.out.println(results.equals(queue.toString()));
                    }
                }
            }
        }
    }
}
