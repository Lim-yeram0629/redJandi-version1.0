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

.classImg{
	width: 80%;
	text-align: center;
	border: 1px solid green;
	border-radius: 0.5rem;
}

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

.alternate {
	padding-left:3px;
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

</style>
</head>
<script src="http://125.132.252.115:3000/socket.io/socket.io.js"></script>
<script>

	/* mongoDB DATE 함수 포멧 메소드 */
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

	/* 전송한 메세지를 채팅 화면에 추가하는 메소드 */
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
	
	/* 받은 메세지를 채팅 화면에 추가하는 메소드 */
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
		// 해당 로그인 한 세션 이메일 가져오기
		const email = "${ sessionScope.loginMember.email }";
		// 가장 첫번 째 채팅방의 채팅코드가 있다면
		if( '${ chatRoomList[0].CHAT_CODE }' !== '' ){
			
			// DB에서 검색해올 채팅 정보 저장
			let chatInfo = {
				email: email,
				chat_code: $('.chatCodeInput').first().val()
			};
			
			/* 페이지가 뜨자 마자 첫 번째 채팅방에 들어가기 때문에 그에 맞는 css 처리 */
			$('.chatRoomBox').first().css('background-color', 'white');
			$('#nick').html($('.chatRoomBox').first().text());
			$('#repEmail').val($('.chatRoomBox').prev().val());
			console.log("repEmail : " + $('#repEmail').val());
			
			// classChat채팅 서버 연결
			let socket = io("http://125.132.252.115:3000/classChat");
			
			//서버로 chatinfo 전달 및 해당 채팅방 접속
			socket.emit("chat_info", chatInfo);
			
			console.log(chatInfo);
			
			/* 채팅방 변경하기  */
			$('.chatRoomBox').click(function(e){
				// 채팅방 목록 클릭시 전체 css 돌리기
				$('.chatRoomBox').css('background-color', '#e2fcea');
		
				// 기존에 있던 채팅방 나가기
				socket.emit("leaveChat", chatInfo);
				console.log(chatInfo);
				
				// 클릭한 채팅 목록 요소 저장
				let chatBox = e.target;
				
				// 그에 해당하는 css 및 데이터 변경
				$(chatBox).css('background-color', 'white');
				$('#nick').html($(chatBox).text());
				console.log($(chatBox).children().last().val());
				
				$('#repEmail').val($(chatBox).prev().val());
				console.log("repEmail : " + $('#repEmail').val());
				
				// 채팅 방 코드 저장 후, 다시 서버로 전송할 채팅 정보에 저장
				let chatCode = $(chatBox).children().last().val();
				chatInfo.chat_code = chatCode;
				
				// 채팅 정보와 함께 채팅방 접속
				socket.emit("chat_info", chatInfo);
			
			});
			
			// 해당 채팅방에 다른 누군가가 접속하면 접속한 이메일을 알 수 있게 서버로 부터 받는다.
			socket.on("connect_user", function(connect_email){
				console.log(connect_email);
			});
				
			// 채팅 이력 불러오기 및 메세지 받기 
			socket.on("receive_msg", function(chat_log){
				$('.chatRight').html('');
				console.log(chat_log);
				
				// 서버로 받은 채팅을 보여주면서 해당 로그인 사용자를 기준으로 왼쪽 오른쪽으로 나눈다.
				for(const chat of chat_log){
					if(chat.email === chatInfo.email){
						addSenderBox(chat);
					}else {
						addReceiveBox(chat);
					}
					$('.chatRight').scrollTop($('.chatRight').prop('scrollHeight'));
				}
			});
				
			//엔터로 전송할 수 있게 시프트 엔터가 아닌 경우, 엔터 키를  뗐을 떄 전송
			$('#msg').keyup(function(key){
				if(key.keyCode==13 && !key.shiftKey){
					// 시프트 엔터가 아닌 경우
					$('#sendBtn').click();
				}
			});
			
			// 메세지칸에 포커스되면 서버로 타이핑 중 알리기
			$('#msg').focusin(function(key){
				socket.emit("typing", chatInfo);
			});
			
			// 포커스  아웃되면 타이핑 중 아니라고 알리기
			$('#msg').focusout(function(key){
				socket.emit("non-typing", chatInfo);
			});
			
			// 전송 하기
			$('#sendBtn').click(function(){
				// 엔터를 막기 위해 엔터만 있는 경우 빈값으로 초기화
				let msg = $('#msg').val().replace(/\n/g, "");
				
				// 빈값이 아니라면
				if(msg != ""){
					// 서버의 DB에 저장하기 위한 인서트 객체 저장
			        let chat = {
			            nickName: '${ sessionScope.jandi.nickName }',
			            email: chatInfo.email,
			            chat_contents: $('#msg').val().replace(/\n/g, "<br>"),
			            chat_code: chatInfo.chat_code,
			            chat_date: getFormatDate(new Date()),
			            is_file: 'N'
			        };
					
					// 서버로 인서트 객체 전달
					socket.emit("send_msg", chat);
					console.log(chat);

					$('#msg').val('');
				}
			});
			
			// 서버에서 받은 메세지가 있으면 다시 화면에도 보내준다.
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
		
					// 파일 업로드 전송 아이작스
					$.ajax({
						type: 'post',
						enctype: 'multipart/form-data',
						processData: false,	// 파일 전송 시 필수
						contentType: false, // 파일 전송 시 필수
						cache: false,	// 파일 전송 시 필수
						url: "${pageContext.servletContext.contextPath }/jandi/class/chatFileUpload",
						data: formData,
						dataType : "json",
						success: function(chatFileMap){	
							console.log(chatFileMap.savedName);
							console.log(chatFileMap.ext);
							console.log(chatFileMap.originFileName);
							
							// 해당 파일의 이미지와 다운로드 주소를 HTML 태그로 저장
							let img_contents = "<img class='classImg'" 
								+ "src='${ pageContext.servletContext.contextPath }/resources/uploadFiles/chatFile/"
								+ chatFileMap.savedName + "'> <br>"
								+ "<a href='${pageContext.servletContext.contextPath }/member/class/classChat/download?filePath=/uploadFiles/chatFile/"
								+ chatFileMap.savedName + "&fileName=" + chatFileMap.originFileName + "'>이미지 저장</a>";
							
							// 서버로 전송하기 위해 객체에 저장
							let chat = {
						            nickName: '${ sessionScope.jandi.nickName }',
						            email: chatInfo.email,
						            chat_contents: img_contents,
						            chat_code: chatInfo.chat_code,
						            chat_date: getFormatDate(new Date()),
						           	is_file: 'Y'
						        };
								
							console.log(chat);
							
							// 서버에 전송
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
		
		}	//채팅 서버 연결 내용 끝
	
		// 신고 전송
		$('#reportModalBtn').click(function(){
			$('#reportModalForm').submit();
		});	
		
		if('${ requestScope.reportSuccessMessage }' != ''){
			alert('${ requestScope.reportSuccessMessage }');
		}
		
	}); //$(function(){}) 끝
		
</script>
<body>
	<jsp:include page="../../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../../common/mentorsidebar.jsp" />
		<jsp:include page="../class/classRoomNav.jsp" />
		<div class="sidebar-content">
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<c:if test="${ chatRoomList != '[]' }">
			<div class="chatDiv">
				<div class="chatTop">
					<h3 id="nick"></h3>
					<button class="reportBtn" id="reportBtn" data-toggle="modal" data-target="#reportModal">신고</button>
				</div>
				<div class="chatBottom">
					<div class="chatLeft">
						<c:forEach var="chatRoom" items="${ chatRoomList }">
							<input type="hidden" class="chatEmailInput" value="${ chatRoom.EMAIL }">
							<div class="chatRoomBox" >
								<c:out value="${ chatRoom.NICKNAME }"/><i class="comment alternate outline icon"></i>
								<input type="hidden" class="chatCodeInput" value="${ chatRoom.CHAT_CODE }">
							</div>
						</c:forEach>
					</div>
					<div style="width: 100%;">
						<div class="chatRight">
							<br>
						</div>
						<div align="center" style="background: white; border-left: 1px solid green; display:none;" id="typingDiv">
							<i class="comment alternate icon"></i> 상대방이 메시지를 작성중입니다...
						</div>
						<div class="sendMessage" align="center">
							<button class="btn btn-primary" style="float:left; padding:4px;" id="imgBtn" data-toggle="modal" data-target="#sendImgModal">
								<i class="images outline icon"></i>
							</button>
							<textarea class="messageArea" id="msg"></textarea>
							<input class="sendBtn" type="button" id="sendBtn" value="전송" >
						</div>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${ chatRoomList == '[]' }">
			<br><br>
				<h3 align="center"> 아직 클래스를 듣는 인원이 없습니다. </h3>
			</c:if>
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
					<button type="button" class="btn btn-primary" id="sendImgBtn">전송</button>
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
					<form action="${pageContext.servletContext.contextPath }/jandi/class/reportMember" id="reportModalForm" method="post" enctype="multipart/form-data">
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
						<input name="repEmail" id="repEmail" type="hidden">
					</form>
					<br>
				</div>
				<div class="modal-footer">
					<button type="button" id="reportCloseBtn" class="btn btn-default btnBD"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="reportModalBtn">신고하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>