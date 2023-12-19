import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class WordIndex {
    public static void main(String[] args) throws IOException {
        BST<String,ResizingQueue> wordBST=new BST<>();
        Scanner scanner=new Scanner(new File("article.txt"));
        for (int line=1;scanner.hasNextLine();line++){//依据article建立BST
            String[] words=scanner.nextLine().split(" ");
            for(String word : words){//遍历单词
                word=getAvailable(word);//处理单词，排除无效的并对有标点的进行处理
                if(word!=null){//单词有效
                    ResizingQueue<Integer> queue=wordBST.search(word);
                    if(queue==null){//单词在BST中不存在
                        queue=new ResizingQueue<>();
                        queue.enqueue(line);
                        wordBST.insert(word,queue);
                    }
                    else {//单词已经存在
                        queue.enqueue(line);
                    }
                }
            }
        }
        PrintWriter pw=new PrintWriter("index_result.txt");
        wordBST.printInorder(pw);
        pw.flush();
    }
    private static String getAvailable(String word){//数据清洗
        if(word.length()<=2)return null;
        for(int i=0;i<word.length();i++){
            char thisChar=word.charAt(i);
            if(thisChar== 39||thisChar== 34||thisChar== '-'||thisChar=='('||thisChar==')')return null;//单引号，双引号，短横线，括号
            if(thisChar>='1'&&thisChar<='9')return null;//数字
            if(i==word.length()-1&&(thisChar==','||thisChar=='.'||thisChar=='?'||thisChar==';'||thisChar=='!')){//末尾是句号，逗号，问号，分号，感叹号
                return word.substring(0,word.length()-1);
            }
        }
        return word;
    }
}
