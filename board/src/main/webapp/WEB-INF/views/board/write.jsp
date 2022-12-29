<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>

<div id="nav">
	<%@ include file="../include/nav.jsp"%>
</div>
<section>
	<c:if test="${msg==null}">
	<form method="post">
	
	<label>제목</label>
	<input type="text" name="title" /><br> <!-- input,text 입력 엘리먼트의 속성 값은 BoardVO와 동일해야 함 -->
	
	<label>작성자</label>
	<input type="text" name="writer" value="${member.userName}" readonly="readonly"/><br>
	
	<label>내용</label>
	<textarea cols="50" rows="5" name="content"></textarea><br>
	
	<button type="submit">작성</button>
	
	</form>
	</c:if>
	
	<c:if test="${msg==false}">
		<p> 로그인 후 작성이 가능합니다. </p>
		<p><a href="/">홈으로</a></p>
	</c:if>
</section>
</body>
</html>