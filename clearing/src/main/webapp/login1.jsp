<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.clearing.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
<link href="css/login.css" rel="stylesheet" />
<link href="css/chatbot.css" rel="stylesheet">
<style type="text/css">
@font-face {
	font-family: 'gmarket';
	src: url('./fonts/GmarketSansTTFMedium.ttf') format('truetype');
}

body {
	font-family: 'gmarket';
}

.modal label {
	color: black;
}
</style>
<!--

Tooplate 2132 Clean Work

https://www.tooplate.com/view/2132-clean-work

Free Bootstrap 5 HTML Template

-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0db420091d1781f4feb06d2e77972cba&libraries=services"></script>
<script src="https://kit.fontawesome.com/a32650dbb1.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">크리링 계정 만들기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="login-background">
						<section class="vh-100">
							<div class="container py-5 h-100">
								<div
									class="row d-flex align-items-center justify-content-center h-100 modal-form">
									<form action="joinMember" method="post" name="userInfo">
										<div class="memberStore"
											style="display: flex; justify-content: space-around;">
											<div class="form-check">
												<!-- onclick=getMember(event)지움 -->
												<input class="form-check-input" type="radio"
													name="flexRadioDefault" id="flexRadioDefault1"
													value="member" checked /> <label class="form-check-label"
													for="flexRadioDefault1"> 일반회원 </label>
											</div>

											<div class="form-check">
												<!-- getMember(event)지움 -->
												<input class="form-check-input" type="radio"
													name="flexRadioDefault" id="flexRadioDefault2"
													value="store" /> <label class="form-check-label"
													for="flexRadioDefault2"> 사업자 </label>
											</div>
										</div>
										<script>
											$(
													function() {
														$(
																"input[name='flexRadioDefault']")
																.click(
																		function() {
																			var test = $(
																					"input[name='flexRadioDefault']:checked")
																					.val();
																			if ($(
																					"input[name='flexRadioDefault']:checked")
																					.val() == "member") {
																				$(
																						"#form1Example25")
																						.attr(
																								"disabled",
																								true);
																				$(
																						"#form1Example26")
																						.attr(
																								"disabled",
																								true);
																			} else {

																				$(
																						"#form1Example25")
																						.attr(
																								"disabled",
																								false);
																				$(
																						"#form1Example26")
																						.attr(
																								"disabled",
																								false);
																			}
																		});

													})
										</script>
										<!-- Email input -->
										<div class="form-outline mb-4">
											<label class="form-label" for="form1Example13">Email
												address</label> <input type="email" id="form1Example13"
												name="joinEmail" class="form-control form-control-lg" />
											<button id="idCheck" type="button"
												class="btn btn-primary btn-lg btn-block">중복체크</button>
											<input type="hidden" name="emailDuplication"
												value="emailUncheck">

										</div>

										<!-- Password input -->
										<div class="form-outline mb-4">
											<label class="form-label" for="form1Example23">Password</label>
											<input type="password" id="form1Example23" name="joinPw"
												class="form-control form-control-lg" />
										</div>

										<div class="form-outline mb-4">
											<label class="form-label" for="form1Example24">Name</label> <input
												type="text" id="form1Example24" name="joinName"
												class="form-control form-control-lg" />
										</div>

										<div class="form-outline mb-4">
											<label class="form-label" for="sample5_roadAddress">Address</label>
											<input type="text" id="sample5_address" name="joinAddr"
												class="form-control form-control-lg" placeholder="주소"
												readonly> <input type="button"
												class="btn btn-primary btn-lg btn-block"
												onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
											<!-- <input type="text" id="sample4_roadAddress"
												placeholder="도로명주소" name="joinAddr"
												class="form-control form-control-lg" />
											<input
												type="button" onclick="sample4_execDaumPostcode()"
												class="btn btn-primary btn-lg btn-block" value="주소 찾기" /><br /> -->
										</div>

										<div id="map"
											style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
										<div id="searchLat" style="display: none;">
											<!-- class="dp-none;" -->
										</div>
										<div id="searchLng" style="display: none;">
											<!-- class="dp-none;" -->
										</div>

										<script>
											function sample4_execDaumPostcode() {
												new daum.Postcode(
														{
															oncomplete : function(
																	data) {
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
											var mapContainer = document
													.getElementById('map'), // 지도를 표시할 div
											mapOption = {
												center : new daum.maps.LatLng(
														37.537187, 127.005476), // 지도의 중심좌표
												level : 5
											// 지도의 확대 레벨
											};

											//지도를 미리 생성
											var map = new daum.maps.Map(
													mapContainer, mapOption);
											//주소-좌표 변환 객체를 생성
											var geocoder = new daum.maps.services.Geocoder();
											//마커를 미리 생성
											var marker = new daum.maps.Marker(
													{
														position : new daum.maps.LatLng(
																37.537187,
																127.005476),
														map : map
													});

											function sample5_execDaumPostcode() {
												new daum.Postcode(
														{
															oncomplete : function(
																	data) {
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
										<div>
											<input type="number" id="form1Example25" name="laundryCnt"
												class="form-control form-control-lg laundryNum"
												placeholder="세탁기 수" disabled="disabled" /> <input
												type="number" id="form1Example26" name="dryerCnt"
												class="form-control form-control-lg" placeholder="건조기 수"
												disabled="disabled" />

										</div>
										<!-- Submit button -->
										<button type="submit"
											class="btn btn-primary btn-lg btn-block modal-btn"
											onclick="return formChk(); ">Sign up</button>
									</form>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>


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
						href="requestBoardMain.jsp?boardPage=1">문의 </a></li>
					<%
					String email = (String) session.getAttribute("email");
					if (email != null) {
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
		<section
			class="hero-section hero-section-full-height d-flex justify-content-center align-items-center">
			<div class="section-overlay"></div>

			<div class="container">
				<div class="row">
					<!-- GRID Place -->
					<div class="login-background">
						<section class="vh-100">
							<div class="container py-5 h-100">
								<div
									class="row d-flex align-items-center justify-content-center h-100">
									<div class="col-md-8 col-lg-7 col-xl-6">
									</div>
									<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">

										<form action="loginChk" method="post">
											<!-- Member OR Store -->
											<div class="memberLoginChk">
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="loginMemberStore" id="flexRadioDefault1"
														value="member" checked> <label
														class="form-check-label" for="flexRadioDefault1">
														일반 로그인</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="loginMemberStore" id="flexRadioDefault2"
														value="loginMemberStore"> <label
														class="form-check-label" for="flexRadioDefault2">
														사업자 로그인 </label>
												</div>
											</div>
											<!-- Email input -->
											<div class="form-outline mb-4">
												<input type="text" id="form1Example31" name="inputEmail"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form1Example31">Email
													address</label>
											</div>

											<!-- Password input -->
											<div class="form-outline mb-4">
												<input type="password" id="form1Example30" name="inputPw"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form1Example30">Password</label>
											</div>

											<div
												class="d-flex justify-content-around align-items-center mb-4">


											</div>

											<!-- Submit button -->
											<div class="joinform-btn">
												<button type="submit"
													class="btn btn-primary btn-lg btn-block">로그인</button>
												<button type="button"
													class="btn btn-primary btn-lg btn-block"
													data-bs-toggle="modal" data-bs-target="#exampleModal">
													회원 가입</button>
											</div>
										</form>

									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>

			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                    <path fill="#ffffff" fill-opacity="1"
					d="M0,224L40,229.3C80,235,160,245,240,250.7C320,256,400,256,480,240C560,224,640,192,720,176C800,160,880,160,960,138.7C1040,117,1120,75,1200,80C1280,85,1360,139,1400,165.3L1440,192L1440,320L1400,320C1360,320,1280,320,1200,320C1120,320,1040,320,960,320C880,320,800,320,720,320C640,320,560,320,480,320C400,320,320,320,240,320C160,320,80,320,40,320L0,320Z"></path>
                </svg>
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

						<li class="footer-menu-item"><a
							href="requestBoardMain.jsp?boardPage=1" class="footer-menu-link">
								<i class="bi-chevron-double-right footer-menu-link-icon me-2"></i>
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
							href="email: youjinseozzang1004@gmail.com"
							class="site-footer-link"> youjinseozzang1004@gmail.com </a>
					</p>

					<ul class="social-icon mt-4">
						<li class="social-icon-item"><a
							class="social-icon-link button button--skoll"> <span></span>
								<span class="bi-twitter"></span>
						</a></li>

						<li class="social-icon-item"><a
							class="social-icon-link button button--skoll"> <span></span>
								<span class="bi-facebook"></span>
						</a></li>

						<li class="social-icon-item"><a
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

	<script src="./js/jquery-3.7.0.js"></script>
	<!-- 날짜 선택 js -->
	<script type="text/javascript">
		$('#idCheck').on('click',function(){
		    var email = $('#form1Example13').val();
		    $.ajax({
				url:"http://localhost:8081/clearing/loginDChk",
				dataType:'text',
				data:{MB_EMAIL:email},
				success: function(result,textStatus){
					if(result ==='usable'){
						alert("사용할수 있는 아이디 입니다.");
					}else{
						alert("이미 사용중인 아이디 입니다.");
					}
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
					선택하거나 번호를 입력해 주세요.<br>
					<br>

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
					대화 내용은 상담을 위해서만 사용됩니다.<br>
					<br>
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
		var cr_email = "<%=cr_email%>
						";
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
	</script>



	<script src="./js/jquery-3.7.0.js"></script>
	<!-- 날짜 선택 js -->
	<script type="text/javascript">
		$('#idCheck').on('click', function() {
			var email = $('#form1Example13').val();
			$.ajax({
				url : "http://localhost:8081/clearing/loginDChk",
				dataType : 'text',
				data : {
					MB_EMAIL : email
				},
				success : function(result, textStatus) {
					if (result === 'usable') {
						alert("사용할수 있는 아이디 입니다.");
					} else {
						alert("이미 사용중인 아이디 입니다.");
					}
				}
			});

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
	<script src="js/loginform.js"></script>
	<script src="js/btnScroll.js"></script>
</body>
</html>
