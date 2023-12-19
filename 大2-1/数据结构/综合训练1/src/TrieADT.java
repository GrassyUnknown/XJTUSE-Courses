import java.util.ArrayList;

public interface TrieADT {
    void insert(String key);
    void remove(String key);
    ArrayList<String> getWords(String key);
}
