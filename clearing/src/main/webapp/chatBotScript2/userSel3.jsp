<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%Date date = new Date();
SimpleDateFormat tsd2 = new SimpleDateFormat("a HH:mm");
String talkTime = tsd2.format(date);
String cr_email = null;
if(session.getAttribute("email")==null){
	cr_email = "Guest";
}else{
	cr_email = (String)session.getAttribute("email");
}
%>
					<span id ="timeSel3"  style="width: 13%; display:none;font-size: 12px;font-style: italic;color: darkgray;margin-left: 87%;" > <%=talkTime %></span>
		<div id="userSel3" style="display: none">3. 세탁시 주의 사항</div>
		<div id ="warninglist" style="display: none">
❗ 이용 시 주의 사항 ❗<br><br>

			1. 주머니 속의 동전, 라이터 가연성 물질,<br>
				기타 <span style="color:red">내용물을 반드시 확인 후 꺼내고 사용해 주세요.</span> <br>
											 <br>
											 
			2. 세탁기 ,건조기 가동시 <span style="color:red">어린이들이 주위에 가지 않도록 각별히 주의 바랍니다.</span><br><br>
													
			3. 무인 세탁방은 <span style="color:red">사용자 부재시 세탁물 분실 우려가 있으니</span><br> 
			세탁 종료시 세탁물을 바로 꺼내 다른 사용자가 바로 사용 할 수 있도록 부탁 드립니다.<br><br>

			4. 세탁,건조 <span style="color:red">종료 후 10분 이상이 지나도 드럼속의 세탁물을 찾아가지않을 경우 </span><br>
			다음 사용자를 위해 임의로 세탁물을 꺼낼 수 있으므로 양해 부탁 드립니다.<br><br>

			5. 세탁물 분실 및 손상시 운영자는 책임을 지지 않으므로 주의 하십시오.<br><br>

			6. 이불 또는 세탁량이 너무 많을 경우<span style="color:red"> 물을 적게 사용하는<br> 
			드럼 세탁기 특성상</span> 세제가 모자른 느낌이 날 수 있습니다.	이는 정상적인 현상입니다.<br>
			<span style="color:blue">(정량 투입과 이불은 이불코스를 권장합니다)</span><br><br>

			🚫세탁 금지 품목🚫<br>
			가죽제품, 전기담요🔌, 실크 , 기저귀, 발매트, 베개, 반려동물 용품🐶<br><br>
		<div id = "userbutton3" >
			<button class="btn btn-primary sel" type="button" value="1" style="background-color: #7CB8EB;border-color:#7CB8EB">1. 요금 문의</button><br>
			<button class="btn btn-primary sel" type="button" value="2" style="background-color: #7CB8EB;border-color:#7CB8EB">2. 환불 문의</button><br>
			<button class="btn btn-primary sel" type="button" value="4" style="background-color: #7CB8EB;border-color:#7CB8EB">4. 업체 정보 수정 문의</button><br>
  			<button class="btn btn-primary sel" type="button" value="5" style="background-color: #7CB8EB;border-color:#7CB8EB">5. 상담원 연결</button><br><br>
		</div>
		</div>
<script src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript">
$(function(){
	setTimeout(function() {    
		$('#userSel3').css("display","block");	
		$('#timeSel3').css("display","block");	
			
		},300);
	setTimeout(function() {    
		$('#warninglist').css("display","block");
		},1000);
	$('.btn').on('click',function(){
		var qna=$(this).attr('value');
		var cr_email = "<%=cr_email%>";
		if(qna=="1"){
			$.ajax({
				url:"chatBotScript2/userSel1.jsp",
				success: function(result){
					$("#ajaxDisplay").html(result);
				}
			});	
		}else if(qna=="2"){
			
				$.ajax({
					url:"chatBotScript2/userSel2.jsp",
					success: function(result){
						$("#ajaxDisplay").html(result);
					}
				});
			
		}else if(qna=="4"){
			if(cr_email=="Guest"){
			$.ajax({
				url:"chatBotScript2/userSel4_1.jsp",
				success: function(result){
					$("#ajaxDisplay").html(result);
				}
			});
				
			}else{
			$.ajax({
				url:"chatBotScript2/userSel4_2.jsp",
				success: function(result){
					$("#ajaxDisplay").html(result);
				}
			});
				
			}
		}else if(qna=="5"){
			$.ajax({
				url:"chatBotScript2/userSel5.jsp",
				success: function(result){
					$("#ajaxDisplay").html(result);
				}
			});
		}
});
		});
</script>
</body>
</html>