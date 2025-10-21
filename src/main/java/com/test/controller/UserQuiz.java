package com.test.controller;

import java.io.IOException;
import java.util.List;

import com.test.dao.QuizDao;
import com.test.model.Quiz;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserQuiz")
public class UserQuiz extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Quiz> quizzes = QuizDao.getAllQuizzes();
        request.setAttribute("quizzes", quizzes);
        request.getRequestDispatcher("/WEB-INF/views/user/explore.jsp").forward(request, response);
    }
}
