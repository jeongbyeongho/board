<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


	<script>
	 function checkForm() {
         if(document.io.title.value == "") {
             alert("제목을 입력하세요");
             return;
         }else if(document.io.title.value.length<5){
        	 alert("제목이 너무 짧습니다.\n5자 이상 작성해주세요.");
        	 document.io.title.focus();
        	 return false;
         }else if(document.io.title.value.length>30){
         	 alert("제목이 너무 길어요\n30자 이하 작성해주세요.");
         	 document.io.title.focus();
         	 return false;
         }
         
         if(document.io.content.value == "") {
             alert("내용을 입력하세요");
             return false;
         }else if(document.io.content.value.length<10){
			 alert("내용을 10자 이상 작성해주세요.");
			 return false;
		 }else if(document.io.content.value.length>401){
			 alert("작성 허용 범위를 초과했습니다.\n400자 이하 작성해주세요.");
			 return false;
		 }
         document.io.submit();
         
       //  if("${member.userName}" != "${view.writer}")
        //	 alert("정상적인 루트로 이동해주세요.");
        	 //location.href="/board/listPageSearch?num=1";
         //}
     }
	 
	
	</script>
</head>
<style>
	.form-control{
		width: 60%;
	}
	.submit-button{
		margin-left:-7px;
	}
</style>

<body>

<div id="nav"class="contatiner">
	<%@ include file="../include/nav.jsp"%>
</div>
<section>
	<c:if test="${msg==null}">
		<form name="io" method="post">
	<!-- input,text 입력 엘리먼트의 속성 값은 BoardVO와 동일해야 함 --> 
	
	
		  	<div data-role="header" class="container">
		    	<h1>헬스장 추천 게시판</h1><br>
		  	</div>
  	
			<div id="nav" class="container">  
				<!-- input,text 입력 엘리먼트의 속성 값은 BoardVO와 동일해야 함 -->
				<div class="row">
					<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">제목</label>
						<input type="text" class="form-control" name="title" id="exampleFormControlInput1" value="${view.title}">
				</div>	
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">내용</label>
						<textarea class="form-control" id="exampleFormControlTextarea1" name="content" cols="50" rows="12" maxlength='400'>${view.content}</textarea>
					</div>
					<label>작성자</label>
					<div class="col">
						<input type="text" class="form-control" name="writer" value="${member.userName}" aria-label="First name" width="50%" readonly>
					</div>
					<div class="col">
			  		</div>
				</div>
					<br>
		 	<div class="submit-button">
		    	<button type="button" class="btn btn-info" onclick="checkForm()">작성</button>
		    	
		    	  
				<!--  <button type="submit" onclick="if(!confirm('작성하시겠습니까?'))">완료</button> -->
				
					
				 
				</div>
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