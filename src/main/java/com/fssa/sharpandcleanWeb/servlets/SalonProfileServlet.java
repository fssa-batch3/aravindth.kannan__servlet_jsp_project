package com.fssa.sharpandcleanWeb.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.sharpandclean.model.Salon;
import com.fssa.sharpandclean.service.SalonService;
import com.fssa.sharpandclean.service.exception.ServiceException;


@WebServlet("/pages/SalonProfileServlet")
public class SalonProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		    
		    String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	
			if(loggedInEmail == null) {
				response.sendRedirect("pages/index.jsp");
			
		}else {
			SalonService salonService = new SalonService();
			Salon salon = null;
			try {
				salon = salonService.getSalonBySalonEmail(loggedInEmail);
			}catch(ServiceException e) {
				e.printStackTrace();
				request.setAttribute("error", "Error fetching user data.");
			}
			// Set salon data as an attribute to be used in the JSP
	        request.setAttribute("salonProfile", salon);
	        
	     // Forward the request to the salon details JSP
	        request.getRequestDispatcher("/pages/shop_profile.jsp").forward(request, response);
		}
	
	}

	
	
}
