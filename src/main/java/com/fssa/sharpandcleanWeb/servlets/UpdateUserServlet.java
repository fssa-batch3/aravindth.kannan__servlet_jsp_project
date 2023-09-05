package com.fssa.sharpandcleanWeb.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.sharpandclean.model.User;
import com.fssa.sharpandclean.service.UserService;
import com.fssa.sharpandclean.service.exception.ServiceException;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/jsps/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    
	    String loggedInEmail = (String) session.getAttribute("loggedInemail");
	    
	    String newUserName = request.getParameter("name");
	    String newMobileNumber = request.getParameter("phonenumber");
	    String newPassword = request.getParameter("password");
	    
	    UserService userService = new UserService();
	    PrintWriter out = response.getWriter();
	    
	    User updatedUser = new User(loggedInEmail,newUserName, newPassword, newMobileNumber,"user");
	   
	    
	    try {
	        if (userService.updateUser(updatedUser,loggedInEmail)) {
	            out.println("User Information Successfully Updated!");
	        } else {
	            out.println("Error updating user information.");
	        }
	    } catch (ServiceException e) {
	    	out.println("Error: " + e.getLocalizedMessage());
	    }
	}
}
