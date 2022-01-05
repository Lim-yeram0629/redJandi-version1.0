<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />

<title>멘토 프로필</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/mentor/mentormain.css" rel="stylesheet"/>
<link href="${ pageContext.servletContext.contextPath }/resources/css/mentor/mentorsidebar.css" rel="stylesheet"/>
<style>
.warningtable tbody {
	text-align: center;
}

.warningtable thead {
	background-color: #E3FFEC;
	text-align: center;
}

.introduce-detail img {
	width: 250px;
	text-align: center;
	border-radius: 70%;
	border : 1px solid #91C788;
}
ul {
	list-style: none;
}

a {
	color: black;
}

.btnBD {
	border-color: #91C788;
}

.btnBD:focus, .btnBD:hover {
	background-color: #91C788;
}

.btn-primary {
	color: #fff;
	background-color: #91C788;
	border-color: #91C788;
}

.btn-primary.active, .btn-primary.focus, .btn-primary:active,
	.btn-primary:focus, .btn-primary:hover, .open>.dropdown-toggle.btn-primary
	{
	color: #fff;
	background-color: #599A4E;
	border-color: #599A4E
}

.btn-primary:hover {
	background-color: #599A4E;
	border-color: #599A4E
}

input{
	border-radius: 0.5rem;
	border-color: #599A4E;
	border: 1px solid #599A4E;
	width: 250px;
}

input:focus{
	border-radius: 0.5rem;
	border-color: #599A4E;
	outline-color: #599A4E;
}

.areaStyle {
	border: none;
	width: 100%;
	resize: none;
}

.areaStyle: focus {
	border: none;
	width: 100%;
	resize: none;
}

.imgBox {
	width: 100%;
	height: 200px;
}

.img {
	width: 100%;
	height: 100%;
}
</style>

<script>
	// 입력받을 문자열 길이 체크
	function checkLength(inputItem, spanItem, maxLength){
		let $item = $(inputItem);
		spanItem.html($item.val().length);
		
		if($item.val().length > maxLength){
			alert(maxLength + "자를 초과할 수 없습니다.");
			$item.val($item.val().substr(0, (maxLength-1)));
			$item.focus();
			spanItem.html($item.val().length);
		}
	}
	
	$(function(){
		
		/* 잔디 페이지 인서트시 데이터 조건 체크 */
		$('#registBtn').click(function(){
			
			let result = true;
			
			if($('#nickName').val() == ""){
				alert("닉네임을 입력해 주세요.");
				$('#nickName').focus();
				result = false;
				return;
			}
			if($('#account').val() == ""){
				alert("정산 받을 계좌를 입력해 주세요. (- 제외)");
				$('#account').focus();

				result = false;
				return;
			}
			if($('#bank').val() == ""){
				alert("은행을 입력해 주세요.");
				$('#bank').focus();

				result = false;
				return;
			}
			if($('#acc_name').val() == ""){
				alert("예금주를 입력해 주세요.");
				$('#acc_name').focus();

				result = false;
				return;
			}
			
			if(result){
				$('#registJandiForm').submit();
			}
		});
			
		
	/* 닉네임 중복 체크 */
     $('#dupBtn').click(function() {
        let nickName = $("#nickName").val();

        if (!nickName) {
          alert("닉네임을 입력해 주세요.");
        } else {
          $.ajax({
            url: "${ pageContext.servletContext.contextPath }/member/jandiNickDupCheck",
            type: "post",
            data: { nickName: nickName },
            success: function (data) {
              if (data == "true") {
              	console.log(data);
               	$("#p_nick").text("중복된 닉네임이 있습니다.");
              	$("#p_nick").css("color", "red");
              } else {
              	$("#p_nick").text("사용 가능한 닉네임 입니다.");
              	$("#p_nick").css("color", "blue");
              	$('#registBtn').prop('disabled', false);
              }
            },
            error: function (error) {
              console.log(error);
            }
          });
        }
      });
		
	});
	
	
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<div class="common-sidebar">
		<div id="sidebar">
		<div class="sidebar-inner-name">
			<h1>잔디 신청</h1>
			<hr class="border-1px-black" />
		</div>
		<div class="sidebar-inner-name1">
			<ul>
				<li><a href="${ pageContext.servletContext.contextPath }/mypage/joinJandi">정보 입력</a></li>
			</ul>
		</div>
		</div>
			<div class="sidebar-content">
				<form id="registJandiForm" action="${ pageContext.servletContext.contextPath }/mypage/registJandi" method="post">
				<div class="introduce" style="padding: 3%" >
					<div class="introduce-detail">
						<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/sprout.png"
							id="profile">
						<br>
						<div style="width: 600px;" align="left">
						<br>
							<h3>닉네임 : <input type="text" id="nickName" name="nickName" style="margin-left:26px;">&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-primary" style="padding:2px; margin-bottom:2px;" id="dupBtn">닉네임 중복확인</button></h3> 
							<p  style="margin-left:100px;"  id="p_nick" style="text-color: green;"><p>
							<h3>정산 계좌 : <input type="number" id="account" name="account" style="margin-left:6px;"> 
							&nbsp;&nbsp;&nbsp;<span id="p_account"> (-)를 제외하고 숫자만 입력해 주세요.</span></h3>
							<h3>은행 : <input type="text" id="bank" name="bank" style="margin-left:46px;"></h3> 
							<h3>예금주 : <input type="text" id="acc_name" name="acc_name" style="margin-left:26px;"></h3> 
						</div>
						<br>
					</div>
				</div>
				<br>
				<div class="introduce" style="padding: 3%">
	
					<h3>멘토 경력</h3>
					<p style="float:right; margin:3px;">(<span id="careerCheck">0</span> / 100자)</p>
					<hr class="border-1px-black" style="margin-top:5px;"/>
					<textarea class="areaStyle" name="career" rows="10" cols="20" wrap="hard"
						style="border: 1px solid black"  placeholder="경력을 작성해 주세요." onkeyup="checkLength(this, $('#careerCheck'), 100);"></textarea>


					<h3>소개</h3>
					<p style="float:right; margin:3px;">(<span id="introCheck">0</span> / 330자)</p>
					<hr class="border-1px-black" style="margin-top:5px;"/>
					<textarea class="areaStyle" name="intro" id="intro" rows="20" cols="20" wrap="hard"
						style="border: 1px solid black" placeholder="소개를 작성해 주세요." onkeyup="checkLength(this, $('#introCheck'), 330);"></textarea>
					
					<div align="right">
						<br>
						<button type="button" id="registBtn" class="btn btn-primary" disabled>신청 하기</button>
					</div>
				</div>
			</form>
		</div> 
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>
