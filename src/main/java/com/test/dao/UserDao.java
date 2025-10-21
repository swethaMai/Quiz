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
	
	public static boolean updatePassword(String username, String newPassword) {
	    boolean result = false;
	    try (Connection conn = DBConnection.getConnection()) {
	        String sql = "UPDATE users SET password = ? WHERE username = ?";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setString(1, newPassword);
	        stmt.setString(2, username);
	        result = stmt.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}
	
	public static boolean registerNewUser(String username, String password) {
	    try (Connection conn = DBConnection.getConnection()) {
	        String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, 'user')";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setString(1, username);
	        stmt.setString(2, password);
	        return stmt.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	 public static int getUserId(String username) {
	        int userId = -1;
	        try (Connection conn = DBConnection.getConnection()) {
	            String sql = "SELECT id FROM users WHERE username = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, username);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                userId = rs.getInt("id");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return userId;
	    }
}
