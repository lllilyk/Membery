<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>호스트 정보 수정하기</title>
<my:top></my:top>
<link rel="stylesheet" type="text/css" href="/js/semantic/semantic.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<style type="text/css">
#imgContainer {
	position: relative;
}

#addBtn {
	position: absolute;
	top: 80%;
	left: 60%;
}
</style>
</head>
<body>
	<my:navBar></my:navBar>
	<my:logo></my:logo>
	<br>
	<div class="ui centered equal width grid">
		<div class="eight wide column">
			<div class="ui segment">
				<div class="content">
					<h4 class="ui grey center aligned header">수정정보를 입력해주세요.</h4>
					<h1 class="ui center aligned header">${host.hostName }님정보입니다.</h1>
					<div>
						<form action="/petsitter/hostModify" class="ui big form" id="checkForm" method="post" enctype="multipart/form-data">
							<div class="ui aligned container" id="imgContainer">
								<c:choose>
									<c:when test="${host.profile eq null or host.profile eq '' }">
										<img class="ui medium bordered centered circular image " src="/images/paw.png" id="preview">
										<input class="form-control d-none" onchange="readURL(this);" type="file" id="file" name="file" accept="image/*" />
									</c:when>
									<c:otherwise>
										<img class="ui medium bordered centered circular image " id="preview" src="${bucketUrl }/hostProfile/${host.id }/${host.profile }">
										<input class="form-control d-none" onchange="readURL(this);" type="file" id="file" name="file" accept="image/*" />
									</c:otherwise>
								</c:choose>
								<label for="file" class="big circular ui icon button" id="addBtn">
									<i class="large plus icon"></i>
								</label>
							</div>
							<div class="field">
								<label>이름</label>
								<input type="text" name="hostName" value="${host.hostName }">
							</div>
							<div class="field">
								<label>전화번호</label>
								<input type="text" name="phone" value="${host.phone }">
							</div>
							<div class="field">
								<label>생년월일</label>
								<input type="text" name="idNumber" value="${host.idNumber }" disabled>
							</div>
							<div class="field">
								<label>주소</label>
								<my:address></my:address>

							</div>
							<div class="field">
								<label>상세주소</label>
								<input type="text" name="address" value="${host.address }">
							</div>
							<div class="field">
								<div class="equal width fields">
									<div class="field">
										<label for="houseType">거주지 형태 </label>
										<select class="ui fluid search dropdown" name="houseType" id="houseType">
											<option value="10평 이하">10평 이하</option>
											<option value="11 - 20평 이하">11 - 20평 이하</option>
											<option value="21 - 30평 이하">21 - 30평 이하</option>
											<option value="31평 이상">31평 이상</option>
										</select>
									</div>
									<div class="field">
										<label for="pet">반려 경험 유무</label>
										<select class="ui fluid search dropdown" name="pet" id="pet">
											<option value="있음">있음</option>
											<option value="없음">없음</option>
										</select>
									</div>
									<div class="field">
										<label for="species">반려견 크기</label>
										<select class="ui fluid search dropdown" name="species" id="species">
											<option value="소형견">소형견</option>
											<option value="중형견">중형견</option>
											<option value="대형견">대형견</option>
										</select>
									</div>
								</div>
							</div>
							<div class="field">
								<label for="experience">펫시터 활동 경력</label>
								<select class="ui fluid search dropdown" name="experience" id="experience">
									<option value="과거에 활동했지만, 현재는 활동하지 않음">과거에 활동했지만, 현재는 활동하지 않음</option>
									<option value="현재도 활동하고 있음">현재도 활동하고 있음</option>
									<option value="펫시터로 활동을 해본 적이 없음">펫시터로 활동을 해본 적이 없음</option>
								</select>
							</div>
							<input type="hidden" name="id" value="${host.id }">
						</form>
					</div>
				</div>
			</div>
			<div class="extra content">
				<div class="ui two buttons">
					<a href="/petsitter/hostMyPage" class="ui red basic button">취소하기</a>
					<button form="checkForm" class="ui green basic button">수정하기</button>
				</div>
			</div>
		</div>
	</div>


	<my:bottom></my:bottom>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="/js/semantic/semantic.min.js"></script>
	<script>
		$('.ui.dropdown').dropdown();

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('preview').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('preview').src = "";
			}
		}

		$("#addressContainer").click(function() {
			console.log("click");
		})
	</script>
	<script src="/js/petsitter/address.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="/js/semantic/semantic.min.js"></script>

</body>
</html>