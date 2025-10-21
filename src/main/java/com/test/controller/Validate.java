package com.test.controller;

import java.io.IOException;
import java.util.List;

import com.test.dao.QuizDao;
import com.test.dao.UserDao;
import com.test.model.Question;
import com.test.model.UserScore;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Validate")
public class Validate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int quizId = Integer.parseInt(request.getParameter("quizId"));
        List<Question> questions = QuizDao.getQuestionsForQuiz(quizId);

        int score = 0;
        for (Question q : questions) {
            String userAnswer = request.getParameter("q" + q.getId());
            if (userAnswer != null && userAnswer.equalsIgnoreCase(getAnswerLetter(q))) {
                score += 1; 
            }
        }

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        int userId = UserDao.getUserId(username);

        QuizDao.saveQuizResult(userId, quizId, score);

        List<UserScore> leaderboard = QuizDao.getLeaderboardByQuizId(quizId);

        request.setAttribute("score", score);
        request.setAttribute("leaderboard", leaderboard);
        request.setAttribute("quizId", quizId);
        request.getRequestDispatcher("/WEB-INF/views/user/result.jsp").forward(request, response);
    }

    private String getAnswerLetter(Question q) {
        if (q.getAnswer().equals(q.getOptionA())) return "A";
        if (q.getAnswer().equals(q.getOptionB())) return "B";
        if (q.getAnswer().equals(q.getOptionC())) return "C";
        if (q.getAnswer().equals(q.getOptionD())) return "D";
        return "";
    }
}
