package homework;

public class Selection extends SortAlgorithm {
    public void sort(Comparable[] objs){
        int N = objs.length;
        for (int i = 0; i < N - 1; i++) {
            int minIndex = i;
            for (int j = N - 1; j > i; j--) {
                if (less(objs[j], objs[minIndex])) {
                    minIndex = j;
                }
            }
            exchange(objs, i, minIndex);
        }
    }
}
