<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 변경</title>

<style>
*{
		box-sizing: border-box;
	}
	body{
		background: grey;
	}
	/* 로그인 */
	form{
		width:350px;
		border: NONE;
		border-radius:10px;
		padding: 15px;
		
		background-color:#D8D8D8;
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
	}
	h1{
		text-align:center;
	}
	
	.button_login{
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
	}
	.button_login:hover{
		background-color:grey;
	}
	.login{
		width:100%;
		border:0;
		border-radius: 5px;
		padding:20px;
		
	}
	.input-box{
		margin: auto;
		padding:3px 4px;
		width:100%
	
	}
	
	/* 메인 */
	.list_button{
		width: 50%;
		height: 60px;
		align-items:center;
		border-radius:5px; 
		border:0;
		margin:10px auto;		
	}
	.list_button:hover{
		background-color : grey;
	}
	li{
		list-style:none;
	}
	.right_logout, div>span{
		float:right;
		display:inline;
		padding: 5px;
	}
	.right_logout{
		border-radius:5px;
		border:0;
		margin-right:10px;
	}
	.img{
		float:left;
		width:10%;
		display:flex;
		border-radius:10px;
		
	}
	header{
		width:70%;
		height: 75px;
		justify-content: space-between;
		align-items:center;
		background-color:white;
		display: flex;
		border-radius: 10px;
		border:none;
		margin-bottom: 10px;
	}
	section{
		background-color:white;
		width:70%;
		height:430px;
		border-radius:10px;
		display:flex;
		flex-direction: column;
	}
	section>div>p{
		text-align:center;
		margin-bottom:7px;	
		margin-top: 5px;
	}
	.main_content{
		display:flex;
		flex-direction:column;
		width:100%;
	}
	.main_img{
		margin: auto;
	}
	
	.loginbtn_bar{
		padding:20px;
		margin:auto;
	
	}
	span{
		font-size:1.1vw;
	}
	
	.result{
		text-align:center;
	}
	.checkbox{
		margin: auto;
		text-align:center;
	}
	.nickCheck{
		border:none;
		padding:10px 9px;
		border-radius:4px;
		background-color:#1bbc9b;
		color:white;
	}
	.nickCheck:hover{
		background-color:grey;
	}
	
	</style>
	
<script>
function checkForm(){
	if(document.io.userName.value == null){
		alert("닉네임을 입력해주세요.");
		document.io.userName.focus();
		return false;
	}else if(document.io.userName.value.length>8){
		alert("닉네임은 8글자 이상 쓸 수 없습니다.");
		return false;
	}else if(document.io.userName.value.length<2){
		alert("닉네임은 2글자 이상 작성해주세요.");
		document.io.userName.focus();
		return false;
	}
	
	
	else{
		alert("변경 완료되었습니다.\n다시 로그인 해주세요.");
	}
	// console.log(document.getElementById('userPwd').value);
}
</script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>
	<form role="form" method="post" autocomplete="off" name="io">
		<h1>닉네임 변경 👊</h1>
		
	   <div class="input-box">
	    <label for="userId" class="String"></label><br>
	    <input type="text" id="userId" name="userId" class="login" value="${member.userId}" readonly />
	   </div>
	   
	   
	   <div class="input-box">
	    <label for="userName" class="String"></label><br>
	    <input type="text" id="userName" name="userName" class="login" value="${member.userName}" placeholder="변경할 닉네임" />
	   </div>
	   <div class="checkbox">
	   <button type="button" id="idhover" class="nickCheck">닉네임 중복 확인</button>
	   </div>
	   <p class="result">
  			<span class="msg">닉네임을 작성해주세요.</span>
  		</p>	   
	   <div>
		   <button type="submit" id="submit" class="button_login" onclick="return checkForm()" disabled="disabled">변경 완료</button>    
		   <button type="button" class="button_login" onclick="location.href='/board/listPageSearch?num=1'">메인으로</button>
	   </div>
	  <script>
		  $(".nickCheck").click(function(){
	   
	  	var query = {userName : $("#userName").val()};
	   
	   $.ajax({
	    url : "/member/nickCheck",
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
	
	
	$("#userName").keyup(function(){
		$(".result .msg").text("사용 불가");
		$(".result .msg").attr("style","color:red");
		$("#submit").attr("disabled","disabled");
	})
	  
	  </script>
	</form>
</body>
</html>