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

import com.fssa.sharpandclean.model.Style;
import com.fssa.sharpandclean.service.StyleService;
import com.fssa.sharpandclean.service.exception.StyleException;

@WebServlet("/pages/CreateStyleServlet")
public class CreateStyleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String haircutName = request.getParameter("haircutName");
		String haircutBarbersEmail = request.getParameter("haircut_email");
		String hairCutType = request.getParameter("haircutType");
		String haircutAbout = request.getParameter("haircutAbout");
		String haircutURL = request.getParameter("haircutURL");
		
		
		PrintWriter out = response.getWriter();
		StyleService styleService = new StyleService();
		Style styles = new Style(haircutName, haircutBarbersEmail, hairCutType, haircutAbout,
				haircutURL);

		try {
			styleService.addStyle(styles);
				response.sendRedirect("shop_profile.jsp");
			

		} catch (StyleException e) {
			String msg = e.getMessage();
			out.println(msg);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/shop_profile.jsp?error="+msg);
			dispatcher.forward(request, response);
		}
	}

}
