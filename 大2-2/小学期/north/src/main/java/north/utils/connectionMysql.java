package north.utils;

import java.sql.*;

public class connectionMysql {
    Connection connection=null;
    ResultSet resultSet =null;

    public Connection openMsql(){
        try{
            //加载一个驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            int c=1;
            String url="jdbc:mysql://127.0.0.1:3306/users?serverTimezone=UTC";
            String userName="root";
            String passWord="1352688";
            //联通数据库的方式
            connection = DriverManager.getConnection(url, userName, passWord);
        }catch(Exception e){
            e.printStackTrace();
        }
        return connection;
    }
    //增删改
    public int Update(String sql){
        int i=0;
        try{
            Statement statement = connection.createStatement();
            i = statement.executeUpdate(sql);
        }catch (Exception e){
            e.printStackTrace();
        }
        return i;

    }
    //查询
    public ResultSet select(String sql){
        try{
            Statement statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultSet;

    }
    //关闭链接
    public void close() throws SQLException {
        if(resultSet !=null && !resultSet.isClosed()){
            resultSet.close();
        }
    }


}
