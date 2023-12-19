package homework;

public abstract class SortAlgorithm {
    public abstract void sort(Comparable[] objs);
    protected void exchange(Comparable[] numbers, int i, int j){
        Comparable temp;
        temp = numbers[i];
        numbers[i] = numbers[j];
        numbers[j] = temp;
    }
    protected boolean less(Comparable one, Comparable other){
        return one.compareTo(other) < 0;
    }
    protected void show(Comparable[] numbers){
        int N = numbers.length;
        int line = 0;
        for(int i = 0; i < N; i++){
            System.out.printf("%s ", numbers[i]);
            line++;
            if(line % 20 == 0) System.out.println();
        }
        System.out.println();
    }
    protected boolean isSorted(Comparable[] numbers){
        int N = numbers.length;
        for(int i = 0; i < N-1; i++)
            if(numbers[i].compareTo(numbers[i+1]) > 0) return false;
        return true;
    }

}
