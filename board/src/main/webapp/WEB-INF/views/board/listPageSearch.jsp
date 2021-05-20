 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 날짜 포멧 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<style scoped>
table {
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	text-align: center;
	font-size: 1.0vw;
	margin-top: 5%;
}

button:active {
	-ms-transform: translateY(2px);
	-webkit-transform: translateY(2px);
	transform: translateY(2px);
	background: #ccc;
}
button {
	border: none;
	padding: 10px;
}

table td {
	padding: 15px;
	/* border: 1px solid lightgray; */
}

th:nth-child(2) {
	width: 40%;
}

table th {
	padding: 10px;
	border: 1px solid rgb(235, 233, 250);
	background-color: rgb(235, 233, 250);
	color: gray
}
li {
	list-style: none;
	float: right;
}

h1 {
	padding-top: 50px;
	color: purple;
	text-align: center;
}
#searchBtn {
	background-color: lightgray;
	color: white;
	vertical-align: top;
	 margin-top: 5%;
}
.form-control {
	display: inline-block;
}

a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

/* 폼 서식 */
.con {
    width: 100%;
    height: calc(1.5em + .75rem + 2px);
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    
    margin-top: 5%;
}
</style>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- jquery 관련 태그들 -->	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<title>게시물 목록</title>
</head>
<body class="container">

		<!-- 언어 선택 영역 -->
	<div class="col-lg-2 col-md-3" style="float: right;">
	<select class="form-control" id="testBox">
		<option>언어 선택</option>
		<option value="ko">한국어</option>
		<option value="zh">중국어</option>
	</select>
	</div>
	
<%-- 	<p> 
	<a href="<c:url value="/i18n.do?lang=ko" />">한국어</a> 
	<a href="<c:url value="/i18n.do?lang=zh" />">중문</a> 
	</p> --%>

		
	<!-- 게시판 -->
	<h1><strong><spring:message code="site.board" /></strong></h1>

	<table class="table table-hover col-lg-12 col-md-9">
		<thead>
			<tr>
				<!-- 번호 -->
				<th><spring:message code="site.num" /></th>
				<!-- 제목 -->
				<th><spring:message code="site.title" /></th>
				<!-- 작성일 -->
				<th><spring:message code="site.date" /></th>
				<!-- 작성자 -->
				<th><spring:message code="site.writer" /></th>
				<!-- 조회수 -->
				<th><spring:message code="site.count" /></th>
			</tr>
		</thead>
		
		<!-- 리스트 출력 영역 -->
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.bno}</td>
					<td><a href="/board/view?bno=${list.bno}">${list.title}</a></td>
					<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
					<td>${list.writer}</td>
					<td>${list.viewCnt}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<div>
		<!-- 페이징 영역 -->
		<div style="text-align: center; font-size: 1.5vw; color: purple">
			<c:if test="${page.prev}">
				<span>[ <a href="/board/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
			</c:if>
	
			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				 <span>
					<!-- 만약 select의 값이 num과 다를 경우 링크 그대로 출력 -->
					  <c:if test="${select != num}">
					   <a href="/board/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
					  </c:if>    
					  
					  <!-- 만약 select의 값이 num과 같을 경우 굵은 글자로 출력 -->
					  <c:if test="${select == num}">
					   <b>${num}</b>
					  </c:if>
					    
				 </span>
			</c:forEach>
	
			<c:if test="${page.next}">
				 <span>[ <a href="/board/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
			</c:if>
		</div>
		<!-- 페이징 영역 끝 -->
		
		<!-- 검색 영역 -->
		<div>
			 <select name="searchType" class="con col-lg-2">
			 	<!-- test 내부에 조건이 들어감, 이 조건이 참일 경우 selected를 출력, 거짓인 경우 아무 것도 출력하지 않음 -->
			     <option value="title" <c:if test="${searchType eq 'title'}">selected</c:if>>제목</option>
			     <option value="content" <c:if test="${searchType eq 'content'}">selected</c:if>>내용</option>
			     <option value="title_content" <c:if test="${searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
			     <option value="writer" <c:if test="${searchType eq 'writer'}">selected</c:if>>작성자</option>
			 </select>
	 	
			 <input type="text" name="keyword" value="${keyword}" class="con col-lg-3"/>
			 
			 <button type="button" id="searchBtn" class="btn btn-default">검색</button>
		</div>
		<!-- 검색 영역 끝 -->
		
		<li>
			<button type="button" class="btn btn-default" style="background-color: #f1f1f1">
				<!-- 글 작성 -->
				<a href="/board/write"><spring:message code="site.write" /></a>
			</button>
		</li>
		<li>
			<button type="button" class="btn btn-default" style="background-color: #f1f1f1">
				<!-- 글 목록 -->
				<a href="/board/listPageSearch?num=1"><spring:message code="site.list" /></a>
			</button>
		</li>
		
	</div>
	
	<%-- <div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div> --%>
	
</div>
	
<script>

 	document.getElementById("searchBtn").onclick = function () {
   
	  	let searchType = document.getElementsByName("searchType")[0].value;
	  	let keyword =  document.getElementsByName("keyword")[0].value;
	  
	  	/* 해당 url로 이동하는 기능 */
	  	location.href = "/board/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
 	};
 	
 	/* 번역 링크 구간 */
 	$(document).ready(function(){
		
		$('#testBox').on('change', function(){
			var lan = $('#testBox').val();
			location.href='<c:url value="/i18n.do?lang='+lan+'" />';
		});
	});
 	
</script>
</body>


<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
</html>