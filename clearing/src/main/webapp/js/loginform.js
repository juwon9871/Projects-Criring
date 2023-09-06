function formChk() {
	var member = document.querySelector('input[name="flexRadioDefault"]:checked').value;
	var email = document.getElementById("form1Example13");
	var pw = document.getElementById("form1Example23");
	var name = document.getElementById("form1Example24");
	var addr = document.getElementById("sample5_address");
	var laundryCnt = document.getElementById("form1Example25");
	var dryerCnt = document.getElementById("form1Example26");
	
	/* 정규식*/
	var exptext = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if(email.value =="") {
		alert("이메일을 입력하세요");
		email.focus();
		
		return false;
	}else {
		
		if(!exptext.test(email.value)) {
			alert("이메일형식이 올바르지 않습니다.");
			email.focus();
			
			return false;
		}
	}
	
	if(pw.value =="") {
		alert("비밀번호를 입력하세요");
		pw.focus();
		
		return false;
	}
	
	if(name.value == "") {
		alert("이름 또는 사업자명을 입력하세요");
		name.focus();
		
		return false;
	}
	
	if(addr.value =="") {
		alert("주소 검색을 이용하여 주소를 입력하세요");
		addr.focus();
		
		return false;
	}
	
	if(member == "store") {
		
		if(laundryCnt.value =="") {
			alert("세탁기 수를 입력하세요");
			laundryCnt.focus();
			
			return false;
		}
		if(dryerCnt.value =="") {
			alert("건조기 수를 입력하세요.");
			dryerCnt.focus();
			
			return false;
		}
	}
}

function openChkEmail() {
	window.name = "parentForm";
	window.open = ("emailCheckForm.jsp", "chkForm", "width:500, height=300, resizable=no");

}

function inputEmailChk() {
	document.userInfo.emailDuplication.value = "emailUncheck";
}

function pValue() {
	document.getElementById("userEmail").value = opener.document.userInfo.form1Example13.value;
}

function emailCheck() {
	var email = document.getElementById("userEmail").value;
	if (!email) {
		alert("이메일을 입력하지 않았습니다");
		return false;
	} else {
		var param = "email" + email;
		httpRequest = getXMLHttpRequest;
		httpRequest.onreadystatechange = callback;
		httpRequest.open("POST", "MemberEmailCheck", true);
		httpRequest.setRequestHeader('content-Type', 'application/x-www-form-urlencoded');
		httpRequest.send(param);
	}
}

function callback() {
	if (httpRequest.readyState == 4) {
		// 결과값을 가져온다.
		var resultText = httpRequest.responseText;
		if (resultText == 0) {
			alert("사용할수없는 아이디입니다.");
			document.getElementById("cancelBtn").style.visibility = 'visible';
			document.getElementById("useBtn").style.visibility = 'hidden';
			document.getElementById("msg").innerHTML = "";
		}
		else if (resultText == 1) {
			document.getElementById("cancelBtn").style.visibility = 'hidden';
			document.getElementById("useBtn").style.visibility = 'visible';
			document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
		}
	}
}

function sendCheckValue() {
	// 중복체크 결과인 idCheck 값을 전달한다.
	opener.document.userInfo.idDuplication.value = "emailCheck";
	// 회원가입 화면의 ID입력란에 값을 전달
	opener.document.userInfo.id.value = document.getElementById("joinEmail").value;

	if (opener != null) {
		opener.chkForm = null;
		self.close();
	}
}    
