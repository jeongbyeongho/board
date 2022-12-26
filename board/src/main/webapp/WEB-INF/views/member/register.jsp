<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
 <title>헬스 게시판</title> 
</head>
<body>
<script>
	//document.querySelector('input[name="genDer"]:checked').value;
</script>

<form role="form" method="post" autocomplete="off">
 <p>
  <label for="userId">아이디</label>
  <input type="text" id="userId" name="userId" />
 </p>  
 <p>
  <label for="userPass">패스워드</label>
  <input type="password" id="userPwd" name="userPwd" />
 </p>
 <p>
  <label for="userName">닉네임</label>
  <input type="text" id="userName" name="userName" />
 </p>
 <p>
  <label for="genDer">성별: </label>
  남자<input type="radio" id="genDer" value="남자" name="genDer" checked/>
  여자<input type="radio" id="genDer" value="여자" name="genDer"/>
 </p>
 <p>
   <button type="submit" id="submit" >가입</button>  
 </p>
 <p>
  <a href="/">처음으로</a>
 </p>
 
</form>
</body>
</html>