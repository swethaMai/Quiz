package com.test.controller;

import java.io.IOException;
import java.util.List;

import com.test.dao.QuizDao;
import com.test.model.UserScore;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/Leaderboard")
public class Leaderboard extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String quizIdParam = request.getParameter("quizId");
    	if (quizIdParam == null || quizIdParam.isEmpty()) {
    	    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing quizId parameter.");
    	    return;
    	}
    	int quizId = Integer.parseInt(quizIdParam);
        List<UserScore> leaderboard = QuizDao.getLeaderboardByQuizId(quizId);
        request.setAttribute("leaderboard", leaderboard);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/leaderboard.jsp");
        dispatcher.forward(request, response);
    }
}
