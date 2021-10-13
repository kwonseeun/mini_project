<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<head>
<title>게시글 작성</title>

<script type="text/javascript">
$(document).ready(function() {


})

function fn_validation() {
	var boardTitle = $('[name=boardTitle]').val();
	var boardContents = $('[name=boardContents]').val();

	
	//제목, 내용 체크
	if(boardTitle == '' || typeof(boardTitle) == 'undefined'){
		alert('제목을 입력해주세요.');
		return false;
	}else if(boardContents == '' || typeof(boardContents) == 'undefined'){
		alert('내용을 입력해주세요.');
		return false;
	}else{
		return true;
	}
	
}
function goInsert(){
	var isValid = true;
	isValid = fn_validation();
		if(isValid){
			// 		$('#frm').attr('action','/joinUser').submit();
			$('#write').attr('method',  'POST').attr('action',  '${contextPath}/insertBoard').submit();
		}
	}
/* Rest Controller  

function goInsert() {
	var title = $('#boardTitle').val();
	var content = $('#boardContents').val();
	var writer = $('#writer').val();
	var param = {
			boardTitle : title
			,boardContents : content
			,writer : user.userId
	}
	$.ajax({
	    type: 'POST',
	    url: '${contextPath}/insertBoard',
	    dataType: 'json',
	    contentType:'application/json; charset=utf-8',
	    data: JSON.stringify(param),
	    success : function(data, textStatus, xhr) {
	    	console.log(data);
			if (data.resultCode == "0000") {
				alert('등록이 완료되었습니다.');
				$('#frm').attr('action','${contextPath}/listBoard').submit();
			} else {
				alert('등록이 실패하였습니다.');
				return;
			}

		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "error:" + error);
		}
	});
} */
</script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>


<div class="col-md-12">
   <div class="col-md-4">
       <form id="write" name="write" >	
           <div class="form-group" style="margin:50px" > 
           <h2>게시글 등록</h2>
               <label for="title">제목</label>
               <textarea class="form-control" id="boardTitle" name="boardTitle" rows="1"> </textarea>   
           </div>
           <div class="form-group">
               <input type="hidden"  id="writer" name="writer" value="${user.userId}">
           </div>
           <div class="form-group" style="margin:50px">
               <label for="content">내용</label>
               <textarea class="form-control" id="boardContents" name="boardContents" rows="10"></textarea>
           </div>
               
    			<button type="button" class="btn btn-info" id="insertBtn" style="margin-left:137px"; onclick="goInsert()">등록</button>
    			   <a href="/listBoard" role="button" class="btn btn-warning" style="text-align:center">글 취소</a>
       </form>
   </div>
</div>
<%-- 	<div class="container" style="margin-top: 30px">

		<h2>게시글 등록</h2>
		<form id="write" name="write" >
			<table class="board_write">
				<tr>
					<td>제목</td>
					<td><input type="text" id="boardTitle" name="boardTitle">
							<input type="hidden" id="writer" name="writer" value="${user.userId}"></td>
							
				</tr>
				<tr>
					<td colspan="2"><textarea id="boardContents" name="boardContents"></textarea></td>
				</tr>
				
				
			</table>
			<button type="button" id="insertBtn" onclick="goInsert()">등록</button>
		</form>

	</div> --%>

</body>
</html>