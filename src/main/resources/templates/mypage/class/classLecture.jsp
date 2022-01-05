<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<!DOCTYPE html>
<html>
<head>

<title>강의 영상</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
.btnStyle {
	padding: 5px;
	background-color: #91c788;
	border-radius: 0.5rem;
	font-size: 12px;
	border-color: #91c788;
	float: right;
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

.mokcha {
	width: 100%;
}

.mokcha input {
	border: none;
	width: 80%;
	margin: 10px;
}

.mokcha video {
	width: 90%;
	margin: 10px;
}

.newMokcha {
	width: 100%;
	padding-left: 10%;
}

.newMokcha input {
	width: 80%;
	margin: 10px;
}

.newMokcha textarea {
	width: 80%;
	margin: 10px;
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

<script>

function mokchaToggle(item) {
	if($(item).next().css('display') == 'none'){
		$(item).next().css('display', 'block');
		$(item).html($(item).html().replace("▼", "▲"));
	}else{
		$(item).next().css('display','none');
		$(item).html($(item).html().replace("▲", "▼"));
	}
}
</script>

<body>
	<jsp:include page="../../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../../common/mypagesidebar.jsp" />
		<div class="sidebar-content">
			<jsp:include page="../class/classRoomNav.jsp" />
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div>
				<c:if test="${ requestScope.totalCount == 0}">
					<hr>
					<h3 align="center">아직 작성된 목차가 없습니다.</h3>
				</c:if>
				<c:if test="${ requestScope.totalCount != 0}">
					<h2>${ requestScope.totalCount }개의 목차</h2>
					<hr>
					<c:forEach var="mokcha" items="${ requestScope.mokchaList }">
						<div class="mokcha">
							<c:set var="writeDate" value="${ mokcha.writeDate }"/>
							<span class="write" style="float: right; position: relative; top: 5px;">${ fn:substring(writeDate, 2, 10) }</span>
							<h3 onclick="mokchaToggle(this);">${ mokcha.mokchaName } <span style="color:#91C788">▼</span></h3>
							<div class="mokchaDiv" style="display:none;">
							<textarea class="contents" name="contents" style="width:80%; border:none;" readonly>${ mokcha.contents }</textarea>
							
							<c:forEach var="mokchaFile" items="${ mokchaFileList }">
								<c:if test="${ mokcha.mokchaCode eq mokchaFile.mokchaCode }">
									<video class="mokcha" controls
										src="${ pageContext.servletContext.contextPath }/resources/${ mokchaFile.filePath }"></video>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<br>
					<hr style="background-color: lightgray; border: 0; height: 1px;">
					</c:forEach>
					<br><br>
						<jsp:include page="../../common/Paging.jsp" />
					<br>
				</c:if>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>