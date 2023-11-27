package zijie.model;

public class Card {
    public int idcard;
    public int balance;
    int iduser;
    public Card(int idcard, int balance, int iduser) {
        this.idcard = idcard;
        this.balance = balance;
        this.iduser = iduser;
    }
}
