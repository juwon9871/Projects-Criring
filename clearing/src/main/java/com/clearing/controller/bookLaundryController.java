package com.clearing.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clearing.model.StoreDAO;
import com.clearing.model.StoreVO;
import com.clearing.model.usingDAO;
import com.clearing.model.usingVO;

/**
 * Servlet implementation class bookLaundryController
 */
public class bookLaundryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//위도 경도만 일단 받아서 상점 위치 조회(고정값을 세션에서 받아올 예정)
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		

		HttpSession session = request.getSession();
		double lat =Double.parseDouble(request.getParameter("selectStoreLat"));
		double lng = Double.parseDouble(request.getParameter("selectStoreLng"));
		
		List<usingVO> laundryList=null;
		
		LocalTime localTime = LocalTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmm");
		DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("HH00");
		String timeNow = localTime.format(formatter);
		String timeZero = localTime.format(formatter2);
		StringBuffer sb = new StringBuffer();
		sb.append(timeZero);
		sb.insert(2, ":");
		timeZero = sb.toString();
		int nTimeNow = Integer.parseInt(timeNow);
		usingDAO uDao = new usingDAO();
		StoreDAO sDao = new StoreDAO();
		StoreVO sVo = new StoreVO(lat, lng);
		
		sVo = sDao.storeData(sVo);
		int dcnt = 0;
		int lcnt = 0;
		if(sVo!=null) {
			dcnt = sVo.getDRYER_CNT();
			lcnt = sVo.getLAUNDRY_CNT();
			session.setAttribute("store_name", sVo.getSTORE_NAME());
			session.setAttribute("store_addr", sVo.getSTORE_ADDR());
		}
		laundryList = uDao.usedLaundry(timeZero);
		int [] used = new int[laundryList.size()];
		if(laundryList!=null){
			laundryList= uDao.usedLaundry(timeZero);
			for(int i=0;i<laundryList.size(); i++) {
					used[i] = laundryList.get(i).getLaundry_seq();
			}
		}
		session.setAttribute("laundry_cnt", lcnt);
		session.setAttribute("dryer_cnt", dcnt);


		request.setAttribute("used",used );
		request.setAttribute("nTimeNow", nTimeNow);
	
		if(sVo!=null) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("using.jsp");
			requestDispatcher.forward(request, response);
		} else {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("page-405.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
