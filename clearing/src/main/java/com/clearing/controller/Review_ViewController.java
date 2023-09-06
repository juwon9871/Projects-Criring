package com.clearing.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clearing.model.StoreDTO;
import com.clearing.model.tbl_reviewListDAO;
import com.clearing.model.tbl_reviewListDTO;
import com.clearing.model.tbl_storeDAO;

public class Review_ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Double lat = Double.parseDouble(request.getParameter("selectStoreLat"));
		Double lng = Double.parseDouble(request.getParameter("selectStoreLng"));

		tbl_storeDAO storeDAO = new tbl_storeDAO();
		StoreDTO storeDTO = new StoreDTO();
		storeDTO.setLAT(lat);
		storeDTO.setLNG(lng);
		storeDTO = storeDAO.selStoreData(storeDTO);

		String storeName = storeDTO.getSTORE_NAME();
		String storeAdd = storeDTO.getSTORE_ADDR();
		String storeTel = storeDTO.getSTORE_TEL();
		String storeEmail = storeDTO.getSTORE_EMAIL();
		request.setAttribute("storeName", storeName);
		request.setAttribute("storeAdd", storeAdd);
		request.setAttribute("storeTel", storeTel);
		request.setAttribute("storeEmail", storeEmail);
		double totalStar = 0.0;
		double star = 0.0;
		tbl_reviewListDAO reviewDAO = new tbl_reviewListDAO();
		ArrayList<tbl_reviewListDTO> reviewList = (ArrayList<tbl_reviewListDTO>) reviewDAO.selReviewData(storeEmail);
		for (int i = 0; i < reviewList.size(); i++) {
			totalStar += reviewList.get(i).getReview_rating();
			star = (totalStar / reviewList.size());
		}
		
		DecimalFormat df = new DecimalFormat("0.0");
		String starS = df.format(star);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("star", starS);

		RequestDispatcher rd = request.getRequestDispatcher("ReviewMain.jsp");
		rd.forward(request, response);
	}

}
