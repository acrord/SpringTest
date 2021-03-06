<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/part/navi.jsp"/>
	<div align="center">
		<h2>스프링 테스트용 게시판 작성</h2>
	</div>
	<div align="center" style="margin-top: 50px;">
		<table class="table table-hover table-bordered" style="max-width:80%">
			<thead class="thead-light">
				<colgroup> 
					<col style="width:10%"> 
					<col style="width:40%"> 
					<col style="width:20%"> 
					<col style="width:20%"> 
					<col style="width:10%"> 
				</colgroup> 
				<tr style="text-align-last: center;"> 
					<th scope="col">번호</th> 
					<th scope="col">제목</th> 
					<th scope="col">작성자</th> 
					<th scope="col">작성일</th> 
					<th scope="col">조회</th> 
				</tr> 
			</thead>
			<tbody>
				
				<c:if test="${empty posts}">
					<tr align="center" height="300"> 
						<td colspan=5 style="vertical-align: middle;">조회된 데이터가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="post" items="${posts}" varStatus="status"> 
					<tr align="center" height="30"> 
						<td>${posts.size() - status.index}</td> 
						<td> 
							<a href="/myapp/post/content?idx=${post.post_ID}">${post.title}</a>
							<c:if test="${not empty post.post_PW }">
								
								<i class="bi bi-file-lock2-fill"></i>
							</c:if>
						</td> 
						<td>${post.user_ID}</td> 
						<td><fmt:formatDate value="${post.created}" type="both" dateStyle="medium"/></td> 
						<td>${post.read_Cnt}</td> 
					<tr> 
				</c:forEach> 
			</tbody>
		</table>
		<c:if test="${sessionScope.loginCheck eq true }">
			<div align="right" style="max-width: 80%;">
				<button type="button" class="btn btn-outline-primary" onclick="location.href='/myapp/post/newPost'">
                <i class="bi bi-plus-square" style="margin-bottom: 3px;"></i>
                글쓰기
              </button>
			</div>
		</c:if>
	</div>
	
</body>



<script type= text/javascript>
	
</script>
</html>
