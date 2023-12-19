import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
public class RadixSort {
    public static void main(String[] args) throws FileNotFoundException {
        Scanner test1 = new Scanner(new File("radixSort1.txt"));
        int[] testInt = new int[10000];
        int length1 = 0;
        for (; test1.hasNext(); length1++) {//将数据读入数组
            testInt[length1] = test1.nextInt();
        }
        radixSortInt(testInt, length1);//排序
        for (int i = 0; i < length1; i++) {//输出
            System.out.print(testInt[i] + " ");
        }
        System.out.println();

        Scanner test2 = new Scanner(new File("radixSort2.txt"));
        String[] testString = new String[10000];
        int length2 = 0;
        for (; test2.hasNext(); length2++) {//将数据读入数组
            testString[length2] = test2.next();
        }
        radixSortString(testString, length2);//排序
        for (int i = 0; i < length2; i++) {//输出
            System.out.print(testString[i] + " ");
        }
    }

    public static void radixSortInt(int[] list, int length) {
        int max = 0;
        for (int i = 0; i < length; i++) {//寻找数组的最大值
            if (list[i] > max) max = list[i];
        }
        int maxLength = (int) Math.log10(max) + 1;//最大位数
        ResizingQueue<Integer>[] temp = new ResizingQueue[10];
        for (int i = 0; i < 10; i++) {//队列的初始化
            temp[i] = new ResizingQueue<>();
        }
        for (int i = 0; i < maxLength; i++) {//每一次循环对第i位进行排序
            for (int j = 0; j < length; j++) {//将数组中的数放入队列
                temp[(int) (list[j] / Math.pow(10, i)) % 10].enqueue(list[j]);
            }
            for (int k = 0, index = 0; k < 10; k++) {//将队列中的数取出，第一个for循环遍历10个队列
                while (temp[k].size() != 0) {//第二个for循环遍历每个队列里的数
                    list[index] = temp[k].dequeue();
                    index++;
                }
            }
        }
    }

    public static void radixSortString(String[] list, int length) {
        int maxLength = 8;
        ResizingQueue<String>[] temp = new ResizingQueue[52];
        for (int i = 0; i < 52; i++) {//队列的初始化
            temp[i] = new ResizingQueue<>();
        }
        for (int i = maxLength - 1; i >= 0; i--) {//每一次循环对第i位进行排序
            for (int j = 0; j < length; j++) {//将数组中的数放入队列
                char letter = list[j].charAt(i);
                int position = 0;//根据第i位的字母判断放入哪个队列
                if (letter >= 'A' && letter <= 'Z') position = letter - 'A';
                if (letter >= 'a' && letter <= 'z') position = letter - 'a' + 26;
                temp[position].enqueue(list[j]);
            }
            for (int k = 0, index = 0; k < 52; k++) {//将队列中的数取出，第一个for循环遍历52个队列
                while (temp[k].size() != 0) {//第二个for循环遍历每个队列里的数
                    list[index] =  temp[k].dequeue();
                    index++;
                }
            }
        }
    }
}