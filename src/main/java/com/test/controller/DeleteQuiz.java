package com.test.controller;

import java.io.IOException;

import com.test.dao.QuizDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteQuiz")
public class DeleteQuiz extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        QuizDao.deleteQuiz(id);
        response.sendRedirect("Dashboard");
    }
}
