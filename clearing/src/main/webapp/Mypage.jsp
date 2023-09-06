<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.clearing.model.reservation_detailsDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.clearing.model.usingVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<meta name="description" content="" />
<meta name="author" content="" />

<title>Clean Work HTML CSS Template</title>

<!-- CSS FILES -->
<link rel="preconnect" href="https://fonts.googleapis.com" />

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,700;1,400&display=swap"
	rel="stylesheet" />

<link href="css/bootstrap.min.css" rel="stylesheet" />

<link href="css/bootstrap-icons.css" rel="stylesheet" />

<link href="css/tooplate-clean-work.css" rel="stylesheet" />
<link href="css/login.css" rel="stylesheet">
<link href="css/mypageJ.css" rel="stylesheet">
<link href="css/chatbot.css" rel="stylesheet">
<!--

Tooplate 2132 Clean Work

https://www.tooplate.com/view/2132-clean-work

Free Bootstrap 5 HTML Template

-->
<script src="https://kit.fontawesome.com/a32650dbb1.js"
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0db420091d1781f4feb06d2e77972cba&libraries=services,clusterer,drawing"></script>
<script src="https://kit.fontawesome.com/a32650dbb1.js"
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
	String lat = request.getParameter("lat");
	String lng = request.getParameter("lng");
	reservation_detailsDAO dao = new reservation_detailsDAO();
	ArrayList<usingVO> details = (ArrayList<usingVO>) request.getAttribute("details");
	%>
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
						href="requestBoardMain.jsp?boardPage=1">문의</a></li>
					<!-- 문제있다면 여기일수있음 check -->
					<%
					String email = (String) session.getAttribute("email");
					if (email.equals("admin")) {
					%>
					<!-- admin 로그인시 생기는 메뉴 TODO-->
					<li class="nav-item"><a class="nav-link" href="adminReviewBoardMain.jsp?boardPage=1">관리자</a>
					</li>
					<%
					}
					%>

					<%
					if (session.getAttribute("member") != null || session.getAttribute("storeMember") != null) {
					%>
					<li class="nav-item ms-3"><a
						class="nav-link custom-btn custom-border-btn custom-btn-bg-white btn"
						href="#" >내 정보</a></li>
					<%-- href="Mypage.jsp?email=<%=email%>&addr=<%=addr%>&lat=<%=lat%>&lng=<%=lng%>" --%>
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
		<section
			class="hero-section hero-section-full-height d-flex justify-content-center align-items-center">
			<div class="section-overlay"></div>
			<ul class="menu_icon_group">
				<li class="menu_icon">
					<button class="linkBtn" id="linkBtn1" onclick="goToScroll('services-section'); return false;">
						<i class="fa-solid fa-user mypagebtn"></i> <span class="mypagespan">회원 정보 수정</span>
					</button>

				</li>
				<li class="menu_icon">
					<button class="linkBtn" id="linkBtn2" onclick="goToScroll('services-section'); return false;">
						<i class="fa-solid fa-calendar-days mypagebtn"></i> <span class="mypagespan">예약 내역 조회</span>
					</button>

				</li>
				<li class="menu_icon">
					<button class="linkBtn" id="linkBtn3" onclick="goToScroll('services-section'); return false;">
						<i class="fa-solid fa-camera-retro mypagebtn"></i> <span class="mypagespan" style="padding-left: 25px;">내가 쓴 리뷰</span>
					</button>
				</li>
			</ul>
		</section>




		<section class="services-section section-padding section-bg"
			id="services-section">
			<section id="services-section1" style="display: none;">
				<div class="section-overlay"></div>

				<div class="container" style="margin-top: -2%;">
					<div class="row">
						<form action="myPageUpdate" method="post" class="myPageUpdateForm">
							<div class="mb-3 row">
								<label for="staticEmail" class="col-sm-2 col-form-label"
									style="color: #77B2E8">Email</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control-plaintext"
										id="staticEmail" name="inputEmail"
										value="<%=session.getAttribute("email")%>">
								</div>
							</div>
							<!-- 원래 비밀번호 확인 -->
							<div class="mb-3 row">
								<label for="inputPassword" class="col-sm-2 col-form-label"
									style="color: #77B2E8">기존 비밀번호</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPassword"
										name="inputPassword">
								</div>
							</div>
							<!-- 수정할 비밀번호 -->
							<div class="mb-3 row">
								<label for="inputUpdatePassword" class="col-sm-2 col-form-label"
									style="color: #77B2E8">변경 할 비밀번호</label>
								<div class="col-sm-10">
									<input type="password" class="form-control"
										id="inputUpdatePassword" name="inputUpdatePassword">
								</div>
							</div>
							<!-- 수정한 비밀번호 확인 -->
							<div class="mb-3 row">
								<label for="inputUpdatePasswordChk"
									class="col-sm-2 col-form-label" style="color: #77B2E8">변경
									할 비밀번호 확인</label>
								<div class="col-sm-10">
									<input type="password" class="form-control"
										id="inputUpdatePasswordChk" name="inputUpdatePasswordChk">
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-2 col-form-label" for="sample5_roadAddress"
									style="color: #77B2E8">변경할 주소</label>
								<div class="col-sm-10">
									<input type="button" class="btn btn-primary btn-lg btn-block"
										onclick="sample5_execDaumPostcode()" value="주소 검색"
										style="background-color: #77B2E8; border-color: #77B2E8; margin-top: 0; font-size: 14px;">
									<input type="text" id="sample5_address" name="joinAddr"
										class="form-control" value="<%=session.getAttribute("addr")%>"
										readonly style="width: 91%">
								</div>
								<!-- <div class="form-outline mb-4">

						</div> -->
							</div>


							<div id="map"
								style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
							<div id="searchLat" style="display: none;">
								<input type="text" name="userLatInput" id="userLat-input"
									value="<%=request.getParameter("lat")%>">
								<!-- class="dp-none;" -->
							</div>
							<div id="searchLng" style="display: none;">
								<input type="text" name="userLngInput" id="userLng-input"
									value="<%=request.getParameter("lng")%>">
								<!-- class="dp-none;" -->
							</div>

							<script>
							function sample4_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

												// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
												// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
												var roadAddr = data.roadAddress; // 도로명 주소 변수
												var extraRoadAddr = ""; // 참고 항목 변수

												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ""
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraRoadAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ""
														&& data.apartment === "Y") {
													extraRoadAddr += extraRoadAddr !== "" ? ", "
															+ data.buildingName
															: data.buildingName;
												}
												// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
												if (extraRoadAddr !== "") {
													extraRoadAddr = " ("
															+ extraRoadAddr
															+ ")";
												}

												// 우편번호와 주소 정보를 해당 필드에 넣는다.

												document
														.getElementById("sample4_roadAddress").value = roadAddr;

												// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
											},
										}).open();
							}
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div
							mapOption = {
								center : new daum.maps.LatLng(37.537187,
										127.005476), // 지도의 중심좌표
								level : 5
							// 지도의 확대 레벨
							};

							//지도를 미리 생성
							var map = new daum.maps.Map(mapContainer, mapOption);
							//주소-좌표 변환 객체를 생성
							var geocoder = new daum.maps.services.Geocoder();
							//마커를 미리 생성
							var marker = new daum.maps.Marker({
								position : new daum.maps.LatLng(37.537187,
										127.005476),
								map : map
							});

							function sample5_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												var addr = data.address; // 최종 주소 변수

												// 주소 정보를 해당 필드에 넣는다.
												document
														.getElementById("sample5_address").value = addr;
												// 주소로 상세 정보를 검색
												geocoder
														.addressSearch(
																data.address,
																function(
																		results,
																		status) {
																	// 정상적으로 검색이 완료됐으면
																	if (status === daum.maps.services.Status.OK) {

																		var result = results[0]; //첫번째 결과의 값을 활용

																		// 해당 주소에 대한 좌표를 받아서
																		var coords = new daum.maps.LatLng(
																				result.y,
																				result.x);
																		// 지도를 보여준다. 지워야함 TODO
																		map
																				.relayout();
																		// 지도 중심을 변경한다.
																		map
																				.setCenter(coords);
																		// 마커를 결과값으로 받은 위치로 옮긴다.
																		marker
																				.setPosition(coords)

																		var userLat = document
																				.getElementById('searchLat');
																		userLat.innerHTML = '<input type="text" name="userLatInput" id="userLat-input">';
																		var userLats = document
																				.getElementById('userLat-input');
																		userLats.value = coords
																				.getLat();
																		var userLng = document
																				.getElementById('searchLng');
																		userLng.innerHTML = '<input type="text" name="userLngInput" id="userLng-input">';
																		var userLngs = document
																				.getElementById('userLng-input');
																		userLngs.value = coords
																				.getLng();
																	}
																});
											}
										}).open();
							}
						</script>

							<button type="submit"
								class="btn btn-primary btn-lg btn-block modal-btn"
								style="background-color: #77B2E8; border-color: #77B2E8; padding: 0.5%">정보
								수정</button>
							<br>
							<br> <!-- <a href="index.jsp"><button
									class="btn btn-primary btn-lg btn-block modal-btn"
									style="background-color: #77B2E8; border-color: #77B2E8; padding: 0.5%; font-size: 18px; width: 123%;">회원탈퇴</button></a> -->
						</form>

					</div>
				</div>
			</section>

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

	<script src="./js/jquery-3.7.0.js"></script>


	<script type="text/javascript">
	
	$('#linkBtn1').on('click',function(){
				$("#services-section1").css("display","block");
		
		 
	});
	$('#linkBtn2').on('click',function(){
				$.ajax({
					url:"selectReservationDetails",
					success: function(result){
						$("#services-section").html(result);
					}
				});		
		 
	});
	$('#linkBtn3').on('click',function(){
				$.ajax({
					url:"Review_ViewUserController",
					success: function(result){
						$("#services-section").html(result);
					}
				});		
		 
	});
	

	</script>


	<button type="button" class="btn btn-primary scrolltop"
		onclick="goToTop(); return false;">
		<i class="fa-solid fa-arrow-up"></i>
	</button>

<%
	email = (String) session.getAttribute("email");
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
			window.location.href='http://localhost:8081/clearing/Mypage.jsp';
			
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
	<script src="js/kakaoMap.js"></script>
	<script src="js/btnScroll.js"></script>
</body>
</html>