import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MyFrame extends JFrame {

    private JButton myButton = new JButton("Click");
    private JTextField myTextField = new JTextField("");
    private ButtonListener myListener = new ButtonListener();
    int click = 0;

    public MyFrame(){
        Container cp = this.getContentPane();
        cp.setLayout(new BorderLayout());
        cp.add(myButton,BorderLayout.NORTH);
        cp.add(myTextField,BorderLayout.SOUTH);
        myButton.addActionListener(myListener);
        pack();
        setTitle("Event Processing Test");
        setVisible(true);
    }
    private class ButtonListener implements ActionListener{
        @Override
        public void actionPerformed(ActionEvent e) {
            click++;
            myTextField.setText("Clicked "+click);
            myTextField.updateUI();
        }
    }
}
