package zijie.model;

public class User {
    public int iduser;
    public String name;
    public String password;
    public String intro;
    public int idroles;
    public User(int iduser, String name, String password, String intro, int idroles) {
        this.iduser = iduser;
        this.name = name;
        this.password = password;
        this.intro = intro;
        this.idroles = idroles;
    }
}
