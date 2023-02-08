<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
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
		.submit-button{
			margin-top:7px;
		}
		#nav{
			padding-top:0px;
			justify-content:space-between;
		}
		.form-label{
			margin-top:15px;
		}
		#file_list{
			margin-top:10px;
		}
		.fileAdd_btn{
		border:none;
		border-radius:5px;
		background-color:#5bc0de;
		color:white;
		padding:6px 6px;
		}
		#fileDelBtn{
			border:none;
			border-radius:5px;
			padding:5px 5px;
			color:white;
			background-color:#5bc0de;
		}
		.fileAdd_btn:hover{
			background-color:#4e92a7;
		}
		#fileDelBtn:hover{
			background-color:#4e92a7;
		}
	</style>
<script>
	//history.replaceState({}, null, location.pathname);
	//history.pushState({},null,location.pathname);
</script>
<script>
if("${views.userId}" != "${member.userId}"){
	console.log("${views.userId}");
	console.log("${member.userId}");
	alert("정상적인 루트로 이동해주세요.");
	location.href="/board/listPageSearch?num=1";
}

$(document).ready(function(){
	fn_addFile();
})

	
	function checkForm(){
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
			 alert("내용이 너무 짧습니다. 10자 이상 작성해주세요.");
			 return false;
		 }else if(document.io.content.value.length>401){
			 alert("작성 허용 범위를 초과했습니다.\n400자 이하 작성해주세요.");
			 return false;
		 }
		document.io.submit();
	}

		
</script>
</head>
<body>
<div id="nav">
	<%@ include file="../include/nav.jsp"%>
</div>

<form method="post" name="io" enctype="multipart/form-data">
	<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
	<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
	<div id="nav" class="container">  
		<!-- input,text 입력 엘리먼트의 속성 값은 BoardVO와 동일해야 함 -->
		<div class="row">
			<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">제목</label>
			<input type="text" class="form-control" name="title" id="exampleFormControlInput1" value="${views.title}">	
		</div>	
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">내용</label>
				<textarea class="form-control" id="exampleFormControlTextarea1" name="content" cols="50" rows="12" maxlength="400">${views.content}</textarea>
			</div>
			<label>작성자</label>
			<div class="col">
				<input type="text" class="form-control" name="writer" value="${views.writer}" aria-label="First name" readonly>
			</div>
			<div class="col">
	  		</div>
			<label id="file_list">첨부파일</label>
	  		<div id="fileIndex">
	  		
				<c:forEach var="file" items="${file}" varStatus="var">
				<div>
					<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO}">
					<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
			  		<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
			  		<button id="fileDelBtn" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
		  		</div>
				</c:forEach>
			</div>
			<div><button type="button" class="fileAdd_btn">파일 추가</button></div>
		<script>
		function fn_addFile(){
			var fileIndex = 1;
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' id='file' name='file_"+(fileIndex++)+"'>"+
						"<button type='button' id='fileDelBtn' style='border:none; border-radius:5px; margin-top:5px; margin-bottom:5px; padding:5px 10px;'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent("div").remove();
			});
		}
			
			var fileNoArry = new Array();
			var fileNameArry = new Array();
			function fn_del(value, name){
				
				fileNoArry.push(value);
				fileNameArry.push(name);
				$("#fileNoDel").attr("value", fileNoArry);
				$("#fileNameDel").attr("value", fileNameArry);
			}
		</script>
		
		<div class="submit-button">
			<button type="button" class="btn btn-info" onclick="checkForm()">완료</button>
		</div>
	</div>
</form>

</body>
</html>