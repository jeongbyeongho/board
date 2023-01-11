<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--  format 라이브러리  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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
		function formCheck(){
			if(document.frm.content.value==""){
				alert("내용을 입력하세요");
				document.frm.content.focus();
				return false;
			}else if(document.frm.content.value.length>201){
				alert("작성 허용 범위를 초과했습니다.");
				return false;
			}
			
			document.frm.submit();
		}
		if("${reply.writer}" != "${member.userName}"){
			alert("정상적인 루트로 이동해주세요.");
			location.href='/board/view?num=${reply.num}';
		}
		history.replaceState({}, null, location.pathname);
	</script>
</head>
<body>

<div id="nav" class="container">
	<%@ include file="../include/nav.jsp"%>
</div>



	<form method="post" name="frm" action="/reply/modify">
		<div data-role="header" class="container">
    		<h1>헬스장 추천 게시판</h1><br>
  		</div>
  		
		<div id="nav" class="container">
			
				<label>작성자</label>
			<div class="row">
				<div class="col">
					<input type="text" class="form-control" name="writer" aria-label="First name" value="${reply.writer}" readonly>
				</div> 
				<div class="col"></div>
				<div class="mb-3">
					<label for="exampleFormControlTextarea1" class="form-label"></label>
					<textarea rows="5" cols="50" name="content" class="form-control" maxlength="200">${reply.content}</textarea>
				</div>
				
			
			<div class="mb-3">
				<input type="hidden" name="num" value="${reply.num}">
				<input type="hidden" name="rnum" value="${reply.rnum}">
				<button type="button" class="btn btn-info" onclick="formCheck()">수정 완료</button>
				
			</div>
		</div>
		</div>
	</form>
	
</body>
</html>