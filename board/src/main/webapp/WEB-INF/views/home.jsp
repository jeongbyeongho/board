<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	헬스 게시판
</h1>

<P>  현재 시간은  ${serverTime} 입니다. </P>

<p>
	<button onclick="location.href='/board/list'">게시물 목록</button>
	<button onclick="location.href='/board/write'">게시물 작성</button>
	
	<!-- <a href="/board/write">게시물 작성</a>  -->
</p>
<hr>
<c:if test="${member == null }">
<form role="form" method="post" autocomplete="off" action="/member/login">
   <p>
    <label for="userId">아이디</label>
    <input type="text" id="userId" name="userId" />
   </p>
   <p>
    <label for="userPwd">비밀번호</label>
    <input type="password" id="userPwd" name="userPwd" />
   </p>
   <p>
	   <button type="submit">로그인</button>    
	   <button type="button" onclick="location.href='/member/register'; return false;">회원가입</button>
   </p>
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
	<p>${member.userName}님 환영합니다.</p>
	
	<a href="member/logout">로그아웃</a>
</c:if>



</body>
</html>
