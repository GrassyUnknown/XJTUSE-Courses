
public class BinNode<K extends Comparable<K>,V> {

    private K key;
    private V value;
    private BinNode<K,V> left;
    private BinNode<K,V> right;

    public BinNode(K key,V value,BinNode<K,V> left,BinNode<K,V> right){
        this.key=key;
        this.value=value;
        this.left=left;
        this.right=right;
    }
    public BinNode(K key,V value){
        this.key=key;
        this.value=value;
    }

    public K getKey() {
        return key;
    }
    public void setKey(K key) {
        this.key = key;
    }

    public V getValue() {
        return value;
    }
    public void setValue(V value) {
        this.value = value;
    }

    public BinNode<K,V> getLeft() {
        return left;
    }
    public void setLeft(BinNode<K,V> left) {
        this.left = left;
    }

    public BinNode<K,V> getRight() {
        return right;
    }
    public void setRight(BinNode<K,V> right) {
        this.right = right;
    }

    public boolean biggerThan(K key){
        return this.key.compareTo(key)>0;
    }
    public boolean smallerThan(K key){
        return this.key.compareTo(key)<0;
    }
}
