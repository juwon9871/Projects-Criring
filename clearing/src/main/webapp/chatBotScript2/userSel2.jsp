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
	<span id ="timeSel2"  style="width: 13%; display:none;font-size: 12px;font-style: italic;color: darkgray;margin-left: 87%;" > <%=talkTime %></span>
	<div id="userSel2" style="display: none">2.환불 문의</div>
		<div id = "refund" style="display: none">
 			&#128680;환불 문의<br> 
			환불 규정<br>
			■ 이용 30분전 환불 불가&#128683;<br>
			■ 취소 수수료는 예약금의 10%<br> 
			■ [ 로그인 -> My page -> 예약확인 -> 예약취소] 시<br> 
			자동 환불<br>
			<br>
			
		<div id = "userbutton2" >
  			<button class="btn btn-primary sel" type="button" value="1" style="background-color: #7CB8EB;border-color:#7CB8EB">1. 요금문의</button><br>
  			<button class="btn btn-primary sel" type="button" value="3" style="background-color: #7CB8EB;border-color:#7CB8EB">3. 세탁시 주의 사항</button><br>
  			<button class="btn btn-primary sel" type="button" value="4" style="background-color: #7CB8EB;border-color:#7CB8EB">4. 업체 정보 수정 문의</button><br>
  			<button class="btn btn-primary sel" type="button" value="5" style="background-color: #7CB8EB;border-color:#7CB8EB">5. 상담원 연결</button><br><br>
		</div>
		</div>
		
<script src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript">
$(function(){
	setTimeout(function() {    
		$('#userSel2').css("display","block");	
		$('#timeSel2').css("display","block");	
			
		},300);
	setTimeout(function() {    
		$('#refund').css("display","block");
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
		}else if(qna=="3"){
			
				$.ajax({
					url:"chatBotScript2/userSel3.jsp",
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