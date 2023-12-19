package minesweeper;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
/**
 * 这个类是扫雷游戏下方的开始游戏区域。
 * 同时，这个类实现了ActionListener接口，可以对开始新游戏的行为进行监听处理。
 * 单击开始游戏后，该区域将显示Easy,Intermediate,Difficult三种难度供玩家选择。
 * 玩家选择后以对应难度开始游戏。
 */
public class NewGamePanel extends JPanel implements ActionListener {
    private JButton btnNewGame = new JButton("New Game");
    private JButton btnEasy = new JButton("Easy");
    private JButton btnIntermediate = new JButton("Intermediate");
    private JButton btnDifficult = new JButton("Difficult");
    private MineSweeperMain frame;//当前的游戏主面板
    public static final int EASY = 1;
    public static final int INTERMEDIATE = 2;
    public static final int DIFFICULT = 3;
    public NewGamePanel(MineSweeperMain frame){
        this.frame=frame;
        add(btnNewGame);
        //为按钮添加鼠标监听器，即新游戏面板自身
        btnNewGame.addActionListener(this);
        btnEasy.addActionListener(this);
        btnIntermediate.addActionListener(this);
        btnDifficult.addActionListener(this);
    }
    @Override
    public void actionPerformed(ActionEvent e) {
        removeAll();
        if(e.getSource()==btnNewGame||e.getSource()==frame.menu.menuItemNewGame){//单击新游戏按钮时，让用户选择游戏难度
            add(btnEasy);
            add(btnIntermediate);
            add(btnDifficult);
            updateUI();
        }
        else{//单击难度按钮时，以对应难度开始游戏
            add(btnNewGame);
            updateUI();
            if(e.getSource()==btnEasy){
                frame.board.newGame(EASY);
            }
            if(e.getSource()==btnIntermediate){
                frame.board.newGame(INTERMEDIATE);
            }
            if(e.getSource()==btnDifficult){
                frame.board.newGame(DIFFICULT);
            }
        }
    }
}
