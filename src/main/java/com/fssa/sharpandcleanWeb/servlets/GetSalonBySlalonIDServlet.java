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


@WebServlet("/pages/GetSalonBySlalonIDServlet")
public class GetSalonBySlalonIDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session != null) {
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");
			if(loggedInEmail == null) {
				response.sendRedirect("pages/index.jsp");
			}
		}else {
			  // Retrieve the salon's Id  from the request parameter
	        int salonID = Integer.parseInt(request.getParameter("salonId"));

	        // For example, you can retrieve salon data from a service
	        SalonService salonService = new SalonService();
	        Salon salon = null; // Initialize the architect object

	        try {
	        	salon = salonService.getSalonBySalonId(salonID);
	        } catch (ServiceException e) {
	            // Handle the exception properly, you can log it or set an error message
	            e.printStackTrace();
	            request.setAttribute("error", "Error fetching architect data.");
	        }

	        // Set salon data as an attribute to be used in the JSP
	        request.setAttribute("architect", salon);

	        // Forward the request to the salon details JSP
	        request.getRequestDispatcher("/pages/shop_detail.page.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
