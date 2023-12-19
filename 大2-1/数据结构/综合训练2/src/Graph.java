import java.util.ArrayList;

public class Graph {
    //采取邻接表的存储方式
    private LinkList<Edge>[] graph;//边构成的链表的数组，第一位存储一个顶点
    int num=0;//顶点的个数
    int n;//图的大小（能够存储的顶点个数）

    public Graph(int n){
        this.n=n;
        graph=new LinkList[n];
    }
    public void insertEdge(String n1,String n2,String str){//在n1与n2之间插入字段为str的边
        int num1=nodeNum(n1);
        int num2=nodeNum(n2);
        graph[num1].insert(new Edge(num2,str));//为n1的链表插入边
        graph[num2].insert(new Edge(num1,str));//为n2的链表插入边
    }
    private int nodeNum(String str){//如果str在图中，则返回它的编号，否则新建一个顶点和它的邻接链表
        for(int i=0;i<num;i++) {
            graph[i].gotoBeginning();
            if (graph[i].getCursor().str.equals(str)) {//每个链表的第一位存储了一个结点，如果这个结点值和str相等
                return i;
            }
        }
        //str不在当前图中，为它新建一个链表
        graph[num]= new LinkList<>();
        graph[num].insert(new Edge(num,str));
        num++;
        return num-1;
    }
    public String nodeString(int num){
        graph[num].gotoBeginning();
        return graph[num].getCursor().str;
    }
    public ArrayList<Edge> findRelations(String str1,String str2){//从n1开始进行广度优先搜索，直到找到n2，返回的是n2到n1的路径
        int n1=nodeNum(str1),n2=nodeNum(str2);
        boolean[] visited=new boolean[n];
        Edge[] father=new Edge[n];//用于存储每个被遍历顶点的上级
        ArrayList<Edge> relations=new ArrayList<>();
        ResizingQueue<Edge> queue=new ResizingQueue<>();
        graph[n1].gotoBeginning();
        queue.enqueue(graph[n1].getCursor());
        visited[n1]=true;
        father[n1]=null;
        while (queue.size()!=0){
            Edge now = queue.dequeue();
            if(now.n2==n2){
                while (now!=null){//回溯遍历过程，写入relations
                    relations.add(now);
                    now=father[now.n2];
                }
                return relations;
            }
            for (graph[now.n2].gotoBeginning();graph[now.n2].gotoNext();){
                Edge next=graph[now.n2].getCursor();
                if(!visited[next.n2]){//next未被遍历
                    father[next.n2]=now;
                    visited[next.n2]=true;
                    queue.enqueue(next);
                }
            }
        }
        return null;
    }
}
