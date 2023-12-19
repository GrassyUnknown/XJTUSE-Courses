package homework;

public class SortTest {
    // 使用指定的排序算法完成一次排序所需要的时间，单位是纳秒
    public static double time(SortAlgorithm alg, Double[] numbers){
        double start = System.nanoTime();
        alg.sort(numbers);
        double end = System.nanoTime();
        /*if(alg.isSorted(numbers)) System.out.println("Sort success.");
        else System.out.println("Sort failed.");*/
        return end - start;
    }

    // 为了避免一次测试数据所造成的不公平，对一个实验完成T次测试，获得T次测试之后的平均时间
    // 测试数据的生成交给test方法来完成，保证每次测试的数据都是新的数据
    // 该方法重新修正了参数：一个参数是用来表示生成数据的分布模式，一个参数用来表示生成的数据的规模
    public static double test(SortAlgorithm alg, int dataProbabilityType, int dataLength, int k, int T)
    {
        double totalTime = 0;
        Double[] numbers = null;
        for(int i = 0; i < T; i++) {
            switch(dataProbabilityType){
                case GenerateData.RANDOM -> numbers = GenerateData.getRandomData(dataLength);
                case GenerateData.KSORTED -> numbers = GenerateData.getKSortedData(dataLength, k);
                case GenerateData.UNEVEN -> numbers = GenerateData.getUnevenData(dataLength);
            }
            totalTime += time(alg, numbers);
        }
        return totalTime/T;
    }
    // 执行样例，仅供参考。
    // 由于测试数据的规模大小，算法性能，机器性能等因素，请同学们耐心等待每次程序的运行。
    public static void main(String[] args) {
        int[] dataLength = new int[9];
        for(int i=0;i<9;i++){
            dataLength[i]=(int)Math.pow(2,i+8);
        }
        double[] elapsedTime = new double[dataLength.length];
        SortAlgorithm alg = new Mergesort();
        for(int i = 0; i < dataLength.length; i++)
            elapsedTime[i] = test(alg, GenerateData.RANDOM, dataLength[i], 0, 5);
        for(double time: elapsedTime)
            System.out.printf("%6.4f ", time);
        System.out.println();
        for(int i = 0; i < dataLength.length; i++)
            elapsedTime[i] = test(alg, GenerateData.KSORTED, dataLength[i], 1, 5);
        for(double time: elapsedTime)
            System.out.printf("%6.4f ", time);
        System.out.println();
        for(int i = 0; i < dataLength.length; i++)
            elapsedTime[i] = test(alg, GenerateData.KSORTED, dataLength[i], 5, 5);
        for(double time: elapsedTime)
            System.out.printf("%6.4f ", time);
        System.out.println();
        for(int i = 0; i < dataLength.length; i++)
            elapsedTime[i] = test(alg, GenerateData.KSORTED, dataLength[i], 10, 5);
        for(double time: elapsedTime)
            System.out.printf("%6.4f ", time);
        System.out.println();
        for(int i = 0; i < dataLength.length; i++)
            elapsedTime[i] = test(alg, GenerateData.KSORTED, dataLength[i], 15, 5);
        for(double time: elapsedTime)
            System.out.printf("%6.4f ", time);
        System.out.println();
        for(int i = 0; i < dataLength.length; i++)
            elapsedTime[i] = test(alg, GenerateData.UNEVEN, dataLength[i], 0, 5);
        for(double time: elapsedTime)
            System.out.printf("%6.4f ", time);
        System.out.println();
    }
}
