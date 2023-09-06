package com.clearing.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clearing.model.usingDAO;
import com.clearing.model.usingVO;

/**
 * Servlet implementation class usingController
 */
public class usingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 아이디는 세션에서 받아올거임, 결제금액이랑 결제 여부는 ?? 어캄?
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("email");
		String store_name = (String)session.getAttribute("store_name");
		String time =(String)session.getAttribute("time");
		session.removeAttribute("time");
		int laundry_seq = Integer.parseInt(request.getParameter("laundry"));
		String start_time = time.substring(0,5);
		String end_time = time.substring(6);
		String using_dt  =  request.getParameter("date");
		using_dt = using_dt.replace("-", "/").substring(2);
		int pay_amount = 4000;
		String pay_yn = "y";
		
		usingVO uVo = new usingVO(laundry_seq, user_email, start_time, end_time, using_dt, pay_amount, pay_yn,store_name);
		usingDAO uDao = new usingDAO();
		int insert =uDao.insertUsing(uVo);
		if(insert>0) {
			System.out.println("등록성공");
			response.sendRedirect("Success.jsp");
		}
		
		
	
	}

}
