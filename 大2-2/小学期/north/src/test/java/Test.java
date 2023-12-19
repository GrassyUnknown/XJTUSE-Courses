
import north.utils.connectionMysql;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Test {
    public void test() throws SQLException {
        connectionMysql connectionMysql = new connectionMysql();
        connectionMysql.openMsql();
        ResultSet resultSet = connectionMysql.select("SELECT * FROM employees.departments;");

        // 遍历ResultSet并输出数据
        while (resultSet.next()) {
            // 根据具体的表结构，使用对应的get方法获取相应的字段值
            String departmentId = resultSet.getString("dept_no");
            String departmentName = resultSet.getString("dept_name");
            // 输出字段值
            System.out.println("Department ID: " + departmentId);
            System.out.println("Department Name: " + departmentName);
            System.out.println("----------------------");
        }

        // 关闭ResultSet和数据库连接
        resultSet.close();
        connectionMysql.close();
    }
}

