package com.test.controller;

import java.io.IOException;
import java.util.List;

import com.test.dao.QuizDao;
import com.test.model.Quiz;
import com.test.dao.ParametersDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Quiz> quizzes = QuizDao.getAllQuizzes();
        request.setAttribute("quizzes", quizzes);
        
        int totalQuizzes = ParametersDao.getTotalQuizzes();
        int totalUsers = ParametersDao.getTotalUsers();
        int totalQuestions = ParametersDao.getTotalQuestions();

        request.setAttribute("totalQuizzes", totalQuizzes);
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalQuestions", totalQuestions);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp");
        dispatcher.forward(request, response);
    }
}
