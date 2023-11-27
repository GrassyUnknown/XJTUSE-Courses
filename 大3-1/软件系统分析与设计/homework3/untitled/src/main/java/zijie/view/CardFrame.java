package zijie.view;

import zijie.model.Card;
import zijie.model.Permission_Roles;
import zijie.service.CardService;
import zijie.service.Permission_RolesService;
import zijie.service.UserService;

import javax.swing.*;
import javax.swing.text.JTextComponent;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class CardFrame extends JFrame implements ActionListener {
    private JLabel attention = new JLabel("Card ID :");
    private JTextField cardidField = new JTextField(10);
    private JButton searchButton = new JButton("Search");
    private JPanel searchPanel = new JPanel();
    private JTextPane cardinfo = new JTextPane();
    private JButton backButton = new JButton("Back");
    private JButton chargeButton = new JButton("Charge");
    private JButton consumeButton = new JButton("Consume");
    private JButton deleteButton = new JButton("Delete");
    private JButton editButton = new JButton("Edit");
    private JPanel buttons = new JPanel();
    private UserService userService;
    private Card myCard;
    private Card findingCard;

    public CardFrame(UserService userService){
        this.userService=userService;
        Container cp = this.getContentPane();
        cp.setLayout(new BorderLayout());
        buttons.add(backButton);
        backButton.addActionListener(this);
        searchButton.addActionListener(this);
        chargeButton.addActionListener(this);
        consumeButton.addActionListener(this);
        deleteButton.addActionListener(this);
        editButton.addActionListener(this);
        if(Permission_RolesService.findRolePermission(userService.user.idroles,"SearchCard")){
            searchPanel.add(attention);
            searchPanel.add(cardidField);
            searchPanel.add(searchButton);
            cp.add(searchPanel,BorderLayout.NORTH);
        }
        if(Permission_RolesService.findRolePermission(userService.user.idroles,"ChargeCard")) {
            buttons.add(chargeButton);
        }
        if(Permission_RolesService.findRolePermission(userService.user.idroles,"ConsumeCard")) {
            buttons.add(consumeButton);
        }
        if(Permission_RolesService.findRolePermission(userService.user.idroles,"DeleteCard")) {
            buttons.add(deleteButton);
        }
        if(Permission_RolesService.findRolePermission(userService.user.idroles,"EditCard")) {
            buttons.add(editButton);
        }
        cp.add(buttons,BorderLayout.SOUTH);
        myCard= CardService.findCardByUser(userService.user.iduser);
        String cardinfoText = "Your card ID : " + myCard.idcard + "\n" + "Balance : " + myCard.balance;
        cardinfo.setText(cardinfoText);
        cp.add(cardinfo,BorderLayout.CENTER);
        pack(); // Pack the UI components, instead of setSize()
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setTitle("Card Management");
        setBounds(600,300,350,180);
        setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource()==backButton){
            dispose();
            new MainFrame(userService);
        }
        if(e.getSource()==searchButton){
            if(Permission_RolesService.findRolePermission(userService.user.idroles,"SearchCard")) {
                String cardid = cardidField.getText();
                findingCard = myCard;
                if (!cardid.equals("")) {
                    findingCard = CardService.findCardByID(Integer.parseInt(cardid));
                }
                if (findingCard == null) {
                    JOptionPane.showMessageDialog(null, "Card not found!");
                } else {
                    String cardinfoText = "Card ID : " + findingCard.idcard + "\n" + "Balance : " + findingCard.balance;
                    cardinfo.setText(cardinfoText);
                }
            }
            else {
                JOptionPane.showMessageDialog(null,"You don't have the permission to search card!");
            }
        }
        if(e.getSource()==chargeButton) {
            if (Permission_RolesService.findRolePermission(userService.user.idroles, "ChargeCard")) {
                String charge = JOptionPane.showInputDialog("Please input the amount of money you want to charge:");
                if (charge != null) {
                    if (charge.equals("")) {
                        JOptionPane.showMessageDialog(null, "Please input the amount of money you want to charge!");
                    } else {
                        int chargeMoney = Integer.parseInt(charge);
                        if (chargeMoney <= 0) {
                            JOptionPane.showMessageDialog(null, "Please input a positive number!");
                        } else {
                            findingCard.balance += chargeMoney;
                            if (CardService.updateCard(findingCard) == 0) {
                                JOptionPane.showMessageDialog(null, "Charge failed!");
                            } else {
                                JOptionPane.showMessageDialog(null, "Charge successfully!");
                            }
                            findingCard = CardService.findCardByID(findingCard.idcard);
                            String cardinfoText = "Card ID : " + findingCard.idcard + "\n" + "Balance : " + findingCard.balance;
                            cardinfo.setText(cardinfoText);
                        }
                    }
                }
            } else {
                JOptionPane.showMessageDialog(null, "You don't have the permission to charge card!");
            }
        }
        if(e.getSource()==consumeButton){
            if(Permission_RolesService.findRolePermission(userService.user.idroles,"ConsumeCard")) {
                String consume = JOptionPane.showInputDialog("Please input the amount of money you want to consume:");
                if (consume != null) {
                    if (consume.equals("")) {
                        JOptionPane.showMessageDialog(null, "Please input the amount of money you want to consume!");
                    } else {
                        int consumeMoney = Integer.parseInt(consume);
                        if (consumeMoney <= 0) {
                            JOptionPane.showMessageDialog(null, "Please input a positive number!");
                        } else {
                            if (consumeMoney > findingCard.balance) {
                                JOptionPane.showMessageDialog(null, "Your balance is not enough!");
                            } else {
                                findingCard.balance -= consumeMoney;
                                if (CardService.updateCard(findingCard) == 0) {
                                    JOptionPane.showMessageDialog(null, "Consume failed!");
                                } else {
                                    JOptionPane.showMessageDialog(null, "Consume successfully!");
                                }
                                findingCard = CardService.findCardByID(findingCard.idcard);
                                String cardinfoText = "Card ID : " + findingCard.idcard + "\n" + "Balance : " + findingCard.balance;
                                cardinfo.setText(cardinfoText);
                            }
                        }
                    }
                }
            }
            else {
                JOptionPane.showMessageDialog(null,"You don't have the permission to consume card!");
            }
        }
        if(e.getSource()==deleteButton){
            if(Permission_RolesService.findRolePermission(userService.user.idroles,"DeleteCard")) {
                int result = JOptionPane.showConfirmDialog(null, "Are you sure to delete this card?", "Delete", JOptionPane.YES_NO_OPTION);
                if (result == JOptionPane.YES_OPTION) {
                    if (CardService.deleteCard(findingCard) == 0) {
                        JOptionPane.showMessageDialog(null, "Delete failed!");
                    } else {
                        JOptionPane.showMessageDialog(null, "Delete successfully!");
                    }
                    dispose();
                    new MainFrame(userService);
                }
            }
            else {
                JOptionPane.showMessageDialog(null,"You don't have the permission to delete card!");
            }
        }
        if(e.getSource()==editButton){
            if(Permission_RolesService.findRolePermission(userService.user.idroles,"EditCard")) {
                String balance = JOptionPane.showInputDialog("Please input the new balance:");
                if (balance != null) {
                    if (balance.equals("")) {
                        JOptionPane.showMessageDialog(null, "Please input the new balance!");
                    } else {
                        int newBalance = Integer.parseInt(balance);
                        if (newBalance < 0) {
                            JOptionPane.showMessageDialog(null, "Please input a positive number!");
                        } else {
                            findingCard.balance = newBalance;
                            if (CardService.updateCard(findingCard) == 0) {
                                JOptionPane.showMessageDialog(null, "Edit failed!");
                            } else {
                                JOptionPane.showMessageDialog(null, "Edit successfully!");
                            }
                            findingCard = CardService.findCardByID(findingCard.idcard);
                            String cardinfoText = "Card ID : " + findingCard.idcard + "\n" + "Balance : " + findingCard.balance;
                            cardinfo.setText(cardinfoText);
                        }
                    }
                }
            }
            else {
                JOptionPane.showMessageDialog(null,"You don't have the permission to edit card!");
            }
        }
    }
}
