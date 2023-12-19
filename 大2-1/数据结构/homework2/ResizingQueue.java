import java.util.NoSuchElementException;

public class ResizingQueue<T> {
    private int N;
    private int length;
    private int front;
    private int rear;
    private T[] arrayList;
    public ResizingQueue(){
        N = 1;
        length = N+1;
        front = rear = 0;
        arrayList = (T[])new Object[length];
    }
    public void enqueue(T element){
        if(element==null)throw new IllegalArgumentException("Element is null.");//输入元素为空
        else{
            if(size()==N){//若数组满，创建新数组
                T[] arrayListNew = (T[])new Object[2*N+1];
                copy(arrayList,arrayListNew);
                arrayList=arrayListNew;
                front=0;
                rear=N;
                N*=2;
                length=N+1;
            }
            rear=(rear+1)%length;
            arrayList[rear]=element;//入队
        }
    }
    public T dequeue(){
        if(size()==0)throw new NoSuchElementException("Queue is empty.");//队列空
        else{
            front=(front+1)%length;
            T dequeueObject=arrayList[front];//出队
            arrayList[front]=null;
            if(size()==N/4&&N>1){//若数组内元素等于大小的四分之一，创建新数组
                T[] arrayListNew = (T[])new Object[N/2+1];
                copy(arrayList,arrayListNew);
                arrayList=arrayListNew;
                front=0;
                rear=N/4;
                N/=2;
                length=N+1;
            }
            return dequeueObject;
        }
    }
    public int size(){ return (rear-front+length)%length; }
    public String toString(){
        String str="[";
        if(size()<=20){str+=getValues(1,size());}
        else {str=str+getValues(1,5)+"  ... "+getValues(size()-4,size());}
        str=str+"]\nelements: "+size()+" size:"+N;
        return str;
    }
    private void copy(T[] arrayList,T[] arrayListNew){//将原数组中的值复制进新数组
        for(int i=1;i<size()+1;i++){
            arrayListNew[i]=arrayList[(front+i)%length];
        }
    }
    private String getValues(int start,int end){//获得从start位到end位的值（以字符串形式）
        String valueStr="";
        for(int i=start;i<end;i++){
            valueStr=valueStr+arrayList[(front+i)%length]+" ";
        }
        valueStr+=arrayList[(front+end)%length];
        return valueStr;
    }
}
