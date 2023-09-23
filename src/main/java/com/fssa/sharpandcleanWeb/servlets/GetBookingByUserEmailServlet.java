package com.fssa.sharpandcleanWeb.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.fssa.sharpandclean.model.SalonBook;
import com.fssa.sharpandclean.service.SalonService;
import com.fssa.sharpandclean.service.exception.ServiceException;



@WebServlet("/pages/GetBookingByUserEmailServlet")
public class GetBookingByUserEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 HttpSession session = request.getSession();
		 PrintWriter out = response.getWriter();
	    
		 String loggedInEmail = (String) session.getAttribute("loggedInEmail");
		System.out.println(loggedInEmail);	
		 if(loggedInEmail != null) {
				try {
					List<SalonBook> salonBooks = new ArrayList<>();					
						SalonService salonService = new SalonService();
						salonBooks =salonService.getAllSalonBookingForUser(loggedInEmail);
						
	                request.setAttribute("bookList", salonBooks);

					 RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/customer_booked_history.jsp");
		                dispatcher.forward(request, response);
					
				}catch(ServiceException e) {
					String errormsg = ("Error in getting the styles: " + e.getMessage());
					out.print(errormsg);
				} 
			
		}
    
		}
	}		
		
	
	
	
	


