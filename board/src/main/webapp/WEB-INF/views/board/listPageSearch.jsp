<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<title>헬스장 추천 게시판</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script>
 	// url 파라미터 지우는 코드
  		//history.replaceState({},null,location.pathname);
  		//history.pushState({},null,location.pathname);
  		
	</script>
	<style>
		.input-group{
			display:flex;
			width:25%;
			height:5%;
		}
		#pagecenter{
			text-align:center;
		}
		#search_bar_inner{
			width:100%;
			margin-left:30%;
		}
		
		
	</style>
</head>
<body>

<c:if test="${member != null}">



<div id="nav">
	<%@ include file="../include/nav.jsp"%>
</div>



<form role="form" method="POST">

<div class="container">
<table class="table table-striped">
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
			  
			<td><fmt:formatDate value="${list.regDate}" type="time" timeStyle="medium"/></td>
		 </tr>
		</c:forEach>
	</tbody>	
</table>
</div>
</form>
<div class="container" id="pagecenter">
<nav id="nav_bar" aria-label="Page navigation example">
  <ul class="pagination">
    <c:if test="${page.prev}">
		<li class="page-item"><a class="page-link" href="/board/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a></li>
	</c:if>
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<c:if test="${select != num}">
	    	<li class="page-item"><a class="page-link" href="/board/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a></li>
		</c:if>
	    <c:if test="${select == num}">
			<li class="page-item"><a class="page-link"><b>${num}</b></a></li>
		</c:if>
    </c:forEach>
    <c:if test="${page.next}">
		<li class="page-item"><a class="page-link" href="/board/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a></li>
	</c:if>
  </ul>
</nav>
</div>
</c:if>
<c:if test="${member == null}">
	<script>
		alert("로그인후 이용해주세요");
		location.href="/";
	</script>
</c:if>
<div class="container" id="search_bar">
	<div class="search row" id="search_bar_inner">
		<div class="col-xs-2 col-sm-2">
			<select name="searchType" class="form-control">
				<option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
				<option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
				<option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
				<option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
			</select>
		</div>

		<div class="col-xs-10 col-sm-10">
			<div class="input-group">
				<input type="text" name="keyword" value="${page.keyword}" class="form-control"/>
				<button type="button" id="searchBtn" class="btn btn-default">검색</button>
			</div>		
		</div>
	</div>
</div>
	<script>
	document.getElementById("searchBtn").onclick = function(){
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;
		
		location.href="/board/listPageSearch?num=1"+"&searchType="+searchType+"&keyword="+keyword;
		
		//console.log(searchType)
		//console.log(keyword)
	};
	</script>
	
</body>
</html>