package com.test.controller;

import java.io.IOException;

import com.test.dao.UserDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String newPassword = request.getParameter("password");

        boolean updated = UserDao.updatePassword(username, newPassword);

        if (updated) {
            request.setAttribute("message", "Profile updated successfully.");
        } else {
            request.setAttribute("message", "Failed to update profile.");
        }

        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/admin/updateProfile.jsp");
        rd.forward(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/admin/updateProfile.jsp");
        rd.forward(request, response);
    }

}
