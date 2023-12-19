package Service;


import north.utils.Userinfo;
import north.utils.connectionMysql;
import north.utils.stata;

import java.sql.Connection;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class userService {

    //登录方法
    public int logins(String name, String pass) {
        connectionMysql con = new connectionMysql();
        con.openMsql();
        //通过用户名去查询数据库中存储的密码
        ResultSet select = con.select("SELECT upass FROM userinfo WHERE uname='" + name + "'");
        //数据库中的密码
        String password = "";
        try {
            while (select.next()) {
                //将密码拿到
                password = select.getString("upass");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (password.equals(pass)) {
            //登陆成功
            return 1;
        } else if (password.equals("") || password.equals(null)) {
            //用户名密码错误
            return 0;
        } else {
            //该用户不存在
            return 2;
        }
    }

    //新的登录
    public stata login2(String name, String pass) {
        connectionMysql con = new connectionMysql();
        con.openMsql();
        //通过用户名去查询数据库中存储的密码
        ResultSet select = con.select("SELECT upass,uroot FROM userinfo WHERE uname='" + name + "'");
        //数据库中的密码
        String password = "";
        int root = 0;
        int re = 0;
        try {
            while (select.next()) {
                //将密码拿到
                password = select.getString("upass");
                root = select.getInt("uroot");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (password.equals(pass)) {
            //登陆成功
            re = 1;
        } else if (password.equals("") || password.equals(null)) {
            //用户名密码错误
            re = 0;
        } else {
            //该用户不存在
            re = 2;
        }
        stata sa = new stata(re, root);
        return sa;
    }

    public int addUser(int id, String name, String pass, int root) {
        //检验用户是否注册
        connectionMysql con = new connectionMysql();
        Connection connection = con.openMsql();
        ResultSet res = con.select("SELECT upass FROM userinfo WHERE uname='" + name + "'");
        //定义变量保存查回来的密码
        String userpass = "";
        int re = 0;
        try {
            while (res.next()) {
                userpass = res.getString("upass");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (userpass.equals("") || userpass.equals(null)) {
            re = con.Update("INSERT INTO userinfo(uid,uname,upass,uroot)VALUES('" + id + "','" + name + "','" + pass + "'," + root + ")");
        } else {
            re = 2;
        }
        return re;
    }

    //    获取所有数据
    public List<Userinfo> getUser() {
        List<Userinfo> list = new ArrayList<>();
        connectionMysql a = new connectionMysql();
        a.openMsql();
        ResultSet select = a.select("select * from userinfo");
        try {
            while (select.next()) {
                Userinfo user = new Userinfo(select.getInt("uid"), select.getString("uname"), select.getString("upass"), select.getInt("uroot"));
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //删除方法
    public int deleteUser(int id) {
        connectionMysql connectionMysql = new connectionMysql();
        connectionMysql.openMsql();
        if (id == 0) {
            return 0;
        } else {
            return connectionMysql.Update("delete from userinfo where uid=" + id);
        }
    }

    //修改
    public int updateUser(Userinfo u) {
        connectionMysql connectionMysql = new connectionMysql();
        connectionMysql.openMsql();
        String sql = "update userinfo set uname='" + u.getUname() + "',upass='" + u.getUpass() +
                "',uroot=" + u.getUroot() + " where uid=" + u.getUid();
        System.out.println(sql);
        int update = connectionMysql.Update(sql);
        return update;
    }
}

