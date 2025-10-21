package com.test.controller;

import java.io.IOException;
import java.util.List;

import com.test.dao.QuestionDao;
import com.test.model.Question;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CreateQuizForm")
public class CreateQuizForm extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Question> questions = QuestionDao.getAllQuestions();
        request.setAttribute("questions", questions);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/createQuiz.jsp");
        dispatcher.forward(request, response);
    }
}
