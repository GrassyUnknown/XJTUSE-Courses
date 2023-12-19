import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class BSTTest {
    public static void main(String[] args) throws IOException {
        BST<String,String> test=new BST<>();
        PrintWriter pw =new PrintWriter(System.out);
        Scanner scanner=new Scanner(new File("BST_testcases.txt"));
        String key,value;//处理操作过程中用到的变量
        while (scanner.hasNextLine()){
            String line = scanner.nextLine();
            switch (line.charAt(0)){//判断是什么操作
                case '#'->test.showStructure(pw);
                case '?'->{
                    key= line.substring(3,line.length()-2);
                    value=test.search(key);
                    if(value==null)pw.write("search unsuccess ---"+key+"\n");//搜索不成功
                    else pw.write("search success ---"+key+" "+value+"\n");//搜索成功
                }
                case '-'->{
                    key=line.substring(3,line.length()-2);
                    value=test.remove(key);
                    if(value==null)pw.write("remove unsuccess ---"+key+"\n");//搜索不成功
                    else pw.write("remove success ---"+key+" "+value+"\n");//搜索成功
                }
                default->{
                    key=line.split(" , ")[0];
                    value=line.split(" , ")[1];
                    key=key.substring(3);
                    value=value.substring(1,value.length()-3);
                    switch (line.charAt(0)){
                        case '+'->test.insert(key,value);
                        case '='->{
                            if(test.update(key,value))pw.write("update success ---"+key+" "+value+"\n");
                            else pw.write("update unsuccess ---"+key+" "+value+"\n");
                        }
                    }
                }
            }
        }
        pw.flush();
    }
}
