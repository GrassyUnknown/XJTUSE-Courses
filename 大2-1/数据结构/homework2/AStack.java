public class AStack<T> {
    private int size;
    private int top;
    private T[] arrayList;
    public AStack(int size){
        this.size=size;
        top=0;
        arrayList=(T[])new Object[size];
    }
    public void push(T newElement){
        arrayList[top++]=newElement;
    }
    public T pop(){
        return arrayList[--top];
    }
    public boolean isEmpty(){
        return top==0;
    }
}
