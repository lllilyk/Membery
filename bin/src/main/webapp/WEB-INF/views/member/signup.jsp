<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>signup</title>

<style>
.container {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
</head>
<body>
	<my:navBar current="signup"></my:navBar>

	<my:alert></my:alert>

	<div class="ui center aligned container" id="container">

		<div class="row justify-content-center">
			<div class="col-12 col-md-8 ">
				
				<div style="margin:30px 0px 50px 0px;">
				<h1>회원 가입</h1>
				</div>
				
				<form method="post">
					<div class="ui fluid labeled big input mt-5">
					<div class="ui label">아이디</div> 
						<input id="inputId" type="text" class="form-control" name="id" value="${member.id }" style="font-size: 18px; text-align: center;" />
					</div>
					<div class="ui fluid labeled big input mt-5">
					<div class="ui label">이름</div> 
						<input id="inputName" type="text" class="form-control" name="name" value="${member.name }" style="font-size: 18px; text-align: center;"/>
					</div>
					<div class="ui fluid labeled big input mt-5">
					<div class="ui label">비밀번호</div>
						<input id="inputPassword" type="password" class="form-control" name="password" style="font-size: 18px; text-align: center;"/>
					</div>
					<div class="ui fluid labeled big input mt-5">
					<div class="ui label">닉네임</div>
						<input id="inputNickName" type="text" class="form-control" name="nickName" value="${member.nickName }" style="font-size: 18px; text-align: center;"/>
					</div>
					<div class="ui fluid labeled big input mt-5">
					<div class="ui label">이메일</div>
						<input id="inputEmail" type="email" class="form-control" name="email" value="${member.email }" style="font-size: 18px; text-align: center;"/>
					</div>
					<div class="ui fluid labeled big input mt-5">
					<div class="ui label">연락처</div>
						<input id="inputPhoneNumber" type="text" class="form-control" name="phoneNumber" value="${member.phoneNumber }" style="font-size: 18px; text-align: center;"/>
					</div>
					<div class="mb-3">
						<input type="submit" class="ui secondary button" value="가입" style="font-size : 16px; margin: 20px;"/>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
	<script src="semantic/dist/semantic.min.js"></script>
</body>
</html>