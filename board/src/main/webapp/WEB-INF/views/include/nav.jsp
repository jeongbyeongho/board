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
</style>
</head>
<body>

<ul class="nav nav-pills">
	<!-- 
	<li>
		<a href="/board/listPage?num=1">글 목록(페이징)</a>
	<li> -->
	<li>
		<a href="/board/listPageSearch?num=1">게시글 목록</a>
	</li>
	<li>
		<a href="/board/write">글 작성</a>
	</li>
	<li>
		<a class="userName">${member.userName}님</a>
	</li>
	
	<c:if test="${member != null }">
		<li>
			<button class="btn btn-light" type="button" onclick="location.href='../member/logout'; alert('${member.userName}님 로그아웃 되었습니다.');">로그아웃</button>
		</li>
	</c:if>
	<c:if test="${member == null }">
		<script>
			location.href="/member/login"
		</script>
	</c:if>
		
</ul>

</body>
</html>