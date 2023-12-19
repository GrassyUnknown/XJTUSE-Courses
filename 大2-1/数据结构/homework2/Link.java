public class Link<T> {
    private T element;
    private Link<T> next;
    public Link(T element,Link<T> next){
        this.element=element;
        this.next=next;
    }
    public Link(Link<T> next){
        this.next=next;
    }
    
    public Link<T> next(){return next;}
    public void setNext(Link<T> next){this.next=next;}
    public T element(){return element;}
    public void setElement(T element){this.element=element;}
}
