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

@WebServlet("/pages/GetBookingBySalonEmailServlet")
public class GetBookingBySalonEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		 PrintWriter out = response.getWriter();
		 
		 String loggedInEmail = (String) session.getAttribute("loggedInEmail");
		 if(loggedInEmail != null) {
			 try {
				 List<SalonBook> salonBook = new ArrayList<>();
				 SalonService salonService = new SalonService();
				 salonBook = salonService.getAllSalonBookingForSalon(loggedInEmail);
				 
				  request.setAttribute("salonBookList", salonBook);
				  System.out.print(salonBook);

					 RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/barber_booking_list.jsp");
		                dispatcher.forward(request, response);
			 }catch(ServiceException e) {
				 String errormsg = ("Error in get salon bookings"+ e.getMessage());
				 out.println(errormsg);
			 }
		 }
	}

	
	

}
