public interface List<T> {
    void insert(T newElement);
    void remove();
    void replace(T newElement);
    void clear();
    boolean isEmpty();
    boolean isFull();
    boolean gotoBeginning();
    boolean gotoEnd();
    boolean gotoNext();
    boolean gotoPrev();
    T getCursor();
    void showStructure();
}
