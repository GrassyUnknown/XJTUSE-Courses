package north.utils;

public class Cardinfo {
    private int uid;
    private String uname;
    private int cardid;
    private int balance;


    public Cardinfo(int uid, String uname, int cardid, int balance) {
        this.uid = uid;
        this.uname = uname;
        this.cardid = cardid;
        this.balance = balance;
    }

    public int getUid() {
        return uid;
    }

    public String getUname() {
        return uname;
    }

    public int getCardid() {
        return cardid;
    }

    public int getBalance() {
        return balance;
    }
}
