<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/js/semantic/semantic.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>
	<br>
	<!-- 수정 정보 form -->
	<div class="ui centered equal width grid">
		<div class="eight wide column">
			<div class="ui segment">
				<form id="modifyDetailForm" class="ui big form" method="post" action="/petsitter/modifyDetail" enctype="multipart/form-data">
					<h1 class="ui dividing header">상세페이지 수정하기</h1>
					<div class="field">
						<label for="housePhotoes">집사진 등록</label>
						<input id="housePhotoes" type="file" name="housePhotoes" multiple>
					</div>
					<div class="field">
						<label for="title">제목</label>
						<input id="title" type="text" name="title" value="${detail.title }">
					</div>
					<div class="field">
						<label for="body">소개글</label>
						<textarea id="body" type="text" name="body" rows="20">${detail.body }</textarea>
					</div>
					<div class="field">
						<input type="text" name="hostId" value="${param.hostId }">
					</div>
				</form>
			</div>

			<!-- 삭제 정보 form -->
			<div class="d-none">
				<form action="/petsitter/deleteDetail" id="deleteDetailForm">
					<input type="text" name="hostId" value="${param.hostId }">
				</form>
			</div>

			<!-- 버튼 -->
			<div class="extra content">
				<div class="ui three buttons">
					<a href="/petsitter/hostMyPage?id=${detail.hostId }" class="ui blue basic button">뒤로가기</a>
					<button data-bs-toggle="modal" data-bs-target="#deleteDetailModal" class="ui red basic button">삭제하기</button>
					<button class="ui basic green button" data-bs-toggle="modal" data-bs-target="#modifyDetailModal">수정하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 수정 모달 -->
	<div class="modal fade" id="modifyDetailModal" tabindex="-1" aria-labelledby="modifyDetailModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="modifyDetailModalLabel">상세페이지</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">상세페이지를 수정하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
					<button type="submit" form="modifyDetailForm" class="btn btn-primary">수정하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 삭제하기 모달 -->
	<div class="modal fade" id="deleteDetailModal" tabindex="-1" aria-labelledby="deleteDetailModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="deleteDetailModalLabel">상세페이지</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">상세페이지 정보를 정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
					<button type="submit" class="btn btn-danger" form="deleteDetailForm">삭제하기</button>
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