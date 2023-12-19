package homework;

import java.util.Random;

public class GenerateData {
    public static final int RANDOM = 1;
    public static final int KSORTED = 2;
    public static final int UNEVEN = 3;
    // 生成一个长度为N的均匀分布的数据序列
    public static Double[] getRandomData(int N){
        Double[] numbers = new Double[N];
        for(int i = 0; i < N; i++)
            numbers[i] = Math.random();
        return numbers;
    }
    // 生成一个K-sorted数据序列，其中该序列的长度为N，一般要求 K << N
    public static Double[] getKSortedData(int N, int K){
        Double[] numbers = new Double[N];
        double step = 1.0/N;
        numbers[0] = 0.0;
        for(int i = 1; i < N; i++)
            numbers[i] = numbers[i-1] + step;
        int left = 0;
        int right = left + K;
        while(right < N){
            shuffle(numbers, left, right);
            left = right;
            right += K;
        }
        shuffle(numbers, left, N);
        return numbers;
    }
    //生成一个长度为N的不均匀数据序列，其中1/2的数据是0，1/4的数据是1，1/8的数据是2，1/8的数据是3
    public static Double[] getUnevenData(int N) {
        Double[] numbers = new Double[N];
        for (int i = 0; i < N / 8; i++) {
            numbers[i] = 3.0;
        }
        for (int i = N / 8; i < N / 4; i++) {
            numbers[i] = 2.0;
        }
        for (int i = N / 4; i < N / 2; i++) {
            numbers[i] = 1.0;
        }
        for (int i = N / 2; i < N; i++) {
            numbers[i] = 0.0;
        }
        shuffle(numbers, 0, N);
        return numbers;
    }
    // 将数组numbers中的[left,right)范围内的数据随机打乱
    private static void shuffle(Double[] numbers, int left, int right){
        int N = right - left;
        Random rand = new Random();
        for(int i = 0; i < N; i++){
            int j = i + rand.nextInt(N-i);
            exchange(numbers, i+left, j+left);
        }
    }
    private static void exchange(Double[] numbers, int i, int j){
        double temp = numbers[i];
        numbers[i] = numbers[j];
        numbers[j] = temp;
    }

    public static void main(String[] args) {
        Double[] numbers = getUnevenData(100);
        new Insertion().show(numbers);
    }
}
