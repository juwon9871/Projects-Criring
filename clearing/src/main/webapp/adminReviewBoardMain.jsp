<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.clearing.model.StoreDAO"%>
<%@page import="com.clearing.model.StoreVO"%>
<%@page import="com.clearing.model.admin_reviewDAO"%>
<%@page import="com.clearing.model.admin_reviewDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.clearing.model.Request_BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.clearing.model.Request_BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="">

<title>About Us | Bootstrap 5 Theme</title>
<script src="https://kit.fontawesome.com/a32650dbb1.js" crossorigin="anonymous"></script>
<!-- CSS FILES -->        
<link rel="preconnect" href="https://fonts.googleapis.com">
        
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,700;1,400&display=swap" rel="stylesheet">

<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="css/bootstrap-icons.css" rel="stylesheet">

<link href="css/tooplate-clean-work.css" rel="stylesheet">
<link href="css/chatbot.css" rel="stylesheet">
<style type="text/css">
@import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';

@font-face {
    font-family: 'gmarket';
    src: url('./fonts/GmarketSansTTFMedium.ttf') format('truetype');
}
body {
	font-family: 'gmarket';
}
#writer{
	float: right;
}

#main{
	float: left;
}

.req_board {
  	display: block;
  	text-align: center;
}
h3 {
  display: inline-block;
  position: relative;
  text-align: center;
  font-size: 1.5em;
  color: #cecece;
}
h3:before {
  content: "\25C0";
  position: absolute;
  left: -50px;
  -webkit-animation: leftRight 2s linear infinite;
  animation: leftRight 2s linear infinite;
}
h3:after {
  content: "\25b6";
  position: absolute;
  right: -50px;
  -webkit-animation: leftRight 2s linear infinite reverse;
  animation: leftRight 2s linear infinite reverse;
}

@-webkit-keyframes leftRight {
  0%    { -webkit-transform: translateX(0)}
  25%   { -webkit-transform: translateX(-10px)}
  75%   { -webkit-transform: translateX(10px)}
  100%  { -webkit-transform: translateX(0)}
}
@keyframes leftRight {
  0%    { transform: translateX(0)}
  25%   { transform: translateX(-10px)}
  75%   { transform: translateX(10px)}
  100%  { transform: translateX(0)}
}
.title {
	text-decoration: none;
	color: black;
}
.ju {
    bottom: 570px;
    position: absolute;
}
.ms-2{
	color: #FFFFFF;
}
.paging{
	margin-top: 30px;
}
.request{
	width: 80%;
	text-align: center;
	margin: auto;
}
.btn-group me-2{
	text-align: center;
	display: inline-block;
}
</style>
    </head>
    
    <body>

        <header class="site-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-12 d-flex flex-wrap">
					<p class="d-flex me-4 mb-0">
						<i class="bi-house-fill me-2"></i> 온라인 코인세탁방 예약
					</p>

					<p class="d-flex d-lg-block d-md-block d-none me-4 mb-0">
						<i class="bi-clock-fill me-2"></i> <strong class="me-2">월
							- 금</strong> 8:00 AM - 5:30 PM
					</p>

					<p class="site-header-icon-wrap text-white d-flex mb-0 ms-auto">
						<i class="site-header-icon bi-whatsapp me-2"></i> <a
							href="tel: 110-220-9800" class="text-white"> 010-1234-1234 </a>
					</p>
				</div>
			</div>
		</div>
	</header>

        <nav class="navbar navbar-expand-lg">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"> <img
				src="images/bubbles.png" class="logo img-fluid" alt="" /> <span
				class="ms-2">C&nbsp;R&nbsp;I&nbsp;R&nbsp;I&nbsp;N&nbsp;G</span>

			</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="index.jsp">메인</a></li>
					<li class="nav-item"><a class="nav-link" href="NonUserReview">후기
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="requestBoardMain.jsp">문의</a></li>

					<%
					if(session.getAttribute("email")!=null){
					String email = (String)session.getAttribute("email");
					if (email.equals("admin")) {
					%>
					<!-- admin 로그인시 생기는 메뉴 TODO-->
					<li class="nav-item"><a class="nav-link" href="adminReviewBoardMain.jsp?boardPage=1">관리자</a>
					</li>
					<%
					}
					}
					%>

					<%
					if (session.getAttribute("member") != null || session.getAttribute("storeMember") != null) {
					%>
					<li class="nav-item ms-3"><a
						class="nav-link custom-btn custom-border-btn custom-btn-bg-white btn"
						href="Mypage.jsp">내 정보</a></li>
					<li class="nav-item ms-3"><a
						class="nav-link custom-btn custom-border-btn custom-btn-bg-white btn"
						href="logOut">로그아웃</a></li>
					<%
					} else {
					%>
					<li class="nav-item ms-3"><a
						class="nav-link custom-btn custom-border-btn custom-btn-bg-white btn"
						href="login1.jsp">로그인</a></li>
					<%
					}
					%>


				</ul>
			</div>
		</div>
	</nav>

        <main>

            <section class="banner-section d-flex justify-content-center align-items-end">
                <div class="section-overlay"></div>

                <div class="container">
                    <div class="row">

                        <div class="col-lg-7 col-12">
                            <h1 class="text-white mb-lg-0">리뷰 관리</h1>
                        </div>


                    </div>
                </div>
            </section>
         

<section class="section-padding">
    <%
		admin_reviewDTO aDto = new admin_reviewDTO();
    	admin_reviewDAO aDao = new admin_reviewDAO();
    	List<admin_reviewDTO> sel_list = aDao.selectAll_review();
    	StoreVO sVo = new StoreVO();
    	StoreDAO sDao = new StoreDAO();
    	List<StoreVO> vo_list = sDao.selAll();
    	int number = 1;
		int boardPage = 1;
			if(request.getParameter("boardPage") != null) {
				boardPage = Integer.parseInt(request.getParameter("boardPage"));
			}
		int count = 10;
		int totalPage = ((sel_list.size() -1) / count) + 1;
		int displayPageNum = 10;
		int endPage = (((boardPage - 1) / displayPageNum) + 1) * displayPageNum;
		if (totalPage < endPage) {
			endPage = totalPage;
		}
		int startPage = ((boardPage -1) / displayPageNum) * displayPageNum + 1;
		boolean prev = (boardPage == 1) ? false : true;
		boolean next = (endPage == totalPage) ? false : true;
		
	%>
	<%=vo_list.size() %>
	<div class="request">
	<table class="table">
  <tbody>
	   <thead>
	      <tr>
	        <th>번호</th>
	        <th>내용</th>
	        <th>업체명</th>
	        <th>작성자</th>
	        <th>평점</th>
	        <th>삭제</th>
	      </tr>
	   </thead>   
	   
	   <%
	   if (sel_list.size() <= (boardPage*10)){ %>
			<%for(int i = (boardPage * 10) - 10;i < sel_list.size();i++){ %>
				   <%
				   int num = 0;
	   				String store_email = sel_list.get(i).getStore_email();
	   				for (int j = 0;j <= vo_list.size()-1; j++){
	   				String store_name = vo_list.get(j).getSTORE_NAME();
						if(store_email.equals(vo_list.get(j).getSTORE_EMAIL())){
							store_name = vo_list.get(j).getSTORE_NAME();
							num = j;
						}
						
					}
				   %>
	        	<tr>
	        		<td><%=number + i %></td>
	        		<td><a class="title" href="RV2?store_name=<%=vo_list.get(num).getSTORE_NAME()%>"><%=sel_list.get(i).getReview_content() %></a></td>
	        		<td><%=vo_list.get(num).getSTORE_NAME() %></td>
	        		<td><%=sel_list.get(i).getUser_email() %></td>
	        		<td><%=sel_list.get(i).getReview_rating() %></td>
	        		<td><a class="title" href="deleteReview?review_seq=<%=sel_list.get(i).getReview_seq()%>">삭제</a></td>
	        	</tr>
			<%} %>
		  <%} else {%>
			<%for(int i = (boardPage * 10) - 10;i < boardPage * 10;i++){ %>
				<%
				   int num = 0;
	   				String store_email = sel_list.get(i).getStore_email();
	   				for (int j = 0;j <= vo_list.size()-1; j++){
	   				String store_name = vo_list.get(j).getSTORE_NAME();
						if(store_email.equals(vo_list.get(j).getSTORE_EMAIL())){
							store_name = vo_list.get(j).getSTORE_NAME();
							num = j;
						}
						
					}
				   %>
	        	<tr>
	        		<td><%=number + i %></td>
	        		<td><a class="title" href="RV2?store_name=<%=vo_list.get(num).getSTORE_NAME()%>"><%=sel_list.get(i).getReview_content() %></a></td>
	        		<td><%=vo_list.get(num).getSTORE_NAME() %></td>
	        		<td><%=sel_list.get(i).getUser_email() %></td>
	        		<td><%=sel_list.get(i).getReview_rating() %></td>
	        		<td><a class="title" href="deleteReview?review_seq=<%=sel_list.get(i).getReview_seq()%>">삭제</a></td>
	        	</tr>
			<%} %>
	     <%} %>
  </tbody>
</table>
	<!-- <h3 class="paging"></h3> -->
		<div class="btn-group me-2" role="group" aria-label="First group">
			<%if (totalPage <= count) {%>
				<%if(prev == true) {%>
				<a href="adminReviewPaging?pagebutton=<%=boardPage - 1 %>"><button type="button" class="btn btn-outline-secondary" id="pagebutton">이전페이지</button></a>
				<%} %>
				<%for(int i = startPage; i <= endPage; i++){ %>
					<%if (i == boardPage) {%>
					<a href="adminReviewPaging?pagebutton=<%=i %>"><button type="button" class="btn btn-secondary" id="pagebutton"><%=i %></button></a>
					<%} else {%>
					<a href="adminReviewPaging?pagebutton=<%=i %>"><button type="button" class="btn btn-outline-secondary" id="pagebutton"><%=i %></button></a>
					<%} %>
				<%} %>
				<%if(boardPage != totalPage) {%>
					<a href="adminReviewPaging?pagebutton=<%=boardPage + 1 %>"><button type="button" class="btn btn-outline-secondary" id="pagebutton">다음페이지</button></a>
				<%} else {%>
					
				<%} %>
			<%} else {%>
				<%if(prev == true) {%>
				<a href="adminReviewPaging?pagebutton=<%=boardPage - 1 %>"><button type="button" class="btn btn-outline-secondary" id="pagebutton">이전페이지</button></a>
				<%} %>
				<%for(int i = startPage; i <= endPage; i++){ %>
					<%if (i == boardPage) {%>
					<a href="adminReviewPaging?pagebutton=<%=i %>"><button type="button" class="btn btn-secondary" id="pagebutton"><%=i %></button></a>
					<%} else {%>
					<a href="adminReviewPaging?pagebutton=<%=i %>"><button type="button" class="btn btn-outline-secondary" id="pagebutton"><%=i %></button></a>
					<%} %>
				<%} %>
				<%if(next == true) {%>
					<a href="adminReviewPaging?pagebutton=<%=boardPage + 1 %>"><button type="button" class="btn btn-outline-secondary" id="pagebutton">다음페이지</button></a>
				<%} %>
				
			<%} %>
		</div>
	</div>
</section>
</main>

	<footer class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-12 d-flex align-items-center mb-4 pb-2">
					<div>
						<img src="images/bubbles.png" class="logo img-fluid" alt="" />
					</div>

					<ul class="footer-menu d-flex flex-wrap ms-5">
						<li class="footer-menu-item"><a href="#"
							class="footer-menu-link">About Us</a></li>

						<li class="footer-menu-item"><a href="#"
							class="footer-menu-link">후기</a></li>
						<li class="footer-menu-item"><a href="#"
							class="footer-menu-link">문의</a></li>
					</ul>
				</div>

				<div class="col-lg-5 col-12 mb-4 mb-lg-0">
					<h5 class="site-footer-title mb-3">서비스</h5>

					<ul class="footer-menu">
						<li class="footer-menu-item"><a href="#"
							class="footer-menu-link"> <i
								class="bi-chevron-double-right footer-menu-link-icon me-2"></i>
								코인세탁방 검색
						</a></li>

						<li class="footer-menu-item"><a href="#"
							class="footer-menu-link"> <i
								class="bi-chevron-double-right footer-menu-link-icon me-2"></i>
								예약
						</a></li>

						<li class="footer-menu-item"><a href="NonUserReview"
							class="footer-menu-link"> <i
								class="bi-chevron-double-right footer-menu-link-icon me-2"></i>
								후기
						</a></li>

						<li class="footer-menu-item"><a href="requestBoardMain.jsp?boardPage=1"
							class="footer-menu-link"> <i
								class="bi-chevron-double-right footer-menu-link-icon me-2"></i>
								문의
						</a></li>
					</ul>
				</div>

				<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-0 mb-md-0">
					<h5 class="site-footer-title mb-3">Office</h5>

					<p class="text-white d-flex mt-3 mb-2">
						<i class="bi-geo-alt-fill me-2"></i> 광주 서구 경열로 20

					</p>

					<p class="text-white d-flex mb-2">
						<i class="bi-telephone-fill me-2"></i> <a
							href="tel: 010-1234-1234" class="site-footer-link">
							010-1234-1234 </a>
					</p>

					<p class="text-white d-flex">
						<i class="bi-envelope-fill me-2"></i> <a
							href="email: youjinseozzang1004@gmail.com" class="site-footer-link">
							youjinseozzang1004@gmail.com </a>
					</p>

					<ul class="social-icon mt-4">
						<li class="social-icon-item"><a class="social-icon-link button button--skoll"> <span></span>
								<span class="bi-twitter"></span>
						</a></li>

						<li class="social-icon-item"><a class="social-icon-link button button--skoll"> <span></span>
								<span class="bi-facebook"></span>
						</a></li>

						<li class="social-icon-item"><a class="social-icon-link button button--skoll"> <span></span>
								<span class="bi-instagram"></span>
						</a></li>
					</ul>
				</div>

				<div class="col-lg-3 col-md-6 col-6 mt-3 mt-lg-0 mt-md-0">
					<div class="featured-block">
						<h5 class="text-white mb-3">이용 시간</h5>

						<strong class="d-block text-white mb-1">월 - 금</strong>

						<p class="text-white mb-3">8:00 AM - 5:30 PM</p>

						<strong class="d-block text-white mb-1">토</strong>

						<p class="text-white mb-0">6:00 AM - 2:30 PM</p>
					</div>
				</div>
			</div>
		</div>

		<div class="site-footer-bottom">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-12">
						<p class="copyright-text mb-0">Copyright © 2036 Clean Work
							Co., Ltd.</p>
					</div>

					<div class="col-lg-6 col-12 text-end">
						<p class="copyright-text mb-0">
							// Designed by <a href="https://www.tooplate.com"
								target="_parent">Tooplate</a> //
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>


	<button type="button" class="btn btn-primary scrolltop" onclick="goToTop(); return false;">
		<i class="fa-solid fa-arrow-up"></i>
	</button>
	
	<%
	String email = (String) session.getAttribute("email");
	%>
	<!-- 유저 밸류값은 표현식으로 세션에서 저장된거 가져올거임 -->
	<!-- Scrollable modal -->
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary chatbotMain" id="CSR"
		data-remote="ChatModal3.jsp" data-bs-toggle="modal"
		data-bs-target="#staticBackdrop">
		<img alt="CSR" src="./images/CSR2.png">
	</button>
	
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrolable">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #7CB8EB; color: white">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">크리링
						Chat-Bot</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%
					Date date = new Date();
					SimpleDateFormat sd = new SimpleDateFormat("yyyy년-MM월-dd일");
					SimpleDateFormat tsd = new SimpleDateFormat("HHmm");
					SimpleDateFormat tsd2 = new SimpleDateFormat("a HH:mm");
					String nowDate = sd.format(date);
					String time = tsd.format(date);
					String talkTime = tsd2.format(date);
					int numTime = Integer.parseInt(time);
					String cr_email = null;
					if (session.getAttribute("email") == null) {
						cr_email = "Guest";
					} else {
						cr_email = (String) session.getAttribute("email");
					}
					%>
					<%
					if (numTime < 1000 || numTime > 1700) {
					%>
					<span
						style="background-color: lightgray; padding: 1% 1%; margin-left: 34%; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;"><%=nowDate%></span><br>
					<br> 안녕하세요 고객님 &#128075;<br> 크리링 &#129302;챗봇 상담입니다.<br>
					<br> 고객님, 지금은 운영시간이 아닙니다.<br> <br> 현재는 챗봇 상담만 가능하며,
					상담사 연결은 운영시간 내 문의 부탁드립니다.<br> 감사합니다.<br> <br> [운영시간]
					&#128342;<br> 평일 : 10시 - 17시 (공휴일 제외)<br> <br> 문의사항을
					선택하거나 번호를 입력해 주세요.<br> <br>

					<div id="allbutton">
						<button class="btn btn-primary sel" type="button" value="1"
							style="background-color: #7CB8EB; border-color: #7CB8EB;">1.
							요금 문의</button>
						<br>
						<button class="btn btn-primary sel" type="button" value="2"
							style="background-color: #7CB8EB; border-color: #7CB8EB;">2.
							환불 문의</button>
						<br>
						<button class="btn btn-primary sel" type="button" value="3"
							style="background-color: #7CB8EB; border-color: #7CB8EB;">3.
							세탁시 주의 사항</button>
						<br>
						<button class="btn btn-primary sel" type="button" value="4"
							style="background-color: #7CB8EB; border-color: #7CB8EB;">4.
							업체 정보 수정 문의</button>
						<br>
						<button class="btn btn-primary sel" type="button" value="5"
							style="background-color: #7CB8EB; border-color: #7CB8EB;">5.
							상담원 연결</button>
						<br>
					</div>

					<%
					} else {
					%>
					<span
						style="background-color: lightgray; padding: 1% 1%; margin-left: 34%; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;"><%=nowDate%></span><br>
					<br> 안녕하세요 고객님&#128075;<br> 크리링 &#129302;챗봇 상담입니다.<br>
					<br> 문의유형을 선택해주세요!<br> <br> 상담원과의 대화가 필요할 경우<br>
					[상담원 연결] 버튼을 눌러주세요 : )<br> * 상담원 연결 후 문의사항을 말씀해주세요.<br> *
					대화 내용은 상담을 위해서만 사용됩니다.<br> <br>
					<!-- 타임딜레이 -->
					<div id="allbutton">
						<button class="btn btn-primary sel" type="button" value="1"
							style="background-color: #7CB8EB; border-color: #7CB8EB;">1.
							요금 문의</button>
						<br>
						<button class="btn btn-primary sel" type="button" value="2"
							style="background-color: #7CB8EB; border-color: #7CB8EB">2.
							환불 문의</button>
						<br>
						<button class="btn btn-primary sel" type="button" value="3"
							style="background-color: #7CB8EB; border-color: #7CB8EB">3.
							세탁시 주의 사항</button>
						<br>
						<button class="btn btn-primary sel" type="button" value="4"
							style="background-color: #7CB8EB; border-color: #7CB8EB">4.
							업체 정보 수정 문의</button>
						<br>
						<button class="btn btn-primary sel" type="button" value="5"
							style="background-color: #7CB8EB; border-color: #7CB8EB">5.
							상담원 연결</button>
						<br>
					</div>
					<%
					}
					%>



					<form action="#" id="ajaxDisplay"></form>

					<script src="./js/jquery-3.7.0.js"></script>


					<script type="text/javascript">
	$('.btn').on('click',function(){
		var qna=$(this).attr('value');
		var cr_email = "<%=cr_email%>";
							//setTimeout(function() {    },700);
							if (qna == "1") {
								$('#allbutton').css("display", "none");
								$.ajax({
									url : "chatBotScript2/userSel1.jsp",
									success : function(result) {
										$("#ajaxDisplay").html(result);
									}
								});
							} else if (qna == "2") {
								$('#allbutton').css("display", "none");
								$.ajax({
									url : "chatBotScript2/userSel2.jsp",
									success : function(result) {
										$("#ajaxDisplay").html(result);
									}
								});
							} else if (qna == "3") {
								$('#allbutton').css("display", "none");
								$.ajax({
									url : "chatBotScript2/userSel3.jsp",
									success : function(result) {
										$("#ajaxDisplay").html(result);
									}
								});

							} else if (qna == "4") {
								$('#allbutton').css("display", "none");
								if (cr_email == "Guest") {
									$.ajax({
										url : "chatBotScript2/userSel4_1.jsp",
										success : function(result) {
											$("#ajaxDisplay").html(result);
										}
									});
									$('#userbutton4').css("display", "block");
								} else {
									$.ajax({
										url : "chatBotScript2/userSel4_2.jsp",
										success : function(result) {
											$("#ajaxDisplay").html(result);
										}
									});

								}
							} else if (qna == "5") {
								$('#allbutton').css("display", "none");
								$.ajax({
									url : "chatBotScript2/userSel5.jsp",
									success : function(result) {
										$("#ajaxDisplay").html(result);
									}
								});

							} else {

							}

						});
					</script>
				</div>
				<div class="modal-footer">
					<button type="button" id="Exit" class="btn btn-secondary"
						data-bs-dismiss="modal">나가기</button>
				</div>
			</div>
		</div>
	</div>

	<script src="./js/jquery-3.7.0.js"></script>
	<script>

		$('#staticBackdrop').on('show.bs.modal', function(e) {

			var button = $(e.relatedTarget);
			var modal = $(this);

			modal.find('.modal-body').load(button.data("remote"));

		});

		$('#Exit').on('click',function(){
			window.location.href='http://localhost:8081/clearing/index.jsp';
			
		});
	</script>
        <!-- JAVASCRIPT FILES -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/counter.js"></script>
        <script src="js/countdown.js"></script>
        <script src="js/init.js"></script>
        <script src="js/modernizr.js"></script>
        <script src="js/animated-headline.js"></script>
        <script src="js/custom.js"></script>
        <script src="js/btnScroll.js"></script>

    </body>
</html>
