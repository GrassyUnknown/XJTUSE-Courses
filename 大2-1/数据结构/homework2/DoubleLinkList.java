public class DoubleLinkList<T> implements List<T> {
    private DoubleLink<T> head;
    private DoubleLink<T> tail;
    private DoubleLink<T> cursor;
    public DoubleLinkList(){
        head=tail=cursor=new DoubleLink<T>(null,null);
    }
    public void insert(T newElement) {
        if(newElement!=null){
            if(isEmpty())cursor.setElement(newElement);//表空
            else if(cursor==tail){//在表尾
                cursor.setNext(new DoubleLink<>(newElement,null,cursor));
                gotoNext();
                tail=cursor;
            }
            else{
                cursor.setNext(new DoubleLink<>(newElement,cursor.next(),cursor));
                gotoNext();
            }
        }
    }

    public void remove() {
        if(!isEmpty()){
            if(!gotoPrev()){//在表首
                if(!gotoNext())clear();//删除后表空
                else head=cursor;cursor.setPrev(null);
            }
            else if(cursor.next()==tail){//删除后光标在尾
                tail=cursor;
                cursor.setNext(null);
            }
            else{
                cursor.setNext(cursor.next().next());
                cursor.next().setPrev(cursor);
                gotoNext();
            }

        }
    }

    public void replace(T newElement) {
        if(!isEmpty()&&newElement!=null){
            cursor.setElement(newElement);
        }
    }

    public void clear() {
        head=tail=cursor=new DoubleLink<>(null,null);
    }

    public boolean isEmpty() {
        return head.element()==null;
    }

    public boolean isFull() {
        return false;
    }

    public boolean gotoBeginning() {
        if(!isEmpty()){
            cursor = head;
            return true;
        }
        return false;
    }

    public boolean gotoEnd() {
        if(!isEmpty()){
            cursor = tail;
            return true;
        }
        return false;
    }

    public boolean gotoNext() {
        if(cursor!=tail&&cursor!=null){
            cursor=cursor.next();
            return true;
        }
        return false;
    }

    public boolean gotoPrev() {
        if(cursor!=head&&cursor!=null){
            cursor=cursor.prev();
            return true;
        }
        return false;
    }

    public T getCursor() {
        return cursor.element();
    }

    public void showStructure() {
        if(isEmpty())System.out.println("Empty list");
        else{
            for(DoubleLink temp=head;temp!=tail;temp=temp.next()){
                System.out.print(temp.element()+" ");
            }
            DoubleLink temp=head;int i=0;
            while (temp!=cursor){
                temp=temp.next();
                i++;
            }
            System.out.println(i);
        }
    }
}
