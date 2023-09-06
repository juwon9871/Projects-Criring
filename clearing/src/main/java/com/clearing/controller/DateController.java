package com.clearing.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class DateController
 */
public class DateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		
		String seldate = request.getParameter("date");
		request.setAttribute("seldate", seldate);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("using2.jsp");
		requestDispatcher.forward(request, response);
		
	}

}
