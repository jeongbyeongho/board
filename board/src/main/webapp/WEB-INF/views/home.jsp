<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>헬스장 추천 게시판</title>
</head>
<style>

	*{
		box-sizing: border-box;
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
	h1{
		justify-content:center;
		display:flex;
	}
	
	#button_login{
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
	.list_button{
		width: 150px;
		height: 40px;
		margin:auto;
		border-radius:5px; 
		border:0;
		margin-bottom: 10px;
		text-align:center;
		position: absoulte;
	}
	.list_button:hover{
		background-color : grey;
	}
	.input-box{
		margin: auto;
		padding:3px 4px;
		width:100%
	
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
		
	}
	
	.main{
		width:420px;
		height:370px;
		border: NONE;
		padding: 15px;
		margin: 0 auto;
		background-color:#D8D8D8;
	}
	
	section{
		background-color:white;
		width:70%;
		height:350px;
		border-radius:10px;
		display:flex;
		flex-direction: column;
	}
	section>div>p{
		text-align:center;
		display:inline-block;	
		margin-bottom:10px;	
		margin-top: 30px;
	}
	.main_content{
		display:flex;
		flex-direction: column;
		width:100%;
	}
	.main_img{
		display:block;
	}
	
</style>
<body>



<hr>
<c:if test="${member == null }">
<form role="form" method="post" autocomplete="off" action="/member/login">
	<h1>헬스 게시판 👊</h1>
		
	
   <div class="input-box">
    <label for="userId" class="String"></label><br>
    <input type="text" id="userId" name="userId" class="login" placeholder="아이디" />
   </div>
   
   <div class="input-box">
    <label for="userPwd" class="String"></label><br>
    <input type="password" id="userPwd" name="userPwd" class="login" placeholder="비밀번호"/>
   </div>
   
   
   <div>
	   <button type="submit" id="button_login">로그인</button>    
	   <button type="button" onclick="location.href='/member/register'; return false;" id="button_login">회원가입</button>
   </div>
  
</form>
</c:if>

<c:if test="${msg == false}">
	<script>
   		alert("로그인에 실패하였습니다. 아이디, 비밀번호를 확인해주세요");
   	</script>
</c:if>



<c:if test="${member != null }">
	<script>
		alert("${member.userName}님 환영합니다.");
		//document.location.href="/board/listPageSearch?num=1";
	</script>
	
	<header>
		
			<span class="img"><img src="/resources/images/image/neotek_img.png" title="neotek_logo" class="" width=100px height=100% ></span>			
			<h2>헬스장 추천 게시판</h2>
		
			<div class="logbtn_bar">
				<button type="button" class="right_logout" onclick="location.href='member/logout';alert('${member.userName}님 로그아웃 되었습니다.');">로그아웃</button>
				<span><b>${member.userName}님</b></span>
			</div>
		
	</header>
			<br>

	<section>
		<div class="main_content">
			<p>현재 시간은 ${serverTime} 입니다. </p>
				<img src="/resources/images/image/health.jpg" title="neotek_logo" class="main_img" width="auto" height=200px >
				<button onclick="location.href='/board/write'" class="list_button">게시물 작성</button>
				<button onclick="location.href='/board/listPageSearch?num=1'" class="list_button">게시물 목록</button>
			<!-- <a href="/board/write">게시물 작성</a>  -->
			<!-- <a href="member/logout" onclick="alert('${member.userName}님 로그아웃 되었습니다.')">로그아웃</a>  -->
		</div>
	</section>
</c:if>

</body>
</html>
