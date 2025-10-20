package com.test.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.test.dao.QuizDao;
import com.test.model.Question;
import com.test.model.Quiz;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ShowAllQuizzes")
public class ShowAllQuizzes extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<Quiz, List<Question>> quizMap = QuizDao.getAllQuizzesWithQuestions();
        request.setAttribute("quizMap", quizMap);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/showAllQuizzes.jsp");
        dispatcher.forward(request, response);
    }
}
