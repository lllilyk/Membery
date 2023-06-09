<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<meta charset="UTF-8">
<my:top></my:top>

	<style>

		.chating{
			margin: 80px 0px 0px 20px;
			background-color: #FFF2F2;
			width: 50vw;
			height: 82vh;
			overflow: auto;
		}
		.chating p{
			color: black;
			font-size: 40px;
			font-width: bold;
			border-radius: 1rem;
			border: 2px solid gray;
			margin-bottom: 10px;
		}
		
		.me {
		  /* text-align: right; */
		  background-color: white;
		  padding: 10px;
		  float:right;
		}
		
		.others {
          /* text-align: left; */
          background-color: #EEEEEE; 
 		  padding: 10px;
 		  float:left;
   		}
   		
		.chating div {
		 
		  clear:both;
		  
		}
	
	</style>
</head>

<script type="text/javascript">

	var ws;

	function wsOpen() {
		//웹소켓 전송 시 현재 방의 번호를 넘겨서 보내기
		ws = new WebSocket("ws://" + location.host + "/chating");
		wsEvt();
	}

	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<div><p class='me'>" + d.msg + "</p></div>");	
					}else{
						$("#chating").append("<div><p class='others'>" + d.userName + " : " + d.msg + "</p></div>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}

		// 엔터키 치면 전송
		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) { 
				send();
			}
		});
	}

	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
</script>

<body>
	<my:navBar current="chat"></my:navBar>
	<my:logo></my:logo>
	<my:alert></my:alert>
	
	<div id="chatContainer" class="d-flex">
		
		<!-- 현재의 세선값을 저장해놓기 위해 -->
		<input type="hidden" id="sessionId" value="">
		<!-- 방의 번호값을 모델에서 저장하고 그 값을 jstl을 통해 파싱 -->
		
		<div style="display: none;">
		<c:if test="${sessionScope.logedInMember.profileImage ne null}">
			<img id="profileImg" class="ui tiny image btn-primary position-relative" src="${bucketUrl }/pet${sessionScope.logedInMember.profileImage }"></img>
		</c:if>
		</div>
	
		<!-- 채팅 목록 -->
		<div id="chatList" style="background-color: #EEEEEE; height: 100vh; width: 25vw;">
		
		</div>
			
		<div id="chatBack" style="background-color: #FFF2F2; height: 100vh; width: 75vw;">


			<!-- 채팅창 -->
			<div id="chating" class="chating">
			</div>
			
			<div id="yourName" class="ui action input" style="font-size: 20px; height: 50px; width: 20vw; margin: 0px 0px 0px 20px;"> 
				<input type="text" name="userName" id="userName" style="border-top-left-radius: 2rem; border-bottom-left-radius: 2rem;" placeholder=" <sec:authentication property="name"/>" value="<sec:authentication property="name"/>" name="userId">
					<button onclick="chatName()" id="startBtn" class="ui action button" style="border-top-right-radius: 2em; border-bottom-right-radius: 2rem;">
						START
					</button>
			</div>
				
			<div id="yourMsg" class="ui action input" style="display: none; font-size: 20px; height: 50px; width: 70vw; margin: 0px 0px 0px 20px;">
				<input id="chatting" placeholder="메세지를 입력해 주세요." style="border-top-left-radius: 2rem; border-bottom-left-radius: 2rem;">
					<button onclick="send()" id="sendBtn" class="ui action button" style="border-top-right-radius: 2em; border-bottom-right-radius: 2rem;">
						<i class="fa-solid fa-paper-plane"></i>
					</button>
			</div>
			
			
		</div>
	</div>

<my:bottom></my:bottom>

	<script>
		$('.ui.modal').modal('show');
	</script>

</body>
</html>