<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- CSS FILES -->
<link rel="preconnect" href="https://fonts.googleapis.com" />

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,700;1,400&display=swap"
	rel="stylesheet" />

<link href="css/bootstrap.min.css" rel="stylesheet" />

<link href="css/bootstrap-icons.css" rel="stylesheet" />

<link href="css/tooplate-clean-work.css" rel="stylesheet" />
<link href="css/chatbot.css" rel="stylesheet">
<link href="css/using.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/a32650dbb1.js" crossorigin="anonymous"></script>
<style type="text/css">
@font-face {
    font-family: 'gmarket';
    src: url('./fonts/GmarketSansTTFMedium.ttf') format('truetype');
}

body {
  	background-color: var(--white-color);
	font-family: 'gmarket' !important;
}

</style>
</head>
<body>
	<%
	String StoreName = (String) session.getAttribute("store_name");
	String StoreAddr = (String) session.getAttribute("store_addr");
	int laundry_cnt = (int) session.getAttribute("laundry_cnt");
	int dryer_cnt = (int) session.getAttribute("dryer_cnt");
	int used[] = (int[]) request.getAttribute("used");
	String seldate = (String) request.getAttribute("seldate");
	String seltime = (String) request.getAttribute("seltime");
	int usedLength = 0;
	if (used != null) {
		usedLength = used.length;
	} else {
		usedLength = 0;
	}
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
					<li class="nav-item"><a class="nav-link" href="about.html">후기
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="requestBoardMain.jsp?boardPage=1">문의</a></li>

					<%
					String email = (String)session.getAttribute("email");
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
				<div class="row mainForm">
					<div class="col-lg-7 col-12 text-center mx-auto">
						<h3 class="res_current">예약 현황</h3>
						<div class="storename">
							<span><%=StoreName%></span> <span><%=StoreAddr%>점</span>
						</div>
						<form action="usingController" method="post">
							<div class="center-pos">
								<div class="abs-pos">
									<div class="reservation-input">
										<input type="date" id="Date" name="date" value="<%=seldate%>"
											class="date-select"> <select class="form-select"
											name="time" aria-label="multiple select example">
											<%
											if (seltime == null) {
											%>
											<option selected="selected" disabled="disabled">예약시간</option>
											<%
											} else {
											%>
											<option selected="selected" disabled="disabled"><%=seltime%></option>
											<%
											}
											%>
											<%
											for (int i = 6; i < 24; i++) {
												if (i == 9) {
											%>
											<option value="0<%=i%>:00~<%=i + 1%>:00">0<%=i%>:00~<%=i + 1%>:00
											</option>
											<%
											} else if (i < 9) {
											%>
											<option value="0<%=i%>:00~0<%=i + 1%>:00">0<%=i%>:00~<%=i + 1%>:00
											</option>
											<%
											} else {
											%>
											<option value="<%=i%>:00~<%=i + 1%>:00"><%=i%>:00~<%=i + 1%>:00
											</option>
											<%
											}
											%>
											<%
											}
											%>
										</select>
									</div>
									<div class="laundry-form">
										<div class="res-laundry">
											<div class="laundry-group">
												<%
												for (int i = 1; i <= laundry_cnt; i++) {
												%>

												<div class="btn-group" role="group"
													aria-label="Basic checkbox toggle button group">
													<input type="checkbox" class="btn-check"
														id="btncheck<%=100 + i%>" name="laundry"
														value="<%=100 + i%>" autocomplete="off"
														onclick='checkOnlyOne(this)'> <label
														class="res-btn btn-outline-primary"
														for="btncheck<%=100 + i%>">세탁기</label>
												</div>

												<%
												}
												%>
											</div>
											<div class="dryer-group">
												<%
												for (int i = 1; i <= dryer_cnt; i++) {
												%>


												<div class="btn-group-vertical" role="group"
													aria-label="Basic checkbox toggle button group">
													<input type="checkbox" class="btn-check"
														id="btncheck<%=200 + i%>" name="laundry"
														value="<%=200 + i%>" autocomplete="off"
														onclick='checkOnlyOne(this)'> <label
														class="res-btn btn-outline-primary"
														for="btncheck<%=200 + i%>">건조기</label>
												</div>

												<%
												}
												%>
											</div>
										</div>
									</div>
									<div class="res-complete-btn">
										<button type="submit"
											class="btn btn-primary book res-complete">예약하기</button>
										<a href="index.jsp">
											<button type="button" class="btn btn-primary back">돌아가기</button>
										</a>
									</div>
								</div>
							</div>
						</form>
					</div>
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
						<li class="footer-menu-item">
							<a href="#" class="footer-menu-link">
								<i
								class="bi-chevron-double-right footer-menu-link-icon me-2"></i>
								코인세탁방 검색
							</a>
						</li>

						<li class="footer-menu-item"> 
							<a href="#" class="footer-menu-link">
								<i
								class="bi-chevron-double-right footer-menu-link-icon me-2"></i>
								예약
							</a>
						</li>

						<li class="footer-menu-item">
							<a href="#" class="footer-menu-link">
									<i
									class="bi-chevron-double-right footer-menu-link-icon me-2"></i>
									리뷰
							</a>
						</li>

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
						<i class="bi-telephone-fill me-2"></i> <a href="tel: 010-1234-1234"
							class="site-footer-link"> 010-1234-1234 </a>
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
	<button type="button" class="btn btn-primary scrolltop" onclick="goToTop(); return false;">
		<i class="fa-solid fa-arrow-up"></i>
	</button>

				<% email=(String)session.getAttribute("email"); %>
	<!-- 유저 밸류값은 표현식으로 세션에서 저장된거 가져올거임 -->
	<!-- Scrollable modal -->
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary chatbotMain" id="CSR" data-remote="ChatModal3.jsp"  data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  <img alt="CSR" src="./images/CSR2.png">
</button>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrolable">
    <div class="modal-content">
      <div class="modal-header"  style="background-color: #7CB8EB;color: white">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">크리링 Chat-Bot</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" >
      	<% Date date = new Date();
	SimpleDateFormat sd = new SimpleDateFormat("yyyy년-MM월-dd일");
	SimpleDateFormat tsd = new SimpleDateFormat("HHmm");
	SimpleDateFormat tsd2 = new SimpleDateFormat("a HH:mm");
	String nowDate = sd.format(date);
	String time =tsd.format(date);
	String talkTime = tsd2.format(date);
	int numTime = Integer.parseInt(time);
		String cr_email = null;
	if(session.getAttribute("email")==null){
		cr_email = "Guest";
	}else{
		cr_email = (String)session.getAttribute("email");
	}
%>
	<% if(numTime<1000||numTime>1700){%>
		<span style="background-color:lightgray;padding: 1% 1%;margin-left: 34%;border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;"><%=nowDate %></span><br><br>
		안녕하세요 고객님 &#128075;<br>
		크리링 &#129302;챗봇 상담입니다.<br>
	<br>
		고객님, 지금은 운영시간이 아닙니다.<br>
	<br>
		현재는 챗봇 상담만 가능하며, 상담사 연결은 운영시간 내 문의 부탁드립니다.<br>
		감사합니다.<br>
	<br>
		[운영시간] &#128342;<br>
		평일 : 10시 - 17시 (공휴일 제외)<br>
		<br>
		문의사항을 선택하거나 번호를 입력해 주세요.<br><br>
		
		<div id = "allbutton">
  		<button class="btn btn-primary sel" type="button" value="1" style="background-color: #7CB8EB;border-color:#7CB8EB;">1. 요금 문의</button><br>
  		<button class="btn btn-primary sel" type="button" value="2" style="background-color: #7CB8EB;border-color:#7CB8EB;">2. 환불 문의</button><br>
  		<button class="btn btn-primary sel" type="button" value="3" style="background-color: #7CB8EB;border-color:#7CB8EB;">3. 세탁시 주의 사항</button><br>
  		<button class="btn btn-primary sel" type="button" value="4" style="background-color: #7CB8EB;border-color:#7CB8EB;">4. 업체 정보 수정 문의</button><br>
  		<button class="btn btn-primary sel" type="button" value="5" style="background-color: #7CB8EB;border-color:#7CB8EB;">5. 상담원 연결</button><br>
		</div>
		
	<%}else{%>
		<span style="background-color:lightgray;padding: 1% 1%;margin-left: 34%;border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;"><%=nowDate %></span><br><br>
		안녕하세요 고객님&#128075;<br>
		크리링 &#129302;챗봇 상담입니다.<br>
		<br>
		문의유형을 선택해주세요!<br>
		<br>
		상담원과의 대화가 필요할 경우<br>
		[상담원 연결] 버튼을 눌러주세요 : )<br>
		* 상담원 연결 후 문의사항을 말씀해주세요.<br>
		* 대화 내용은 상담을 위해서만 사용됩니다.<br><br>
		<!-- 타임딜레이 -->	
		<div id = "allbutton">
		<button class="btn btn-primary sel" type="button" value="1" style="background-color: #7CB8EB;border-color:#7CB8EB;">1. 요금 문의</button><br>
  		<button class="btn btn-primary sel" type="button" value="2" style="background-color: #7CB8EB;border-color:#7CB8EB">2. 환불 문의</button><br>
  		<button class="btn btn-primary sel" type="button" value="3" style="background-color: #7CB8EB;border-color:#7CB8EB">3. 세탁시 주의 사항</button><br>
  		<button class="btn btn-primary sel" type="button" value="4" style="background-color: #7CB8EB;border-color:#7CB8EB">4. 업체 정보 수정 문의</button><br>
  		<button class="btn btn-primary sel" type="button" value="5" style="background-color: #7CB8EB;border-color:#7CB8EB">5. 상담원 연결</button><br>
		</div>
	<%} %>
	
	
	
	<form action="#" id="ajaxDisplay">
	
	
	
	
	</form>
	
	<script src="./js/jquery-3.7.0.js"></script>
	
	
	<script type="text/javascript">
	$('.btn').on('click',function(){
		var qna=$(this).attr('value');
		var cr_email = "<%=cr_email%>";
		 //setTimeout(function() {    },700);
		if(qna=="1"){
			$('#allbutton').css("display","none");
			$.ajax({
				url:"chatBotScript2/userSel1.jsp",
				success: function(result){
					$("#ajaxDisplay").html(result);
				}
			});	
		}else if(qna=="2"){
			$('#allbutton').css("display","none");
			$.ajax({
				url:"chatBotScript2/userSel2.jsp",
				success: function(result){
					$("#ajaxDisplay").html(result);
				}
			});	
		}else if(qna=="3"){
			$('#allbutton').css("display","none");
				$.ajax({
					url:"chatBotScript2/userSel3.jsp",
					success: function(result){
						$("#ajaxDisplay").html(result);
					}
				});
			
		}else if(qna=="4"){
			$('#allbutton').css("display","none");
				if(cr_email=="Guest"){
				$.ajax({
					url:"chatBotScript2/userSel4_1.jsp",
					success: function(result){
						$("#ajaxDisplay").html(result);
					}
				});
				$('#userbutton4').css("display","block");
				}else{
				$.ajax({
					url:"chatBotScript2/userSel4_2.jsp",
					success: function(result){
						$("#ajaxDisplay").html(result);
					}
				});
				
				}
		}else if(qna=="5"){
			$('#allbutton').css("display","none");
				$.ajax({
					url:"chatBotScript2/userSel5.jsp",
					success: function(result){
						$("#ajaxDisplay").html(result);
					}
				});
			
		}else {
			
		}
		 
	});
	</script>
      </div>
      <div class="modal-footer">
        <button type="button" id="Exit"class="btn btn-secondary" data-bs-dismiss="modal">나가기</button>
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

	<!-- 사용중인 세탁기 사용불가 js -->
	<script type="text/javascript">
	<%for (int i = 0; i < usedLength; i++) {%>
	var num = <%=used[i]%>;
	if(num<200){
		var laundry = document.getElementById('btncheck<%=used[i]%>');
		laundry.setAttribute("disabled","");
	}else{
		var dryer = document.getElementById('btncheck<%=used[i]%>');
		dryer.setAttribute("disabled","");
	}
	

	<%}%>
	</script>
	<script src="./js/jquery-3.7.0.js"></script>
	<!-- 날짜/시간 선택 js -->
	<script type="text/javascript">
		$('#Date').on('blur',function(){
			const selDate= document.querySelector("#Date").value;
			var date = new Date();
		    var year = date.getFullYear();
		    var month = ("0" + (1 + date.getMonth())).slice(-2);
		    var day = ("0" + date.getDate()).slice(-2);
		    
		    const now_date = year+"-"+month+"-"+day;
			if(now_date!==selDate){
				window.location.href="http://localhost:8081/clearing/DateController?date="+selDate;
				
			}else{
				window.location.href="http://localhost:8081/clearing/bookLaundryController";
			}
		});
		
		$("select[name=time]").change(function(){
		 	var selTime =$(this).val();
		 	const selDate= document.querySelector("#Date").value;
		 	window.location.href="http://localhost:8081/clearing/TimeController?time="+selTime+"&date="+selDate;//value값 가져오기

		});
	</script>
	<!-- js 달력 선택 제한 스크립트 -->
	<script>
	
		var now_utc = Date.now()
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000; 
		var maxDate = new Date((now_utc+518400000)-timeOff).toISOString().split("T")[0];
		// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		document.getElementById("Date").setAttribute("max", maxDate);
		document.getElementById("Date").setAttribute("min", today);
		var time = new Date();
		var hours = ('0' + time.getHours()).slice(-2); 
		var minutes = ('0' + time.getMinutes()).slice(-2);

		var currentTime = hours + minutes;

		
		function checkOnlyOne(element) {
			  
			  const checkboxes 
			      = document.getElementsByName("laundry");
			  
			  checkboxes.forEach((cb) => {
			    cb.checked = false;
			  })
			  
			  element.checked = true;
			}
	 </script>
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