<%@page import="com.clearing.model.StoreDTO"%>
<%@page import="com.clearing.model.tbl_reviewListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JavaScript Bundle with Popper -->

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<style type="text/css">
	@font-face {
    font-family: 'gmarket';
    src: url('./fonts/GmarketSansTTFMedium.ttf') format('truetype');
}
body {
	font-family: 'gmarket';
}
</style>
</head>
<body>
	<%
	ArrayList<tbl_reviewListDTO> reviewList = (ArrayList<tbl_reviewListDTO>) request.getAttribute("userReviewList");
	ArrayList<StoreDTO> reviewStoreName = (ArrayList<StoreDTO>) request.getAttribute("reviewListStoreName");

	
	%>
	
	<h1 style="margin-left: 38%;">나의 리뷰 목록</h1><br>

	<table class="table" style="text-align: center;width:75%; margin-left: 13%; align-content: center">
		<thead>
			<tr>
				<th scope="col" style="width: 5%;">#</th>
				<th scope="col" style="width: 10%;">업체명</th>
				<th scope="col" style="width: 10%;">평점</th>
				<th scope="col">리뷰내용</th>
				<th scope="col" style="width:10%">작성날짜</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < reviewList.size(); i++) {
			%>
			<tr>
				<th scope="row" style="padding: 2% 1%"><%=i + 1%></th>
				<td  style="padding: 2% 1%"><%=reviewStoreName.get(i).getSTORE_NAME()%></td>
				<td style="padding: 2% 1%"><div class="reviews-icons">
				<%for(int j=0;j<reviewList.get(i).getReview_rating();j++){%>
						<i class="bi-star-fill"></i> 
				<%}%>
				<%for(int j=0;j<5-reviewList.get(i).getReview_rating();j++){%>
						<i class="bi-star"></i> 
				<%}%>
				
					</div></td>
				<td style="width: 20%;padding: 2% 1%"><%=reviewList.get(i).getReview_content()%></td>
				<td><%= reviewList.get(i).getReview_dt() %></td>
				<td style="width: 10%;padding: 2% 1%"><a style="color: #77B2E8" href="http://localhost:8081/clearing/Review_DeleteController?review_seq=<%=reviewList.get(i).getReview_seq()%>" >삭제</a></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
	

</body>
</html>