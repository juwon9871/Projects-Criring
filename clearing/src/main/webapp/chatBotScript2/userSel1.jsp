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
<span id ="timeSel1"  style="width: 13%; display:none;font-size: 12px;font-style: italic;color: darkgray;margin-left: 87%;" > <%=talkTime %></span>
		<div id="userSel1" style="display: none">1. 요금문의</div><br>
		
		<div id = "pricelist" style="width: 100%"></div>
		

	<div id="priceList" style="display: none">
	💵요금 표<br>
		 <table class="table" style="width:100%">
				  <thead class="table-info">
				    <tr>
				      <th scope="col" colspan="2" >Course</th>
				      <th scope="col">Price</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>쾌속</td>
				      <td>본세탁->헹굼 2번->탈수</td>
				      <td>4000원</td>
				    </tr>
				    <tr>
				      <td>표준</td>
				      <td>본세탁->헹굼 3번->탈수</td>
				      <td>4500원</td>
				    </tr>
				    <tr>
				      <td>고급</td>
				      <td>본세탁->헹굼 4번->탈수</td>
				      <td>5000원</td>
				    </tr>
				    <tr>
				      <td>최고급</td>
				      <td>본세탁2회->헹굼 4번->탈수</td>
				      <td>5500원</td>
				    </tr>
				    <tr>
				      <td>통세척</td>
				      <td>드럼통 세척</td>
				      <td>500원</td>
				    </tr>
				    <tr>
				      <td>추가 헹굼</td>
				      <td>헹굼 1회</td>
				      <td>1000원</td>
				    </tr>
				  </tbody>
			</table> 
		<div id = "userbutton1">
  			<button class="btn btn-primary sel" type="button" value="2" style="background-color: #7CB8EB;border-color:#7CB8EB">2. 환불 문의</button><br>
  			<button class="btn btn-primary sel" type="button" value="3" style="background-color: #7CB8EB;border-color:#7CB8EB">3. 세탁시 주의 사항</button><br>
  			<button class="btn btn-primary sel" type="button" value="4" style="background-color: #7CB8EB;border-color:#7CB8EB">4. 업체 정보 수정 문의</button><br>
  			<button class="btn btn-primary sel" type="button" value="5" style="background-color: #7CB8EB;border-color:#7CB8EB">5. 상담원 연결</button><br><br>
		</div>
	</div>
<script src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript">
$(function(){
	setTimeout(function() {    
		$('#userSel1').css("display","block");	
		$('#timeSel1').css("display","block");	
			
		},300);
	setTimeout(function() {    
		$('#priceList').css("display","block");
		},1000);
	$('.btn').on('click',function(){
		var qna=$(this).attr('value');
		var cr_email = "<%=cr_email%>";
		if(qna=="2"){
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