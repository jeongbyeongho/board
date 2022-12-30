<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

<div id="nav"class="contatiner">
	<%@ include file="../include/nav.jsp"%>
</div>
<section>
	<c:if test="${msg==null}">
	<form method="post">
	
	<!-- <label>제목</label>
	<input type="text" name="title" /><br> <!-- input,text 입력 엘리먼트의 속성 값은 BoardVO와 동일해야 함 --> 
	
	
  	<div data-role="header" class="container">
    	<h1>헬스장 추천 게시판</h1><br>
  	</div>
<div id="nav"class="container">  
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">제목</label>
		<input type="text" class="form-control" name="title" id="exampleFormControlInput1" placeholder="제목">	
	</div>	
	
	<!--  <label>내용</label>
	<textarea cols="50" rows="5" name="content"></textarea><br>  -->
	
	<div class="mb-3">
		<label for="exampleFormControlTextarea1" class="form-label">내용</label>
		<textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="6"></textarea>
	</div>
	
	<!--  파일 업로드 
	<div class="input-group mb-3">
  		<input type="file" class="form-control" id="inputGroupFile02">
  		<label class="input-group-text" for="inputGroupFile02">Upload</label>
	</div>
	-->
	
	<!--
	<input type="text" name="writer" value="${member.userName}" /><br>
	 -->
	
	<div class="row">
		<label>작성자</label>
		<div class="col">
			<input type="text" class="form-control" name="writer" value="${member.userName}" aria-label="First name">
		</div>
		<div class="col">
  		</div>
	</div>
	<br>
	<button type="submit">작성</button>
	
</div>
	</form>
	</c:if>
	
	<c:if test="${msg==false}">
		<p> 로그인 후 작성이 가능합니다. </p>
		<p><a href="/">홈으로</a></p>
	</c:if>
	
	
</section>
</body>
</html>