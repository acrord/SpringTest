<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<link href="${cp}/resources/css/login.css" rel="stylesheet"/> 	
	<title>Login</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/part/navi.jsp"/>
	<div cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
		width="100%" height="100%" align="center">
		<div class="card align-middle"
			style="width: 20rem; border-radius: 20px; margin-top: 50px">
			<div class="card-title" style="margin-top: 30px;">
				<h2 class="card-title text-center" style="color: #113366;">로그인</h2>
			</div>
			<div class="card-body">
				<form class="form-signin" method="POST" onSubmit="return logincall()" action="/myapp">
					<h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
					<label for="inputEmail" class="sr-only">Your ID</label> <input
						type="text" id="uid" class="form-control" placeholder="Your ID"
						required autofocus><BR> <label for="inputPassword"
						class="sr-only">Password</label> <input type="password" id="upw"
						class="form-control" placeholder="Password" required><br>
					<div class="checkbox">
						<label> <input type="checkbox" value="remember-me">
							기억하기
						</label>
					</div>
					<button id="btn-Yes" class="btn btn-lg btn-primary btn-block"
						type="submit">로 그 인</button>
				</form>
				<button onclick ="register()" class="btn btn-lg btn-primary btn-block">회원가입</button>
			</div>
		</div>
	</div>
	<script
	  src="https://code.jquery.com/jquery-3.5.1.min.js"
	  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	  crossorigin="anonymous"></script>
	<script type= text/javascript>
		function register(){
			location.href='/myapp/member/register';
		}
		function logincall(){
			let uid = document.querySelector('#uid').value();
			let upw = document.querySelector('#upw').value();
			$.ajax({
	            type:'post',
	            url:'http://localhost:8090/myapp/member/loginCheck',
	            dataType:'text',
	            data:{uid:uid, upw:upw},
	            success: function(data) {
	                if(data === 'success') {
	                    return true;
	                } else {
	                	alert("아이디나 비밀번호를 확인해주세요.")
						return false;
	                }
	            }
	        })
			
		}
	</script>
</body>
</html>
