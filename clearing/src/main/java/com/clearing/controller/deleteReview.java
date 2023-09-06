package com.clearing.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clearing.model.admin_reviewDAO;
import com.clearing.model.admin_reviewDTO;

public class deleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int review_seq = 0;
		if(request.getParameter("review_seq") != null) {
			
			review_seq = Integer.parseInt(request.getParameter("review_seq"));
		}
		admin_reviewDAO dao = new admin_reviewDAO();
		int delete = dao.delete_review(review_seq);
		
		HttpSession session = request.getSession();
			
		if (delete > 0) {
			session.removeAttribute("review_seq");
			response.sendRedirect("adminReviewBoardMain.jsp?boardPage=1");
		} else {
			response.sendRedirect("adminReviewBoardMain.jsp?boardPage=1");
		}
		
		}
		
	

}
