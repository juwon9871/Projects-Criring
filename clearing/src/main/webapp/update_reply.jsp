<%@page import="com.clearing.model.Request_BoardDAO"%>
<%@page import="com.clearing.model.Request_BoardDTO"%>
<%@page import="com.clearing.model.admin_replyDAO"%>
<%@page import="com.clearing.model.admin_replyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,700;1,400&display=swap"
	rel="stylesheet">

<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="css/bootstrap-icons.css" rel="stylesheet">

<link href="css/tooplate-clean-work.css" rel="stylesheet">
<style type="text/css">
@import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';

@font-face {
	font-family: 'gmarket';
	src: url('./fonts/GmarketSansTTFMedium.ttf') format('truetype');
}

body {
	font-family: 'gmarket';
}

img {
	border-radius: 10px;
}

input[type=reset], input[type=submit], input[type=button] {
	border: none;
}

.requestWriteTable {
	margin: 0 auto;
}

.reqname {
	margin-top: 50px;
}

.reqtitle {
	margin-top:50px;
    margin-bottom: 15px;
}
.reqwriter {
	margin-bottom: 15px;
}

.reqimg {
	display:inline-block;
	width: 80%;
    height: 80%;
    margin-bottom: 15px;
}
.reqtext {
	margin-left: 10px;
	margin-bottom: 10px;
	border-radius: 10px;
	resize: none;
	width: 50%
}
    
.replyWrite {
	margin-top: 40px;
}

.replyWriteTable {
	margin: 0 auto;
}

.replyBack {
	border: none;
}

.replyname {
	margin-top: 50px;
}
.replytitle {
	margin-top: 5px;
    margin-bottom: 15px;
}

.replytext {
	margin-left: 10px;
	margin-bottom: 10px;
	border-radius: 10px;
	resize: none;
	width: 50%
}

.replyimg {
	display:inline-block;
	width: 80%;
    height: 80%;
    margin-bottom: 15px;
}

.replybtn {
	width: 70px;
    height: 40px;
    border: 1px solid var(--white-color);
    background-color: #7cb8eb;
    border-radius: 10px;
}
</style>
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
					<li class="nav-item"><a class="nav-link" href="about.html">후기
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="requestBoardMain.jsp?boardPage=1">문의</a></li>

					<%
					if (session.getAttribute("email") != null) {
						String email = (String) session.getAttribute("email");
						if (email.equals("admin")) {
					%>
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
						href="selectReservationDetails">내 정보</a></li>
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
	<%
		int req_seq = (int)session.getAttribute("req_seq");
		int boardPage = (int)session.getAttribute("boardPage");
		Request_BoardDTO dto = new Request_BoardDTO(req_seq);
		Request_BoardDAO dao = new Request_BoardDAO();
		Request_BoardDTO rDto = dao.selectDetail_request(dto);
		admin_replyDAO adminDao = new admin_replyDAO();
		admin_replyDTO adminDto = new admin_replyDTO(req_seq);
		admin_replyDTO aDto = adminDao.select_reply(adminDto);
	%>
	
	<main>
	   <section class="banner-section d-flex justify-content-center align-items-end">
                <div class="section-overlay"></div>

                <div class="container">
                    <div class="row">

                        <div class="col-lg-7 col-12">
                            <h1 class="text-white mb-lg-0">문의 게시판</h1>
                        </div>
                    </div>
                </div>
		</section>
		
		<section class="d-flex justify-content-center align-items-end">
   		<div class="container">
   			<div class="row">
   				 <!-- 게시판 답글 수정 -->   
			     <h1 class="reqtitle"><%=rDto.getReqTitle() %></h1><br>
			     <hr>
			     <h5 class="reqwriter">작성자 : <%=rDto.getReqEmail() %></h5><br>
			     <hr>
			     <h5>내용</h5><br>
			     <div class="row">
			     <textarea class="reqtext" rows="10" cols="50" readonly="readonly"><%if (rDto.getReqContent() == null) {%><%}else if (rDto.getReqContent() != null) {%><%=rDto.getReqContent() %><%} %></textarea>
			     	<%if(rDto.getReqFile() == null) {%>
			        <%}else if(rDto.getReqFile() != null){%>
						<img alt="x" src="./file/<%=rDto.getReqFile() %>" style="display: inline-block; width: 45%; height: 97%; margin-left: 4%;">
					<%} %>
			     </div>
   			</div>
   		</div>
		</section>
   		
	<br>
	<hr>
		
		<section class="d-flex justify-content-center align-items-end">
	   		<div class="container">
	   			<div class="row">
	   				<h2 class="replytitle">답글 작성</h2>
				    <hr>
				    <h5 class="replywriter">작성자 : 관리자</h5><br>
				    <hr>
				    <form action="replyUpdate" method="post" enctype="multipart/form-data">
					    <h5>내용</h5>
				     	<div class="row">
					    <textarea class="replytext" rows="10" cols="50" name="reply_content"><%=aDto.getReplyContent()%></textarea>
		                  	<%if(aDto.getReplyPhoto() == null) {%>
		                     <%}else if(aDto.getReplyPhoto() != null){%>
		                     
							<img alt="x" src="./file/<%=aDto.getReplyPhoto() %>" style="display: inline-block; width: 45%; height: 97%; margin-left: 4%;">
							
							<%} %>
		     			</div>
						<input type="file" class="form-control" name="reply_photo" style="margin-bottom: 20px;"/>
						<input type="submit" class="replybtn" value="수정하기">
						<a href="requestBoardMain.jsp?boardPage=<%=boardPage%>" class="replyBack"><input type="button" class="replybtn" value="돌아가기"></a>
				    </form>
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

						<li class="footer-menu-item"><a href="#"
							class="footer-menu-link"> <i
								class="bi-chevron-double-right footer-menu-link-icon me-2"></i>
								리뷰
						</a></li>

						<li class="footer-menu-item"><a href="#"
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
							href="youjinseozzang1004@gmail.com" class="site-footer-link">
							youjinseozzang1004@gmail.com </a>
					</p>

					<ul class="social-icon mt-4">
						<li class="social-icon-item"><a href="#"
							class="social-icon-link button button--skoll"> <span></span>
								<span class="bi-twitter"></span>
						</a></li>

						<li class="social-icon-item"><a href="#"
							class="social-icon-link button button--skoll"> <span></span>
								<span class="bi-facebook"></span>
						</a></li>

						<li class="social-icon-item"><a href="#"
							class="social-icon-link button button--skoll"> <span></span>
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
	
</body>
</html>