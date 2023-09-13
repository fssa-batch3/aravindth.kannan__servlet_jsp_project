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


@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher re = req.getRequestDispatcher("/jsps/login.jsp");
		re.forward(req, resp);
	}


    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User(email, password);
		
	
		PrintWriter out = response.getWriter();
		UserService userService = new UserService();
		try {
				userService.loginUser(user);
				HttpSession session = request.getSession();
				session.setAttribute("loggedInEmail", email);
				
				response.sendRedirect(request.getContextPath()+"/jsps/home.jsp");
				out.println("Login success");	     	
			
			
		}catch(ServiceException e) {
			e.printStackTrace();
			response.sendRedirect("login?errorMessage="+e.getMessage());
			out.println(e.getMessage());
		}

		
	}

}