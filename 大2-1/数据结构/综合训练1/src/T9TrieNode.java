import java.util.ArrayList;

public class T9TrieNode {
    private int num;//结点前的路径上的数字
    private T9TrieNode next;//下级结点
    private T9TrieNode right;//并列右结点
    private ArrayList<String> words;//关键字

    public T9TrieNode(int num, String word){
        this.num=num;
        this.words=new ArrayList<>();
        words.add(word);
    }
    public T9TrieNode(int num, T9TrieNode next){
        this.num=num;
        this.words=new ArrayList<>();
        this.next=next;
    }

    public T9TrieNode getNext() {
        return next;
    }
    public void setNext(T9TrieNode next) {
        this.next = next;
    }

    public T9TrieNode getRight() {
        return right;
    }
    public void setRight(T9TrieNode right) {
        this.right = right;
    }

    public int getNum() {
        return num;
    }
    public void setNum(int num) {
        this.num = num;
    }

    public ArrayList<String> getWords() {
        return words;
    }
    public void addWord(String word) {
        this.words.add(word);
    }
    public void deleteWord(String word) {
        this.words.remove(word);
    }
}
