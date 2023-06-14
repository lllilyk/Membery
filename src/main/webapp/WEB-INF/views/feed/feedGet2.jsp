<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<my:top></my:top>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css"
	rel="stylesheet" />
<my:top></my:top>

</head>

<style>
.body {
	height: 1000px;
}

.pageName {
	height: 120px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.wrapper {
	display: flex;
	justify-content: space-around;
	align-items: center;
	min-height: 100vh;
	background-color: #EEEEEE;
	margin-right: 10%;
	margin-left: 10%;
	border-radius: 1.5rem;
	position: relative;
}

.bx-wrapper {
	margin-left: 1.2rem;
}

#textContentt {
	/* flex-grow: 2;  */
	margin-right: 10rem;
	margin-left: 10rem;
}

#drop {
	/* flex-grow: 0.5;  */
	/* position: absolute;  */
	
}

#my-card {
	width: 100%;
	/* height: 80vh; */
}

#profilImage {
	border-radius: 50%;
	height: 50px;
	width: 50px;
}

#inserted {
	margin-top: 15px;
}
#commentTitle {
	text-align: center;
	font-weight: bold;
}
#commentListContainer{
	height: 250px;
	overflow-y: auto;
	border: solid 0.5px grey;
}
#addCommentContainer {
	padding-top: 20px;
}


</style>
<body id="body" style="background-color: #FFF2F2">

	<my:navBar />

	<!-- toast 알람 -->
	<div
		class="toast-container position-fixed  top-0 start-50 translate-middle-x p-3">
		<div id="liveToast" class="toast" role="alert" aria-live="assertive"
			aria-atomic="true">
			<div class="d-flex">
				<div class="toast-body"></div>
				<button type="button" class="btn-close me-2 m-auto"
					data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
	</div>

	<div class="pageName" >
		<h1 class="d-none" >
			<span id="feedIdText">${feed.id }</span>번 게시물
		</h1>
	</div>

	<div class="wrapper">

		<div class="d-flex">
		
			<!-- card -->
			<div class="ui card" id="my-card">
				<div class="content"">
					<div id="inserted" class="right floated meta">${feed.inserted }</div>
					<!-- 프로필 이미지 + 닉네임 -->
					<c:if test="${logedInMember.profileImage ne null}">
						<img class="ui avatar image" id="profilImage" src="${bucketUrl }/pet${logedInMember.profileImage }">${logedInMember.nickName } 
					</c:if>
					<c:if test="${logedInMember.profileImage eq null}">
						<img class="ui avatar image" id="profilImage" src="/images/paw.png">${logedInMember.nickName } 
					</c:if>
				</div>
				<div class="content">
					<div class="right floated meta">
						<img class="ui avatar image" src="/images/scrap.png">
					</div>
				</div>

				<!-- 이미지 파일 출력 -->
				<div class="content">
					<br />
					<ul class="bxslider">
						<c:forEach items="${feed.fileName }" var="fileName">
							<li><img class="ui medium rounded imager"
								src="${bucketUrl }/feed/${feed.id }/${fileName }" alt="" /></li>
						</c:forEach>
					</ul>
				</div>

				<!-- 좋아요, 댓글 콘텐츠 -->
				<div class="content">
					<!-- 좋아요 기능 -->
					<span class="likeIcon" data-feed-id="${feed.id }"> 
						<c:if test="${feed.liked }">
							<img src="/images/bone.png">
						</c:if> <c:if test="${not feed.liked }">
							<img src="/images/olbone.png">
						</c:if>
					</span> 
					<!-- 좋아요 숫자 -->
					<span class="likeNumber" style="font-weight: 300; font-size: large;">
						${feed.likeCount } 
					</span> 
					<span style="font-weight: 300; font-size: large;">likes</span> 
					<!-- 댓글 숫자 -->
					<span class="left floated" style="margin-right: 200px; font-weight: 300; font-size: large;">
						<button type="button" class="btn btn-secondary-link btnTriggerModal position-relative"
							id="commentIcon" data-bs-toggle="modal" data-bs-target="#commentModal" data-id="${feed.id }">
							<i class="fa-solid fa-comment fa-2x"></i> <span id="commentCnt"
								class="position-absolute top-35 start-70 translate-middle badge rounded-pill bg-warning"">
								${feed.commentCount }</span>
						</button>
					</span>
					<!-- 댓글 입력 창 -->
					<div class="extra content">
						<div class="ui large transparent right icon input">
							<input size=42 type="text" placeholder="Add Comment..."><imgsrc="/images/comment.png">
						</div>
					</div>
				</div>


				<!-- 댓글 기능 -->
				<div id="commentcontainer">
						<div id="commentTitle"><h3><i class="fa-solid fa-comments"></i> 댓글</h3></div>
						<br />
						<c:if test="${feed.commentCount > 0 }">
							<ul class="list-group" id="commentListContainer"></ul>
						</c:if>
						<c:if test="${feed.commentCount == 0 }">
							<div><h6>댓글이 없습니다.</h6></div>
						</c:if>
							
						
						<sec:authorize access="isAuthenticated()">
							<div class="mb-3" id="addCommentContainer">
	
								<div class="input-group">
									<div class="form-floating">
										<textarea id="commentTextArea" class="form-control"
											style="height: 60px" placeholder="댓글을 남겨주세요"></textarea>
										<label for="floatingTextArea">댓글을 남겨주세요</label>
									</div>
									<button id="sendCommentBtn" class="btn btn-outline-secondary">
										<i class="fa-regular fa-paper-plane"></i>
									</button>
								</div>
							</div>
						</sec:authorize>
				</div>
			</div>
			
			<!-- text content-->
			<div class="textContent">			
				<div class="ui segment" style="font-weight: 700;">제목 : ${feed.title }</div>
				<div class="ui segment" style="font-weight: 700;">본문 : ${feed.content }</div>
				<div class="ui segment" style="font-weight: 700;">작성자 : ${feed.writer }</div>
				<div class="ui segment" style="font-weight: 700;">장소 태그 : ${feed.location }</div>
			</div>


			<!-- 댓글 삭제 모달 -->
			<div class="modal fade" id="deleteCommentConfirmModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5">댓글 삭제 확인</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
							<div class="modal-body">삭제 하시겠습니까?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
									<button id="deleteCommentModalButton" data-bs-dismiss="modal"
										type="submit" class="btn btn-danger">삭제</button>
								</div>
						</div>
					</div>
				</div>

					<%-- 댓글 수정 모달 --%>
					<div class="modal fade" id="commentUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5">댓글 수정</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div id="updateCommentContainer">
										<input type="hidden" id="commentUpdateIdInput" />
										<textarea class="form-control" id="commentUpdateTextArea"></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="updateCommentBtn" data-bs-dismiss="modal">수정</button>
								</div>
							</div>
						</div>
					</div>

				<!-- 수정/삭제 버튼 드랍다운 -->
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="name" var="uerId" />
						<c:if test="${userId eq feed.writer }">
						
							<div class="drop">
								<button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
									<i class="fa-solid fa-ellipsis-vertical"></i>
								</button>
				
								<ul class="dropdown-menu">
									<!-- Dropdown menu links -->
									<div style="text-align: center">
										<a href="/modify/${feed.id }">수정하기</a>
									</div>
									<div style="text-align: center">
										<a href="#" onclick="javascript:document.removeForm.submit();">삭제하기</a>
									</div>
								</ul>
				
								<!-- 삭제하기 기능 -->
								<div class="d-none">
									<form action="/remove" method="post" name="removeForm">
										<input type="text" name="id" value="${feed.id }" />
									</form>
								</div>
			
							</div>
						</c:if>
				</sec:authorize>
			
		</div>
	</div>


	<my:bottom></my:bottom>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			let slider = $('.bxslider').bxSlider({
				slideWidth : 400
			});
		});
	</script>

	<script src="/js/feed/like.js"></script>

	<script src="/js/feed/comment.js"></script>
</body>
</html>