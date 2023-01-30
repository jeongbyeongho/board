<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	header>ul>li>a{
		color:white;
	}
	.userName{
		color: #0080FF;
	}
	#list{
		color:white;
		margin:4px auto;
	}
	#nickname{
		color:black;
		margin-top:12px;	
	}
	#loginBtn{
		margin:4px auto;
		
	}
	#img{
		position:block;
	}
	#ul-list{
		background-color: grey;
	}
	.rightbar{
		display:inline-block;
		float:right;
		margin-top:12px;
		margin-right:10px;
	}
	#logoutbtn{
		margin:3px auto;
		background-color:#f0f0f0;
	}
	#continues{
		border:none;
		border-radius:4px;
		padding:4px 8px;
	}

</style>

<script>



<%
	String pattern = "mm분 ss초";
	SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	long lastTime = session.getLastAccessedTime();
	// System.out.println("세션 유지 시간:" + (session.getLastAccessedTime()*1000)/60);
	
	sdf.format(new Date(lastTime));
	System.out.println("세션 유지 시간 : "+sdf.format(new Date(lastTime)));

	//System.out.println((session.getCreationTime()/1000));
	
	System.out.println("세션 유효 시간:"+(session.getMaxInactiveInterval()/60));
	
	java.util.Date d = new java.util.Date(session.getCreationTime());
	System.out.println("세션 생성된 시간 : "+ d );
	
	int interval = session.getMaxInactiveInterval();
	session.setMaxInactiveInterval(interval);
	
	System.out.println("세션 설정 시간: "+interval);
	
	// 자리비움 시간으로 하고, 시간이 만료되었을 때 로그아웃 처리 후 로그인 화면으로 이동
	
%>


 
var time=1800; // 30분

var min="";
var sec="";
var x = setInterval(function(){
	min=parseInt(time/60);
	sec = time%60;
	
	document.getElementById("demo").innerHTML = "자리 비움 : "+ min+"분"+sec+"초";
	time--;
	
	if(time<0){
		clearInterval(x);
		document.getElementById("demo").innerHTML = "시간초과";
		
		alert("세션이 만료되어 로그아웃 되었습니다.");
		location.href="/member/logout";
		
	}
},1000);


	
	
	


</script>
</head>
<body>
<div class="iconbar">
	<a href="/board/listPageSearch?num=1"><img id ="img" src="/resources/images/image/neotek_health2.png" width="300px"></a>

	<div class="rightbar">
		<a id="nickname" class="userName">${member.userName}님</a>
		<c:if test="${member != null }">
			<button class="btn btn-light" id="logoutbtn" type="button" onclick="location.href='../member/logout'; alert('${member.userName}님 로그아웃 되었습니다.');">로그아웃</button>
			<a id="demo" style=""></a>
		</c:if>
		<button type="button" id="continues" onclick="window.location.reload()">연장</button>
	</div>
</div>
<header id="ul-list">
	<ul class="nav nav-pills">
		<li> 
			<a id="loginBtn" href="/board/listPageSearch?num=1">게시글 목록</a>
		</li>
		<li>
			<a id="loginBtn" href="/board/write">글 작성</a>
		</li>
		<li>
			<a type="button" id="loginBtn"onclick="location.href='/member/change';">닉네임 변경</a>
		</li>
		<li>
			<a type="button" id="loginBtn"onclick="location.href='/member/pwdchange';">비밀번호 변경</a>
		</li>
		<li>
			<a type="button" id="loginBtn" onclick="location.href='/member/withdrawal'">회원 탈퇴</a>
		</li>
		
		
		
		<c:if test="${member == null }">
			<script>
				location.href="/member/login"
			</script>
		</c:if>
	</ul>
</header>
</body>
</html>