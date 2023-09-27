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


@WebServlet("/pages/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    
	    String loggedInEmail = (String) session.getAttribute("loggedInEmail");  
	    String newUserName = request.getParameter("name");
	    String newMobileNumber = request.getParameter("phonenumber");
	    String newPassword = request.getParameter("password");
	    
	    UserService userService = new UserService();
	    PrintWriter out = response.getWriter();
	    
	    User updated_user = new User(loggedInEmail,newUserName, newPassword, newMobileNumber);
	   
	    
	    try {
	        userService.updateUser(updated_user);
	        response.sendRedirect("customer_profile.jsp");
	            
	    } catch (ServiceException e) {

			response.sendRedirect("customer_profile_page.jsp?error="+e);
			out.print(e.getMessage());
	    }
	}
}
