package minesweeper;
import java.util.Random;

/** 这个类主要用来存储地雷在单元格中的位置， */
public class MineMap {
    boolean[][] isMined;
    public MineMap(int rows,int cols,int numMines){
        this.isMined = new boolean[rows][cols];
        Random randomNumber = new Random();
        for(int i=0;i<numMines;i++){
            int x=randomNumber.nextInt(0,GameBoardPanel.ROWS);
            int y=randomNumber.nextInt(0,GameBoardPanel.COLS);//随机生成一个放置地雷的位置
            if(!isMined[x][y]) isMined[x][y]=true;
            else i--;//若该位置已有地雷，此次随机作废
        }
    }
}