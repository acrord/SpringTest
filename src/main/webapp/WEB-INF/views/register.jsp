<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	
	<title>Register</title>
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
				<form name ="form" class="form-signup" onSubmit="return registercall()" method="POST" action="${cp}/member/register">
					<label for="uid" class="col-lg-2" style="margin-top:8px">아이디</label> 
					<div class = "col-lg-7">
						<input type="text" name="uid" class="form-control" placeholder="Your ID" required autofocus>
					</div>
					<div class = "col-lg-3">
						<button type="button" name="dupl" class="btn btn-primary btn-block" onclick="duplicationCheck()">중복확인</button>
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
					<input type="hidden" name="contact">
					<div style="padding-left: 5%; padding-right: 2%;"> 
						<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">가입하기</button>
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
