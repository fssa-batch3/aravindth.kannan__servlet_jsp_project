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
import com.google.protobuf.ServiceException;


@WebServlet("/jsps/CreateStyleServlet")
public class CreateStyleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  HttpSession session = request.getSession();
		    
		    String loggedInEmail = (String) session.getAttribute("loggedInEmail");
		System.out.println(loggedInEmail);    
		String haircutName = request.getParameter("haircutName");
		String haircutBarbersEmail = loggedInEmail;
		String hairCutType = request.getParameter("haircutType");
		String haircutAbout = request.getParameter("haircutAbout");
		String haircutURL = request.getParameter("haircutURL");
		
		
		PrintWriter out = response.getWriter();
		StyleService styleService = new StyleService();
		Style styles = new Style(haircutName, haircutBarbersEmail, hairCutType, haircutAbout,
				haircutURL);
		System.out.println(styles);
		try {
			if (styleService.addStyle(styles)) {
				out.println("Style successfully Added");
				RequestDispatcher dispatcher = request.getRequestDispatcher("barber_home.jsp");
				dispatcher.forward(request, response);
			} else {
				out.println("Style adding Failed");
			}

		} catch (StyleException e) {
			String msg = e.getMessage();
			out.println(msg);
			RequestDispatcher dispatcher = request.getRequestDispatcher("create_style.jsp?error="+msg);
			dispatcher.forward(request, response);
		}
	}

}
