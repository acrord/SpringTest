<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<head>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
	</head>
	<nav class="navbar navbar-expand-lg navbar-light bg-white">
      <div class="container">

        <!-- Brand -->
        <a class="navbar-brand" href="/myapp">myapp</a>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
            	<c:if test="${sessionScope.loginCheck eq true}">
			      	<a class="navbar-brand" onclick="javascript:void(0)">${uid}님 안녕하세요</a>
		        </c:if>
            </li>
         </ul>
         <c:choose>
         	<c:when test="${sessionScope.loginCheck eq true}">
         		<a class="navbar-btn btn btn-sm btn-primary lift ml-auto" href="/myapp/member/logout">
		        	Logout
		        </a>
         	</c:when>
          	<c:otherwise>
          		<a class="navbar-btn btn btn-sm btn-primary lift ml-auto" href="/myapp/member/login">
		        	Login
		        </a>
          	</c:otherwise>
          </c:choose>
       </div>
    </nav>