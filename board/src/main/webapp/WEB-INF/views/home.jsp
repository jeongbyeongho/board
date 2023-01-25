<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>헬스장 추천 게시판</title>
</head>
<script>

	var reg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	function checkForm(){
		if(document.io.userId.value ==""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		if(reg.test(document.io.userId.value)){
			alert("특수문자를 입력할 수 없습니다.");
			document.io.userId.value="";
			document.io.userId.focus();
			return false;
		}
		if(document.io.userPwd.value ==""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		document.io.submit();
	}
	// String myName=(String)request.getAttribute("userID");
</script>
<style>

	*{
		box-sizing: border-box;
	}
	body{
		background: grey;
	}
	/* 로그인 */
	#box{
		width:100%;
		height:100%;
		position:relative;
	}
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
		font-size:30px;
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
	.button_login:hover{
		background-color:#1bb8bc;
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
	
	h2{
		padding-left:70px;
		font-size:2vw;
	}
	.loginbtn_bar{
		padding:20px;
		margin:auto;
	
	}
	span{
		font-size:1.1vw;
	}
	.error{
		text-align:center;
		color:red;
	}
</style>
<body>

<c:if test="${member == null }">


<div id="box">
<form role="form" method="post" autocomplete="off" action="/member/login" name="io">
	<h1>헬스장 추천 게시판 👊</h1>
   <div class="input-box">
    <label for="userId" class="String"></label><br>
    <input type="text" id="userId" name="userId" class="login" placeholder="아이디" />
   </div>
   
   <div class="input-box">
    <label for="userPwd" class="String"></label><br>
    <input type="password" id="userPwd" name="userPwd" class="login" placeholder="비밀번호"/>
   </div>
   
   
   <div>
	   <button type="submit" class="button_login" onclick="checkForm()">로그인</button>    
	   <button type="button" onclick="location.href='/member/register'; return false;" class="button_login">회원가입</button>
   </div>
	<div class="error">
		<c:if test="${msg == false}">
			<p>아이디 및 비밀번호가 틀렸습니다.</p>
				<script>
					document.io.userId.focus();
				</script>
		</c:if>
  	</div>
</form>
</div>
</c:if>

 
<c:if test="${member != null }">
	<script>
		//alert("${member.userName}님 환영합니다.");
		location.href="/board/listPageSearch?num=1";
		
	</script>
</c:if>
</body>
</html>
