package com.fssa.sharpandcleanWeb.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.sharpandclean.service.StyleService;
import com.fssa.sharpandclean.service.exception.ServiceException;

@WebServlet("/pages/DeleteStyleCardServlet")
public class DeleteStyleCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int styleId = Integer.parseInt(request.getParameter("styleID"));
		
		try {
			StyleService styleService = new StyleService();
			styleService.deleteStyle(styleId);
			response.sendRedirect(request.getContextPath()+"/pages/shop_profile.jsp");
		}catch(ServiceException e) {
			e.printStackTrace();
			response.sendRedirect("/pages/shop_profile.jsp?error="+e);
		}
	}

}
