package zijie.dao;

import zijie.model.Permission_Roles;
import zijie.model.Roles;
import zijie.util.ConnectionMysql;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Permission_RolesDao {
    public static Permission_Roles selectByID(int idroles,int idpermission) {
        ConnectionMysql connectionMysql = new ConnectionMysql();
        String sql = "select * from permission_roles where "+idroles+" = roles_idroles and "+idpermission+" = permission_idpermission";
        ResultSet resultSet = connectionMysql.select(sql);
        try {
            if (resultSet.next()) {
                Permission_Roles pr = new Permission_Roles(resultSet.getInt("roles_idroles"),resultSet.getInt("permission_idpermission"));
                return pr;
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
