import java.io.IOException;
import java.io.PrintWriter;

public class BST<K extends Comparable<K>,V> implements BSTADT<K, V> {
    BinNode<K,V> root;

    public BST(){root=null;}

    @Override
    public void insert(K key, V value) {
        root=inserthelp(root,key,value);
    }
    private BinNode<K,V> inserthelp(BinNode<K,V> rt,K key,V value){//递归调用，遍历BST，找到插入位置
        if(rt==null){//遍历到底
            return new BinNode<>(key, value);
        }
        if(rt.biggerThan(key)){//遍历到的rt的key较大
            rt.setLeft(inserthelp(rt.getLeft(),key,value));
        }
        else if(rt.smallerThan(key)){//遍历到的rt的key较小
            rt.setRight(inserthelp(rt.getRight(),key,value));
        }
        else {//遍历到的rt的key相等
            rt.setValue(value);
        }
        return rt;
    }

    @Override
    public V remove(K key) {
        BinNode<K,V> removed = new BinNode<>(null, null);
        root=removehelp(root,key,removed);
        return removed.getValue();
    }
    private BinNode<K,V> removehelp(BinNode<K,V> rt,K key,BinNode<K,V> removed){
        if(rt==null){//遍历到底
            return null;
        }
        if(rt.biggerThan(key)){//遍历到的rt的key较大
            rt.setLeft(removehelp(rt.getLeft(),key,removed));
        }
        else if(rt.smallerThan(key)) {//遍历到的rt的key较小
            rt.setRight(removehelp(rt.getRight(),key,removed));
        }
        else {//找到了
            removed.setKey(rt.getKey());
            removed.setValue(rt.getValue());//使用这种方式将删除的内容传出
            if(rt.getLeft()==null)rt=rt.getRight();//左子树空
            else if (rt.getRight()==null)rt=rt.getLeft();//右子树空
            else {//双子树
                BinNode<K,V> rightMin = getMin(rt.getRight());//右子树最小值
                removehelp(rt,rightMin.getKey(),rt);//同时实现数据复制、删除最小值
            }
        }
        return rt;
    }
    private BinNode<K,V> getMin(BinNode<K,V> rt){
        if(rt.getLeft()==null){//最小值
            return rt;
        }
        return getMin(rt.getLeft());
    }

    @Override
    public V search(K key) {
        return searchhelp(root,key);
    }
    private V searchhelp(BinNode<K,V> rt,K key){
        if(rt==null){//遍历到底
            return null;
        }
        if(rt.biggerThan(key)){//遍历到的rt的key较大
            return searchhelp(rt.getLeft(),key);
        }
        else if(rt.smallerThan(key)) {//遍历到的rt的key较小
            return searchhelp(rt.getRight(),key);
        }
        else {
            return rt.getValue();
        }
    }

    @Override
    public boolean update(K key, V value) {
        return updatehelp(root,key,value);
    }
    private boolean updatehelp(BinNode<K,V> rt,K key,V value){
        if(rt==null){//遍历到底
            return false;
        }
        if(rt.biggerThan(key)){//遍历到的rt的key较大
            return updatehelp(rt.getLeft(),key,value);
        }
        else if(rt.smallerThan(key)) {//遍历到的rt的key较小
            return updatehelp(rt.getRight(),key,value);
        }
        else {
            rt.setValue(value);
            return true;
        }
    }

    @Override
    public boolean isEmpty() {
        return root == null;
    }

    @Override
    public void clear() {
        root=null;
    }

    @Override
    public void showStructure(PrintWriter pw) throws IOException {
        if(pw==null)throw new IOException();
        pw.write("-----------------------------\n");
        pw.write(String.format("There are %d nodes in this BST.\n",getNodes(root)));
        pw.write(String.format("The height of this BST is %d.\n",getHeight(root)));
        pw.write("-----------------------------\n");
    }
    private int getNodes(BinNode<K,V> rt){
        if(rt==null)return 0;
        return getNodes(rt.getRight())+getNodes(rt.getLeft())+1;
    }
    private int getHeight(BinNode<K,V> rt){
        if(rt==null)return 0;
        return Math.max(getHeight(rt.getLeft()),getHeight(rt.getRight()))+1;
    }

    @Override
    public void printInorder(PrintWriter pw) throws IOException {
        if(pw==null)throw new IOException();
        printhelp(root,pw);
    }
    private void printhelp(BinNode<K,V> rt,PrintWriter pw){//中序周游
        if (rt==null)return;
        printhelp(rt.getLeft(),pw);
        pw.write("["+rt.getKey()+" --- < "+rt.getValue()+">]\n");
        printhelp(rt.getRight(),pw);
    }
}