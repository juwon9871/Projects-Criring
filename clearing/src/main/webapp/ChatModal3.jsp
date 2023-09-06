<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.sel{
	--bs-btn-padding-y: .25rem;
	 --bs-btn-padding-x: .5rem;
	 --bs-btn-font-size: 1rem;
	margin-bottom: 0.5%;
	width: 43%
}
#userSel1{
    line-height: 1;
	width: 23%;
    margin-left: 77%;	
    background-color: lightgray;
    padding: 2% 1%;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    border-top-left-radius: 10px;
}
#userSel2{
    line-height: 1;
    background-color: lightgray;
	width: 21%;
    margin-left: 79%;    
    padding: 2% 1%;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    border-top-left-radius: 10px;
}
#userSel3{
    line-height: 1;
    background-color: lightgray;
	width: 34%;
    margin-left: 66%;
    padding: 2% 1%;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    border-top-left-radius: 10px;
}
#userSel4{
    line-height: 1;
	margin-left: 60%;
    background-color: lightgray;
    width: 40%;
    padding: 2% 1%;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    border-top-left-radius: 10px;
}
#userSel5{
    line-height: 1;
	margin-left: 74%;
    background-color: lightgray;
    width: 26%;
    padding: 2% 1%;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    border-top-left-radius: 10px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
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
</body>
</html>