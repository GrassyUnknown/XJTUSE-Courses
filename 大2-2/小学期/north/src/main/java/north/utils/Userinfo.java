package north.utils;

public class Userinfo {
    private int uid;
    private String uname;
    private String upass;
    private int uroot;


    public Userinfo(int uid, String uname, String upass, int uroot) {
        this.uid = uid;
        this.uname = uname;
        this.upass = upass;
        this.uroot = uroot;
    }

    public int getUid() {
        return uid;
    }

    public String getUname() {
        return uname;
    }

    public String getUpass() {
        return upass;
    }

    public int getUroot() {
        return uroot;
    }
}
