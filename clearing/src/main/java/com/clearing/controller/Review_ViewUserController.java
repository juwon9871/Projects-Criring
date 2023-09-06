package com.clearing.controller;

import java.io.IOException;
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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Review_ViewUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String user_email=(String)session.getAttribute("email");
		StoreDTO storeDTO = new StoreDTO();
		tbl_reviewListDAO rlDao = new tbl_reviewListDAO();

		ArrayList<tbl_reviewListDTO> userReviewList = (ArrayList<tbl_reviewListDTO>) rlDao.userReviewData(user_email);
		String store_email = userReviewList.get(0).getStore_email();

		ArrayList<StoreDTO> reviewListStoreName = (ArrayList<StoreDTO>) rlDao.selReviewStoreName(store_email);

		request.setAttribute("reviewListStoreName", reviewListStoreName);
		request.setAttribute("userReviewList", userReviewList);


		
		RequestDispatcher rd = request.getRequestDispatcher("MyPage/mypagereview.jsp");
		rd.forward(request, response);
	}

}
