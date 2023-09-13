package com.fssa.sharpandcleanWeb.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.sharpandclean.service.UserService;
import com.fssa.sharpandclean.service.exception.ServiceException;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/jsps/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doGet(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	

		UserService userService = new UserService();
		// Assuming a user with the email "kavi@gmail.com" exists in the database
		String userEmail = "chandru@gmail.com";
		try {

			if (userService.deleteUser(userEmail)) {
				
			
				
			} else {

				
			}

		} catch (ServiceException e) {
		

		}
	}

}
