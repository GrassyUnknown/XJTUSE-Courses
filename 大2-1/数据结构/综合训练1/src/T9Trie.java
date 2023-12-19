import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class T9Trie implements TrieADT{
    T9TrieNode root;
    public T9Trie() throws FileNotFoundException {
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
    private T9TrieNode inserthelp(String key, int index, T9TrieNode rt){//从结点rt开始插入key的index之后位
        if(rt==null){//需新建结点
            if(index==key.length()-1){//关键字结束
                return new T9TrieNode(toNum(key.charAt(index)),key);//新建叶结点
            }
            return new T9TrieNode(toNum(key.charAt(index)),inserthelp(key,index+1,null));//新建中间结点
        }
        if(rt.getNum()==toNum(key.charAt(index))){//当前结点是关键字的一部分
            if(index==key.length()-1) {//关键字结束
                rt.addWord(key);//在树中，更改当前结点
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
    private T9TrieNode removehelp(String key, int index, T9TrieNode rt){
        if(rt==null){//关键字不在树中
            return rt;
        }
        if(rt.getNum()==toNum(key.charAt(index))){//当前结点是关键字的一部分
            if(index==key.length()-1) {//关键字结束
                if(rt.getNext()!=null||rt.getWords().size()>1){//向后还有结点，或此结点还有别的关键字
                    rt.deleteWord(key);
                    return rt;
                }
                else {//向后没有结点，且该节点只有一个关键字，移除它
                    return rt.getRight();
                }
            }
            rt.setNext(removehelp(key,index+1,rt.getNext()));
            if(rt.getNext()==null&&rt.getWords().isEmpty())return rt.getRight();//若该节点向后没有节点，且该节点没有关键字，该节点需被移除
            return rt;
        }
        //当前结点不是关键字的一部分
        rt.setRight(removehelp(key,index,rt.getRight()));
        return rt;
    }

    @Override
    public ArrayList<String> getWords(String key) {//获得key对应的数个单词
        T9TrieNode rt=root;//根据输入的关键字找到的结点
        for(int i=0;i<key.length();){
            if(rt==null){//在当前树中找不到当前关键字
                return null;
            }
            else if(rt.getNum()==key.charAt(i)-48){//当前结点是关键字的一部分
                if(i<key.length()-1) rt=rt.getNext();//若不在最后一层，进入下层
                i++;
            }
            else {//当前结点不是关键字的一部分
                rt=rt.getRight();
            }
        }
        return rt.getWords();
    }

    private int toNum(char s){//获得字符对应的键盘数字
        if(s>='a'&&s<='c')return 2;//ABC
        if(s>='d'&&s<='f')return 3;//DEF
        if(s>='g'&&s<='i')return 4;//GHI
        if(s>='j'&&s<='l')return 5;//JKL
        if(s>='m'&&s<='o')return 6;//MNO
        if(s>='p'&&s<='s')return 7;//PQRS
        if(s>='t'&&s<='v')return 8;//TUV
        if(s>='w'&&s<='z')return 9;//WXYZ
        return 0;
    }
}
