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

</body>
<script type= text/javascript>
	
</script>
</html>
