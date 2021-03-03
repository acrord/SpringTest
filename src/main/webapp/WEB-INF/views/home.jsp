<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
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
						<td>${post.post_ID}</td> 
						<td align="left"> 
							<a href="">${post.title}</a> 
						</td> 
						<td>${post.user_ID}</td> 
						<td>${post.created}</td> 
						<td>${post.read_Cnt}</td> 
					<tr> 
				</c:forEach> 
			</tbody>
		</table>
		<c:if test="${sessionScope.loginCheck eq true }">
			<div align="right" style="max-width: 80%;">
				<button type="button" class="btn btn-primary" onclick="location.href='/myapp/post/newPost'">
				  <span class="badge badge-light">+</span>&nbsp;&nbsp;글쓰기
				  <span class="sr-only">unread messages</span>
				</button>
			</div>
		</c:if>
	</div>

</body>
<script type= text/javascript>
	
</script>
</html>
