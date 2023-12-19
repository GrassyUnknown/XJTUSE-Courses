import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        try {
            Scanner productScanner = new Scanner(new File("input.txt"));
            Scanner offerScanner = new Scanner(new File("offer.txt"));
            PrintWriter writer = new PrintWriter("output.txt");

            int B = productScanner.nextInt();
            int[][] products = new int[B][3];

            for (int i = 0; i < B; i++) {
                products[i][0] = productScanner.nextInt();
                products[i][1] = productScanner.nextInt();
                products[i][2] = productScanner.nextInt();
            }

            int S = offerScanner.nextInt();
            int[][][] offers = new int[S][][];
            for (int i = 0; i < S; i++) {
                int j = offerScanner.nextInt();
                offers[i] = new int[j + 1][2];
                for (int k = 0; k < j; k++) {
                    offers[i][k][0] = offerScanner.nextInt();
                    offers[i][k][1] = offerScanner.nextInt();
                }
                offers[i][j][0] = offerScanner.nextInt();
            }

            int result = calculateMinimumCost(B, products, S, offers);
            writer.println(result);

            productScanner.close();
            offerScanner.close();
            writer.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
    private static int calculateMinimumCost(int B, int[][] products, int S, int[][][] offers) {
        // Create data structures to store product and offer information
        Map<Integer, Integer> buyList = new HashMap<>();
        Map<Integer, Integer> priceList = new HashMap<>();
        Map<int[][], Integer> discount = new HashMap<>();
        List<int[][]> offerDetail = new LinkedList<>();

        // Populate buyList and priceList from the input products
        for (int i = 0; i < B; i++) {
            int productId = products[i][0];
            int quantity = products[i][1];
            int price = products[i][2];

            buyList.put(productId, quantity);
            priceList.put(productId, price);
        }

        // Populate offerDetail and discount from the input offers
        for (int i = 0; i < S; i++) {
            int numProductsInOffer = offers[i].length - 1;
            int[][] offer = new int[numProductsInOffer][2];

            for (int j = 0; j < numProductsInOffer; j++) {
                offer[j][0] = offers[i][j][0];
                offer[j][1] = offers[i][j][1];
            }

            int offerPrice = offers[i][numProductsInOffer][0];
            offerDetail.add(offer);
            discount.put(offer, offerPrice);
        }

        // Calculate the minimum cost using the provided function
        return cheapestPrice(buyList, priceList, discount, offerDetail);
    }

    private static int cheapestPrice(Map<Integer, Integer> buyList, Map<Integer, Integer> priceList,
                                     Map<int[][], Integer> discount, List<int[][]> offerDetail) {
        int minFee = 0;
        int[] needBuy = buyList.keySet().stream().mapToInt(Integer::intValue).toArray();

        if (isEmpty(needBuy, buyList)) {
            return minFee;
        } else {
            minFee += offer(buyList, discount, offerDetail);
            for (int productId : needBuy) {
                if (buyList.get(productId) > 0) {
                    minFee += buyList.get(productId) * priceList.get(productId);
                }
            }
        }

        return minFee;
    }

    private static int offer(Map<Integer, Integer> buyList, Map<int[][], Integer> discount,
                                  List<int[][]> offerDetail) {
        int val = 0;
        for (int i = offerDetail.size() - 1; i >= 0; i--) {
            int[][] tmp = offerDetail.get(i);
            int cnt = 0;
            for (int j = 0; j < tmp.length; j++) {
                if (buyList.get(tmp[j][0]) >= tmp[j][1]) {
                    cnt++;
                }
            }
            if (cnt == tmp.length) {
                for (int j = 0; j < tmp.length; j++) {
                    buyList.put(tmp[j][0], buyList.get(tmp[j][0]) - tmp[j][1]);
                }
                val += discount.get(tmp);
            }
        }
        return val;
    }

    private static boolean isEmpty(int[] arr, Map<Integer, Integer> buyList) {
        for (int productId : arr) {
            if (buyList.get(productId) != 0) {
                return false;
            }
        }
        return true;
    }
}

