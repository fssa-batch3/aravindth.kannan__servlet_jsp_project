package com.fssa.sharpandcleanWeb.servlets;
import java.io.IOException;
import java.util.List;
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

@WebServlet("/pages/salonlist")
public class SalonListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");
			if(loggedInEmail == null) {
				response.sendRedirect("pages/index.jsp");
			}else {
				try {
					SalonService salonService  = new SalonService();
					List<Salon> salons = salonService.getAllSalon();
					request.setAttribute("salonList", salons);
					System.out.println(salons);
				}catch(ServiceException e) {
					request.setAttribute("error", "Error fetching or displaying salons data:"+ e.getMessage());
					e.printStackTrace();
				}
				 RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/customer_select_shop.jsp");
			        dispatcher.forward(request, response);
			}
		}
	}

	
	

}
