package Service;

import north.utils.Cardinfo;
import north.utils.connectionMysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class cardService {
    public int findUser(int id, String name) {
        connectionMysql con = new connectionMysql();
        Connection connection = con.openMsql();
        ResultSet res = con.select("SELECT upass FROM userinfo WHERE uid='"+id+"' and uname='" + name + "'");
        //定义变量保存查回来的密码
        String userpass = "";
        try {
            while (res.next()) {
                userpass = res.getString("upass");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (userpass.equals("") || userpass.equals(null)) {
            return 0;
        } else {
            return 1;
        }
    }

    public int findCard(int cardid) {
        connectionMysql con = new connectionMysql();
        Connection connection = con.openMsql();
        //查找卡号是否被占用
        ResultSet res = con.select("SELECT uid FROM cardinfo WHERE cardid='" + cardid + "'");
        String userid = "";
        try {
            while (res.next()) {
                userid = res.getString("uid");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (userid.equals("") || userid.equals(null)) {
            return 0;
        } else {
            return 1;
        }
    }

    public int findCardByUID(int uid) {
        connectionMysql con = new connectionMysql();
        Connection connection = con.openMsql();
        //查找卡号是否被占用
        ResultSet res = con.select("SELECT cardid FROM cardinfo WHERE uid='" + uid + "'");
        int i = 0;
        try {
            while (res.next()) {
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public int addCard(int uid, String name, int cardid, int balance) {
        connectionMysql con = new connectionMysql();
        Connection connection = con.openMsql();
        //先查找卡号是否被占用
        if (findCard(cardid) == 0) {
            //再查找用户名下的卡个数
            if (findCardByUID(uid) < 3) {
                con.Update("INSERT INTO cardinfo(uid,uname,cardid,balance) values ('" + uid + "','" + name + "','" + cardid + "','" + balance + "')");
                return 0;
            } else {
                return 2;
            }
        } else {
            return 1;
        }
    }

    public List<Cardinfo> getCard(){
        List<Cardinfo> list=new ArrayList<>();
        connectionMysql a=new connectionMysql();
        a.openMsql();
        ResultSet select=a.select("select * from cardinfo");
        try {
            while (select.next()){
                Cardinfo user=new Cardinfo(select.getInt("uid" ),select.getString("uname"),select.getInt("cardid"),select.getInt("balance"));
                list.add(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public int deleteCard(int id) {
        connectionMysql connectionMysql = new connectionMysql();
        connectionMysql.openMsql();
        if (findCard(id)==1) {
            connectionMysql.Update("delete from cardinfo where cardid=" + id);
            return 0;
        } else {
            return 1;
        }
    }

    //修改
    public int updateCard(Cardinfo c) {
        if(findUser(c.getUid(),c.getUname())==0){//修改不合法,查无此人
            return 2;
        }
        connectionMysql connectionMysql = new connectionMysql();
        connectionMysql.openMsql();
        String sql = "update cardinfo set uname='" + c.getUname() + "',uid='" + c.getUid() +
                "',balance='" + c.getBalance() + "' where cardid='" + c.getCardid() + "'";
        int update = connectionMysql.Update(sql);
        return update;
    }
}
