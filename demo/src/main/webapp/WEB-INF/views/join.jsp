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
	
	//���̵�, ��й�ȣ, �̸�, ��ȭ��ȣ üũ
	if(userId == '' || typeof(userId) == 'undefined'){
		alert('id�� �Է����ּ���.');
		return false;
	}else if(userPw == '' || typeof(userPw) == 'undefined'){
		alert('��й�ȣ�� �Է����ּ���.');
		return false;
	}else if(userName == '' || typeof(userName) == 'undefined'){
		alert('�̸��� �Է����ּ���.');
		return false;
	}else if(userPhone == '' || typeof(userPhone) == 'undefined'){
		alert('��ȣ�� �Է����ּ���.');
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
	    contentType : "application/json; charset=UTF-8",//���� ������ ������ �������� Ÿ��
	    success: function(data){
	    	console.log(data);
	         if(data.resultCode == '0000'){
	         console.log("���̵� ����");
	         alert("����Ͻ� �� �ִ� ���̵��Դϴ�.");
	         }else{
	         	console.log("���̵� ����");
	         	alert("�ߺ��� ���̵� �����մϴ�.");
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
	    contentType : "application/json; charset=UTF-8",//���� ������ ������ �������� Ÿ��
	    success: function(data){
	    	console.log(data);
	         if(data.resultCode == '0000'){
	         	alert("ȸ�������� �Ϸ�Ǿ����ϴ�.");
	         	$('#frm').attr('action','/login').submit();
	         }else{
	         	alert("ȸ������ ����");
	         }
	    },
	    error: function (){        
	                      
	    }
  	});

}
</script>


</head>
<body>
 
 <h2> ȸ������ </h2>
	<form method="post" id="frm">
		<h5>���̵�: </h5><input type="text" name="userId" class="form-control" placeholder="���̵� �Է��ϼ���" oninput="fn_limitlength(this,10)" maxlength="20" />
		<button type="button" class="btn btn-primary" onclick="idCk()">�ߺ��˻�</button> 
		<br><h5>��й�ȣ: </h5><input type="password" name="userPw" class="form-control" placeholder="��й�ȣ�� �Է��ϼ���" oninput="fn_limitlength(this,15)" maxlength="20" />
		<br> <h5>�̸�: </h5> <input type="text" name="userName" class="form-control" placeholder="�̸��� �Է��ϼ���"  oninput="fn_limitlength(this,10)" maxlength="10" />
	   <br> <h5>��ȭ��ȣ: </h5> <input type="text" name="userPhone" class="form-control" placeholder="��ȭ��ȣ�� �Է��ϼ���"  oninput="fn_limitlength(this,15)" maxlength="11" /> <br>
	</form>

	<button onclick="fn_join()" class="btn btn-danger">ȸ������</button>

</body>
</html>