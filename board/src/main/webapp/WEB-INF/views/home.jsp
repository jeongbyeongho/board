<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>Home</title>
</head>
<style>

	*{
		box-sizing: border-box;
	}
	body{
		background: #1bbc9b;
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
		background-color:#EEEFF1;
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
	
	}

	
	

</style>
<body>



<hr>
<c:if test="${member == null }">
<form role="form" method="post" autocomplete="off" action="/member/login">
	<h1>
		<p> 헬스 게시판 👊</p>
	</h1>
		
	
	<!--  
   <p>
    <label for="userId" class="String">아이디</label>
    <input type="text" id="userId" name="userId" class="login" placeholder="아이디" />
   </p>
   <p>
    <label for="userPwd" class="String">비밀번호</label>
    <input type="password" id="userPwd" name="userPwd" class="login" placeholder="비밀번호"/>
   </p>
   
    -->
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
   <!-- <button type="button" onclick="location.href='/member/register'">회원가입</button> -->
   <!-- <p><a href="/member/register">회원가입</a></p>  -->    
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
	</script>
	
	<header>
		<div>
			<h1>헬스장 추천 게시판</h1>
			<hr color="green">	
				<div>
					<button type="button" class="right_logout" onclick="location.href='member/logout'; alert('${member.userName}님 로그아웃 되었습니다.');">로그아웃</button>
					<span>${member.userName}님</span>
				</div>
		</div>
			<br>
			<p>현재 시간은 ${serverTime} 입니다. </p>
	</header>
	<section>
		<div>
			<ul>
				<li><button onclick="location.href='/board/write'" class="list_button">게시물 작성</button></li>
				<li><button onclick="location.href='/board/list'" class="list_button">게시물 목록</button></li>
				<br>
			
			</ul>
		<!-- <a href="/board/write">게시물 작성</a>  -->
			<!-- <a href="member/logout" onclick="alert('${member.userName}님 로그아웃 되었습니다.')">로그아웃</a>  -->
		</div>
	</section>
	
	<footer>
	</footer>
		
		
		
</c:if>

</body>
</html>
