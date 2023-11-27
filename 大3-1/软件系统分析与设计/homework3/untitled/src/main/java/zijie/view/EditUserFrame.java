package zijie.view;

import zijie.model.User;
import zijie.service.UserService;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class EditUserFrame extends JFrame implements ActionListener {
    private User user;
    private JTextField nameField = new JTextField(10);
    private JTextField passwordField = new JTextField(10);
    private JTextField introField = new JTextField(10);
    private JButton confirmButton = new JButton("Confirm");
    private JButton cancelButton = new JButton("Cancel");
    private JPanel buttons = new JPanel();
    private JPanel editPanel = new JPanel();
    public EditUserFrame(User user){
        this.user=user;
        Container cp = this.getContentPane();
        cp.setLayout(new BoxLayout(cp,BoxLayout.Y_AXIS));
        editPanel.add(new JLabel("Name :"));
        editPanel.add(nameField);
        editPanel.add(new JLabel("Password :"));
        editPanel.add(passwordField);
        editPanel.add(new JLabel("Intro :"));
        editPanel.add(introField);
        cp.add(editPanel);
        buttons.add(confirmButton);
        buttons.add(cancelButton);
        confirmButton.addActionListener(this);
        cancelButton.addActionListener(this);
        cp.add(buttons);
        pack(); // Pack the UI components, instead of setSize()
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setTitle("User Edit");
        setBounds(600,300,350,180);
        setVisible(true);
    }
    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource()==confirmButton){
            if(!nameField.getText().equals(""))user.name=nameField.getText();
            if(!passwordField.getText().equals(""))user.password=passwordField.getText();
            if(!introField.getText().equals(""))user.intro=introField.getText();
            if(UserService.update(user)==0){
                JOptionPane.showMessageDialog(null,"Update failed!");
            }
            else{
                JOptionPane.showMessageDialog(null,"Update successfully!");
            }
            new UserFrame(new UserService(user));
            this.dispose();
        }
        else if(e.getSource()==cancelButton){
            new UserFrame(new UserService(user));
            this.dispose();
        }
    }
}
