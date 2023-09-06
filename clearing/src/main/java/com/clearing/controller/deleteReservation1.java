package com.clearing.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clearing.model.reservation_detailsDAO;
import com.clearing.model.usingVO;

public class deleteReservation1 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
reservation_detailsDAO dao = new reservation_detailsDAO();
		
		int deleteUsing = Integer.parseInt(request.getParameter("using"));
		usingVO vo = new usingVO();
		vo.setUSING_SEQ(deleteUsing);
		int result = dao.deleteReservation(vo);
		if(result >0) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");			
		}
		response.sendRedirect("Mypage.jsp");
	}
}
