public class LinkList<T> implements List<T> {
    private Link<T> head;
    private Link<T> tail;
    private Link<T> cursor;
    public LinkList(){
        head=tail=cursor=new Link<>(null);
    }
    public void insert(T newElement) {
        if(newElement!=null){
            if(isEmpty())cursor.setElement(newElement);//表空
            else if(cursor==tail){//在表尾
                cursor.setNext(new Link<>(newElement,null));
                cursor=cursor.next();
                tail=cursor;
            }
            else{
                cursor.setNext(new Link<>(newElement,cursor.next()));
                gotoNext();
            }
        }
    }

    public void remove() {
        if(!isEmpty()){
            if(!gotoPrev()) {//在表首
                if (!gotoNext()) clear();//删除后表空
                else head = cursor;
            }
            else if(cursor.next()==tail){//删除后光标在尾
                tail=cursor;
                cursor=head;
            }
            else{
                cursor.setNext(cursor.next().next());
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
        head=tail=cursor=new Link<>(null);
    }

    public boolean isEmpty() {
        return head==tail&&head.element()==null;
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
            Link<T> temp=head;
            while (temp.next()!=cursor){
                temp=temp.next();
            }
            cursor=temp;
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
            for(Link temp=head;temp!=tail;temp=temp.next()){
                System.out.print(temp.element()+" ");
            }
            System.out.print(tail.element()+" ");
            Link temp=head;int i=0;
            while (temp!=cursor){
                temp=temp.next();
                i++;
            }
            System.out.println(i);
        }
    }
}
