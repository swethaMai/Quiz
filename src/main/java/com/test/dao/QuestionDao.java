package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.test.model.Question;
import com.test.util.DBConnection;

public class QuestionDao {
    public static boolean addQuestion(String q, String a, String b, String c, String d, String ans) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO questions (question, optionA, optionB, optionC, optionD, answer) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, q);
            ps.setString(2, a);
            ps.setString(3, b);
            ps.setString(4, c);
            ps.setString(5, d);
            ps.setString(6, ans);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static List<Question> getAllQuestions() {
        List<Question> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM questions";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuestion(rs.getString("question"));
                q.setOptionA(rs.getString("optionA"));
                q.setOptionB(rs.getString("optionB"));
                q.setOptionC(rs.getString("optionC"));
                q.setOptionD(rs.getString("optionD"));
                q.setAnswer(rs.getString("answer"));
                list.add(q);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static Question getQuestionById(int id) {
        Question q = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM questions WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuestion(rs.getString("question"));
                q.setOptionA(rs.getString("optionA"));
                q.setOptionB(rs.getString("optionB"));
                q.setOptionC(rs.getString("optionC"));
                q.setOptionD(rs.getString("optionD"));
                q.setAnswer(rs.getString("answer"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return q;
    }
    
    public static void updateQuestion(int id, String question, String a, String b, String c, String d, String answer) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE questions SET question=?, optionA=?, optionB=?, optionC=?, optionD=?, answer=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, question);
            stmt.setString(2, a);
            stmt.setString(3, b);
            stmt.setString(4, c);
            stmt.setString(5, d);
            stmt.setString(6, answer);
            stmt.setInt(7, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void deleteQuestion(int id) {
        try (Connection conn = DBConnection.getConnection()) {
            String unlinkSql = "DELETE FROM quizQuestion WHERE questionId = ?";
            PreparedStatement unlinkStmt = conn.prepareStatement(unlinkSql);
            unlinkStmt.setInt(1, id);
            unlinkStmt.executeUpdate();

            String sql = "DELETE FROM questions WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
