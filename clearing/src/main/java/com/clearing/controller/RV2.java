package com.clearing.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clearing.model.StoreDAO;
import com.clearing.model.StoreDTO;
import com.clearing.model.StoreVO;
import com.clearing.model.tbl_reviewListDAO;
import com.clearing.model.tbl_reviewListDTO;
import com.clearing.model.tbl_storeDAO;

/**
 * Servlet implementation class RV2
 */
public class RV2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String store_name = request.getParameter("store_name");
		StoreDAO sDao = new StoreDAO();
		StoreVO svo = new StoreVO();
		svo=sDao.storelocation(store_name);
	
		tbl_storeDAO storeDAO = new tbl_storeDAO();
		StoreDTO storeDTO = new StoreDTO();
		storeDTO.setLAT(svo.getLAT());
		storeDTO.setLNG(svo.getLNG());
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
