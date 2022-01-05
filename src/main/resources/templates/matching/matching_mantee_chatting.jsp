<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Signin Template for Bootstrap</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.warningtable tbody {
	text-align: center;
}

.warningtable thead {
	background-color: #E3FFEC;
	text-align: center;
}

.introduce-detail img {
	width: 60%;
	height: 60%;
	text-align: center;
}


</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />

	<div class="common-sidebar">
		<jsp:include page="../common/matching_mantee_sidebar.jsp" />
		<div class="introduce">
				<br>
				<div class="name">
					<p>잔디1</p>				
				</div>
				<br><br>
				
			<div class="chatting-content">
				
				<div class="chatting-content2">
				<div class="one_chat_rec">
					<div class="rec_name">
						<p>잔디1</p>
					</div>
						
					<div class="chat_rec">
						<p style="line-height: 40px;" class="mss">잔디 되고 싶죠?</p>
					</div>
					
					<div class="rec_date">
					<p>2021-11-18 02:15</p>
					</div>
					
				</div> <!-- one_chat_rec -->
				
				<br><br><br>    <!-- 채팅 사이에 있는 빈 공백 -->
				
				<div class="one_chat_send">
						
					<div class="send_mss">
						<p style="line-height: 40px;" class="mss">네!!!!!!!!</p>
					</div>
					<div class="send_date">
					<p>2021-11-18 03:15</p>
					</div>
					
				</div> <!-- one_chat_send -->
				</div>
				
				
				
				<br><br>
				<div class="send_bg">
						<input class="chat_bg" type="text">
					
					<div class="send_btn_div">
						<button class="send_btn">전송</button>
					</div>
				</div>
				
			</div> <!-- chatting-content -->
			
			<div class="back">
					<button class="backBtn">목록으로</button>
			</div>
			
		</div>
	</div>
<jsp:include page="../common/footer.jsp" />s
</body>
</html>
