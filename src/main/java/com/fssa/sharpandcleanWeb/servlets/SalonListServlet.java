package com.fssa.sharpandcleanWeb.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.fssa.sharpandclean.model.Salon;
import com.fssa.sharpandclean.service.SalonService;
import com.fssa.sharpandclean.service.exception.ServiceException;

@WebServlet("/salonlist")
public class SalonListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		
		if(session != null) {
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");
			if(loggedInEmail == null) {
				response.sendRedirect("pages/index.jsp");
			}else {
				try {
					List<Salon> salons = new SalonService().getAllSalon();
					System.out.println(salons);
					session.setAttribute("Styles_List", salons);
					response.sendRedirect(request.getContextPath()+"/pages/customer_select_shop.jsp");
				}catch(ServiceException e) {
					String errormsg = ("Error in getting the salons: "+e.getMessage());
					out.print(errormsg);
				}
			}
		}
	}

	
	

}
