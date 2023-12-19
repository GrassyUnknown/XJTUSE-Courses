package minesweeper;

import javax.swing.*;
import java.awt.*;
import java.io.Serial;


/**
 * 扫雷游戏的主程序。
 * 定义了扫雷游戏的主面板，其中包括了菜单面板、游戏面板和新游戏面板。
 */
public class MineSweeperMain extends JFrame {
    @Serial
    private static final long serialVersionUID = 1L;
    //为每个面板都传入主面板，以便它们对主面板或者主面板中的其它面板进行操作
    public GameBoardPanel board = new GameBoardPanel(this);
    public NewGamePanel newGame = new NewGamePanel(this);
    public GameMenuPanel menu = new GameMenuPanel(this);

    public MineSweeperMain(){
        Container cp = this.getContentPane();
        cp.setLayout(new BorderLayout());
        board.newGame(NewGamePanel.EASY);
        cp.add(menu,BorderLayout.NORTH);
        cp.add(board, BorderLayout.CENTER);
        cp.add(newGame, BorderLayout.SOUTH);
        pack(); // Pack the UI components, instead of setSize()
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setTitle("Minesweeper");
        setVisible(true);
    }
    public static void main(String[] args){
        // 使用安全的方式启动下面的构造函数
        SwingUtilities.invokeLater(MineSweeperMain::new);
    }
}