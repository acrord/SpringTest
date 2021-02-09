<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	
	<title>Home</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/part/navi.jsp"/>
	<div cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
		width="100%" height="100%" align="center">
		<div class="card align-middle"
			style="width: 60rem; border-radius: 20px; margin-top: 50px">
			<div class="card-title" style="margin-top: 30px;">
				<h2 class="card-title text-center" style="color: #113366;">회원가입</h2>
			</div>
			<div class="card-body">
			<!-- onSubmit="registercall();return false" -->
				<form class="form-signup" method="POST" action="${cp}/member/register">
					<label for="uid" class="col-lg-2" style="margin-top:8px">아이디</label> 
					<div class = "col-lg-10">
						<input type="text" name="uid" class="form-control" placeholder="Your ID" required autofocus>
					</div>
					<BR> <BR> <BR> 
					<label for="upw" class="col-lg-2" style="margin-top:8px">비밀번호</label> 
					<div class = "col-lg-10">
						<input type="password" name="upw" class="form-control" placeholder="Password" required>
					</div>
					<br><BR> <BR> 
					<label for="gender" class="col-lg-2" style="margin-top:3px">성별</label>
					<div id="gender" class = "col-lg-3" style="text-align:left">
						<input type="radio" name="gender" value="M" id="male" required>&nbsp;<label for="male">남자</label>&nbsp;
						<input type="radio" name="gender" value="F" id="felmale">&nbsp;<label for="female">여자</label>
					</div>
					<br><BR>
					<label for="phone" class="col-lg-2" style="margin-top:8px">연락처</label>
					<div id="phone" class = "col-lg-10">
						<div class = "col-lg-3">
							<input type="text" name="uphone1" class="form-control" maxlength="3" style="text-align: center;" required>
						</div>
						<div class = "col-lg-1">-</div>
						<div class = "col-lg-3">
							<input type="text" name="uphone2" class="form-control" maxlength="4" style="text-align: center;" required>
						</div>
						<div class = "col-lg-1">-</div>
						<div class = "col-lg-3">
							<input type="text" name="uphone3" class="form-control" maxlength="4" style="text-align: center;" required>
						</div>
					</div>
					<br><BR><br>
					<div style="padding-left: 5%; padding-right: 2%;"> 
						<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">가입하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type= text/javascript>
	function registercall(){
		let uid = document.querySelector("#uid").value();
		let upw = document.querySelector("#uid").value();
		let uid = document.querySelector("#uid").value();
		let uid = document.querySelector("#uid").value();
		//location.href = '/myapp/member/login';
	}
</script>
</html>
