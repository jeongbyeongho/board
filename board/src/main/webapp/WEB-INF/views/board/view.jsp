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
	<style>
		.form-control{
			width: 60%;
		}
		.modify-button{
			margin-left:-7px;
		}
	</style>
	<script>
		function deleteAlert(){
			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}else{
				location.href='/board/delete?num=${view.num}';
			}
		}
		function modifyAlert(){
			if(!confirm("수정 하시겠습니까?")){
				return false;
			}else{
				location.href='/board/modify?num=${view.num}';
			}
		}
	</script>
</head>
<body>

<div id="nav" class="container">
	<%@ include file="../include/nav.jsp"%>
</div>


<!-- input,text 입력 엘리먼트의 속성 값은 BoardVO와 동일해야 함 -->
<form method="post">
	<div data-role="header" class="container">
    	<h1>헬스장 추천 게시판</h1><br>
  	</div>
	
	<div id="nav" class="container">  
		<!-- input,text 입력 엘리먼트의 속성 값은 BoardVO와 동일해야 함 -->
		<div class="row">
			<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">제목</label>
			<input type="text" class="form-control" name="title" id="exampleFormControlInput1" value="${view.title}" readonly>	
		</div>	
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">내용</label>
				<textarea class="form-control" id="exampleFormControlTextarea1" name="content" cols="50" rows="12" readonly>${view.content}</textarea>
			</div>
			<label>작성자</label>
			<div class="col">
				<input type="text" class="form-control" name="writer" value="${view.writer}" aria-label="First name" readonly>
			</div>
			<div class="col">
	  		</div>
			
		</div>
		<br>
		
		<c:if test="${member.userName == view.writer}">
			<div class="modify-button">
				<button type="button" class="btn btn-info" onclick="modifyAlert();">게시글 수정</button>
				<button type="button" class="btn btn-info" onclick="deleteAlert();">게시글 삭제</button>
			</div>
		</c:if>
	</div>
	

</form>
	
</body>
</html>