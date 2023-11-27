package zijie.model;

public class Permission {
    public int idpermission;
    public String name;
    public String intro;
    public Permission(int idpermission, String name, String intro) {
        this.idpermission = idpermission;
        this.name = name;
        this.intro = intro;
    }
}
