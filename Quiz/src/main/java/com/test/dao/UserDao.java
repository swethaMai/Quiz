package com.test.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.test.util.DBConnection;

public class UserDao {
	public static boolean checkUser(String username,String pass, String role) 
    {
        boolean st = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from users where username=? and password=? and role=?");
            ps.setString(1, username);
            ps.setString(2, pass);
            ps.setString(3, role);
            ResultSet rs =ps.executeQuery();
            st = rs.next();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return st;                 
    }   
}
