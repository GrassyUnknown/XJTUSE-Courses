public class DoubleLink<T> {
    private T element;
    private DoubleLink<T> next;
    private DoubleLink<T> prev;
    public DoubleLink(T element,DoubleLink<T> next,DoubleLink<T> prev){
        this.element=element;
        this.next=next;
        this.prev=prev;
    }
    public DoubleLink(DoubleLink<T> next,DoubleLink<T> prev){
        this.next=next;
        this.prev=prev;
    }

    public DoubleLink<T> next(){return next;}
    public void setNext(DoubleLink<T> next){this.next=next;}
    public DoubleLink<T> prev(){return prev;}
    public void setPrev(DoubleLink<T> prev){this.prev=prev;}
    public T element(){return element;}
    public void setElement(T element){this.element=element;}
}
