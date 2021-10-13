<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<html>
<head>
<head>
</head>
<body>
	<h2>[게시판 수정]</h2>
	<form action='<c:url value='/updateBoard'/>' method="post">	
			<tr>
					<td><input type="hidden" id="boardNo" name="boardTitle">
							<input type="hidden" id="writer" name="writer" value="${user.userId}">
					</td>												
			</tr>
		

		<div>
			<label>제목</label>
			<textarea rows="5" cols="13" name="boardTitle">${board.boardTitle}</textarea>
		</div>
		<div>
			<label>내용</label>
			<textarea rows="5" cols="13" name="boardContent">${board.boardContent}</textarea>
		</div>
		<button type="submit">수정완료</button>
		<button type="button" onclick="location.href='/listBoard'">돌아가기</button>
	</form>
	<input type="hidden" name="boardNo" value="${board.boardNo}">
</body>
</html>
