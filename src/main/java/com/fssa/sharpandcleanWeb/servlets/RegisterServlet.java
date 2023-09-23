package com.fssa.sharpandcleanWeb.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.sharpandclean.model.User;
import com.fssa.sharpandclean.service.UserService;
import com.fssa.sharpandclean.service.exception.ServiceException;



@WebServlet("/pages/registration")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phonenumber");

		PrintWriter out = response.getWriter();
		try {
		UserService userService = new UserService();
		User user1 = new User( email, userName, password, phoneNumber);
		System.out.print(user1);
		
			userService.registerUser(user1);
			System.out.println("done 2");
				
				response.sendRedirect(request.getContextPath()+"/pages/customer_login.jsp");
			
		} catch (ServiceException e) {
			out.println(e.getMessage());
			System.out.print("Done 3");
			response.sendRedirect(request.getContextPath()+"/pages/customer_register.jsp");
		}

	}

}
