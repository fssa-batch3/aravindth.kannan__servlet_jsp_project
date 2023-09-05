package com.fssa.sharpandcleanWeb.servlets;

import java.io.IOException;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fssa.sharpandclean.model.Style;
/**
 * Servlet implementation class GetAllAccounts
 */
import com.fssa.sharpandclean.service.StyleService;
import com.fssa.sharpandclean.service.exception.ServiceException;

import javax.servlet.http.HttpSession;

//import com.fssa.sharpandclean.model.ProductDetails;
//import com.fssa.sharpandclean.services.ProductService;
//import com.fssa.sharpandclean.services.exceptions.ServiceException;
/**
 * Servlet implementation class GetAllProductServlet
 */
@WebServlet("/ListAllStyleServlet")
public class ListAllStyleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();

		if (session != null) {
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");
			if (loggedInEmail == null) {
				response.sendRedirect("jsps/index.jsp");
			} else {
				try {
					List<Style> styles = new StyleService().getAllStyles();
					System.out.println(styles);
					session.setAttribute("Styles_List", styles);
					RequestDispatcher dispatcher = request.getRequestDispatcher("getAllStyle.jsp");
					dispatcher.forward(request, response);
				} catch (ServiceException e) {
					String errormsg = ("Error in getting the styles: " + e.getMessage());
					out.print(errormsg);
				}
			}
		}
	}


}