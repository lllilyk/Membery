<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<my:top></my:top>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
</head>

<style>
.pageName {
	height: 120px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 75vh;
	position: relative;
}

.back {
	min-height: 75vh;
	margin-right: 15%;
	margin-left: 15%;
	border-radius: 1.5rem;
}

#add {
	flex-grow: 2;
	margin-left: 2rem;
}

#content {
	flex-grow: 3;
	margin-right: 10rem;
	margin-left: 10rem;
}

#imageList {
	width: 400px;
	height: 400px;
}

#removeCheck {
	position: absolute;
	top: 0;
	left: 0;
}

#imager {
	width: 400px;
	height: 400px;
}
</style>

<body style="background-color: #FFF2F2">

	<my:navBar></my:navBar>
	<my:logo></my:logo>
	<div class="pageName">
		<%-- <h1>${feed.id }번 게시물 수정하기</h1> --%>
	</div>

	<div class="back" style="background-color: #EEEEEE">
		<form class="wrapper" method="post" enctype="multipart/form-data" id="modifyForm">

			<input type="hidden" name="id" value="${feed.id }" />

			<!-- 기존 이미지 파일 보이기 -->
			<div id="add" align="center">
				<ul class="bxslider">
					<c:forEach items="${feed.fileName }" var="fileName" varStatus="status">
						<!-- <div id="imageDiv"> -->
						<li id="imageList${status.index }" align="left">
							<div id="removeCheck" class="d-flex">
								<i class="trash alternate icon"></i>
								<div class="form-check form-switch">
									<input name="removeFiles" value="${fileName }" class="form-check-input" type="checkbox" role="switch" id="removeCheckBox${status.index }">
									</label>
								</div>
							</div> <label class="form-check-label" for="removeCheckBox${status.index }"> <%-- <button data-target-list="#imageList${status.index }" type="button" class=" removeFilesBtn btn btn-outline-dark" name="removeFiles" value="${fileName }"><i class="fa-solid fa-trash"></i></button> --%> <%--  <button type="button" class="removeFilesBtn btn btn-dark" name="removeFiles" value="${fileName }"><i class="trash alternate icon"></i></button> --%> <img id="imager" class="ui medium rounded imager" src="${bucketUrl }/feed/${feed.id }/${fileName }" alt="" />
						</li>
						<!-- </div> -->
					</c:forEach>
				</ul>

				<!-- 새 이미지 파일 추가 input -->
				<div align="center">
					<h3>사진을 추가해보세요!</h3>
					<input style="margin-left: 60px;" type="file" multiple name="files" accept="image/*" required />
				</div>

			</div>


			<!-- 글 수정 부분 -->
			<div id="content">

				<div class="ui form">
					<div class="title">
						<label align="left" style="color: red; font-weight: bolder;">필수</label>
						<input placeholder="제목을 입력하세요" type="text" name="title" value="${feed.title }">
					</div>
				</div>
				<br />

				<div class="ui form">
					<div class="content">
						<label align="left" style="color: red; font-weight: bolder;">필수</label>
						<textarea placeholder="내용을 입력하세요" name="content">${feed.content }</textarea>
					</div>
				</div>
				<br />

				<div class="ui form">
					<div class="content">
						<%-- <label align="left" style="color: gray; font-weight: bolder;">태그를 추가 해 보세요:)</label>
						<input type="text" id="writer" name="writer" value="${feed.writer }" style="display: none;">
						<div class="ui right labeled left icon input">
							<i class="tags icon"></i>
							<input type="text" id="tagInput" placeholder="Enter tags">
							<a type="submit" class="ui tag label" id="addTag">Add Tag</a>
						</div>
						<div class="tagsContainer mt-2"> --%>
							<c:forEach items="${feed.keyword}" var="keyword">
								<span class="ui tag blue tiny label" style="margin: 2px 6px 2px 6px">${keyword}</span>
							</c:forEach>
						<!-- </div>
					</div>
 -->				</div>
			</div>
			<%-- <div class="ui form">
                   <div class="location">
                     <label></label>
                     <input placeholder="장소를 태그하세요" type="text" name="location" value="${feed.location }" />
                   </div>
               </div>
               <br /> --%>
		</form>

		<div align="right">
			<button class="btn btn-secondary" type="submit" form="modifyForm" id="modifyButton">수정하기</button>
		</div>

	</div>
	<my:bottom></my:bottom>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
	<script src="/js/feed/tag.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			let slider = $('.bxslider').bxSlider({
				slideWidth : 400
			});

			$(".removeFilesBtn").click(function() {
				const target = $(this).attr("data-target-list");
				$(target).remove();
				slider.reloadSlider();
			});
		});

		/* 엔터키 치면 전송되는 것 방지 */
		$('input[type="text"]').keydown(function() {
			if (event.keyCode == 13) {
				event.preventDefault();
			}
			;

		})

		/* 첨부파일 이미지 변경 */
		const fileInput = document.getElementById("fileInput");
		const previewContainer = document.getElementById("imagePreview");
		const previewImage = previewContainer.querySelector(".preview");
		const previewDefaultImage = previewContainer
				.querySelector(".defaultImage");

		fileInput.addEventListener("change", function() {
			const file = this.files[0];
			//console.log(file);

			if (file) {
				const reader = new FileReader();

				previewDefaultImage.style.display = "none";
				previewImage.style.display = "block";

				reader.addEventListener("load", function() {
					previewImage.setAttribute("src", this.result);
				});

				reader.readAsDataURL(file);
			}

		})
	</script>
</body>
</html>