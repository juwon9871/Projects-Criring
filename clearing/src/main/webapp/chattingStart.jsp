<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<style type="text/css">
.btn{

    background-color: #7CB8EB;
    border-color: #7CB8EB;
    border-bottom-left-radius: 18px;
    border-bottom-right-radius: 18px;
    border-top-right-radius: 18px;
    border-top-left-radius: 0px;
}
</style>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
   integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
   crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<% String email=(String)session.getAttribute("email"); %>
	<!-- 유저 밸류값은 표현식으로 세션에서 저장된거 가져올거임 -->
	<!-- Scrollable modal -->
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" id="CSR" data-remote="ChatModal3.jsp"  data-bs-toggle="modal" data-bs-target="#staticBackdrop">
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
      
      </div>
      <div class="modal-footer">
        <button type="button" id="Exit"class="btn btn-secondary" data-bs-dismiss="modal">나가기</button>
      </div>
    </div>
  </div>
</div>

	<script src="js/bootstrap.min.js"></script>
	<script src="./js/jquery-3.7.0.js"></script>
<script>
		$('#staticBackdrop').on('show.bs.modal', function(e) {
	
			var button = $(e.relatedTarget);
			var modal = $(this);
			
			modal.find('.modal-body').load(button.data("remote"));
	
		});
		$('#Exit').on('click',function(){
			window.location.href='http://localhost:8081/clearing2/chattingStart.jsp';
			
		});
	</script> 


	
	 
</body>
</html>