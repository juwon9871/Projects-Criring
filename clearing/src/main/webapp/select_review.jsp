<%@page import="com.clearing.model.admin_reviewDAO"%>
<%@page import="com.clearing.model.admin_reviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="#" method="post">
		<input type="text" name="store_email">
		<input type="text" name="user_email">
		<input type="submit" value="검색">
	</form>
	
	<h1>리뷰</h1>
	<%
		admin_reviewDAO selectAllDao = new admin_reviewDAO();
		List<admin_reviewDTO> selectAll_list = selectAllDao.selectAll_review();
		if (!request.getMethod().equals("POST")) {
	%>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>업체</td>
				<td>내용</td>
				<td>작성자</td>
				<td>평점</td>
				<td>공감</td>
				<td>시간</td>
				<td>첨부</td>
				</tr>		
				<%for (admin_reviewDTO alldto : selectAll_list) {%>
			<tr>
				<td><%=alldto.getReview_seq() %></td>
				<td><%=alldto.getStore_email() %></td>
				<td><%=alldto.getReview_content() %></td>
				<td><%=alldto.getUser_email() %></td>
				<td><%=alldto.getReview_rating() %></td>
				<td><%=alldto.getReview_shares() %></td>
				<td><%=alldto.getReview_dt() %></td>
				<td><%=alldto.getReview_photo() %></td>
			</tr>
				<%} %>
		</table>
	<%} %>
	
	<%	String store_email = request.getParameter("store_email");
		String user_email = request.getParameter("user_email");
		if (request.getMethod().equals("POST")) {
		admin_reviewDAO dao = new admin_reviewDAO();
		admin_reviewDTO dto = new admin_reviewDTO(store_email, user_email);
		
		List<admin_reviewDTO> select_list = dao.select_review(dto);
	%>
	<div>
		<table border="2">
	<%if (select_list == null) { %>
				<tr>
				<td>번호</td>
				<td>업체</td>
				<td>내용</td>
				<td>작성자</td>
				<td>평점</td>
				<td>공감</td>
				<td>시간</td>
				<td>첨부</td>
				</tr>	
	<%} else {%>
			 
				<tr>
				<td>번호</td>
				<td>업체</td>
				<td>내용</td>
				<td>작성자</td>
				<td>평점</td>
				<td>공감</td>
				<td>시간</td>
				<td>첨부</td>
				</tr>		
				<%for (admin_reviewDTO adto : select_list) {%>
			<tr>
				<td><%=adto.getReview_seq() %></td>
				<td><%=adto.getStore_email() %></td>
				<td><%=adto.getReview_content() %></td>
				<td><%=adto.getUser_email() %></td>
				<td><%=adto.getReview_rating() %></td>
				<td><%=adto.getReview_shares() %></td>
				<td><%=adto.getReview_dt() %></td>
				<td><%=adto.getReview_photo() %></td>
				<td><a href="deleteReview?review_seq=<%=adto.getReview_seq()%>">삭제</a></td>
			</tr>
		<%} %>
		<%} %>
		</table>
	</div>
		<%} %>
</body>
</html>