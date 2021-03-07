<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>

<%
	String idx= request.getParameter("idx");
%>
<script
	  src="https://code.jquery.com/jquery-3.5.1.min.js"
	  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	  crossorigin="anonymous"></script>
<script type="text/javascript">
	$.ajax({
	    type:'post',
	    url:'http://localhost:8090/myapp/post/view',
	    dataType:'text',
	    data:{post_ID:<%=idx%>},
	    success: function(data) {
	        if(data === 'success') {
	            return true;
	        } else {
	        	alert("오류")
				return false;
	        }
	    }
	})
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/part/navi.jsp"/>
	<div align="center">
		<h2>게시글 조회</h2>
	</div>
	
	<div align="center" style="text-align-last: justify;">
		<div style="width: 80%;">
			<table class="table">
			  <tbody>
			    <tr>
			      <th scope="row" colspan="1">제목</th>
			      <td colspan="11">${post.title}</td>
			      <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			    </tr>
			    <tr>
			      <th scope="row" colspan="1">작성자</th>
			      <td colspan="11">${post.user_ID}</td>
			      <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			    </tr>
			    <tr>
			      <th scope="row" colspan="1">내용</th>
			      <td colspan="11"></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			    </tr>
			  </tbody>
			</table>
			<div class="mb-3">
	         <label for="text" class="form-label"></label>
	         <br>
	         <div id="text" style="min-height:300px;">
	         	${post.content}
	         </div>
	       </div>
	       <button type="button" class="btn btn-secondary" onclick="location.href='/myapp'">목록으로</button>
	       <c:if test="${sessionScope.uid eq post.user_ID}">
	       	   <button type="button" class="btn btn-primary" onclick="modifyPost'">수정하기</button>
	       	   <button type="button" class="btn btn-danger" onclick="deletePost()">삭제하기</button>
       	   </c:if>
       </div>
     </div>
      
</body>
<script type= text/javascript>
	function modifyPost(){
	
		if(${post.user_ID} == sessionScope.uid){
			var form = document.createElement('form');
			form.setAttribute('method', 'post');
			form.setAttribute('action', "/myapp/post/modify");
			var hiddenField = document.createElement('input');
			hiddenField.setAttribute('type', 'hidden');
			hiddenField.setAttribute('name', idx);
			hiddenField.setAttribute('value', <%=idx%>);
			var hiddenField2 = document.createElement('input');
			hiddenField2.setAttribute('type', 'hidden');
			hiddenField2.setAttribute('name', 'uid');
			hiddenField2.setAttribute('value', ${post.user_ID});
			form.appendChild(hiddenField);
			form.appendChild(hiddenField2);
			form.submit();
		}
		
		
	}
	function deletePost(){

		if(${post.user_ID} == sessionScope.uid){
			var form = document.createElement('form');
			form.setAttribute('method', 'post');
			form.setAttribute('action', "/myapp/post/delete");
			var hiddenField = document.createElement('input');
			hiddenField.setAttribute('type', 'hidden');
			hiddenField.setAttribute('name', idx);
			hiddenField.setAttribute('value', <%=idx%>);
			var hiddenField2 = document.createElement('input');
			hiddenField2.setAttribute('type', 'hidden');
			hiddenField2.setAttribute('name', 'uid');
			hiddenField2.setAttribute('value', ${post.user_ID});
			form.appendChild(hiddenField);
			form.appendChild(hiddenField2);
			form.submit();
		}
		
		
	}
	
</script>
</html>