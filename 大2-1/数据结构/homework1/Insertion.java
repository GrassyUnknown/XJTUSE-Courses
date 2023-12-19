package homework;

public class Insertion extends SortAlgorithm{
    public void sort(Comparable[] objs){
        int N = objs.length;
        for(int i = 1; i < N; i++){
            for(int j = i; j > 0 && less(objs[j], objs[j-1]); j--)
                exchange(objs, j, j-1);
        }
    }
}
