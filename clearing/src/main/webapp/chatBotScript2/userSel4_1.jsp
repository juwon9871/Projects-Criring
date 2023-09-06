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
<span id ="timeSel4"  style="width: 13%; display:none;font-size: 12px;font-style: italic;color: darkgray;margin-left: 87%;" > <%=talkTime %></span>
		 <div id="userSel4" style="display: none">4. 업체 정보 수정 문의</div>
		 <div id = "updatestore"style="display: none">
수정 가능한 정보<br>
		 	1. 세탁기, 건조기 대수<br>
		 	2. 업체 연락처<br>
		 	3. 업체 명 <br>
		 	[업체 상세 정보 수정]-> 문의 페이지를 참고해주세요 👉<a href="chattingStart.jsp">문의등록페이지</a><br>
		 	
		 <div id = "userbutton4">
		 	<button class="btn btn-primary sel" type="button" value="1" style="background-color: #7CB8EB;border-color:#7CB8EB">1. 요금 문의</button><br>
		 	<button class="btn btn-primary sel" type="button" value="2" style="background-color: #7CB8EB;border-color:#7CB8EB">2. 환불 문의</button><br>
		 	<button class="btn btn-primary sel" type="button" value="3" style="background-color: #7CB8EB;border-color:#7CB8EB">3. 세탁시 주의 사항</button><br>
		 	<button class="btn btn-primary sel" type="button" value="5" style="background-color: #7CB8EB;border-color:#7CB8EB">5. 상담원 연결</button><br>
		 </div>
		 </div>
<script src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript">
$(function(){
	setTimeout(function() {    
		$('#userSel4').css("display","block");	
		$('#timeSel4').css("display","block");	
			
		},300);
	setTimeout(function() {    
		$('#updatestore').css("display","block");
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
			
		}else if(qna=="3"){
			$.ajax({
				url:"chatBotScript2/userSel3.jsp",
				success: function(result){
					$("#ajaxDisplay").html(result);
				}
			});
				
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