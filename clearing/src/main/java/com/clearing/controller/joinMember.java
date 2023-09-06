package com.clearing.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clearing.model.LaundryDTO;
import com.clearing.model.MemberDAO;
import com.clearing.model.MemberDTO;
import com.clearing.model.StoreDAO;
import com.clearing.model.StoreDTO;

public class joinMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String joinMember = request.getParameter("flexRadioDefault");
		String joinEmail = request.getParameter("joinEmail");
		String joinPw = request.getParameter("joinPw");
		String joinName = request.getParameter("joinName");
		String joinAddr = request.getParameter("joinAddr");
		String joinLaundry = request.getParameter("laundryCnt");
		String joinDryer = request.getParameter("dryerCnt");
		double joinLat = Double.parseDouble(request.getParameter("userLatInput"));
		double joinLng = Double.parseDouble(request.getParameter("userLngInput"));	
		int joinLaundryCnt = 0;
		int joinDryerCnt = 0;
		
		if (joinLaundry != null || joinDryer != null) {
			joinLaundryCnt = Integer.parseInt(joinLaundry);
			joinDryerCnt = Integer.parseInt(joinDryer);
		}

		MemberDTO dto = new MemberDTO(joinEmail, joinPw, joinName, joinAddr, null, null, null, joinLat, joinLng);
		StoreDTO sdto = new StoreDTO(joinEmail, joinPw, joinName, joinAddr, joinDryer, joinLaundryCnt, joinDryerCnt,
				joinLat, joinLng);
		MemberDAO dao = new MemberDAO();
		StoreDAO sdao = new StoreDAO();

		if (joinMember.equals("member")) {
			int result = dao.joinMember(dto);
			if (result > 0) {
				System.out.println("등록 성공");
				response.sendRedirect("Success2.jsp");
			} else {
				System.out.println("등록 실패");
				response.sendRedirect("page-404.html");
			}
		} else {
			int result = dao.joinStore(sdto);
			if (result > 0) {
				System.out.println("업체 등록 성공");
				for (int i = 1; i <= joinLaundryCnt; i++) {
					LaundryDTO ldto = new LaundryDTO(i, "laundry" + i, joinEmail, 'n', 100 + i);
					int insert = sdao.insertLaundry(ldto);
					if (insert > 0) {
						System.out.println("세탁기 등록 성공");
					} else {
						System.out.println("세탁기 등록 실패");
					}
				}

				for (int i = 1; i <= joinDryerCnt; i++) {
					LaundryDTO ddto = new LaundryDTO(i, "dryer" + i, joinEmail, 'n', 200 + i);
					int insert = sdao.insertLaundry(ddto);
					if (insert > 0) {
						System.out.println("건조기 등록 성공");
					} else {
						System.out.println("건조기 등록 실패");
					}
				}

				response.sendRedirect("Success2.jsp");
			} else {
				System.out.println("업체 등록 실패");
				response.sendRedirect("page-404.html");
			}
		}
	}

}
