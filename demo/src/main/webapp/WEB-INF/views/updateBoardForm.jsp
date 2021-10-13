<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<head>
<title>게시글 수정</title>

<script type="text/javascript">
function fncAddBoard() {
	var boardNo = $('#boardNo').val();
	
	$('form').attr('method', 'POST').attr('action', '/updateBoard?boardNo='+boardNo)
			.submit();
}

function canBoard() {
	var boardNo = $('#boardNo').val();
	
	$('form').attr('method', 'POST').attr('action', '/getBoard')
			.submit();
}
</script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

	<div class="container col-md-6"  style="margin-right:350px; padding:50px">

		<h2 >게시글 수정</h2>
		<form id="write" name="write" >		
			<table class="board_write" >

				<tr>				
					<td>제목</td>
					<td>
							<input type="hidden"  id="boardNo" name="boardNo" value="${board.boardNo}"/>
							<input type="text"  id="boardTitle" name="boardTitle" class="form-control" value="${board.boardTitle}" readonly="readonly" />
							<input type="hidden" id="writer" name="writer" value="${user.userId}"></td>
							
				</tr>
				<tr>
					<td colspan="2"><textarea id="boardContents"  cols="50" rows="7" name="boardContents"  class="form-control">${board.boardContents}</textarea></td>
				</tr>		
				
			</table>
			<button type="button" onclick="fncAddBoard()" class="btn btn-danger" style="width: 60px; ">수정</button>
			<button type="button" onclick="canBoard()" class="btn btn-info">취소</button>
		</form>

	</div>
</body>
</html>