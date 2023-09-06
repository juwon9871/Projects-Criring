<%@page import="com.clearing.model.usingVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<%ArrayList<usingVO> details = (ArrayList<usingVO>) request.getAttribute("details"); %>
	
			<div class="container">
						<div class="reservationList">
							<h1 style="margin-left: 38%;">나의 예약 내역</h1><br>
							<table class="table">
								<thead style="text-align: center">
									<tr>
										<th scope="col">#</th>
										<th scope="col">업체명</th>
										<th scope="col">세탁기 번호</th>
										<th scope="col">사용 시작 시간</th>
										<th scope="col">사용 종료 시간</th>
										<th scope="col">사용 날짜</th>
									</tr>
								</thead>
								<%
								if (details != null) {
									for (int i = 0; i < details.size(); i++) {

								%>
								<tbody class="table-group-divider" style="text-align: center">
									<tr>

										<th scope="row"><%=i+1%></th>
										<td><%=details.get(i).getStore_name()%></td>
										<td><%=details.get(i).getLaundry_seq()%></td>
										<td><%=details.get(i).getStart_time()%></td>
										<td><%=details.get(i).getEnd_time()%></td>
										<td><%=details.get(i).getUsing_dt().substring(0, 10)%></td>
										<td><a
											href="deleteReservation1?using=<%=details.get(i).getUSING_SEQ()%>" style="color: #77B2E8">예약
												취소</a></td>
										<td><a href="ReviewWrite2.jsp?store_name=<%=details.get(i).getStore_name()%>" style="color: #77B2E8">리뷰 작성</a></td>
									</tr>
								</tbody>
								<%
								}
								} else if (details == null) {
								%>
								<tbody class="table-group-divider">
									<tr>
										<th scope="row"></th>
										<td colspan="4">예약 정보가 없습니다.</td>
									</tr>
								</tbody>

								<%
								}
								%>
							</table>
						</div>

					<div class="col-lg-6 col-12 custom-block-wrap"></div>
			</div>
		
</body>
</html>