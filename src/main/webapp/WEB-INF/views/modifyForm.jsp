<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
	<title>newPost</title>
</head>
<body>
<c:if test="${sessionScope.loginCheck eq false}">
	<jsp:forward page="home.jsp"/>
</c:if>
	<jsp:include page="/WEB-INF/views/part/navi.jsp"/>
	<div align="center">
		<h2>게시글 작성</h2>
	</div>
	<div align="center" style="text-align-last: justify;">
	    <form method="post" action="/myapp/post/modifyPost" style="width: 80%;">
	    	<input type="hidden" name="post_ID" value="${post.post_ID }">
	       <div class="mb-3">
	         <label for="title" class="form-label">제목</label>
	         <input type="text" class="form-control" id="title" name="title" placeholder="제목을 작성해주세요." required value="${post.title }">
	       </div>
	       <div class="mb-3">
	         <label for="uid" class="form-label">작성자</label>
	         <input type="text" class="form-control" id="uid" name="user_ID" value="${sessionScope.uid}" readonly>
	       </div>
	       
	       <div class="mb-3">
	       	<label for="pw" class="form-label">비밀번호</label>
	       	<div class="input-group mb-3">
			  <div class="input-group-text">
			    <input type="checkbox" class="form-check-input mt-0" id="pw" onchange="passEanble(this)">
			  </div>
			  <input type="password" class="form-control" id="pw_input" name="post_PW" readonly>
			</div>
	       </div>
	       <div class="mb-3">
	         <label for="text" class="form-label">내용</label>
	         <textarea class="form-control" id="content" name="content" rows="10" style="resize: none;" required>${post.content}</textarea>
	       </div>
	       <button type="submit" class="btn btn-primary">수정완료</button>
	       <button type="button" class="btn btn-secondary" onclick="location.href='/myapp'">목록으로</button>
	   </form>
	</div>
</body>
<script type= text/javascript>
	function passEanble(e){
		
		if(e.checked==true) document.getElementById("pw_input").readOnly = false;
		else document.getElementById("pw_input").readOnly = true;
	}
</script>
</html>
