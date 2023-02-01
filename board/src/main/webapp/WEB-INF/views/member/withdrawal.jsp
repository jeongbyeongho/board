<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
*{
		box-sizing: border-box;
	}
	body{
		background: grey;
	}
	/* 로그인 */
	form{
		width:350px;
		border: NONE;
		border-radius:10px;
		padding: 15px;
		
		background-color:#D8D8D8;
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
	}
	h1{
		text-align:center;
	}
	.button_login:hover{
		background-color:grey;
	}
	.button_login{
		margin : 10px auto;
		font-weight:bold;
		color : #eeeff1;
		padding: 6px 15px;
		font-size:14px;
		width:100%;
		height: 45px;
		border: none;
		border-radius : 5px;
		background-color: #1bbc9b;
	}
	.login{
		width:100%;
		border:0;
		border-radius: 5px;
		padding:20px;
		
	}
	.input-box{
		margin: auto;
		padding:3px 4px;
		width:100%
	
	}
	
	/* 메인 */
	.list_button{
		width: 50%;
		height: 60px;
		align-items:center;
		border-radius:5px; 
		border:0;
		margin:10px auto;		
	}
	.list_button:hover{
		background-color : grey;
	}
	li{
		list-style:none;
	}
	.right_logout, div>span{
		float:right;
		display:inline;
		padding: 5px;
	}
	.right_logout{
		border-radius:5px;
		border:0;
		margin-right:10px;
	}
	.img{
		float:left;
		width:10%;
		display:flex;
		border-radius:10px;
		
	}
	header{
		width:70%;
		height: 75px;
		justify-content: space-between;
		align-items:center;
		background-color:white;
		display: flex;
		border-radius: 10px;
		border:none;
		margin-bottom: 10px;
	}
	section{
		background-color:white;
		width:70%;
		height:430px;
		border-radius:10px;
		display:flex;
		flex-direction: column;
	}
	section>div>p{
		text-align:center;
		margin-bottom:7px;	
		margin-top: 5px;
	}
	.main_content{
		display:flex;
		flex-direction:column;
		width:100%;
	}
	.main_img{
		margin: auto;
	}
	
	.loginbtn_bar{
		padding:20px;
		margin:auto;
	
	}
	span{
		font-size:1.1vw;
	}
	</style>
	

	
</head>
<body>
	<form role="form" method="post" id="deleteForm" autocomplete="off" name="io">
		<h1>회원 탈퇴 👊</h1>
		
	   <div class="input-box">
	    <label for="userId" class="String"></label><br>
	    <input type="text" id="userId" name="userId" class="login" value="${member.userId}" readonly />
	   </div>
	   
	   
	   <div class="input-box">
	    <label for="userPwd" class="String"></label><br>
	    <input type="password" id="userPwd" name="userPwd" class="login" placeholder="현재 비밀번호 " />
	   </div>
	   <div class="input-box">
	    <label for="Pwd" class="String"></label><br>
	    <input type="password" id="Pwd" name="Pwd" class="login" placeholder="비밀번호 재입력 " />
	   </div>
	   	   
	   <div>
		   <button type="button" class="button_login" id="submit" onclick="return submitBtn()">회원 탈퇴</button>    
		   <button type="button" class="button_login" onclick="location.href='/board/listPageSearch?num=1'">메인으로</button>
	   </div>
	  
	</form>
	<script>
	
	
	
	
	function submitBtn(){		
	
	//$("#submit").click(function(){
		var query = {userPwd: $("#userPwd").val()};
		var flag=true;
		if($("#userPwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userPwd").focus();
			return false;
		}
		if($("#Pwd").val()==""){
			alert("비밀번호를 재입력해주세요.");
			$("#Pwd").focus();
			return false;
		}
		if($("#userPwd").val()!=$("#Pwd").val()){
			alert("비밀번호가 옳지 않습니다.\n다시 입력해주세요.");
			$("#userPwd").val()="";
			$("#Pwd").val()="";
			$("#userPwd").focus();
			return false;
		}
	
	$.ajax({
		url : "/member/checkPw",
		type : "POST",
		dateType : "json",
		data : $("#deleteForm").serializeArray(),
		//data:query,
		async:false,
		success: function(data){
			
			if(data==true){
				if(confirm("회원탈퇴하시겠습니까?")){
					$("#deleteForm").submit();
					flag=true;
				}
			}else{
				alert("비밀번호가 틀렸습니다.");
				flag=false;
				$("#userPwd").focus();
				console.log(document.getElementById('userPwd').value);
				console.log(document.getElementById('Pwd').value);
			}
			
		}
	});
	return flag;
};



</script>
</body>
</html>