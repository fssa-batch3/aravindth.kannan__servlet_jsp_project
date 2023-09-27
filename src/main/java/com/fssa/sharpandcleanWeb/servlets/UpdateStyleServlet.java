package com.fssa.sharpandcleanWeb.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.sharpandclean.model.Style;
import com.fssa.sharpandclean.service.StyleService;
import com.fssa.sharpandclean.service.exception.ServiceException;

@WebServlet("/pages/UpdateStyleServlet")
public class UpdateStyleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int styleId = Integer.parseInt(request.getParameter("style_id"));
		String styleEmail = request.getParameter("style_email");
		String styleName = request.getParameter("styleName");
		String style_type = request.getParameter("styleType");
		String style_about = request.getParameter("styleAbout");
		String style_url = request.getParameter("styleURL");
		
		StyleService styleService = new StyleService();
		PrintWriter out = response.getWriter();
		Style newStyle = new Style();
		newStyle.setHaircutAbout(style_about);
		newStyle.setHaircutEmail(styleEmail);
		newStyle.setHaircutId(styleId);
		newStyle.setHaircutName(styleName);
		newStyle.setHaircutType(style_type);
		newStyle.setHaircutUrl(style_url);
		try {
			styleService.updateStyle(newStyle);
			response.sendRedirect("shop_profile.jsp");
		}catch(ServiceException e) {
			response.sendRedirect("salon_style_update.jsp?error="+e);
			out.print(e.getMessage());
		}
	}

}
