<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
 <title>헬스 게시판</title>
<style>
	*{
		box-sizing:border-box;
	}
	body{
		background: grey;
	}
	#box{
		width:100%;
		height:100%;
		position:relative;
	}
	form{
		width:350px;
		border: NONE;
		border-radius:10px;
		padding: 15px;
		text-align:center;
		
		background-color:#D8D8D8;
		position: absolute;
		top:50%;
		left:50%;
		transform: translate(-50%,-50%);
	}
	

	#submit{
		margin : 10px auto;
		font-weight:bold;
		color : #eeeff1;
		padding: 6px 15px;
		font-size:14px;
		width:100%;
		height: 45px;
		border: none;
		border-radius : 5px;
		background-color: #1bbc9b;
		text-decoration-line:none;
	}
	#submit:hover{
		background:#1bb8bc;
	}
	.login{
		width:100%;
		border-radius:5px;
		border:0px;
		padding:10px;
		margin-top:4px;
	}
	label{
		float:left;
	}

	.idCheck{
		border:none;
		border-radius:5px;
		width:50%;
		height:35px;
		background-color:#1bbc9b;
		color:#eeeff1;
	}
	.idCheck:hover{
		background-color:#1bb8bc;
	}
	
</style> 
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>
<script>
	//document.querySelector('input[name="genDer"]:checked').value;
	function checkForm(){
		var frm=document.getElementById('send');
		 var reg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
			 
		if(reg.test(document.io.userId.value)){
			alert("특수문자를 입력할 수 없습니다.");
			document.io.userId.value="";
			document.io.userId.focus();
			return false;
		}
		 
		if(document.io.userId.value ==""){
			alert("아이디를 입력해주세요.");
			document.io.userId.focus();
			return false;
		}else if(document.io.userId.value.length>10){
			alert("아이디는 10자 이상 쓸 수 없습니다.");
			document.io.userId.focus();
			return false;
		}else if(document.io.userId.value.length<6){
			alert("아이디는 6자 이상 작성해주세요");
			document.io.userId.focus();
			return false;
		}
		
		if(document.io.userPwd.value ==""){
			alert("비밀번호를 입력해주세요");
			document.io.userPwd.focus();
			return false;
		}else if(document.io.userPwd.value.length>20){
			alert("비밀번호는 20자 이상 쓸 수 없습니다.");
			document.io.userPwd.focus();
			return false;
		}else if(document.io.userPwd.value.length<6){
			alert("비밀번호는 6자 이상 작성해주세요");
			document.io.userPwd.focus();
			return false;
		}
		
		
		if(document.io.Pwd.value ==""){
			alert("비밀번호를 재입력해주세요");
			document.io.Pwd.focus();
			return false;
		}else if(document.io.Pwd.value != document.io.userPwd.value){
			alert("비밀번호가 같지 않습니다.");
			document.io.Pwd.value="";
			return false;
		}
		
		
		if(document.io.Pwd.value ==""){
			alert("비밀번호를 입력해주세요");
			document.io.Pwd.focus();
			return false;
		}else if(document.io.Pwd.value.length>20){
			alert("비밀번호는 20자 이상 쓸 수 없습니다.");
			document.io.userPwd.focus();
			return false;
		}else if(document.io.Pwd.value.length<6){
			alert("비밀번호는 6자 이상 작성해주세요");
			document.io.userPwd.focus();
			return false;
		}
		
		if(reg.test(document.io.userName.value)){
			alert("특수문자를 입력할 수 없습니다.");
			document.io.userName.value="";
			document.io.userName.focus();
			return false;
		}
		if(document.io.userName.value ==""){
			alert("닉네임를 입력해주세요");
			document.io.userName.focus();
			return false;
		}else if(document.io.userName.value.length>8){
			alert("닉네임은 8자 이상 쓸 수 없습니다.");
			document.io.userName.focus();
			return false;
		}else if(document.io.userName.value.length<2){
			alert("닉네임은 2자 이상 작성해주세요");
			document.io.userName.focus();
			return false;
		}
		
	}
	

	
</script>

<div id="box">
<form role="form" name="io" method="post" autocomplete="off" onsubmit="alert('회원가입을 축하합니다.')">
	<h1>회원가입</h1>
	
 		<label for="userId">아이디</label>
  		<input type="text" class="login" id="userId" name="userId" placeholder="6자 이상 10자 이하"/>
  		<p>
  			<button type="button" class="idCheck">아이디 중복 확인</button>
  		</p>
  		<p class="result">
  			<span class="msg">아이디를 확인해주세요.</span>
  		</p>
  		

 <p>
  <label for="userPass">비밀번호</label>
  <input type="password" class="login"  id="userPwd" name="userPwd" placeholder="6자 이상 20자 이하"/>
 </p>
 <p>
  <label for="userPass">비밀번호 재입력</label>
  <input type="password" class="login"  id="Pwd" name="Pwd" placeholder="비밀번호 재입력"/>
 </p>
 
 
 <p>
  <label for="userName">닉네임</label>
  <input type="text"  class="login" id="userName" name="userName" placeholder="닉네임"/>
 </p>

<script>

$(".idCheck").click(function(){
   
   var query = {userId : $("#userId").val()};
   
   $.ajax({
    url : "/member/idCheck",
    type : "post",
    data : query,
    success : function(data) {
    
     if(data == 1) {
      $(".result .msg").text("사용 불가");
      $(".result .msg").attr("style", "color:red","font-weight:bold");      
      $("#submit").attr("disabled","disabled");
     } else {
      $(".result .msg").text("사용 가능");
      $(".result .msg").attr("style", "color:#00f","font-weight:bold");
      $("#submit").removeAttr("disabled");
     }
    }
   });  // ajax 끝
});


$("#userId").keyup(function(){
	$(".result .msg").text("사용 불가");
	$(".result .msg").attr("style","color:red");
	$("#submit").attr("disabled","disabled");
})
</script> 
	
 
   <button type="submit" id="submit" onclick="return checkForm()" disabled="disabled">회원가입</button>
       
 
 
 <p>
  <a href="/" id="submit">처음으로</a>
 </p>
 
</form>
</div>
</body>
</html>