package com.clearing.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adminReviewPaging extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pagebutton = Integer.parseInt(request.getParameter("pagebutton"));
		
		int i = pagebutton;
		response.sendRedirect("adminReviewBoardMain.jsp?boardPage=" + i);
		
	}

}
