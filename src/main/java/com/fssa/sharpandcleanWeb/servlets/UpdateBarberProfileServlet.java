package com.fssa.sharpandcleanWeb.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.fssa.sharpandclean.model.Barber;
import com.fssa.sharpandclean.service.BarberService;
import com.fssa.sharpandclean.service.exception.ServiceException;

@WebServlet("/pages/UpdateBarberProfileServlet")
public class UpdateBarberProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	      
		String loggedInEmail = (String) session.getAttribute("loggedInEmail");  
	    String newBarberName = request.getParameter("barber_name");
	    String newBarberProfile = request.getParameter("barber_profile");
	    String newBarberPhone = request.getParameter("barber_phone");
	    String newBarberEx = request.getParameter("barber_ex");
	    String newBarberAddress = request.getParameter("barberAddress");
	    String newBarberAbout = request.getParameter("barberAbout");
	    String sample_1 = request.getParameter("sample1");
	    String sample_2 = request.getParameter("sample2");
	    String sample_3 = request.getParameter("sample3");
	    BarberService barberService = new BarberService();
	    PrintWriter out = response.getWriter();
	    
	    try {
	    Barber barber = new Barber();
	    barber.setBarberEmail(loggedInEmail);
	    barber.setBarberName(newBarberName);
	    barber.setBarberProfile(newBarberProfile);
	    barber.setBarberPhone(newBarberPhone);
	    barber.setBarberExperience(newBarberEx);
	    barber.setBarberAddress(newBarberAddress);
	    barber.setBarberAbout(newBarberAbout);
	    barber.setSample_1(sample_1);
	    barber.setSample_2(sample_2);
	    barber.setSample_3(sample_3);
  
	    barberService.updateBarber(barber);
	    response.sendRedirect("barber_profile.jsp");
	    
	    }catch(ServiceException e) {
	    	response.sendRedirect("barber_profile_edit.jsp?error="+e);
			out.print(e.getMessage());

	    }
	}

}
