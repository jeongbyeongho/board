<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--  format 라이브러리  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${view.title}</title>
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
		ul{
			list-style:none;
			padding:0px;
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
		
		function RdeleteAlert(){
			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}else{
				location.href='/reply/delete?num=${view.num}';
			}
		}
		function formCheck(){
			if(document.frm.content.value == ""){
				alert("내용을 입력해주세요.");
				return false;
			}else if(document.frm.content.value.length<3){
				alert("내용이 너무 짧아요.");
				return false;
			}else if(document.frm.content.value.length>201){
				alert("내용이 너무 길어요.");
				return false;
			}
			 document.frm.submit();
		}
		
		//history.replaceState({}, null, location.pathname);
	</script>
</head>
<body>

<div id="nav">
	<%@ include file="../include/nav.jsp"%>
</div>


<!-- input,text 입력 엘리먼트의 속성 값은 BoardVO와 동일해야 함 -->
<div id="center">
<form method="post">
	<br>
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
		
		
		 <c:if test="${member.userId == view.userId}">
			<div class="modify-button">
				<button type="button" class="btn btn-info" onclick="modifyAlert();">게시글 수정</button>
				<button type="button" class="btn btn-info" onclick="deleteAlert();">게시글 삭제</button>
			</div>
		</c:if>
	</div>
</form>
</div>
<br>
<div id="nav" class="container">
	<ul>
		<c:forEach items="${reply}" var="reply">
			<li>
				<p><b>${reply.writer}</b> / <fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd"/> / <fmt:formatDate value="${reply.regDate}" type="time" timeStyle="medium"/> </p>
				<p>${reply.content}</p>
				
				<!-- <c:if test="${member.userName == reply.writer}"> </c:if>  --> 
				<c:if test="${member.userId == reply.userId}">
					<a href="/reply/modify?num=${view.num}&rnum=${reply.rnum}" onclick="return confirm('수정하시겠어요?');">수정</a> / <a href="/reply/delete?num=${view.num}&rnum=${reply.rnum}" onclick="return confirm('삭제하시겠어요?');">삭제</a>
				</c:if> 
				<hr>
								
			</li>
	 
		</c:forEach>
	</ul>
</div>


<div>
	<form method="post" name="frm" action="/reply/write">
		<div id="nav" class="container">
			
				<label>댓글 작성자</label>
				<div class="row">
					<div class="col">
						<input type="text" class="form-control" name="writer" aria-label="First name" value="${member.userName}" readonly>
					</div> 
					<div class="col">
					</div>
					
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label"></label>
						<textarea rows="5" cols="50" name="content" class="form-control" placeholder="내용" maxlength="200"></textarea>
					</div>
					<div class="col"></div>
					
				
					<div class="mb-3">
						<input type="hidden" name="num" value="${view.num}">
						<button type="button" name="replyContent" class="btn btn-info" onclick="formCheck()">댓글 작성</button>
					</div>
				</div>
	
		</div>
	</form>
</div>
	
</body>
</html>