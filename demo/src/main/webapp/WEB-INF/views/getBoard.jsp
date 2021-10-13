<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function fncWrite(user) {
/* 	boardNo = location.search.substring(15); */
	boardNo =  ${board.boardNo}; 
	location.href = "/updateBoardForm?boardNo=" + boardNo;
}

function deleteBtn(boardNo){
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		alert('삭제가 완료되었습니다.')
		location.href = "/deleteBoard?boardNo="+boardNo;
	}else{   //취소
	    return;
	}
}

</script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<div class="container col-md-6" style="margin-right:350px; padding:50px">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title mb-3">${board.boardTitle}</h4>
            <h6 class="card-subtitle text-muted mb-4">
                <i class="far fa-user"></i> ${board.writer}
                <i class="far fa-clock"></i> ${board.regDate}
            </h6>
            <p class="card-text">${board.boardContents}</p>
        </div>
        <div class="card-body">
        <c:if test="${userId eq board.writer}">
    		<button type="button" id="writeBtn" class="btn btn-outline-primary" onclick="javascript:fncWrite('${user.userId}')">수정</button>
 			<a href="javascript:deleteBtn('${board.boardNo}');" role="button" class="btn btn-outline-info">삭제</a> 
 		</c:if>	
        </div>
        <div class="card-body">
            <a href='<c:url value='listBoard'/>' class="btn btn-info" role="button">목록으로</a>
        </div>
    </div>
</div>

</body>
</html>