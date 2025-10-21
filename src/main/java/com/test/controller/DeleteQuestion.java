package com.test.controller;

import java.io.IOException;

import com.test.dao.QuestionDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteQuestion")
public class DeleteQuestion extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        QuestionDao.deleteQuestion(id);
        response.sendRedirect("ShowQuestions");
    }
}
