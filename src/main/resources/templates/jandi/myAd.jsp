<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>나의 광고</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
a {
	color: black;
}

p {
	font-weight: bold;
	font-size: 20px;
}

.btnStyle {
	padding: 5px;
	background-color: #91c788;
	border-radius: 0.5rem;
	font-size: 12px;
	border-color: #91c788;
	float: right;
}

.border-1px-black {
	margin-top: 10px;
	margin-bottom: 10px;
}

table {
	text-align: center;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<div class="common-sidebar">
		<jsp:include page="/WEB-INF/views/common/mentorsidebar.jsp" />
		<div class="sidebar-content">
			<c:set var="days" value="${ requestScope.calDateDays }"/>
			<c:set var="resultValue" value="${requestScope.resultValue }"/>
			
			<c:choose>
				<c:when test="${ resultValue=='Y' }">
					
					<c:choose>
						<c:when test="${ days eq 0 }">
							<h3 style="color: #147900;" align="right">오늘 광고 종료!!</h3>
						</c:when>
						<c:otherwise>
							<h3 style="color: #147900;" align="right">광고 종료 D - ${ requestScope.calDateDays }</h3>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:when test="${ resultValue=='W' }">
					<h3 style="color: #147900;" align="right">내일부터 광고 예정입니다!</h3>
				</c:when>
				<c:otherwise>
					<button type="button" style="float:right" onclick="location.href='${ pageContext.servletContext.contextPath }/jandi/jandiBuy?adCode=${ adCode }'">결제하기</button>
				</c:otherwise> 
			</c:choose>
			
			
		

			<h3>광고 중</h3>
			<hr class="border-1px-black" />
			<h4 style="padding-left: 30px;">광고 중인 클래스 : &nbsp; ${ requestScope.className }</h4>
<!-- 			<div style="margin: 20px; width: 90%;">
				이 클래스는 OH! 잔디만의 특급 공부 비법을 담은<br>
				JAVA 강의 클래스입니다.<br>
				여태 들었던 JAVA는 지워버리세요!<br>
			</div> -->
			<textArea name="adContents" cols="5" rows="5" placeholder="광고 문구를 입력해주세요."
				style="resize:none; margin-left: 30px; border:1px solid black; width:90%;" readonly>
				${ requestScope.adContents }
			</textArea>
			<h4>등록한 이미지: ${requestScope.originImagePath}</h4>
			<hr style="margin-top: 10px; margin-bottom: 10px;">
			<div style="margin: 20px; width: 90%;" align="center">
				<img style="width: 80%;"
					src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/${requestScope.imagePath}">
			</div>
			<br>
			<br>
			<h4>광고 안내</h4>
			<hr style="margin-top: 10px; margin-bottom: 10px;">
			<div style="margin: 20px;">
				해당 광고를 등록하면 일주일 동안 메인화면에 신청한 광고 이미지와 문구가 노출됩니다.<br> 허위 혹은 과장
				광고시 정책에 따라 법적인 조치를 취할 수 있습니다.<br> <br> 클래스는 중복해서 광고를 올릴 수
				없으며, 멘토당 하나의 클래스만 광고가 가능합니다.<br> <br> 결제 완료한 그 다음날 부터 일주일
				동안 광고가 노출됩니다. <br>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
