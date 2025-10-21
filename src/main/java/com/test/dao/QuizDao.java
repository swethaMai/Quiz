package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.test.model.Question;
import com.test.model.Quiz;
import com.test.model.UserScore;
import com.test.util.DBConnection;

public class QuizDao {
	public static int addQuizAndReturnId(String title, String category) {
	    int quizId = -1;
	    try (Connection conn = DBConnection.getConnection()) {
	        String sql = "INSERT INTO quiz (title, category) VALUES (?, ?)";
	        PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	        stmt.setString(1, title);
	        stmt.setString(2, category);
	        stmt.executeUpdate();
	        ResultSet rs = stmt.getGeneratedKeys();
	        if (rs.next()) {
	            quizId = rs.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return quizId;
	}

	public static void linkQuestionToQuiz(int quizId, int questionId) {
	    try (Connection conn = DBConnection.getConnection()) {
	        String sql = "INSERT INTO quizQuestion (quizId, questionId) VALUES (?, ?)";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setInt(1, quizId);
	        stmt.setInt(2, questionId);
	        stmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public static Map<Quiz, List<Question>> getAllQuizzesWithQuestions() {
	    Map<Quiz, List<Question>> quizMap = new LinkedHashMap<>();
	    try (Connection conn = DBConnection.getConnection()) {
	        String quizSql = "SELECT * FROM quiz";
	        PreparedStatement quizStmt = conn.prepareStatement(quizSql);
	        ResultSet quizRs = quizStmt.executeQuery();

	        while (quizRs.next()) {
	            Quiz quiz = new Quiz();
	            quiz.setId(quizRs.getInt("id"));
	            quiz.setQuizName(quizRs.getString("title"));
	            quiz.setCategory(quizRs.getString("category"));

	            String questionSql = "SELECT q.* FROM questions q JOIN quizQuestion qq ON q.id = qq.questionId WHERE qq.quizId = ?";
	            PreparedStatement questionStmt = conn.prepareStatement(questionSql);
	            questionStmt.setInt(1, quiz.getId());
	            ResultSet questionRs = questionStmt.executeQuery();

	            List<Question> questions = new ArrayList<>();
	            while (questionRs.next()) {
	                Question q = new Question();
	                q.setId(questionRs.getInt("id"));
	                q.setQuestion(questionRs.getString("question"));
	                q.setOptionA(questionRs.getString("optionA"));
	                q.setOptionB(questionRs.getString("optionB"));
	                q.setOptionC(questionRs.getString("optionC"));
	                q.setOptionD(questionRs.getString("optionD"));
	                q.setAnswer(questionRs.getString("answer"));
	                questions.add(q);
	            }

	            quizMap.put(quiz, questions);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return quizMap;
	}
	
	public static List<Quiz> getAllQuizzes() {
	    List<Quiz> list = new ArrayList<>();
	    try (Connection conn = DBConnection.getConnection()) {
	        String sql = "SELECT * FROM quiz";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            Quiz quiz = new Quiz();
	            quiz.setId(rs.getInt("id"));
	            quiz.setQuizName(rs.getString("title"));
	            quiz.setCategory(rs.getString("category"));
	            list.add(quiz);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	public static List<UserScore> getLeaderboardByQuizId(int quizId) {
	    List<UserScore> leaderboard = new ArrayList<>();
	    try (Connection conn = DBConnection.getConnection()) {
	        String sql = "SELECT u.username, qr.score FROM quizResults qr " +
	                     "JOIN users u ON qr.user_id = u.id " +
	                     "WHERE qr.quiz_id = ? ORDER BY qr.score DESC";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setInt(1, quizId);
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            UserScore us = new UserScore();
	            us.setUserName(rs.getString("username"));
	            us.setScore(rs.getInt("score"));
	            leaderboard.add(us);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return leaderboard;
	}
	
	 public static List<Question> getQuestionsForQuiz(int quizId) {
	        List<Question> questions = new ArrayList<>();
	        try (Connection conn = DBConnection.getConnection()) {
	            String sql = "SELECT q.* FROM questions q JOIN quizQuestion qq ON q.id = qq.questionId WHERE qq.quizId = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, quizId);
	            ResultSet rs = stmt.executeQuery();
	            while (rs.next()) {
	                Question q = new Question();
	                q.setId(rs.getInt("id"));
	                q.setQuestion(rs.getString("question"));
	                q.setOptionA(rs.getString("optionA"));
	                q.setOptionB(rs.getString("optionB"));
	                q.setOptionC(rs.getString("optionC"));
	                q.setOptionD(rs.getString("optionD"));
	                q.setAnswer(rs.getString("answer"));
	                questions.add(q);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return questions;
	    }

	    public static boolean saveQuizResult(int userId, int quizId, int score) {
	        boolean success = false;
	        try (Connection conn = DBConnection.getConnection()) {
	            String sql = "INSERT INTO quizResults (user_id, quiz_id, score) VALUES (?, ?, ?)";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, userId);
	            stmt.setInt(2, quizId);
	            stmt.setInt(3, score);
	            success = stmt.executeUpdate() > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return success;
	    }
	    
	    public static Quiz getQuizById(int id) {
	        Quiz quiz = null;
	        try (Connection conn = DBConnection.getConnection()) {
	            String sql = "SELECT * FROM quiz WHERE id = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, id);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                quiz = new Quiz();
	                quiz.setId(rs.getInt("id"));
	                quiz.setQuizName(rs.getString("title"));
	                quiz.setCategory(rs.getString("category"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return quiz;
	    }

	    public static void deleteQuiz(int id) {
	        try (Connection conn = DBConnection.getConnection()) {
	            String sql = "DELETE FROM quiz WHERE id = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, id);
	            stmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public static void updateQuiz(int id, String title, String category) {
	        try (Connection conn = DBConnection.getConnection()) {
	            String sql = "UPDATE quiz SET title = ?, category = ? WHERE id = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, title);
	            stmt.setString(2, category);
	            stmt.setInt(3, id);
	            stmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

}
