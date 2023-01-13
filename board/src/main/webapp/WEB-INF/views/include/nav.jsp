<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.userName{
		color: #0080FF;
	}
	#list{
		color:white;
		padding-top:13px;
	}
	#loginBtn{
		margin-top:5px;	
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
</style>
</head>
<body>
<div class="iconbar">
	<a><img id ="img" src="/resources/images/image/neotek_health2.png" width="300px"></a>

	<div class="rightbar">
		<a id="list" href="/member/change">회원 정보 수정</a>
		<button class="btn btn-light" type="button" id="loginBtn"onclick="location.href='/member/change';">회원 정보 수정</button>
		<c:if test="${member != null }">
			<button class="btn btn-light" id="loginBtn" type="button" onclick="location.href='../member/logout'; alert('${member.userName}님 로그아웃 되었습니다.');">로그아웃</button>
		</c:if>
	</div>
</div>
<header id="ul-list">
	<ul class="nav nav-pills">
		<li> 
			<a id="list" href="/board/listPageSearch?num=1">게시글 목록</a>
		</li>
		<li>
			<a id="list" href="/board/write">글 작성</a>
		</li>
		<li>
			<a id="list" class="userName">${member.userName}님</a>
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