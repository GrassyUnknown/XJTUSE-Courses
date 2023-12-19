package homework;

public class Mergesort extends SortAlgorithm {
    public void sort(Comparable[] objs){
        mergesort(objs,new Comparable[objs.length],0,objs.length-1);
    }
    private void mergesort(Comparable[] objs,Comparable[] temp,int i,int j){
        if(i==j) return;
        int midIndex = (i+j)/2;
        mergesort(objs,temp,i,midIndex);
        mergesort(objs,temp,midIndex+1,j);
        System.arraycopy(objs, i, temp, i, j + 1 - i);
        int n1=i,n2=midIndex+1;//左侧数组和右侧数组的位置指示
        for(int index=i;index<=j;index++) {//将左右侧数组按大小复制进原数组
            if (n1 == midIndex + 1) {//左侧数组已复制完
                objs[index] = temp[n2++];
            } else if (n2 == j + 1) {//右侧数组已复制完
                objs[index] = temp[n1++];
            } else if (less(temp[n1], temp[n2])) {//左侧数组首位较小
                objs[index] = temp[n1++];
            } else {//右侧数组首位较小
                objs[index] = temp[n2++];
            }
        }
    }
}
