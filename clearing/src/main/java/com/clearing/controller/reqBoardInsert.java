package com.clearing.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clearing.model.Request_BoardDAO;
import com.clearing.model.Request_BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class reqBoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String path = request.getServletContext().getRealPath("./file");
		int maxSize = 1024 * 1024 * 10; // 10MB
		
		String encoding = "UTF-8";
		
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, rename);
		System.out.println(path);
		int boardPage = (int)session.getAttribute("boardPage");
		String req_title = multi.getParameter("req_title");
		String req_email = (String)session.getAttribute("email");
		String req_file = multi.getFilesystemName("req_file");
		String req_content = multi.getParameter("req_content");
		
		Request_BoardDTO dto = new Request_BoardDTO();
		Request_BoardDAO dao = new Request_BoardDAO();
		
		dto.setReqTitle(req_title);
		dto.setReqEmail(req_email);
		dto.setReqFile(req_file);
		dto.setReqContent(req_content);
		
		int insert = dao.insert_req(dto);
		if (insert > 0) {
			response.sendRedirect("requestBoardMain.jsp?boardPage=" + boardPage);
		} else {
			response.sendRedirect("requestBoardMain.jsp?boardPage=" + boardPage);
		}
		
	}

}
