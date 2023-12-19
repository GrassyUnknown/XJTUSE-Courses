public class ArrayList<T> implements List<T> {

    private int size;//数组大小
    private int length;//实际元素个数
    private int cursor;
    private T[] arrayList;

    public ArrayList(int size){
        this.size = size;
        length = 0;
        cursor = 0;
        arrayList = (T[]) new Object[this.size];
    }

    public void insert(T newElement) {
        if(newElement!=null && !isFull()){//元素不为空且数组未满
            if(isEmpty()){arrayList[cursor]=newElement;}
            else {
                cursor++;
                for (int i = length; i > cursor; i--) {
                    arrayList[i] = arrayList[i - 1];
                }
                arrayList[cursor] = newElement;
            }
            length++;
        }
    }

    public void remove() {
        if(!isEmpty()){
            length--;
            for(int i=cursor;i<length;i++) {
                arrayList[i] = arrayList[i + 1];
            }
            if(cursor==length)cursor=0;
        }
    }

    public void replace(T newElement) {
        if(!isEmpty()&&newElement!=null){
            arrayList[cursor]=newElement;
        }
    }

    public void clear() {
        length = cursor = 0;
    }

    public boolean isEmpty() {
        return length == 0;
    }

    public boolean isFull() {
        return length == size;
    }

    public boolean gotoBeginning() {
        if(!isEmpty()){
            cursor = 0;
            return true;
        }
        return false;
    }

    public boolean gotoEnd() {
        if(!isEmpty()){
            cursor = length-1;
            return true;
        }
        return false;
    }

    public boolean gotoNext() {
        if(cursor<length-1){
            cursor++;
            return true;
        }
        return false;
    }

    public boolean gotoPrev() {
        if(cursor>0){
            cursor--;
            return true;
        }
        return false;
    }

    public T getCursor() {
        return arrayList[cursor];
    }

    public void showStructure() {
        if(isEmpty())System.out.println("Empty list");
        else{
            for(int i=0;i<length;i++){
                System.out.print(arrayList[i]+" ");
            }
        }
        System.out.println(cursor);
    }

}
