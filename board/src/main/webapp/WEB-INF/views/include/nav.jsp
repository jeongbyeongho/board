<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	header>ul>li>a{
		color:white;
	}
	.userName{
		color: #0080FF;
	}
	#list{
		color:white;
		margin:4px auto;
	}
	#nickname{
		color:black;
		margin-top:12px;	
	}
	#loginBtn{
		margin:4px auto;
		
	}
	#img{
		position:block;
	}
	#ul-list{
		background-color: grey;
	}
	.rightbar{
		display:inline-block;
		float:right;
		margin-top:12px;
		margin-right:10px;
	}
	#logoutbtn{
		margin:3px auto;
		background-color:#f0f0f0;
	}
	

</style>
</head>
<body>
<div class="iconbar">
	<a href="/board/listPageSearch?num=1"><img id ="img" src="/resources/images/image/neotek_health2.png" width="300px"></a>

	<div class="rightbar">
		<!--   <a id="list" href="/member/change">회원 정보 수정</a>  -->
		<a id="nickname" class="userName">${member.userName}님</a>
		<c:if test="${member != null }">
			<button class="btn btn-light" id="logoutbtn" type="button" onclick="location.href='../member/logout'; alert('${member.userName}님 로그아웃 되었습니다.');">로그아웃</button>
		</c:if>
	</div>
</div>
<header id="ul-list">
	<ul class="nav nav-pills">
		<li> 
			<a class ="" id="loginBtn" href="/board/listPageSearch?num=1">게시글 목록</a>
		</li>
		<li>
			<a class="" id="loginBtn" href="/board/write">글 작성</a>
		</li>
		<li>
			<a class="" type="button" id="loginBtn"onclick="location.href='/member/change';">닉네임 변경</a>
		</li>
		<li>
			<a class="" type="button" id="loginBtn"onclick="location.href='/member/pwdchange';">비밀번호 변경</a>
		</li>
		
		
		
		<c:if test="${member == null }">
			<script>
				location.href="/member/login"
			</script>
		</c:if>
	</ul>
</header>
</body>
</html>