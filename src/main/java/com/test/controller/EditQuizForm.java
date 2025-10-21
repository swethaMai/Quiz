package com.test.controller;

import java.io.IOException;

import com.test.dao.QuizDao;
import com.test.model.Quiz;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditQuizForm")
public class EditQuizForm extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int quizId = Integer.parseInt(request.getParameter("id"));
        Quiz quiz = QuizDao.getQuizById(quizId);
        request.setAttribute("quiz", quiz);
        request.getRequestDispatcher("/WEB-INF/views/admin/editQuiz.jsp").forward(request, response);
    }
}

