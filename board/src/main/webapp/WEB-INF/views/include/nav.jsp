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
		color:0000ffc2;
		margin-top:12px;	
	}
	#loginBtn{
		margin-top:3px;
		margin-bottom:5px;
		color:white;
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
		margin-top:14px;
		margin-right:10px;
	}
	#logoutbtn{
		margin-top:3px;
		margin-bottom:5px;
		background-color:#f0f0f0;
		padding:3px 12px;
	}
	#continues{
		border:none;
		border-radius:4px;
		padding:4px 8px;
		margin-top:2px;
	}

	#hiddentext{
		display:none;
		position:absolute;
	}
	#nickname:hover + #hiddentext{
		display:block;
	}
	#top_bar>li{
		display:inline-block;
		margin:3px 20px 0 0;
	}
	
	



</style>



<script>

<%
	String pattern = "mm분 ss초";
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd (a)hh:mm:ss");
	
	long lastTime = session.getLastAccessedTime();
	System.out.println("접속 시간: "+formatter.format(new Date(lastTime)));
	
	session.setMaxInactiveInterval(60*30);
	long timeout = session.getMaxInactiveInterval();
	System.out.println("세션 유효시간"+timeout);
	//System.out.println("세션 유효 시간:"+(session.getMaxInactiveInterval()/60));
	
	
	//session.setMaxInactiveInterval(3000);
	//long ttime = session.getMaxInactiveInterval();
	
	java.util.Date d = new java.util.Date(session.getCreationTime());
	System.out.println("세션 생성된 시간 : "+ d );
	
	// 자리비움 시간으로 하고, 시간이 만료되었을 때 로그아웃 처리 후 로그인 화면으로 이동
	
	
%>

var time=<%=timeout%>; // 30분
var min="";
var sec="";
var x = setInterval(function(){
	min=parseInt(time/60);
	sec = time%60;
	document.getElementById("demo").innerHTML = ""+ min+"분"+sec+"초";
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
	<ul id="top_bar">
		<li><span id="nickname" class="userName">${member.userName}</span>님</li>
		<!-- <a id="hiddentext"><%=formatter.format(new Date(lastTime)) %></a>  -->
		<li><span id="clock" style="color:gray;"></span></li>
		<c:if test="${member != null }">
			<li>세션 만료 시간 : <span id="demo" style="color:gray"></span></li>
			<button type="button" id="continues" onclick="window.location.reload()">연장</button>
			<button class="btn btn-light" id="logoutbtn" type="button" onclick="location.href='../member/logout'; alert('${member.userName}님 로그아웃 되었습니다.');">로그아웃</button>
		</c:if>
	</ul>
	</div>
</div>

<script>

function clock() {
    var date = new Date();

    var month = date.getMonth();

    var clockDate = date.getDate();
 
    var day = date.getDay();

    var week = ['일', '월', '화', '수', '목', '금', '토'];

    var hours = date.getHours();

    var minutes = date.getMinutes();
   
    var seconds = date.getSeconds();

    if(hours<10){
    	hours="0"+hours;	
    }
    if(minutes<10){
    	minutes="0"+minutes;
    }
    if(seconds<10){
    	seconds="0"+seconds;
    }
   
    
    document.getElementById("clock").innerText = (month+1)+"월"+ clockDate +"일" + "("+ week[day]+")" + hours+":" +minutes+ ":" +seconds;
   
    
}

function init() {
	clock();
	setInterval(clock, 1000);
}

init();

</script>

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