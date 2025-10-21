package com.test.controller;

import java.io.IOException;

import com.test.dao.QuestionDao;
import com.test.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditQuestionForm")
public class EditQuestionForm extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Question q = QuestionDao.getQuestionById(id);
        request.setAttribute("question", q);
        request.getRequestDispatcher("/WEB-INF/views/admin/editQuestion.jsp").forward(request, response);
    }
}
