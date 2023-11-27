package zijie.view;

import zijie.model.User;
import zijie.service.UserService;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class LoginFrame extends JFrame implements ActionListener {
    private JTextField accountField = new JTextField();
    private JLabel accountLabel = new JLabel("Account :");
    private JPasswordField passwordField = new JPasswordField();
    private JLabel passwordLabel = new JLabel("Password :");
    private JPanel inputPanel = new JPanel();
    private JButton loginBtn = new JButton("Login");
    private JButton exitBtn = new JButton("Exit");
    private JPanel buttonPanel = new JPanel();

    public LoginFrame(){
        //buttonPanel
        buttonPanel.setLayout(new FlowLayout());
        buttonPanel.add(loginBtn);
        buttonPanel.add(exitBtn);
        loginBtn.addActionListener(this);
        exitBtn.addActionListener(this);
        //inputPanel
        inputPanel.setLayout(null);
        accountLabel.setBounds(50,20,80,20);
        passwordLabel.setBounds(50,60,80,20);
        inputPanel.add(accountLabel);
        inputPanel.add(passwordLabel);
        accountField.setBounds(140,20,160,20);
        passwordField.setBounds(140,60,160,20);
        inputPanel.add(accountField);
        inputPanel.add(passwordField);
        // Make it visiable
        Container cp = this.getContentPane();
        cp.setLayout(new BorderLayout());
        cp.add(inputPanel, BorderLayout.CENTER);
        cp.add(buttonPanel, BorderLayout.SOUTH);
        pack(); // Pack the UI components, instead of setSize()
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setTitle("Login");
        setBounds(600,300,350,180);
        setVisible(true);
    }
    public static void main(String[] args) {
        SwingUtilities.invokeLater(LoginFrame::new);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource()==loginBtn){
            String account = accountField.getText();
            String password = new String(passwordField.getPassword());
            UserService userService = new UserService();
            if(userService.login(account,password)){
                JOptionPane.showMessageDialog(null,"Login successfully!");
                dispose();
                new MainFrame(userService);
            }
            else{
                JOptionPane.showMessageDialog(null,"Login failed!");
            }
        }
        else if(e.getSource()==exitBtn){
            dispose();
        }
    }
}