package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.test.util.DBConnection;

public class ParametersDao {
	public static int getTotalQuizzes() {
	    int count = 0;
	    try (Connection conn = DBConnection.getConnection()) {
	        String sql = "SELECT COUNT(*) FROM quiz";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}

	public static int getTotalUsers() {
	    int count = 0;
	    try (Connection conn = DBConnection.getConnection()) {
	        String sql = "SELECT COUNT(*) FROM users";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}

	public static int getTotalQuestions() {
	    int count = 0;
	    try (Connection conn = DBConnection.getConnection()) {
	        String sql = "SELECT COUNT(*) FROM questions";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}
}
