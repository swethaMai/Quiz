package com.test.controller;

import java.io.IOException;
import java.util.List;

import com.test.dao.QuestionDao;
import com.test.dao.QuizDao;
import com.test.model.Question;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CreateQuiz")
public class CreateQuiz extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        String[] questionIds = request.getParameterValues("questionIds");

        int quizId = QuizDao.addQuizAndReturnId(title, category);

        if (quizId > 0 && questionIds != null) {
            for (String qid : questionIds) {
                QuizDao.linkQuestionToQuiz(quizId, Integer.parseInt(qid));
            }
            request.setAttribute("message", "Quiz created and questions linked successfully!");
        } else {
            request.setAttribute("message", "Failed to create quiz or no questions selected.");
        }
        
        List<Question> questions = QuestionDao.getAllQuestions();
        request.setAttribute("questions", questions);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/createQuiz.jsp");
        dispatcher.forward(request, response);
    }
}
