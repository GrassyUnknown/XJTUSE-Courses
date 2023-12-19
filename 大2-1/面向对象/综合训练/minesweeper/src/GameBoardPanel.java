package minesweeper;
import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.io.Serial;

/**
 * 这是扫雷游戏的游戏面板，即雷区。
 * 单击鼠标左键对单元格执行挖雷操作。
 * 单击鼠标右键用来对单元格执行添加标记，或者移除标记，标记疑似有地雷的单元格。
 * 如果所有没有地雷的单元格都执行了挖雷操作，或玩家标记了所有地雷，那么玩家赢得游戏。
 * 如果对某个有地雷的单元格执行了挖雷操作，那么玩家输。
  */

public class GameBoardPanel extends JPanel {
    @Serial
    private static final long serialVersionUID = 1L;
    // 设定了“棋盘”中有多少个Cell对象
    public static int ROWS;
    public static int COLS;
    // 每一个Cell对象的尺寸大小，依次大小再去计算“棋盘”的大小
    public static int CELL_SIZE = 35;
    private MineSweeperMain frame;
    public Cell[][] cells;
    int numMines = 10;
    public GameBoardPanel(MineSweeperMain frame){this.frame=frame;}
    public void newGame(int difficulty){
        switch (difficulty) {//根据难度调整大小和地雷数量
            case (NewGamePanel.EASY) -> {
                ROWS = 10;
                COLS = 10;
                numMines = 10;
            }
            case (NewGamePanel.INTERMEDIATE) -> {
                ROWS = 15;
                COLS = 15;
                numMines = 20;
            }
            case (NewGamePanel.DIFFICULT) -> {
                ROWS = 20;
                COLS = 20;
                numMines = 30;
            }
        }
        cells=new Cell[ROWS][COLS];
        super.setLayout(new GridLayout(ROWS, COLS, 1, 1));
        CellMouseListener listener = new CellMouseListener();//为所有的Cell单元对象创建一个共享的鼠标事件监听器
        MineMap mineMap = new MineMap(ROWS,COLS,numMines);//通过MineMap获得新游戏中的地雷数据的布局
        super.removeAll();//清空上次游戏里的Cell
        for(int row = 0; row < ROWS; ++row){
            for(int col = 0; col < COLS; ++col){
                cells[row][col] = new Cell(row, col);
                cells[row][col].addMouseListener(listener);
                cells[row][col].newCell(mineMap.isMined[row][col]);
                super.add(cells[row][col]);
            }
        }
        //根据
        super.setPreferredSize(new Dimension(CELL_SIZE * COLS, CELL_SIZE * ROWS));
        frame.menu.refreshBar();
        frame.menu.startClock();
        frame.pack();
    }
    public void resetGame(){
        for(int row = 0; row < ROWS; ++row){
            for(int col = 0; col < COLS; ++col){
                cells[row][col].isRevealed=false;
                cells[row][col].isFlagged=false;
                cells[row][col].paint();
            }
        }
        frame.menu.refreshBar();
        frame.menu.startClock();
    }
    // 获得[srcRow, srcCol]Cell单元对象周围的8个邻居的地雷总数
    private int getSurroundingMines(int srcRow, int srcCol){
        int numMines = 0;
        for(int row = srcRow-1; row <= srcRow+1; ++row){
            for(int col = srcCol-1; col <= srcCol+1; ++col){
                if(row >= 0 && row < ROWS && col >= 0 && col < COLS)
                    if(cells[row][col].isMined) numMines++;
            }
        }
        return numMines;
    }
    // 对[srcRow, srcCol]Cell单元对象执行挖雷操作
    // 如果该单元格对象中的标记的雷的数量为0，那么就自动递归对其周围8个邻居执行挖雷操作
    private void revealCell(int srcRow, int srcCol){
        int numMines = getSurroundingMines(srcRow, srcCol);
        cells[srcRow][srcCol].setText(numMines + "");
        cells[srcRow][srcCol].isRevealed = true;
        cells[srcRow][srcCol].isFlagged = false;
        cells[srcRow][srcCol].paint();
        if(numMines == 0){
            for(int row = srcRow-1; row <= srcRow+1; ++row){
                for(int col = srcCol-1; col <= srcCol+1; ++col){
                    if(row >= 0 && row < ROWS && col >= 0 && col < COLS)
                        if(!cells[row][col].isRevealed) revealCell(row, col);
                }
            }
        }
    }
    // 用来判断玩家是否已经赢得此次游戏
    public boolean hasWon(){
        // 获胜条件1：所有单元格都成功执行了挖雷操作
        // 获胜条件2：所有的地雷都被标记
        for(Cell[] cellList: cells){for(Cell cell:cellList){//对于每一个单元格
            if(!(cell.isMined||cell.isRevealed)){//不满足获胜条件1
                for(Cell[] cellList2: cells){for(Cell cell2:cellList2){//对于每一个单元格
                    if(cell2.isMined&&!cell2.isFlagged){//不满足获胜条件2
                        return false;
                    }
                }}
                return true;//满足获胜条件2
            }
        }}
        return true;//满足获胜条件1
    }
    // 定义一个内部类，该类的作用为鼠标事件监听器
    private class CellMouseListener extends MouseAdapter{
        public void mouseClicked(MouseEvent e){
            // 获得触发此次鼠标事件的Cell对象
            Cell sourceCell = (Cell)e.getSource();
            // 获得鼠标事件的类型，MouseEvent.BUTTON1为单击鼠标左键
            if(e.getButton() == MouseEvent.BUTTON1) {
                sourceCell.isFlagged=false;//单击左键时需移除旗子
                // 如果当前Cell对象里面有地雷，则游戏结束；否则对该Cell对象执行挖雷操作
                if (sourceCell.isMined) {
                    frame.menu.timer.stop();
                    JOptionPane.showMessageDialog(frame,"Game over!","Game over!",JOptionPane.INFORMATION_MESSAGE,new ImageIcon("assets/mine.png"));
                    sourceCell.setIcon(new ImageIcon("assets/mine.png"));
                } else {
                    revealCell(sourceCell.row, sourceCell.col);
                }
            }
            else if(e.getButton() == MouseEvent.BUTTON3){ //MouseEvent.BUTTON3为单击鼠标右键
                // 果该Cell对象上插了旗子，那么就去掉旗子；否则插上旗子。
                if(sourceCell.isFlagged || sourceCell.isRevealed){//如果该Cell对象已经被挖雷，不应插上旗子
                    sourceCell.isFlagged=false;
                    sourceCell.paint();
                }
                else{
                    sourceCell.isFlagged=true;
                    sourceCell.paint();
                }
            }
            frame.menu.refreshBar();
            if(hasWon()){
                frame.menu.timer.stop();
                JOptionPane.showMessageDialog(frame,"You win! Time:"+frame.menu.timeBar.getText(),"You win!",JOptionPane.PLAIN_MESSAGE);
            }
        }
    }
}
