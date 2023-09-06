package com.clearing.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clearing.model.tbl_reviewListDAO;

public class Review_DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Double review_seq = Double.parseDouble(request.getParameter("review_seq"));
		tbl_reviewListDAO rlDao = new tbl_reviewListDAO();
		int result = rlDao.delReviewData(review_seq);
		if (result > 0) {

			response.sendRedirect("Mypage.jsp");
		} else {
			System.out.println("삭제X");
		}
	}

}
