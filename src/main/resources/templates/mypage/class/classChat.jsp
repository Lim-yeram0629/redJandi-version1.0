<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>멘티 채팅</title>

<link href="${ pageContext.servletContext.contextPath }/resources/css/chat.css?" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
img {
	width: 250px;
	text-align: center;
	border: none !important;
}

.content {
	width: 90%;
	border: none !important;
}

.reportBtn {
	background: none;
	border: none;
	border-radius: 0.5rem;
	color:darkred;
	font-size: small;
}
.btn-primary {
	width: 30px; 
	height:30px;
	color: #fff;
	background-color: #91C788;
	border-color: #91C788;
	border-radius: 0.3rem;
	border-style: none;
}

.btn-primary.active, .btn-primary.focus, .btn-primary:active,
	.btn-primary:focus, .btn-primary:hover, .open>.dropdown-toggle.btn-primary
	{
	color: #fff;
	background-color: #599A4E;
	border-color: #599A4E;
	
}

.btn-primary:hover {
	background-color: #599A4E;
	border-color: #599A4E;
}

.inputSyle{
	border-radius: 0.5rem;
	border: 1.5px solid green;
	height: 30px;
	padding:2%;
}

.contents{
	resize: none;
	border-radius: 0.5rem;
	border: 1.5px solid green;
	height: 100px;
	padding:2%;
	
}

.modalBtn{
	width:auto;
	height:auto;
	padding: 8px;
}

</style>
</head>

<script src="http://125.132.252.115:3000/socket.io/socket.io.js"></script>
<script>

	function getFormatDate(chat_date){
		let year = chat_date.getFullYear() 
		let month = chat_date.getMonth() + 1;
		month = month < 10 ? '0' + month :  month;
		
		let date = chat_date.getDate();
		date = date < 10 ? '0' + date :  date;
		
		let hour = chat_date.getHours();
		hour = hour < 10 ? '0' + hour :  hour;
		
		let minutes = chat_date.getMinutes();
		minutes = minutes < 10 ? '0' + minutes :  minutes;
		
		return year + "-" + month + "-" + date + " " + hour + ":" + minutes;
	}

	function addSenderBox(chat){
		let $senderBox = 
			"<div class='senderBox' align='right'><b class='chatName'>"
			+ "나"
			+"</b><br><div class='messageBox sender'>" 
			+ chat.chat_contents 
			+ "</div><div class='chatDate' >"
			+ chat.chat_date
			+ "</div></div><br>";
			
			$('.chatRight').append($senderBox);
	};
	
	function addReceiveBox(chat){
		let $receiverBox = 
			"<div class='receiverBox'><b class='chatName'>"
			+ chat.nickName 
			+ "</b><br><div class='messageBox'>"
			+ chat.chat_contents
			+ "</div><div class='chatDate'>"
			+ chat.chat_date
			+ "</div></div><br>";
			
			$('.chatRight').append($receiverBox);
	};
	
	$(function(){
		
		const email = "${ sessionScope.loginMember.email }";
		const chatCode = ${ chatCode };
		// 테스트 채팅방 정보 
		let chatInfo = {
			email: email,
			chat_code: chatCode
		};
		
		let socket = io("http://125.132.252.115:3000/classChat");
		
		socket.emit("chat_info", chatInfo);
		
		console.log(chatInfo);
		
		// 채팅 이력 불러오기
		socket.on("receive_msg", function(chat_log){
			console.log(chat_log);
			for(const chat of chat_log){
				if(chat.email === chatInfo.email){
					addSenderBox(chat);
				}else {
					addReceiveBox(chat);
				}
				
				$('.chatRight').scrollTop($('.chatRight').prop('scrollHeight'));
			}
		});
		
		socket.on("connect_user", function(chatInfo){
			console.log(chatInfo.email);
		});
		
		//키보드를  뗐을 떄
		$('#msg').keyup(function(key){
			if(key.keyCode==13 && !key.shiftKey){
				// 시프트 엔터가 아닌 경우
				$('#sendBtn').click();
			}
		});
		
		// 포커스  인
		$('#msg').focusin(function(key){
			socket.emit("typing", chatInfo);
		});
		
		// 포커스  아웃
		$('#msg').focusout(function(key){
			socket.emit("non-typing", chatInfo);
		});
		
		$('#sendBtn').click(function(){
			
			let msg = $('#msg').val().replace(/\n/g, "");
			
			if(msg != ""){
				// CLASS_CHAT에 저장
		        let chat = {
		            nickName: '${ sessionScope.loginMember.nickName }',
		            email: email,
		            chat_contents: $('#msg').val().replace(/\n/g, "<br>"),
		            chat_code: chatCode,
		            chat_date: getFormatDate(new Date())
		        };
				
				console.log(chat);
				
				socket.emit("send_msg", chat);
				
			}
			$('#msg').val('');
		});
		
		socket.on('send_msg', function(chat){
			
			if(chat.email === chatInfo.email){
				addSenderBox(chat);
			}else {
				addReceiveBox(chat);
			}
			//스크롤 맨 아래 감지
			$('.chatRight').scrollTop($('.chatRight').prop('scrollHeight'));
		});
		
		// 타이핑 중인지 띄우기
		socket.on('typing', function(typingEmail){
			if(typingEmail != email){
				$('#typingDiv').css('display', 'block');
			}
		});
		
		// 타이핑 중인지 띄우기
		socket.on('non-typing', function(typingEmail){
			if(typingEmail != email){
				$('#typingDiv').css('display', 'none');
			}
		});
		
		// 사진 전송
		$('#sendImgBtn').click(function(){
			if($("#sendFile").val() == ""){
				alert("이미지를 선택해 주세요.");
			}else{
				
				let formData = new FormData($('#chatFileForm')[0]);
				formData.append("sendFile", $("#sendFile").val());
	
				$.ajax({
					type: 'post',
					enctype: 'multipart/form-data',
					processData: false,
					contentType: false,
					cache: false,
					url: "${pageContext.servletContext.contextPath }/mypage/class/chatFileUpload",
					data: formData,
					dataType : "json",
					success: function(chatFileMap){
						console.log(chatFileMap.savedName);
						console.log(chatFileMap.ext);
						console.log(chatFileMap.originFileName);
						
						let img_contents = "<img class='classImg'" 
							+ "src='${ pageContext.servletContext.contextPath }/resources/uploadFiles/chatFile/"
							+ chatFileMap.savedName + "'> <br>"
							+ "<a href='${pageContext.servletContext.contextPath }/mypage/member/classChat/download?filePath=/uploadFiles/chatFile/"
							+ chatFileMap.savedName + "&fileName=" + chatFileMap.originFileName + "'>이미지 저장</a>";
						
						let chat = {
					            nickName: '${ sessionScope.jandi.nickName }',
					            email: chatInfo.email,
					            chat_contents: img_contents,
					            chat_code: chatInfo.chat_code,
					            chat_date: getFormatDate(new Date()),
					           	is_file: 'Y'
					        };
							
						console.log(chat);
						
						socket.emit("send_msg", chat);
						$("#sendFile").val() == "";
					},
					error: function(err){
						console.log(err);
					}
					
				});	//ajax 끝
				$('#closeBtn').click();
			}	//if-else 끝
			
		});	//사진 전송 버튼 클릭 이벤트 끝
		
		
		// 신고 전송
		$('#reportModalBtn').click(function(){
			$('#reportModalForm').submit();
		});	
		
		if('${ requestScope.reportSuccessMessage }' != ''){
			alert('${ requestScope.reportSuccessMessage }');
		}
		
	});
		
</script>
<body>
	<jsp:include page="../../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../../common/mypagesidebar.jsp" />
		<div class="sidebar-content">
			<jsp:include page="../class/classRoomNav.jsp" />
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div class="chatDiv">
				<div class="chatTop">
					<h3>${ sessionScope.classDTO.nickName } </h3>
					<button class="reportBtn" id="reportBtn" data-toggle="modal" data-target="#reportModal">신고</button>
				</div>
				<div class="chatBottom">
					<div style="width: 100%;">
						<div class="chatRight" style="background: #e2fcea">
							
						</div>
						<div align="center" style="background: #e2fcea; border-left: 1px solid green; display:none;" id="typingDiv">
							<i class="comment alternate icon"></i> 상대방이 메시지를 작성중입니다...
						</div>
						<div class="sendMessage" align="center">
							<button class="btn-primary" style="float:left; padding:4px; margin-left:10px; " id="imgBtn" data-toggle="modal" data-target="#sendImgModal">
								<i class="images outline icon"></i>
							</button>
							<textarea class="messageArea" id="msg"></textarea>
							<input class="sendBtn" type="button" id="sendBtn" value="전송" >
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="sendImgModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">파일 첨부</h4>
				</div>
				<div class="modal-body" align="center">
					<br>	
					<form id="chatFileForm" method="post" enctype="multipart/form-data">
						<input type="file" name="sendFile" id="sendFile" accept="image/*">
					</form>
					<br>
				</div>
				<div class="modal-footer">
					<button type="button" id="closeBtn" class="btn btn-default btnBD"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn-primary modalBtn" id="sendImgBtn">전송</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">회원 신고</h4>
				</div>
				<div class="modal-body" align="center">
					<br>	
					<form action="${pageContext.servletContext.contextPath }/mypage/class/reportMember" id="reportModalForm" method="post" enctype="multipart/form-data">
						<b>신고 카테고리(필수): <select id="repTypeCode" name="repTypeCode">
						<c:forEach var="reportState" items="${ reportStateList }">
							<option value="${ reportState.REP_TYPE_CODE }">${ reportState.REP_TYPE }</option>
						</c:forEach>
						</select>
						</b>
						<br><br>
						<b>이미지 첨부</b> (선택)
						<br>
						<input type="file" name="repImage" id="repImage" accept="image/*">
						<br>
						<b>신고 사유(필수)</b><br>
						<textarea class="contents" name="repContents" style="width:300px;"></textarea>
						<br><br>
						타당한 사유 및 근거 없는 신고는 해당 신고가 반려될 수 있습니다.
						<input name="repEmail" type="hidden" value="${ sessionScope.classDTO.email }">
					</form>
					<br>
				</div>
				<div class="modal-footer">
					<button type="button" id="reportCloseBtn" class="btn btn-default btnBD"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn-primary modalBtn" id="reportModalBtn">신고하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>