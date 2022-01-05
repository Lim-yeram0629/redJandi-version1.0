<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>클래스룸</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/mentor/mentormain.css" rel="stylesheet"/>
<link href="${ pageContext.servletContext.contextPath }/resources/css/mentor/mentorsidebar.css" rel="stylesheet"/>

<style>

.title {
	width: 100%;
	font-size: 30px;
	text-align: center;
	color:#448817;
}

.room {
	font-size: 20px;
	background: none;
	border: none;
	font-weight: 2px;
	color:black;
}
table{
	text-align: center;
}

table th{
	text-align: center;
}

.modalContents{
	resize: none;
	border-radius: 0.5rem;
	border: 1.5px solid green;
	height: 100px;
	padding:2%;
	
}
.btn-primary {
	padding: 8px;
	color: #fff;
	background-color: #91C788;
	border-color: #91C788;
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
</style>

<script>
$(function(){
	
	//----------------신고 전송
	$('#reportClassBtn').click(function(){
		if('${ sessionScope.loginMember.email }' != ''){
			let repContents = $('#repContents').val();
			let repTypeCode =  $('#repTypeCode').val();
				$.ajax({
					url: "${pageContext.servletContext.contextPath }/member/class/reportClass",
					type: "post",
					data:  { 
						repContents: repContents,
						repTypeCode: repTypeCode
						},
					success: function(data){
						alert(data);
					},
					error: function(error){
						cnosole.log(error);
					}
				});
				$('#repContents').val("");
				$('#reportClassCloseBtn').click();
		}else{
			alert("로그인이 필요한 서비스입니다.");
		}
	});	
	
	//-----------찜
	let status = "N";
	<c:forEach var="jjimMember" items="${ sessionScope.jjimClassMemberList }">
		<c:if test="${ jjimMember.EMAIL == loginMember.email }" >
			status = "Y";
		</c:if>
	</c:forEach>
	
	if(status == "Y"){
		$('#jjimBtn').html("<span style='color:red;'><i class='heart icon'></i></span>해제");
	}else{
		$('#jjimBtn').html("<span style='color:red;'><i class='heart outline icon'></i></span>찜");
	}
	
	$('#jjimBtn').click(function(){
		if('${ sessionScope.loginMember.email }' != ''){
			console.log(status);
				$.ajax({
					url: "${pageContext.servletContext.contextPath }/member/class/jjimClass",
					type: "get",
					data:  { status : status},
					success: function(data){
						status = data;
						if(status == "Y"){
							$('#jjimBtn').html("<span style='color:red;'><i class='heart icon'></i></span>해제");
						}else{
							$('#jjimBtn').html("<span style='color:red;'><i class='heart outline icon'></i></span>찜");
						}
					},
					error: function(error){
						cnosole.log(error);
					}
				});
		}else{
			alert("로그인이 필요한 서비스입니다.");
		}
	});
	
});
</script>

</head>
<body>
	<div>
		<button type="button" style="float:left; color:black; background:none; border:none;" 
				data-toggle="modal" data-target="#reportClassModal">
			<span style="color:red;"><i class="bullhorn icon"></i></span>클래스 신고</button>
		<button id="jjimBtn" style="float:right; color:black; background:none; border:none;"></button>
	</div>
	<br>
	<div align="center">
		<p class="title" style="width: 70%;"><b>${ sessionScope.classDTO.title } 클래스룸</b></p>
	</div>
	<br>
	<!-- 탭 메뉴 상단 시작 -->
	<table style="width: 100%">
		<tr>
			<th width="25"><a href="${ pageContext.servletContext.contextPath }/mypage/class/classRoom?classCode=${ classCode }" class="room class">클래스</a></th>
			<th width="25"><a href="${ pageContext.servletContext.contextPath }/mypage/class/classLecture" class="room lecture">강의 영상</a></th>
			<th width="25"><a href="${ pageContext.servletContext.contextPath }/mypage/class/classLearningBoard" class="room learning">학습방</a></th>
			<th width="25"><a href="${ pageContext.servletContext.contextPath }/mypage/class/mypageClassChat" class="room classChat">채팅</a></th>
		</tr>
	</table>
	<br>
	<br>
	
	<!-- Modal -->
	<div class="modal fade" id="reportClassModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">클래스 신고</h4>
				</div>
				<div class="modal-body" align="center">
					<br>	
						<b>신고 카테고리(필수): <select id="repTypeCode" name="repTypeCode">
						<c:forEach var="reportState" items="${ reportStateList }">
							<option value="${ reportState.REP_TYPE_CODE }">${ reportState.REP_TYPE }</option>
						</c:forEach>
						</select>
						</b>
						<br><br>
						<b>신고 사유(필수)</b><br>
						<textarea class="modalContents" id="repContents" style="width:300px;"></textarea>
						<br><br>
						타당한 사유 및 근거 없는 신고는 해당 신고가 반려될 수 있습니다.
					<br>
				</div>
				<div class="modal-footer">
					<button type="button" id="reportClassCloseBtn" class="btn btn-default btnBD"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn-primary modalBtn" id="reportClassBtn">신고하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>