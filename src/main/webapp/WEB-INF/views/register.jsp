<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	
	<title>Register</title>
</head>
<body>
	<c:if test="${sessionScope.loginCheck eq false}">
		<jsp:forward page="home.jsp"/>
	</c:if>
	<jsp:include page="/WEB-INF/views/part/navi.jsp"/>
	<div cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
		width="100%" height="100%" align="center">
		<div class="card align-middle"
			style="width: 60rem; border-radius: 20px; margin-top: 50px">
			<div class="card-title" style="margin-top: 30px;">
				<h2 class="card-title text-center" style="color: #113366;">회원가입</h2>
			</div>
			<div class="card-body">
				<form name ="form" class="form-signup" onSubmit="return registercall()" method="POST" action="${cp}/member/register" style="text-align:left;">
				  <div class="mb-3">
				    <label for="uid" class="form-label">아이디</label>
				    <div class="input-group mb-3">
					  <input type="text" class="form-control" name="uid" id="uid" placeholder="Your ID" required autofocus>
					  <button type="button" name="dupl" class="btn btn-primary btn-block" onclick="duplicationCheck()">중복확인</button>
					</div>
				  </div>
				  <div class="mb-3">
				    <label for="upw" class="form-label">비밀번호</label>
				    <input type="password" class="form-control" name="upw" id="upw" placeholder="Password" required>
				  </div>
				  <div class="mb-3">
				    <label class="form-label" for="gender">성별</label>
				    <br>
					<div class="form-check form-check-inline" id="gender">
					  <input class="form-check-input" type="radio" name="gender" id="male" value="M">
					  <label class="form-check-label" for="male">남자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="gender" id="female" value="F">
					  <label class="form-check-label" for="female">여자</label>
					</div>
				  </div>
				  <div class="mb-3">
				    <label for="phone" class="form-label">연락처</label>
				    <div id="phone" class="input-group">
						<input type="text" name="uphone1" class="form-control" maxlength="3" style="text-align: center;" required>
						&nbsp;-&nbsp;
						<input type="text" name="uphone2" class="form-control" maxlength="4" style="text-align: center;" required>
						&nbsp;-&nbsp;
						<input type="text" name="uphone3" class="form-control" maxlength="4" style="text-align: center;" required>
					</div>
				  </div>
				  <input type="hidden" name="contact">
				  <div style="text-align:center">
				  	<button id="btn-Yes" class="btn btn-primary btn-block" type="submit" style="text-align: center;">가입하기</button>
				  </div>
				</form>
			</div>
		</div>
	</div>
</body>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script type= text/javascript>
	let checked = false;
	function registercall(){
		let uid = document.querySelector('input[name="uid"]').value;
		let upw = document.querySelector('input[name="upw"]').value;
		let uphone1 = document.querySelector('input[name="uphone1"]').value
		let uphone2 = document.querySelector('input[name="uphone2"]').value
		let uphone3 = document.querySelector('input[name="uphone3"]').value
		let contact = uphone1 + "-" + uphone2 + "-" + uphone3; 
		document.querySelector('input[name="contact"]').value = contact;
		if(!checked) {
			alert("아이디를 확인해주세요");
			return false;
		}
	}
	function duplicationCheck(){
		let uid = document.querySelector('input[name="uid"]').value;
		$.ajax({
            type:'post',
            url:'http://localhost:8090/myapp/member/userCheck',
            dataType:'text',
            data:{uid:uid},
            async:false,
            success: function(data) {
                if(data === 'usable') {
                    alert("사용 가능한 아이디 입니다.")
                    checked = true;
                } else {
                	alert("사용 중인 아이디 입니다.")
                	checked = false;
                }
            }
        })
	}
</script>
</html>
