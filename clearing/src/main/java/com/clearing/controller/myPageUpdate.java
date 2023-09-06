package com.clearing.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clearing.model.MemberDAO;
import com.clearing.model.MemberDTO;

public class myPageUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String inputEmail = request.getParameter("inputEmail");
		String inputPassword = request.getParameter("inputPassword");
		String inputUpdatePassword = request.getParameter("inputUpdatePassword");
		String inputAddr = request.getParameter("joinAddr");
		double joinLat = 0;
		double joinLng = 0;

		MemberDAO dao = new MemberDAO();
		MemberDTO udto = new MemberDTO(inputEmail, inputPassword);
		int memberChk = dao.loginCount(udto);
		System.out.println(memberChk);
		MemberDTO dto = new MemberDTO();
		dto.setMB_EMAIL(inputEmail);
		dto.setMB_PW(inputUpdatePassword);
		dto.setMB_ADDR(inputAddr);
		dto.setLAT(joinLat);
		dto.setLNG(joinLng);
		
		int result = dao.updateMember(dto);
		if (memberChk == 1) {
			if (result > 0) {
				HttpSession session = request.getSession();
				System.out.println("회원정보 수정 완료");
				session.invalidate();
				response.sendRedirect("login1.jsp");
			} else {
				System.out.println("수정 실패");
				response.sendRedirect("Mypage.jsp");
			}
		} else {
			System.out.println("기존 비밀번호가 일치하지 않습니다.");
			response.sendRedirect("Mypage.jsp");
		}
	}

}
