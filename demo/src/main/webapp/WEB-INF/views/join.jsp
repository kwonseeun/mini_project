<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	
	
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	

<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
	

	
function fn_limitlength(el, maxlength) {
	if (el.value.length > maxlength) {
		el.value = el.value.substr(0, maxlength);
	}
}

function fn_join(){
	
	var isValid = true;
	isValid = fn_validation();
	if(isValid){
		fn_join_ajax();
// 		$('#frm').attr('action','/joinUser').submit();
	}
}

function fn_validation() {
	var userId = $('[name=userId]').val();
	var userPw = $('[name=userPw]').val();
	var userName = $('[name=userName]').val();
	var userPhone = $('[name=userPhone]').val();
	
	//아이디, 비밀번호, 이름, 전화번호 체크
	if(userId == '' || typeof(userId) == 'undefined'){
		alert('id를 입력해주세요.');
		return false;
	}else if(userPw == '' || typeof(userPw) == 'undefined'){
		alert('비밀번호를 입력해주세요.');
		return false;
	}else if(userName == '' || typeof(userName) == 'undefined'){
		alert('이름을 입력해주세요.');
		return false;
	}else if(userPhone == '' || typeof(userPhone) == 'undefined'){
		alert('번호를 입력해주세요.');
		return false;
	}else{
		return true;
	}
	
}

function idCk(){
	id = $("[name=userId]").val();
	
	var param = {
			userId : id
		}
		
	
	$.ajax({
	    url: '/dupCheck',
	    type: 'POST',
	    data:  JSON.stringify(param),
	    contentType : "application/json; charset=UTF-8",//내가 서버로 보내는 데이터의 타입
	    success: function(data){
	    	console.log(data);
	         if(data.resultCode == '0000'){
	         console.log("아이디 없음");
	         alert("사용하실 수 있는 아이디입니다.");
	         }else{
	         	console.log("아이디 있음");
	         	alert("중복된 아이디가 존재합니다.");
	         }
	    },
	    error: function (){        
	                      
	    }
  	});

}


function fn_join_ajax(){
	var id = $("[name=userId]").val();
	var pw = $('[name=userPw]').val();
	var name = $('[name=userName]').val();
	var phone = $('[name=userPhone]').val();
	
	var param = {
			userId : id,
			userPw : pw,
			userName : name,
			userPhone : phone
		}
		
	
	$.ajax({
	    url: '/joinUser',
	    type: 'POST',
	    data:  JSON.stringify(param),
	    contentType : "application/json; charset=UTF-8",//내가 서버로 보내는 데이터의 타입
	    success: function(data){
	    	console.log(data);
	         if(data.resultCode == '0000'){
	         	alert("회원가입이 완료되었습니다.");
	         	$('#frm').attr('action','/login').submit();
	         }else{
	         	alert("회원가입 실패");
	         }
	    },
	    error: function (){        
	                      
	    }
  	});

}
</script>


</head>
<body>
 
 <h2> 회원가입 </h2>
	<form method="post" id="frm">
		<h5>아이디: </h5><input type="text" name="userId" class="form-control" placeholder="아이디를 입력하세요" oninput="fn_limitlength(this,10)" maxlength="20" />
		<button type="button" class="btn btn-primary" onclick="idCk()">중복검사</button> 
		<br><h5>비밀번호: </h5><input type="password" name="userPw" class="form-control" placeholder="비밀번호를 입력하세요" oninput="fn_limitlength(this,15)" maxlength="20" />
		<br> <h5>이름: </h5> <input type="text" name="userName" class="form-control" placeholder="이름을 입력하세요"  oninput="fn_limitlength(this,10)" maxlength="10" />
	   <br> <h5>전화번호: </h5> <input type="text" name="userPhone" class="form-control" placeholder="전화번호를 입력하세요"  oninput="fn_limitlength(this,15)" maxlength="11" /> <br>
	</form>

	<button onclick="fn_join()" class="btn btn-danger">회원가입</button>

</body>
</html>