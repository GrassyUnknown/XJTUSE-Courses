package zijie.dao;

import zijie.model.User;
import zijie.util.ConnectionMysql;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    public static User selectByID(int iduser) {
        ConnectionMysql connectionMysql = new ConnectionMysql();
        String sql = "select * from user where "+iduser+" = iduser";
        ResultSet resultSet = connectionMysql.select(sql);
        try {
            if (resultSet.next()) {
                User user = new User(resultSet.getInt("iduser"), resultSet.getString("name"), resultSet.getString("password"), resultSet.getString("intro"), resultSet.getInt("idroles"));
                return user;
            }
            else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static int deleteByID(int iduser) {
        ConnectionMysql connectionMysql = new ConnectionMysql();
        String sql = "delete from user where "+iduser+" = iduser";
        return connectionMysql.update(sql);
    }

    public static int update(User user) {
        ConnectionMysql connectionMysql = new ConnectionMysql();
        String sql = "update user set name = '"+user.name+"',password = '"+user.password+"',intro = '"+user.intro+"',idroles = '"+user.idroles+"' where "+user.iduser+" = iduser";
        return connectionMysql.update(sql);
    }
}
