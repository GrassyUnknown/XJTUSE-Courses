package zijie.view;

import zijie.model.User;
import zijie.service.CardService;
import zijie.service.Permission_RolesService;
import zijie.service.UserService;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class UserFrame extends JFrame implements ActionListener {
    private JLabel attention = new JLabel("User ID :");
    private JTextField cardidField = new JTextField(10);
    private JButton searchButton = new JButton("Search");
    private JPanel searchPanel = new JPanel();
    private JTextPane userinfo = new JTextPane();
    private JButton backButton = new JButton("Back");
    private JButton deleteButton = new JButton("Delete");
    private JButton editButton = new JButton("Edit");
    private JPanel buttons = new JPanel();
    private UserService userService;
    private User user;
    public UserFrame(UserService userService){
        this.userService=userService;
        Container cp = this.getContentPane();
        cp.setLayout(new BorderLayout());
        buttons.add(backButton);
        buttons.add(editButton);
        backButton.addActionListener(this);
        searchButton.addActionListener(this);
        deleteButton.addActionListener(this);
        editButton.addActionListener(this);
        if(Permission_RolesService.findRolePermission(userService.user.idroles,"SearchUser")){
            searchPanel.add(attention);
            searchPanel.add(cardidField);
            searchPanel.add(searchButton);
            cp.add(searchPanel,BorderLayout.NORTH);
        }
        if(Permission_RolesService.findRolePermission(userService.user.idroles,"DeleteUser")) {
            buttons.add(deleteButton);
        }
        cp.add(buttons,BorderLayout.SOUTH);
        user= userService.user;
        String userinfoText = "Your user ID : " + user.iduser + "\nName : " + user.name + "\nIntro:" + user.intro;
        userinfo.setText(userinfoText);
        cp.add(userinfo,BorderLayout.CENTER);
        pack(); // Pack the UI components, instead of setSize()
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setTitle("User Management");
        setBounds(600,300,350,180);
        setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource()==backButton){
            new MainFrame(userService);
            this.dispose();
        }
        else if(e.getSource()==searchButton){
            int iduser = Integer.parseInt(cardidField.getText());
            user = userService.searchUser(iduser);
            if(user==null){
                JOptionPane.showMessageDialog(null,"No such user!");
            }
            else{
                String userinfoText = "User ID : " + user.iduser + "\nName : " + user.name + "\nIntro:" + user.intro;
                userinfo.setText(userinfoText);
            }
        }
        else if(e.getSource()==deleteButton){
            int iduser = Integer.parseInt(cardidField.getText());
            if(userService.deleteUser(iduser)==1){
                JOptionPane.showMessageDialog(null,"Delete successfully!");
            }
            else{
                JOptionPane.showMessageDialog(null,"Delete failed!");
            }
        }
        else if(e.getSource()==editButton){
            new EditUserFrame(user);
            dispose();
        }
    }
}
