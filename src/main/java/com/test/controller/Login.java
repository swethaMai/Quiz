package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.test.dao.UserDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class Login
 */
@WebServlet(name = "Login", urlPatterns = { "/Login" })
public class Login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public Login() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        if(UserDao.checkUser(username, password, role))
        {
        	HttpSession session = request.getSession();
        	session.setAttribute("username", username);
        	session.setAttribute("role", role);

        	if ("admin".equalsIgnoreCase(role)) {
        	    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/admin/adminHome.jsp");
        	    rd.forward(request, response);
        	} else {
        	    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/user/userHome.jsp");
        	    rd.forward(request, response);
        	}
        }
        else
        {
           out.println("Username or Password incorrect");
           RequestDispatcher rs = request.getRequestDispatcher("/login.jsp");
           rs.include(request, response);
        }
	}

}
