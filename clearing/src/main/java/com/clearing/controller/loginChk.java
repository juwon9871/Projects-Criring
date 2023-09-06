package com.clearing.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clearing.model.MemberDAO;
import com.clearing.model.MemberDTO;
import com.clearing.model.StoreDAO;
import com.clearing.model.StoreDTO;

public class loginChk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputMember = request.getParameter("loginMemberStore");
		String inputEmail = request.getParameter("inputEmail");
		String inputPw = request.getParameter("inputPw");

		MemberDAO dao = new MemberDAO();
		StoreDAO sdao = new StoreDAO();
		MemberDTO dto = new MemberDTO(inputEmail, inputPw);
		StoreDTO sdto = new StoreDTO(inputEmail, inputPw);
		MemberDTO memberChk = dao.loginChk(dto);			
		StoreDTO storeChk = sdao.loginChk(sdto);
		HttpSession session = request.getSession();
		
		if(inputMember.equals("member")) {
			if(memberChk == null) {
				System.out.println("member 로그인 실패");
				response.sendRedirect("login1.jsp");
			} else {
				session.setAttribute("member", memberChk);
				System.out.println("member 로그인 성공");
				response.sendRedirect("index.jsp");
			}
		} else if(inputMember.equals("loginMemberStore")){
			if(storeChk == null) {
				System.out.println("store 로그인 실패");
				response.sendRedirect("login1.jsp");
			} else {
				session.setAttribute("storeMember", storeChk);
				System.out.println("store 로그인 성공");
				response.sendRedirect("index.jsp");
			}
		} else {
			System.out.println("로그인 실패");
			response.sendRedirect("login1.jsp");
		}
	}

}
