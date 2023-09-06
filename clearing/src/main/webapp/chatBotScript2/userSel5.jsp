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
<span id ="timeSel5"  style="width: 13%; display:none;font-size: 12px;font-style: italic;color: darkgray;margin-left: 87%;" > <%=talkTime %></span>
<div id="userSel5" style="display: none">5. 상담원 연결</div><br>
		 <div id = "connect" style="display: none"> 
[상담사 연결]<br>
		 상담원을 연결 하시려면<br>
		 아래👇 링크를 클릭 하세요!<br>
		 &#128222;<a href='tel:070-4567-4321'>전화 상담 연결</a><br><br>
		 <div id = "userbutton5" >
		 <button class="btn btn-primary sel" type="button" value="1" style="background-color: #7CB8EB;border-color:#7CB8EB;">1. 요금 문의</button><br>
  		<button class="btn btn-primary sel" type="button" value="2" style="background-color: #7CB8EB;border-color:#7CB8EB;">2. 환불 문의</button><br>
  		<button class="btn btn-primary sel" type="button" value="3" style="background-color: #7CB8EB;border-color:#7CB8EB;">3. 세탁시 주의 사항</button><br>
  		<button class="btn btn-primary sel" type="button" value="4" style="background-color: #7CB8EB;border-color:#7CB8EB;">4. 업체 정보 수정 문의</button><br>
		 </div>
		 </div>
		 
		 <script src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript">
$(function(){
	setTimeout(function() {    
		$('#userSel5').css("display","block");	
		$('#timeSel5').css("display","block");	
			
		},300);
	setTimeout(function() {    
		$('#connect').css("display","block");
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
		}
});
		});
</script>
</body>
</html>