package zijie.dao;

import zijie.model.Permission;
import zijie.model.Roles;
import zijie.util.ConnectionMysql;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PermissionDao {
    public static Permission selectById(int idpermission) {
        ConnectionMysql connectionMysql = new ConnectionMysql();
        String sql = "select * from permission where "+idpermission+" = idpermission";
        ResultSet resultSet = connectionMysql.select(sql);
        try {
            if (resultSet.next()) {
                Permission permission=new Permission(resultSet.getInt("idpermission"),resultSet.getString("name"),resultSet.getString("intro"));
                return permission;
            }
            else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static Permission selectByName(String name) {
        ConnectionMysql connectionMysql = new ConnectionMysql();
        String sql = "select * from permission where \""+name+"\" = name";
        ResultSet resultSet = connectionMysql.select(sql);
        try {
            if (resultSet.next()) {
                Permission permission=new Permission(resultSet.getInt("idpermission"),resultSet.getString("name"),resultSet.getString("intro"));
                return permission;
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
