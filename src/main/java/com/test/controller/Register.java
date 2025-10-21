package com.test.controller;

import java.io.IOException;

import com.test.dao.UserDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/Register")
public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean success = UserDao.registerNewUser(username, password);
        if (success) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("message", "Registration failed.");
            request.getRequestDispatcher("/WEB-INF/views/user/register.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to registration form
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/user/register.jsp");
        rd.forward(request, response);
    }

}
