package com.test.controller;

import java.io.IOException;

import com.test.dao.QuestionDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddQuestion")
public class AddQuestion extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/admin/addQuestions.jsp");
	    dispatcher.forward(request, response);
	}

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question = request.getParameter("question");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String answer = request.getParameter("answer");

        boolean success = QuestionDao.addQuestion(question, optionA, optionB, optionC, optionD, answer);
        if (success) {
        	RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/admin/addQuestions.jsp");
            dispatcher.forward(request, response);
        } else {
            response.getWriter().println("Failed to add question.");
        }
    }
}

