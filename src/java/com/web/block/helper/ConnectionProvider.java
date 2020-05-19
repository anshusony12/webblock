package com.web.block.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

    public static Connection con;

    public static Connection getConnection() {
        try {
            if(con==null){
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/webblock", "root", "root");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

}
