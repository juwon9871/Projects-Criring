package com.clearing.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clearing.model.reservation_detailsDAO;
import com.clearing.model.usingVO;

/**
 * Servlet implementation class selectReservationDetails
 */
public class selectReservationDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String myPageEmail = (String)session.getAttribute("email");
		
		usingVO vo = new usingVO();
		vo.setUser_email(myPageEmail);
		
		reservation_detailsDAO dao = new reservation_detailsDAO();
		ArrayList<usingVO> details= (ArrayList<usingVO>)dao.show_reservation(vo);
		
	
		request.setAttribute("details", details);
		RequestDispatcher rd = request.getRequestDispatcher("MyPage/reservation.jsp");
		rd.forward(request, response);
	}
}
