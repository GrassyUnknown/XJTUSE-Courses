public class DictionaryTrieNode {
    private char letter;//结点前的路径上的字母
    private DictionaryTrieNode next;//下级结点
    private DictionaryTrieNode right;//并列右结点
    private String word;//关键字

    public DictionaryTrieNode(char letter, String word){
        this.letter=letter;
        this.word=word;
    }
    public DictionaryTrieNode(char letter, DictionaryTrieNode next){
        this.letter=letter;
        this.next=next;
    }

    public DictionaryTrieNode getNext() {
        return next;
    }
    public void setNext(DictionaryTrieNode next) {
        this.next = next;
    }

    public DictionaryTrieNode getRight() {
        return right;
    }
    public void setRight(DictionaryTrieNode right) {
        this.right = right;
    }

    public char getLetter() {
        return letter;
    }
    public void setLetter(char letter) {
        this.letter = letter;
    }

    public String getWord() {
        return word;
    }
    public void setWord(String word) {
        this.word = word;
    }
}
