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

import com.fssa.sharpandclean.service.exception.StyleException;

/**
 * Servlet implementation class CreateStyleServlet
 */
@WebServlet("/jsps/CreateStyleServlet")
public class CreateStyleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String haircutName = request.getParameter("haircutName");
		String haircutBarbersEmail = request.getParameter("haircutBarbersEmail");
		String hairCutType = request.getParameter("haircutType");
		String haircutAbout = request.getParameter("haircutAbout");
		String haircutURL = request.getParameter("haircutURL");
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		StyleService styleService = new StyleService();
		Style styles = new Style(haircutName, haircutBarbersEmail, hairCutType, haircutAbout,
				haircutURL);
		try {
			if (styleService.addStyle(styles)) {
				out.println("Style successfully Added");
			} else {
				out.println("Style adding Failed");
			}

		} catch (StyleException e) {
			e.printStackTrace();
		}
	}

}
