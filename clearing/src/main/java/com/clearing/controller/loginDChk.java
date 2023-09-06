package com.clearing.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clearing.model.MemberDAO;

/**
 * Servlet implementation class loginDChk
 */
public class loginDChk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String MB_EMAIL=request.getParameter("MB_EMAIL");
		MemberDAO mDao = new MemberDAO();
		int result =mDao.idDchk(MB_EMAIL);
		
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			out.print("non-usable");
		}else {
			
			out.print("usable");
		}
	
	
	}

}
