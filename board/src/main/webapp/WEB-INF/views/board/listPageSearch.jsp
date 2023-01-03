<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 목록</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
<div class="logo">
	<img src="/resources/images/image/neotek_img.png" width="10%" >
	<h2> 헬스장 추천 게시판</h2>
</div>


<div id="nav" class="contatiner">
	<%@ include file="../include/nav.jsp"%>
</div>
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
			  </td>
			  <!-- <td>${list.content}</td>  -->
			  <td>${list.writer}</td>
			  <td>${list.views}</td>
			  <td>${list.regDate}</td>
		 </tr>
		</c:forEach>
	</tbody>	
</table>
<!--  
<div>
	<c:if test="${page.prev}">
		<span>[ <a href="/board/listPageSearch?num=${page.startPageNum - 1}">이전</a> ]</span>
	</c:if>
	
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<span>
			<c:if test="${select != num}">
				<a href="/board/listPageSearch?num=${num}">${num}</a>
			</c:if>
			
			<c:if test="${select == num}">
				<b>${num}</b>
			</c:if>
		</span>
	</c:forEach>
	 
	<c:if test="${page.next}">
		<span>[ <a href="/board/listPageSearch?num=${page.endPageNum + 1}">다음</a> ]</span>
	</c:if>
</div>
-->


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


	<%-- <c:forEach begin="1" end="${pageNum}" var="num">
		<span>
			<a href="/board/listPage?num=${num}">${num}</a> }
		</span>
	</c:forEach> --%>
	


	<div class="search row">
		<div class="col-xs-2 col-sm-2">
			<select name="searchType" class="form-control">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="title_content">제목+내용</option>
				<option value="writer">작성자</option>
			</select>
		</div>

		<div class="col-xs-10 col-sm-10">
			<div class="input-group">
				<input type="text" name="keyword" class="form-control"/>
				<button type="button" id="searchBtn" class="btn btn-default">검색</button>
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