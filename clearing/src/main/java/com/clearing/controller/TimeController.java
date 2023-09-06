package com.clearing.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clearing.model.usingDAO;
import com.clearing.model.usingVO;


public class TimeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selTime =request.getParameter("time");
		HttpSession session =  request.getSession();
		session.setAttribute("time", selTime);
		request.setAttribute("seltime", selTime);
		selTime =selTime.substring(0,5);
		String selDate = request.getParameter("date");
		request.setAttribute("seldate",selDate);
		selDate=selDate.replace("-", "/").substring(2);
		List<usingVO> laundryList =null;
		usingDAO uDao = new usingDAO();
		laundryList = uDao.usedLaundry_byDate(selDate, selTime);
		int [] used = new int [laundryList.size()];
		if(laundryList!=null) {
			laundryList = uDao.usedLaundry_byDate(selDate, selTime);
			for(int i =0; i<laundryList.size();i++) {
				used[i] = laundryList.get(i).getLaundry_seq();
			}
		}
		request.setAttribute("used", used);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("using2.jsp");
		requestDispatcher.forward(request, response);
	}

}
