package com.fssa.sharpandcleanWeb.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.sharpandclean.service.SalonService;
import com.fssa.sharpandclean.service.exception.ServiceException;



@WebServlet("/DeleteSalonServlet")
public class DeleteSalonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    
		    String loggedInEmail = request.getParameter("salonEmail");
		    
		    try {
		    	SalonService salonService = new SalonService();
		    	salonService.deleteSalon(loggedInEmail);
		    	response.sendRedirect(request.getContextPath() +"/pages/barber_home.jsp");
//		    	RequestDispatcher rd = request.getRequestDispatcher("/baber_home.jsp");
//		    	rd.forward(request, response);
		    	
		    }catch(ServiceException e) {
		    	e.printStackTrace();
		    	response.sendRedirect("shop_profile.jsp?error="+e);
		    }
		
	}

}
