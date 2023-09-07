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

import com.fssa.sharpandclean.model.Barber;
import com.fssa.sharpandclean.service.BarberService;
import com.fssa.sharpandclean.service.exception.ServiceException;


@WebServlet("/jsps/BarberLoginServlet")
public class BarberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String barberEmail = request.getParameter("barber_email");
		String barberPassword = request.getParameter("barber_password");
		Barber barber = new Barber(barberEmail, barberPassword);
		
		PrintWriter out = response.getWriter();
		BarberService barberService = new BarberService();
		try {
			if(barberService.loginBarber(barber, barberEmail)) {
				HttpSession session = request.getSession();
				session.setAttribute("loggedInEmail", barberEmail);
				RequestDispatcher dispatcher = request.getRequestDispatcher("barber_home.jsp");
				dispatcher.forward(request, response);
				out.println("Login success");
			}
		}catch(ServiceException e) {
			e.printStackTrace();
			response.sendRedirect("login.jsp?errorMessage="+e.getMessage());
			out.println(e.getMessage());
		}
	}

}
