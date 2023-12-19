import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class KevinBacon {
    public static void main(String[] args) throws FileNotFoundException {
        Graph graph=new Graph(50000);
        Scanner scanner=new Scanner(new File("Simple.txt"));
        while (scanner.hasNextLine()){//建立Graph
            String[] input=scanner.nextLine().split("/");
            for (int i=1;i< input.length-1;i++){
                for(int j=i+1;j<input.length;j++){//为输入人名中的每一对人名添加对应的边
                    graph.insertEdge(input[i],input[j],input[0]);
                }
            }
        }
        System.out.println("Welcome to the Six Degrees of Kevin Bacon.");
        System.out.println("If you tell me an actor's name, I'll connect them to Kevin Bacon through the movies they appeared in.");
        System.out.println("I bet your actor has a Kevin Bacon number of less than six!");
        Scanner scannerin=new Scanner(System.in);
        System.out.print("Actor's name?");
        String actor=scannerin.nextLine();
        String actor1=actor;
        String actor2="Kevin Bacon";
        ArrayList<Edge> relation=graph.findRelations(actor1,actor2);
        if(relation==null||relation.size()==0){//找不到对应的关系
            System.out.print("Your input is invalid!");
            return;
        }
        System.out.printf("Path from %s to %s:\n",actor1,actor2);
        for(int i=relation.size()-2;i>=0;i--){//列表最后一位不是关系
            actor2=graph.nodeString(relation.get(i).n2);
            System.out.printf("%s was in %s with %s\n",actor1,relation.get(i).str,actor2);
            actor1=actor2;
        }
        System.out.printf("%s's Bacon Number is %d",actor,relation.size()-1);
    }
}
