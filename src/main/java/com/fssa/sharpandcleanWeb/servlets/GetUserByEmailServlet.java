package com.fssa.sharpandcleanWeb.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.sharpandclean.model.User;
import com.fssa.sharpandclean.service.UserService;
import com.fssa.sharpandclean.service.exception.ServiceException;


@WebServlet("/pages/GetUserByEmailServlet")
public class GetUserByEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session = request.getSession();
		    
		    String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	
			if(loggedInEmail == null) {
				response.sendRedirect("pages/index.jsp");
			
		}else {
			UserService userService = new UserService();
			User user = null;
			try {
				user = userService.getUser(loggedInEmail);
			}catch(ServiceException e) {
				e.printStackTrace();
				request.setAttribute("error", "Error fetching user data.");
			}
			// Set user data as an attribute to be used in the JSP
	        request.setAttribute("customer", user);
	        
	     // Forward the request to the user details JSP
	        request.getRequestDispatcher("/pages/customer_profile.jsp").forward(request, response);
		}
	}

	
}
