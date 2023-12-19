package org.example;


import java.sql.*;

public class Main {
    public static void main(String[] args) throws SQLException {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","1352688");
        Statement stat = conn.createStatement();
        stat.execute("SELECT * FROM bus_manage.busstop");
        System.out.println("I am here.");
    }
}