<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	//$('[name=pageSelect]').on('change',function(){
		//$('[name=pageSize]').val($('[name=pageSelect]').val());
		//$('[name=searchForm]').attr('action', '/listBoard').submit();
	//});
})

	$(function() {
		$('.board_wrap').on('click', function() {
			let boardNo = $(this).children('.boardNo').text();
			$('[name=boardNo]').val(boardNo);
			$('[name=searchForm]').attr('action', '/getBoard').submit();
		})
	})

	function fncWrite(user) {
		boardNo = location.search.substring(15);

		location.href = "/write";
	}

	function searchBtn() {

		$('[name=searchForm]').attr('action', '/listBoard').submit();
	}

	function fn_movePage(curPage) {
		$('[name=currentPage]').val(curPage);
		$('[name=searchForm]').attr('action', '/listBoard').submit();
	}
</script>
</head>
<body>

	<div class="menu" style="text-align:center; margin:30px;">
			<a class="menu_index" href="/home">홈으로</a>
</div>

	<h2 style="text-align: center; padding: 50px;">게시글 목록</h2>
	

		<%-- <select name='pageSelect' style="margin-left:150px;margin-bottom:20px;">
			  <option value='10' <c:if test="${Search.pageSize eq 10 or Search.pageSize eq 0}">selected</c:if>>10</option>
			  <option value='30'<c:if test="${Search.pageSize eq 30 }">selected</c:if>>30</option>
			  <option value='50'<c:if test="${Search.pageSize eq 50 }">selected</c:if>>50</option>
			  <option value='100'<c:if test="${Search.pageSize eq 100 }">selected</c:if>>100</option>
		</select>--%>
		
				
		<div class="container-search" style="text-align: center">
		<form name="searchForm" method="post">
			<select name="keyType">
				<option value="title">제목</option>
				<option value="contents">내용</option>
				<option value="writer">작성자</option>
			</select> <input type="text" name="keyWord" id="keywordInput" value="" />
			<button type="button" onclick="searchBtn()">검색</button>
			<input type="hidden" name="currentPage" value="1" />
			 <input type="hidden" name="pageSize" value="10" /> 
				<input type="hidden" name="boardNo" value="" />
		</form>
	</div>
		
	<div class="container" style="text-align: center">
		<table class="table table-striped table-sm">
			<colgroup>
				<col width="15%" />
				<col width="15%" />
				<col width="18%" />
				<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${list}">
					<tr class="board_wrap">
						<td>${board.BOARDNO}</td>
						<td class="boardNo" style="display: none;">${board.BOARDSEQ}</td>
						<td>${board.BOARDTITLE}</td>
						<td>${board.WRITER}</td>
						<td>${board.REGDATE}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<c:forEach var="page" items="${pageList}" varStatus="status">
			<c:if test="${status.first}">
				<c:if test="${Search.currentPage ne '1'}">
					<a href="javascript:fn_movePage('${Search.currentPage - 1}');">[이전]</a>
				</c:if>
			</c:if>
			<c:if test="${Search.currentPage ne page }">
				<a href="javascript:fn_movePage('${page }');">
			</c:if>
        [${page}]
		<c:if test="${Search.currentPage ne page }">
				</a>
			</c:if>
			<c:if test="${status.last}">
				<c:if test="${Search.currentPage ne Search.totalPage}">
					<a href="javascript:fn_movePage('${Search.currentPage + 1 }');">[다음]</a>
				</c:if>
			</c:if>
		</c:forEach>


		<!--         <li> -->
		<%--             <a href="/listBoard${page.currentPage - 1}">[이전]</a> --%>
		<!--         </li> -->

		<%--     <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index"> --%>
		<%--         <a href="/board/listPage${(index) }">[${index }]</a> --%>
		<%--     </c:forEach> --%>

		<%--     <c:if test="${pageMaker.next }"> --%>

		<!--         <li> -->
		<%--             <a href="/listBoard${page.currentPage - 1}">[다음]</a> --%>
		<!--         </li> -->
		<%--     </c:if>   --%>
	</div>


	<button type="button" id="writeBtn" class="btn"
		style="width: 90px; background-color: #88b3fa; margin-left: 1225px;''  
		 "
		onclick="javascript:fncWrite('${user.userId}')">글쓰기</button>

</body>
</html>