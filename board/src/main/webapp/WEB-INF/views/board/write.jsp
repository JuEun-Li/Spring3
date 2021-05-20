<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style scoped>
	.write-box {
		text-align: center;
		vertical-align: middle;
		border: 5px solid skyblue;
		box-shadow: 10px 10px 5px aliceblue;
		left: 25%;
		padding: 3% 5% 5% 5%;
	}
	li {
		list-style: none;
		float: right;
		margin: 5% 10% 5% 0;
	}
	input, textarea {
		display: inline-block;
		margin-left: auto;
		margin-right: auto;
		/* left: 25%; */
		border: none;
    	background-color: aliceblue;
    	min-height: 50px;
    	box-shadow: 5px 5px 8px #f1f1f1;
    	border-radius: 7%;
	}
	h1 {
		padding: 3% 0 0 10%;
		color: navy;
	}
	label {
		margin: 3%;
		font-size: 1.3vw;
	}
</style>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="<c:url value="/resources/static/common.css"/>" rel='stylesheet' />
<title>게시물 작성</title>
</head>
<body>
	<%-- <div id="nav">
	 <%@ include file="../include/nav.jsp" %>
	</div> --%>
	
	<h1><strong>게시물 작성</strong></h1>
<form action="write" method="post" enctype="multipart/form-data">
	<!-- input 과 textarea의 이름 속성의 값이 BoardVO와 일치해야한다. -->
		<div class="write-box col-lg-6 col-md-6">
		<label><strong>제목</strong></label><br>
		
		<!-- form-control 클래스 값 넣어주면 됨. -->
		<input type="text" name="title" class=" col-lg-6 col-md-6"/><br />
		
		<label><strong>작성자</strong></label><br>
		<input type="text" name="writer" class=" col-lg-6 col-md-6"/><br />
		
		<label><strong>내용</strong></label><br>
		<textarea cols="100" rows="10" name="content" class=" col-lg-6 col-md-6"></textarea><br />
		
		<label><strong>업로드</strong></label>
		<input type="file" name="uploadFile"/>
		
		<button type="submit" class="btn btn-default" style="background-color: skyblue; color: white; font-size: 1.3vw;">작성</button>
	</div>
</form>
	<li>
		<button type="button" class="btn btn-default" style="background-color: rgb(235, 233, 250)">
			<a href="/board/listPageSearch?num=1">글 목록</a>
		</button>
	</li>
</body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</html>