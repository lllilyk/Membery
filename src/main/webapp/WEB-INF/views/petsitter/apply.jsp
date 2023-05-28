<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="d" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>호스트 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/js/semantic/semantic.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>
	<h1>호스트 등록</h1>
	<div class="ui centered equal width grid">
		<div class="eight wide column">
			<div class="ui segment">
				<form id="applyForm" class="ui big form" method="post" action="/petsitter/apply">
					<h1>1. 기본 정보</h1>
					<div class="field">
						<label for="photo">사진 등록</label>
						<input id="photo" type="file" name="photo">
					</div>
					<div class="field">
						<label for="hostName">이름</label>
						<input id="hostName" type="text" name="hostName" placeholder="이름을 입력해주세요.">
					</div>
					<div class="field">
						<label for="phone">전화번호</label>
						<input id="phone" type="text" name="phone" placeholder="예)01012341234">
					</div>
					<div class="field">
						<label for="idNumber">주민번호</label>
						<input id="idNumber" type="text" name="idNumber" placeholder="-를 빼고 입력해주세요.">
					</div>
					<div class="field">
						<label>주소</label>
						<div class="equal width fields">
							<div class="field">
								<select class="ui fluid search dropdown" name="si" id="si">
									<option value="서울">서울</option>
									<option value="부산">부산</option>
									<option value="대구">대구</option>
									<option value="인천">인천</option>
								</select>
							</div>
							<label>시</label>
							<div class="field">
								<select class="ui fluid search dropdown" name="gu" id="gu">
									<option value="종로">종로</option>
									<option value="강서">강서</option>
									<option value="마포">마포</option>
								</select>
							</div>
							<label>구</label>
							<div class="field">
								<select class="ui fluid search dropdown" name="dong" id="dong">
									<option value="내발산">내발산</option>
									<option value="염창">염창</option>
									<option value="화곡">화곡</option>
								</select>
							</div>
							<label>동</label>
						</div>
					</div>
					<div class="field">
						<label for="address">상세 주소</label>
						<input id="address" type="text" name="address">
					</div>
					<div class="inline fields">
						<label>거주지 형태 : </label>
						<div class="field">
							<div class="ui radio checkbox">
								<input id="10" type="radio" name="houseType" value="10평 이하">
								<label for="10">10평 이하</label>
							</div>
						</div>
						<div class="field">
							<div class="ui radio checkbox">
								<input id="20" type="radio" name="houseType" value="11 - 20평 이하">
								<label for="20">11 - 20평 이하</label>
							</div>
						</div>
						<div class="field">
							<div class="ui radio checkbox">
								<input id="30" type="radio" name="houseType" value="21 - 30평 이하">
								<label for="30">21 - 30평 이하</label>
							</div>
						</div>
						<div class="field">
							<div class="ui radio checkbox">
								<input id="40" type="radio" name="houseType" value="31평 이상">
								<label for="40">31평 이상</label>
							</div>
						</div>
					</div>


					<h1>2. 반려 경험 및 경력</h1>
					<div class="inline fields">
						<label for="fruit">반려 경험 유무 :</label>
						<div class="field">
							<div class="ui radio checkbox">
								<input id="ok" type="radio" name="pet" value="있음">
								<label for="ok">있음</label>
							</div>
						</div>
						<div class="field">
							<div class="ui radio checkbox">
								<input id="no" type="radio" name="pet" value="없음">
								<label for="no">없음</label>
							</div>
						</div>
					</div>
					<div class="inline fields">
						<label>반려견 :</label>
						<div class="field">
							<div class="ui radio checkbox">
								<input id="small" type="radio" name="species" value="소형견">
								<label for="small">소형견</label>
							</div>
						</div>
						<div class="field">
							<div class="ui radio checkbox">
								<input id="middle" type="radio" name="species" value="중형견">
								<label for="middle">중형견</label>
							</div>
						</div>
						<div class="field">
							<div class="ui radio checkbox">
								<input id="big" type="radio" name="species" value="대형견">
								<label for="big">대형견</label>
							</div>
						</div>
					</div>
					<div class="grouped fields">
						<label>펫시터 활동 경력 :</label>
						<div class="field">
							<div class="ui radio checkbox">
								<input id="past" type="radio" name="experience" value="과거에 활동했지만, 현재는 활동하지 않음">
								<label for="past">과거에 활동했지만, 현재는 활동하지 않음</label>
							</div>
						</div>
						<div class="field">
							<div class="ui radio checkbox">
								<input id="present" type="radio" name="experience" value="현재도 활동하고 있음">
								<label for="present">현재도 활동하고 있음</label>
							</div>
						</div>
						<div class="field">
							<div class="ui radio checkbox">
								<input id="never" type="radio" name="experience" value="펫시터로 활동을 해본 적이 없음">
								<label for="never">펫시터로 활동을 해본 적이 없음</label>
							</div>
						</div>
					</div>
				</form>
			</div>

			<!-- 버튼 -->
			<div class="extra content">
				<div class="ui two buttons">
					<button class="ui basic red button" >뒤로 돌아가기</button>
					<button class="ui basic green button" form="applyForm">등록하기</button>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="applyCheckModal" tabindex="-1" aria-labelledby="applyCheckModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="applyCheckModalLabel">지원 등록</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">호스트 지원 등록을 하시겠습니까?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary" form="applyForm">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
	<script src="semantic/dist/semantic.min.js"></script>
	
</body>
</html>