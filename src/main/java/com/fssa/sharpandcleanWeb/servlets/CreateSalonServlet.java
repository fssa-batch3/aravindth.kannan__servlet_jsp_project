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
import com.fssa.sharpandclean.service.SalonService;
import com.fssa.sharpandclean.service.exception.ServiceException;


@WebServlet("/pages/createsalon")
public class CreateSalonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		    
		    String loggedInEmail = (String) session.getAttribute("loggedInEmail");
		String salon_name = request.getParameter("salonName");
		String salon_email= loggedInEmail;
		String salon_url = request.getParameter("salonPhoto");
		String salon_area = request.getParameter("salonArea");
		String salon_phone = request.getParameter("salonPhone");
		String salon_Ex = request.getParameter("salonExperience");
		String salon_address = request.getParameter("salonAddress");
		String salon_about = request.getParameter("salonAbout");
		String salon_hairStyle1 = request.getParameter("haircut1");
		String salon_hairStyle2 = request.getParameter("haircut2");
		String salon_hairStyle3 = request.getParameter("haircut3");
		PrintWriter out = response.getWriter();
		SalonService salonService = new SalonService();
		Salon salon = new Salon(salon_name,salon_email,salon_phone,salon_address,salon_about,salon_url,
				salon_area,salon_Ex,salon_hairStyle1,salon_hairStyle2,salon_hairStyle3);
		try {
			
			salonService.registerSalon(salon);
			response.sendRedirect(request.getContextPath()+"/pages/barber_home.jsp");
		
	    }catch(ServiceException e){
	    	out.print(e.getMessage());
		   // response.sendRedirect(request.getContextPath()+"/pages/barber_shop_card.jsp"+e);
		    String msg = e.getMessage();
			String[] error = msg.split(":");
			request.setAttribute("salonName", salon_name);
			request.setAttribute("salonPhoto",salon_url);
			request.setAttribute("salonArea",salon_area);
			request.setAttribute("salonPhone",salon_phone);
			request.setAttribute("salonExperience",salon_Ex);
			request.setAttribute("salonAddress",salon_address);
			request.setAttribute("salonAbout",salon_about);
			request.setAttribute("haircut1",salon_hairStyle1);
			request.setAttribute("haircut2",salon_hairStyle2);
			request.setAttribute("haircut3",salon_hairStyle3);
			RequestDispatcher patcher = request.getRequestDispatcher("/pages/barber_shop_card.jsp?error="+error[error.length-1]);
			patcher.forward(request, response);
		    
	}
	
	}
}
