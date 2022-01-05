<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>학습방 게시물</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
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

.areaStyle {
	border: none;
	width: 90%;
	resize: none;
	margin-left:2%;
	border-radius : 10px;
	padding : 1%;
}

.areaStyle:focus {
	outline: none;
}

.inputStyle{
	border: none;
	width: 80%;
	text-align: center;
	border-radius : 10px;
}

.inputStyle:focus {
	outline: none;
}
</style>
<script>
	$(function(){
		console.log('${ sessionScope.loginMember.email }');
		console.log('${ sessionScope.classDTO.email }');
		if('${ requestScope.uploadMessage }' != ''){
			alert('${ requestScope.uploadMessage }');
			console.log('${ requestScope.uploadMessage }');
		}
	});
	
	function checkValue(item){
		if($(item).prev().val() != ""){
			$("#fileForm").submit();
			alert("업로드를 시작합니다.");
		}else{
			alert("파일을 선택해 주세요.");
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
				<div>
					<p style="font-size: x-large; font-weight: 700;" align="center">
						<input class="inputStyle" type="text" name="title" value="${ learnigPost.title }" readonly></p>
					<p align="right">작성일: ${ learnigPost.writeDate }</p>
					<p align="right">최종 수정일: ${ learnigPost.reDate }</p>
				</div>
				<hr>
				<br>
				<div id="contents">
					<textarea class="areaStyle" id="contents" name="contents" rows="10" wrap="hard"
						placeholder="아직 작성된 내용이 없습니다." readonly>${ learnigPost.contents }</textarea>
				</div>
				<input type="hidden" name="postCode" value="${ learnigPost.postCode }">
              <br><br>
              <h3>첨부파일</h3>
              <div style="max-height:200px; overflow-y: auto;">
              <c:forEach var="file" items="${ learnigFileList }">
					<c:if test="${ file.email == learnigPost.email }">
						<b style="float:right;">${ file.writeDate }</b>
						<a style="float:left;"href="${pageContext.servletContext.contextPath }/member/class/learningPost/download?filePath=${ file.filePath }&fileName=${file.orgFilePath}">${ file.orgFilePath }</a>
						<br>
					</c:if>
			  </c:forEach>
			  </div>
              <br>
              <h3>제출</h3>
              <c:if test="${ sessionScope.loginMember.email != learnigPost.email }">
					<form action="${pageContext.servletContext.contextPath }/mypage/class/uploadLearningFile" method="post" id="fileForm" enctype="multipart/form-data">
						<div align="center" >
							<div class="step" style="border: 3px solid #91C788; height:50px;">
							<!-- <div class="title" style="font-size: large;">파일 업로드</div> -->
								<div class="description" style="padding-left:10%; padding-right:10%; padding-top: 10px;">
									<input type="hidden" value="${ learnigPost.postCode }" name="postCode">
									<input type="file" name="file" style="border: none; float:left;">
									<button style="float:right;" type="button" class="btnStyle formBtn" onclick="checkValue(this);">파일 추가하기</button>
								</div>
							</div>
						</div>
					</form>
				</c:if>
              <hr>
              <div style="max-height:500px; overflow-y: auto;" align="center">
	              <c:forEach var="file" items="${ learnigFileList }">
	             		<c:if test="${ file.email != learnigPost.email }">
							<div class="ui steps" >
								<div class="step" style="border: 3px solid #91C788; ">
									<div class="title">${ file.nickName }</div>
									<div class="description">
										<b style="float:right;">${ file.writeDate }</b>
										<a style="float:left;"href="${pageContext.servletContext.contextPath }/member/class/learningPost/download?filePath=${ file.filePath }&fileName=${file.orgFilePath}">${ file.orgFilePath }</a>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
					</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>