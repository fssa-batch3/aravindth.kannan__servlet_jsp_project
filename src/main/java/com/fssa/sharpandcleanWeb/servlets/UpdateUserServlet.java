package com.fssa.sharpandcleanWeb.servlets;

import java.io.IOException;

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


@WebServlet("/pages/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    
	    String loggedInEmail = (String) session.getAttribute("loggedInEmail");  
	    String newUserName = request.getParameter("name");
	    String newMobileNumber = request.getParameter("phonenumber");
	   
	    UserService userService = new UserService();
	    
	    User updated_user = new User(loggedInEmail,newUserName, newMobileNumber); 
	    try {
	        userService.updateUser(updated_user);
	        response.sendRedirect("customer_profile.jsp");
	            
	    } catch (ServiceException e) {
	    	e.printStackTrace();
			String error = e.getMessage();
			request.setAttribute("name", newUserName);
			request.setAttribute("phonenumber", newMobileNumber);
			
			RequestDispatcher patcher = request.getRequestDispatcher("/pages/customer_profile.jsp?error="+error);
			patcher.forward(request, response);
	    }
	}
}
