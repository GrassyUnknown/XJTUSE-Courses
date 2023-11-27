package zijie.dao;

import zijie.model.Roles;
import zijie.model.User;
import zijie.util.ConnectionMysql;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RolesDao {
    public static Roles selectByID(int idroles) {
        ConnectionMysql connectionMysql = new ConnectionMysql();
        String sql = "select * from roles where "+idroles+" = idroles";
        ResultSet resultSet = connectionMysql.select(sql);
        try {
            if (resultSet.next()) {
                Roles roles=new Roles(resultSet.getInt("idroles"),resultSet.getString("name"),resultSet.getString("intro"));
                return roles;
            }
            else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
