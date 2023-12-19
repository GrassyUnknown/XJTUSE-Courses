package minesweeper;

import javax.swing.*;
import java.awt.*;
/**
 * 这个类是扫雷游戏上方的菜单栏、进度条和计时器部分。
 * 菜单栏中有一个File菜单，它又包含三个菜单项。
 * 进度条和计时器均使用JTextField实现，并被添加到一个JPanel中。
 */
public class GameMenuPanel extends JPanel {
    private JMenuBar menuBar = new JMenuBar();//菜单栏
    private JMenu menuFile = new JMenu("File");//一级菜单
    public JMenuItem menuItemNewGame = new JMenuItem("New Game");
    private JMenuItem menuItemResetGame = new JMenuItem("Reset Game");
    private JMenuItem menuItemExit = new JMenuItem("Exit");
    private JPanel progressAndTimePanel = new JPanel();
    private JTextField progressBar = new JTextField();
    public JTextField timeBar = new JTextField("00:00");
    public Timer timer;
    private long timeStart;
    private MineSweeperMain frame;//扫雷的主面板

    public GameMenuPanel(MineSweeperMain frame){
        this.frame=frame;
        setLayout(new BorderLayout());
        //添加菜单栏、添加菜单、添加菜单项、为菜单项添加监听器
        add(menuBar, BorderLayout.CENTER);
        menuBar.add(menuFile);
        menuFile.add(menuItemNewGame);
        menuFile.add(menuItemResetGame);
        menuFile.add(menuItemExit);
        menuItemNewGame.addActionListener(frame.newGame);
        menuItemResetGame.addActionListener(e -> frame.board.resetGame());
        menuItemExit.addActionListener(e -> frame.dispose());
        add(progressAndTimePanel,BorderLayout.SOUTH);
        //添加进度条和计时栏、给该栏添加进度条、添加计时器
        progressAndTimePanel.setLayout(new BorderLayout());
        progressAndTimePanel.add(progressBar,BorderLayout.WEST);
        progressAndTimePanel.add(timeBar,BorderLayout.EAST);
    }

    public void refreshBar() {
        int notFoundMines=frame.board.numMines;
        for(int row = 0; row < GameBoardPanel.ROWS; ++row){
            for(int col = 0; col < GameBoardPanel.COLS; ++col){
                if(frame.board.cells[row][col].isFlagged){
                    notFoundMines--;
                }
            }
        }
        String text = "剩余地雷数：" + notFoundMines + "/" + frame.board.numMines;
        if(notFoundMines>0){
            text+="⬛".repeat(notFoundMines);
        }
        progressBar.setText(text);
    }
    public void startClock(){
        timeBar.setText("00:00");
        timeStart=System.currentTimeMillis();
        timer = new Timer(1000, e -> {
            long timePeriod=System.currentTimeMillis()-timeStart;
            timeBar.setText(String.format("%02d:%02d",timePeriod/60000,(timePeriod/1000)%60));
        });
        timer.start();
    }
}
