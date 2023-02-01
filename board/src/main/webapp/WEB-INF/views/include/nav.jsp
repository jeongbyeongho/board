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
		margin-top:12px;
		margin-right:10px;
	}
	#logoutbtn{
		margin:3px auto;
		background-color:#f0f0f0;
		padding:3px 12px;
	}
	#continues{
		border:none;
		border-radius:4px;
		padding:4px 8px;
	}

	#hidden_accesstime{
		display:none;
		position:absolute;
	}
	#nickname:hover + #hidden_accesstime{
		display:block;
	}
</style>



<script>



<%
	String pattern = "mm분 ss초";
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd (a)hh:mm:ss");
	
	long lastTime = session.getLastAccessedTime();
	System.out.println("접속 시간: "+formatter.format(new Date(lastTime)));
	
	//System.out.println("세션 유효 시간:"+(session.getMaxInactiveInterval()/60));
	
	java.util.Date d = new java.util.Date(session.getCreationTime());
	System.out.println("세션 생성된 시간 : "+ d );
	int interval = session.getMaxInactiveInterval();
	session.setMaxInactiveInterval(interval);
	
	
	
	Date a = new Date();
	//SimpleDateFormat sf= new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
	
	// 자리비움 시간으로 하고, 시간이 만료되었을 때 로그아웃 처리 후 로그인 화면으로 이동
	
	
%>


 
var time=1800; // 30분

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
		<a id="clock" style="color:gray;"></a>
		<a id="nickname" class="userName">${member.userName}님</a>
		<a id="hidden_accesstime"><%=formatter.format(new Date(lastTime)) %></a>
		<c:if test="${member != null }">
			<button class="btn btn-light" id="logoutbtn" type="button" onclick="location.href='../member/logout'; alert('${member.userName}님 로그아웃 되었습니다.');">로그아웃</button>
			<a id="demo" style=""></a>
		</c:if>
		<button type="button" id="continues" onclick="window.location.reload()">연장</button>
		
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