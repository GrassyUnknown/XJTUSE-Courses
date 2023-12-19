package homework;

public class Shell extends SortAlgorithm {
    public void sort(Comparable[] objs) {
        for (int i = objs.length / 3; i > 3; i /= 3) {//元素间距
            for (int j = 0; j < i; j++) {
                insertSort(objs, j, i);
            }
        }
        insertSort(objs, 0, 1);
    }

    private void insertSort(Comparable[] objs, int start, int incr) {//对以start为始，incr为间距的子序列进行插入排序
        for (int i = start + incr; i < objs.length; i += incr) {
            for (int j = i; j > start && less(objs[j], objs[j - incr]); j -= incr) {
                exchange(objs, j, j - incr);
            }
        }
    }
}
