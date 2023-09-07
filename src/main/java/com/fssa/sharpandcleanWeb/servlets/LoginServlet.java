package com.fssa.sharpandcleanWeb.servlets;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.sharpandclean.model.User;
import com.fssa.sharpandclean.service.UserService;
import com.fssa.sharpandclean.service.exception.ServiceException;


@WebServlet("/jsps/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}


    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User(email, password);
	
		PrintWriter out = response.getWriter();
		UserService userService = new UserService();
		try {
			if(userService.loginUser(user)) {
				HttpSession session = request.getSession();
				session.setAttribute("loggedInEmail", email);
				RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
				dispatcher.forward(request, response);
				out.println("Login success");	     	
			}
			
		}catch(ServiceException e) {
			e.printStackTrace();
			response.sendRedirect("login.jsp?errorMessage="+e.getMessage());
			out.println(e.getMessage());
		}

		
	}

}