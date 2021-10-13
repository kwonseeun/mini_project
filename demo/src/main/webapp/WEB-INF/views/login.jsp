<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	

<head >
<title>로그인 페이지</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('#loginBtn').click(function() {
			ajaxLoginCheck();
		});
		$('#joinBtn').click(function() {
			goJoinForm();
		});
	})

	function fn_limitlength(el, maxlength) {
		if (el.value.length > maxlength) {
			el.value = el.value.substr(0, maxlength);
		}
	}
	function goJoinForm() {
		$('#loginForm').attr('action', '/join').submit();
	}
	function ajaxLoginCheck() {

		var userId = $('[name=userId]').val();
		var userPw = $('[name=userPw]').val();

		var param = {
			userId : userId,
			userPw : userPw
		}
		
		$.ajax({
			type : "POST",
			url : "${contextPath}/loginCheck",
			data : JSON.stringify(param),
			contentType : "application/json; charset=UTF-8",
			success : function(data, textStatus, xhr) {

				if (data.isLogin) {
					
					window.location.href = '/home';			

				} else {

					alert('로그인에 실패하였습니다.')

				}

			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "error:" + error);
			}
		})
	}
</script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<body>
	<form id="loginForm" method="post" style="margin:30px; text-align:center">
		<h2>로그인</h2>
		<input type="text" name="userId" placeholder="아이디" oninput="fn_limitlength(this,10)" maxlength="20" /><br>
		<input type="password" name="userPw" placeholder="비밀번호" oninput="fn_limitlength(this,15)" maxlength="20" />

	</form>
	<button id="loginBtn" style="margin-left:605px;" class="btn btn-primary">로그인</button>
	<button id="joinBtn" style="margin-left:15px;" class="btn btn-warning">회원가입</button>
</body>
</html>