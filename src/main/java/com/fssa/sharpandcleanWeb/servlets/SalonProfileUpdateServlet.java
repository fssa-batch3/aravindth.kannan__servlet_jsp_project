package com.fssa.sharpandcleanWeb.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.fssa.sharpandclean.model.Salon;
import com.fssa.sharpandclean.service.SalonService;
import com.fssa.sharpandclean.service.exception.ServiceException;


@WebServlet("/pages/SalonProfileUpdateServlet")
public class SalonProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  HttpSession session = request.getSession();
		    
		    String loggedInEmail = (String) session.getAttribute("loggedInEmail");  
		    String newSalonName = request.getParameter("salonName");
		    String newSalonProfile = request.getParameter("salonProfile");
		    String newSalonArea = request.getParameter("salonArea");
		    String newSalonPhone = request.getParameter("salonPhone");
		    String  newSalonEx = request.getParameter("experience");
		    String newSalonAddress = request.getParameter("address");
		    String newSalonAbout = request.getParameter("aboutSalon");
		    String sample_1 = request.getParameter("sample1");
		    String sample_2 = request.getParameter("sample2");
		    String sample_3 = request.getParameter("sample3");
		    SalonService salonService = new SalonService();
		    PrintWriter out = response.getWriter();
		    
		    try {
		    Salon salon = new Salon();
		    salon.setSalonEmail(loggedInEmail);
		    salon.setSalonName(newSalonName);
		    salon.setSalonURL(newSalonProfile);
		    salon.setSalonArea(newSalonArea);
		    salon.setSalonPhone(newSalonPhone);
		    salon.setSalonExperience(newSalonEx);
		    salon.setSalonAddress(newSalonAddress);
		    salon.setSalonAbout(newSalonAbout);
		    salon.setSalonSample1(sample_1);
		    salon.setSalonSample2(sample_2);
		    salon.setSalonSample3(sample_3);
		    
		    salonService.updateSalon(salon);
		    response.sendRedirect("shop_profile.jsp");
		    
		    }catch(ServiceException e) {
		    	response.sendRedirect("shop_profile_edit.jsp?error="+e);
				out.print(e.getMessage());

		    }

	}

}
