package com.fssa.sharpandcleanWeb.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.sharpandclean.model.Barber;
import com.fssa.sharpandclean.service.BarberService;
import com.fssa.sharpandclean.service.exception.ServiceException;


@WebServlet("/pages/register")
public class BarberRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   String barberName = request.getParameter("barber_name");
	        String barberEmail = request.getParameter("barber_email");
	        String barberPassword = request.getParameter("barber_password");
	        String barberPhone = request.getParameter("barber_phone");
	        String barberURL = request.getParameter("profile_url");
	        String barberExperience = request.getParameter("barber_experience");
	        String barberAddress = request.getParameter("barber_address");
	        String barberAbout = request.getParameter("barber_about");
	        
	        PrintWriter out = response.getWriter();
	        BarberService barberService = new BarberService();
	        Barber barber = new Barber(barberName, barberEmail, barberPassword, barberPhone, barberExperience, barberURL,
	                barberAddress, barberAbout);
	        
	        try {
	            barberService.registerBarber(barber);
	            response.sendRedirect(request.getContextPath()+"/pages/barber_login.jsp");
	            
	        } catch (ServiceException e) {
				response.sendRedirect(request.getContextPath()+"/pages/barber_register.jsp?error="+ e);
				out.print(e.getMessage());
	        }
	}

}









