package zijie.view;

import zijie.service.UserService;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainFrame extends JFrame implements ActionListener {
    private JButton cardButton = new JButton("Manage card");
    private JButton userButton = new JButton("Manage user");
    private JPanel buttons = new JPanel();
    private JLabel label = new JLabel("Welcome to the card management system!");
    private JLabel userinfo = new JLabel();
    private UserService userService;
    public MainFrame(UserService userService){
        this.userService=userService;
        userinfo.setText("Welcome, "+userService.user.name+"!");
        cardButton.addActionListener(this);
        userButton.addActionListener(this);
        buttons.add(cardButton);
        buttons.add(userButton);
        Container cp = this.getContentPane();
        cp.setLayout(new BorderLayout());
        cp.add(buttons,BorderLayout.CENTER);
        cp.add(userinfo, BorderLayout.SOUTH);
        cp.add(label, BorderLayout.NORTH);
        pack(); // Pack the UI components, instead of setSize()
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setTitle("Card Management System");
        setBounds(600,300,350,100);
        setVisible(true);
    }
    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource()==cardButton){
            dispose();
            new CardFrame(userService);
        }
        else if(e.getSource()==userButton){
            dispose();
            new UserFrame(userService);
        }
    }
}
