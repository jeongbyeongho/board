<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<title>게시물 목록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script>
 	// url 파라미터 지우는 코드
  		history.replaceState({}, null, location.pathname);	 
	</script>
 
	<style>
		.input-group{
			display:flex;
			width:25%;
			height:5%;
		}
		.logo{
			display:flex;
			padding:10px 0px;
			
		}
	</style>
</head>
<body>
<% String Referer=request.getHeader("Referer");  %>

<div class="logo">
	<img src="/resources/images/image/neotek_img.png" width="10%" >
	<h2> 헬스장 추천 게시판</h2>
</div>



<div id="nav" class="contatiner">
	<%@ include file="../include/nav.jsp"%>
</div>
<form role="form" method="POST">
<table class="table table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성시간</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${list}" var="list">
		 <tr>
			  <td>${list.num}</td>
			  <td>
			  	<a href="/board/view?num=${list.num}">${list.title}</a>
			  </td>
			  <td>
			  	<fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" />
			  	<!-- fmt:formatDate 날짜 정보를 담고 있는 객체를 포맷팅하여 출력할 때 사용 -->
			  </td>
			  <td>${list.writer}</td>
			  <td>${list.views}</td>
			  <td>${list.regDate}</td>
		 </tr>
		</c:forEach>
	</tbody>	
</table>
</form>
<nav aria-label="Page navigation example">
  <ul class="pagination">
    <c:if test="${page.prev}">
		<li class="page-item"><a class="page-link" href="/board/listPageSearch?num=${page.startPageNum - 1}">이전</a></li>
	</c:if>
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<c:if test="${select != num}">
	    	<li class="page-item"><a class="page-link" href="/board/listPageSearch?num=${num}">${num}</a></li>
		</c:if>
	    <c:if test="${select == num}">
			<li class="page-item"><a class="page-link"><b>${num}</b></a></li>
		</c:if>
    </c:forEach>
    <c:if test="${page.next}">
		<li class="page-item"><a class="page-link" href="/board/listPageSearch?num=${page.endPageNum + 1}">다음</a></li>
	</c:if>
  </ul>
</nav>

</body>
</html>