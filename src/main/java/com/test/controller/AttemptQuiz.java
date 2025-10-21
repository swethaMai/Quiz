package com.test.controller;

import java.io.IOException;
import java.util.List;

import com.test.dao.QuizDao;
import com.test.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AttemptQuiz")
public class AttemptQuiz extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        List<Question> questions = QuizDao.getQuestionsForQuiz(quizId);
        request.setAttribute("questions", questions);
        request.setAttribute("quizId", quizId);
        request.getRequestDispatcher("/WEB-INF/views/user/attempt.jsp").forward(request, response);
    }
}
