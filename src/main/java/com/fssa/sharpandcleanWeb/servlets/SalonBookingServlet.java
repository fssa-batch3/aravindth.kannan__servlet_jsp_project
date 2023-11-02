package com.fssa.sharpandcleanWeb.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.sharpandclean.model.Salon;
import com.fssa.sharpandclean.model.SalonBook;
import com.fssa.sharpandclean.service.GenerateOTP;
import com.fssa.sharpandclean.service.SalonService;
import com.fssa.sharpandclean.service.exception.ServiceException;


@WebServlet("/pages/SalonBookingServlet")
public class SalonBookingServlet<LocalDate> extends HttpServlet {
	private static final long serialVersionUID = 1L;
      


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
	    String loggedInEmail = (String) session.getAttribute("loggedInEmail"); 
	    String userEmail = loggedInEmail;
	    String userPhone = request.getParameter("bookUserPhone");
		String username = request.getParameter("bookUsername");
		String service = request.getParameter("bookingservice");
		java.time.LocalDate date = java.time.LocalDate.parse(request.getParameter("bookdate"));

		String time = request.getParameter("bookTime");
		 int salonID = Integer.parseInt(request.getParameter("saloonId"));
		 try { 
			 GenerateOTP generate = new GenerateOTP();
			String OTP = generate.generateOTP();
			System.out.println(OTP);
		 SalonService salonService = new  SalonService();
		Salon salon = null;
		 
			  salon =  salonService.getSalonBySalonId(salonID);
		 // get the data from salon object. and set in a single.. single Strings. 
		 String salonName = salon.getSalonName();
		 String salonEmail = salon.getSalonEmail();
		 String salonPhone = salon.getSalonPhone();
		 String salonURL = salon.getSalonURL();
		 String salonEx = salon.getSalonExperience();
		 String salonAddress = salon.getSalonAddress();
		 String salonAbout = salon.getSalonAbout();
		 String salonArea = salon.getSalonArea();
		 
			 
		 // call the salonBook method and set all data needed in salonBook table.
		 SalonBook salonBook = new SalonBook();
		 salonBook.setBookUserName(username);
		 salonBook.setBooUserEmail(userEmail);
		 salonBook.setBookUserPhone(userPhone);
		 salonBook.setBookService(service);
		 salonBook.setBookDate(date);
		 salonBook.setBookTime(time);
		 salonBook.setSalonName(salonName);
		 salonBook.setSalonEmail(salonEmail);
		 salonBook.setSalonPhone(salonPhone);
		 salonBook.setSalonProfile(salonURL);
		 salonBook.setSalonEx(salonEx);
		 salonBook.setSalonAddress(salonAddress);
		 salonBook.setSalonAbout(salonAbout);
		 salonBook.setSalonArea(salonArea);
		 salonBook.setSalonOTP(OTP);
		 salonService.bookingSalon(salonBook);
		 response.sendRedirect(request.getContextPath()+"/pages/customer_shop_booking_payment.jsp?salonId="+salonID);
		 
		 }catch(ServiceException e) {
				//response.sendRedirect(request.getContextPath()+"/pages/customer_shop_booking_form.jsp"+e);
				out.print(e.getMessage());
				String msg = e.getMessage();
				String[] error = msg.split(":");
				request.setAttribute("bookUsername", username);
				request.setAttribute("bookUserPhone",userPhone);
				
				RequestDispatcher patcher = request.getRequestDispatcher("/pages/customer_shop_booking_form.jsp?error="+error[error.length-1]+"&salonId="+salonID);
				patcher.forward(request, response);
			 }
	}

}
