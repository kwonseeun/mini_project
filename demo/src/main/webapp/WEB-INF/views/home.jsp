<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- main content -->
	<div class="container-fluid text-center bg-main" style="padding:50px">
	
			<h2>${user.userId}님,반갑습니다!</h2>
		<li><a href="/listBoard"><i class="fa-board"></i>게시판</a></li>
		<li><a href="/logout"><i class="fa fa-sign-out"></i> 로그아웃</a></li>

	</div>

</body>
</html>