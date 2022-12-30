<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
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

<div id="nav" class="container">
	<%@ include file="../include/nav.jsp"%>
</div>


<label>제목</label>
${view.title}<br> <!-- input,text 입력 엘리먼트의 속성 값은 BoardVO와 동일해야 함 -->

<label>작성자</label>
${view.writer}<br>

<label>내용</label>
${view.content}<br>


<div id="nav"class="container">  
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">제목</label>
		<input type="text" class="form-control" name="title" id="exampleFormControlInput1" placeholder="${view.title}" readonly>	
	</div>	
	
	<!--  <label>내용</label>
	<textarea cols="50" rows="5" name="content"></textarea><br>  -->
	<div class="mb-3">
		<label for="exampleFormControlTextarea1" class="form-label">내용</label>
		<textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="6" placeholder="${view.content}" readonly></textarea>
	</div>
	
	<div class="row">
		<label>작성자</label>
		<div class="col">
			<input type="text" class="form-control" name="writer" value="${view.writer}" aria-label="First name" readonly>
		</div>
		<div class="col">
  		</div>
	</div>
</div>
	
	
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

<div>
	<a href="/board/modify?num=${view.num}">게시물 수정</a>, <a href="/board/delete?num=${view.num}">게시물 삭제</a>
</div>
</body>
</html>