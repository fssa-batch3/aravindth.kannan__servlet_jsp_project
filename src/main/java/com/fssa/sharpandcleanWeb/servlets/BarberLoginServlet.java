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


@WebServlet("/pages/barberlogin")
public class BarberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		RequestDispatcher re = request.getRequestDispatcher("/pages/barber_login.jsp");
		re.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String barberEmail = request.getParameter("barber_email");
		String barberPassword = request.getParameter("barber_password");
		Barber barber = new Barber(barberEmail, barberPassword);
		
		PrintWriter out = response.getWriter();
		BarberService barberService = new BarberService();
		try {
		        barberService.loginBarber(barber); 
				HttpSession session = request.getSession();
				session.setAttribute("loggedInEmail", barberEmail);
				response.sendRedirect(request.getContextPath()+"/pages/barber_home.jsp");
				
		}catch(ServiceException e) {
			
			out.println(e.getMessage());
			String msg = e.getMessage();
			String[] error = msg.split(":");
			request.setAttribute("barber_email", barberEmail);
			request.setAttribute("barber_password",barberPassword);
			
			RequestDispatcher patcher = request.getRequestDispatcher("/pages/barber_login.jsp?error="+error[error.length-1]);
			patcher.forward(request, response);
		}
	}

}
