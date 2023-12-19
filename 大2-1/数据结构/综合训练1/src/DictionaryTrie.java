import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class DictionaryTrie implements TrieADT {
    DictionaryTrieNode root;
    public DictionaryTrie() throws FileNotFoundException {
        root=null;
        Scanner scanner=new Scanner(new File("dictionary.txt"));
        while (scanner.hasNext()){
            insert(scanner.next());
        }
    }

    @Override
    public void insert(String key) {
        root=inserthelp(key,0,root);
    }
    private DictionaryTrieNode inserthelp(String key, int index, DictionaryTrieNode rt){//从结点rt开始插入key的index之后位
        if(rt==null){//需新建结点
            if(index==key.length()-1){//关键字结束
                return new DictionaryTrieNode(key.charAt(index),key);//新建叶结点
            }
            return new DictionaryTrieNode(key.charAt(index),inserthelp(key,index+1,null));//新建中间结点
        }
        if(rt.getLetter()==key.charAt(index)){//当前结点是关键字的一部分
            if(index==key.length()-1) {//关键字结束
                rt.setWord(key);//在树中，更改当前结点
                return rt;
            }
            rt.setNext(inserthelp(key,index+1,rt.getNext()));
        }
        else {//当前结点不是关键字的一部分
            rt.setRight(inserthelp(key,index,rt.getRight()));
        }
        return rt;
    }

    @Override
    public void remove(String key) {
        root=removehelp(key,0,root);
    }
    private DictionaryTrieNode removehelp(String key, int index, DictionaryTrieNode rt){
        if(rt==null){//关键字不在树中
            return rt;
        }
        if(rt.getLetter()==key.charAt(index)){//当前结点是关键字的一部分
            if(index==key.length()-1) {//关键字结束
                if(rt.getNext()!=null){//向后还有结点
                    rt.setWord(null);
                    return rt;
                }
                else {//向后没有结点
                    return rt.getRight();
                }
            }
            rt.setNext(removehelp(key,index+1,rt.getNext()));
            if(rt.getNext()==null&&rt.getWord()==null)return rt.getRight();//若该节点向后没有节点，且该节点没有关键字，该节点需被移除
            return rt;
        }
        //当前结点不是关键字的一部分
        rt.setRight(removehelp(key,index,rt.getRight()));
        return rt;
    }

    @Override
    public ArrayList<String> getWords(String key) {//以key为前缀串的所有关键字
        DictionaryTrieNode rt=root;//根据输入的关键字找到的结点
        for(int i=0;i<key.length();){
            if(rt==null){//在当前树中找不到当前关键字
                return null;
            }
            else if(rt.getLetter()==key.charAt(i)){//当前结点是关键字的一部分
                rt=rt.getNext();
                i++;
            }
            else {//当前结点不是关键字的一部分
                rt=rt.getRight();
            }
        }
        return getWordshelp(rt);
    }
    private ArrayList<String> getWordshelp(DictionaryTrieNode rt){//获得结点rt右下级的所有关键字
        ArrayList<String> words = new ArrayList<>();
        if(rt==null)return words;//遍历到底
        if(rt.getWord()!=null)words.add(rt.getWord());//此节点有关键字
        words.addAll(getWordshelp(rt.getNext()));
        words.addAll(getWordshelp(rt.getRight()));
        return words;
    }
}
