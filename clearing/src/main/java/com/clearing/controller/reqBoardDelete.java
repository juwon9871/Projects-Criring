package com.clearing.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clearing.model.Request_BoardDAO;
import com.clearing.model.Request_BoardDTO;
import com.clearing.model.admin_replyDAO;
import com.clearing.model.admin_replyDTO;

public class reqBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		/*
		 * if (request.getParameter("req_seq") != null) {
		 * 
		 * req_seq = Integer.parseInt(request.getParameter("req_seq")); }
		 */
		HttpSession session = request.getSession();
		int boardPage = (int)session.getAttribute("boardPage");
		int req_seq = (int)session.getAttribute("req_seq");
		Request_BoardDTO sdto = new Request_BoardDTO(req_seq);
		Request_BoardDAO sdao = new Request_BoardDAO();
		Request_BoardDTO selDto = sdao.selectDetail_request(sdto);
		if (selDto.getReqType().equals("Y")) {
			admin_replyDTO sDto = new admin_replyDTO(req_seq);
			admin_replyDAO sDao = new admin_replyDAO();
			admin_replyDTO selectDto = sDao.select_reply(sDto);
			int reply_seq = selectDto.getReplySeq();
			admin_replyDAO aDao = new admin_replyDAO();
			int replyDelete = aDao.delete_reply(reply_seq);
		}
		
		Request_BoardDAO dao = new Request_BoardDAO();
		int delete = dao.delete_req(req_seq);
		
		
		if (delete > 0) {
			response.sendRedirect("requestBoardMain.jsp?boardPage=" + boardPage);
		} else {
			response.sendRedirect("requestBoardMain.jsp?boardPage=" + boardPage);
		}
		
	}

}
