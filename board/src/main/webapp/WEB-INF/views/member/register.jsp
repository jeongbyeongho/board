<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
 <title>헬스 게시판</title>
<style>
	*{
		box-sizing:border-box;
	}
	body{
		background: grey;
		display: flex;
		justify-content : center;
		align-items:center;
		flex-direction: column;
		
	}
	form{
		width:350px;
		border: NONE;
		border-radius:10px;
		padding: 15px;
		margin: 0 auto;
		background-color:#D8D8D8;
	}
	div{
		text-align:center;
		width:350px;
		height:100px;
		
	}
	.input-box{
		
		padding:3px 4px;
		width:100%
		
	}
	#submit{
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
		text-decoration-line:none;
	}
	.login{
		width:100%;
		border-radius:5px;
		border:0px;
		padding:10px;
		margin-top:4px;
	}
	label{
		float:left;
	}
	.gender{
		
		border-radius:5px;
	}
	
</style> 
</head>
<body>
<script>
	//document.querySelector('input[name="genDer"]:checked').value;
	function checkForm(){
		var frm=document.getElementById('send');
		if(document.io.userId.value ==""){
			alert("아이디를 입력하세요");
			return false;
		}
		if(document.io.userName.value == ""){
			alert("닉네임을 입력해주세요");
			return false;
		}
		if(document.io.userPwd.value ==""){
			alert("비밀번호를 입력해주세요");
			return false;
		}
	}
</script>

<div>
<form role="form" id="send" name="io" method="post" autocomplete="off" onsubmit="alert('회원가입을 축하합니다.')">
	<h1>회원가입</h1>
	
 		<label for="userId">아이디</label>
  		<input type="text" class="login" id="userId" name="userId" placeholder="아이디"/>

 <p>
  <label for="userPass">비밀번호</label>
  <input type="password" class="login"  id="userPwd" name="userPwd" placeholder="비밀번호"/>
 </p>
 <p>
  <label for="userName">닉네임</label>
  <input type="text"  class="login" id="userName" name="userName" placeholder="닉네임"/>
 </p>
 
	
 
   <button type="submit" id="submit" onclick="return checkForm()">회원가입</button>
       
 
 
 <p>
  <a href="/" id="submit">처음으로</a>
 </p>
 
</form>
</div>
</body>
</html>