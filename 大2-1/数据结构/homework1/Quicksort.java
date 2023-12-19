package homework;
public class Quicksort extends SortAlgorithm {
    public void sort(Comparable[] objs){
        qsort(objs,0, objs.length-1);
    }
    private void qsort(Comparable[] objs,int i,int j){//对第i位到第j位的子序列进行快速排序
        int pivotIndex = (i+j)/2;//取数组中间点为轴值
        exchange(objs,pivotIndex,j);//将轴值放置在末尾，因为轴值所处的位置未确定

        int m = i-1, n = j;
        do{//从两端移动下标直至相遇
            while(less(objs[++m], objs[j]));
            while(n!=0&&less(objs[j], objs[--n]));//每次循环中，在两端分别寻找两侧小于和大于轴值的数
            exchange(objs,m,n);
        }while(m<n);
        exchange(objs,m,n);//最后一次循环时多换了一次
        exchange(objs,m,j);//将轴值放置在适当位置

        if(j-(m+1)>0) qsort(objs,m+1,j);//m+1位到j位是新的右侧子序列
        if(n-i>0) qsort(objs,i,n);//i位到n位是新的左侧子序列
    }
}
