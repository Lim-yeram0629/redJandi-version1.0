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

*:focus {
    outline: 0;
}

.btnStyle {
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

.write {
	text-align: right;
    position: relative;
    right: 7%;
    bottom: 32px;
}

.btn-mokcha {
	border-radius: 20px;
	position: relative;
    left: 73%;
    background-color: white;
    border: 2px solid #91c788;
    top: 20px;
}

</style>
<script>

	// 강의 영상 올리기 전 빈 값 체크 
	function checkValue(item){
		if($(item).prev().val() != ""){
			$(item).parent().parent().submit();
			alert("업로드를 시작합니다.");
		}else{
			alert("파일을 선택해 주세요.");
		}
	}
	
	// 목차 토글
	function mokchaToggle(item) {
		if($(item).next().css('display') == 'none'){
			$(item).next().css('display', 'block');
			$(item).html($(item).html().replace("▼", "▲"));
		}else{
			$(item).next().css('display','none');
			$(item).html($(item).html().replace("▲", "▼"));
		}
	}
	
	// 목차 삭제
	function deleteMokcha(item){
		console.log($(item).next());
		if(confirm("해당 목차를 삭제하시면 안의 내용까지 전부 삭제됩니댜. 삭제하시겠습니까?")){
			$(item).parent().submit();
		}
	}
	
	// 글자 길이 체크
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
	
	// 업로드 성공 여부 리다이렉트 메세지
	$(function(){
		if('${ requestScope.uploadMessage }' != ''){
			alert('${ requestScope.uploadMessage }');
			console.log('${ requestScope.uploadMessage }');
		}
	});
	
</script>
<body>
	<jsp:include page="../../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../../common/mentorsidebar.jsp" />
		<jsp:include page="../class/classRoomNav.jsp" />
		<div class="sidebar-content">
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div>
			<br>
				<h2 style="float: left;">${ requestScope.totalCount }개의 목차</h2>
				<button class="btn-mokcha btn btn-primary" data-toggle="modal" data-target="#addMokchaModal">목차 추가하기</button>
				<br><br>
				<hr style="background-color:black; border: 0; height: 1px;">
				<br>
				<c:forEach var="mokcha" items="${ requestScope.mokchaList }">
					<div class="mokcha">
						<form action="${pageContext.servletContext.contextPath }/jandi/class/deleteMokcha" method="post">
							<button type="button" class="btnStyle btn btn-primary" onclick="deleteMokcha(this);">삭제</button>
							<input type="hidden" name="mokchaCode" value="${ mokcha.mokchaCode }">
						</form>
						<c:set var="writeDate" value="${ mokcha.writeDate }"/>
						<span class="write" style="float: right; position: relative; top: 5px;">${ fn:substring(writeDate, 2, 10) }</span>
						<h3 onclick="mokchaToggle(this);">${ mokcha.mokchaName } <span style="color:#91C788">▼</span> </h3>
						<div class="mokchaDiv" style="display:none;">
							<textarea class="contents" name="contents" style="width:80%; border:none;" readonly>${ mokcha.contents }</textarea>
							
							<c:forEach var="mokchaFile" items="${ mokchaFileList }">
								<c:if test="${ mokcha.mokchaCode eq mokchaFile.mokchaCode }">
									<video class="mokcha" controls
										src="${ pageContext.servletContext.contextPath }/resources/${ mokchaFile.filePath }"></video>
								</c:if>
							</c:forEach>
							
							<form action="${pageContext.servletContext.contextPath }/jandi/class/uploadMokchaFile" method="post" enctype="multipart/form-data">
								<div>
									<input type="hidden" name="mokchaCode" value="${ mokcha.mokchaCode }">
									<br><b>영상 업로드</b> <br> <input type="file" name="file" style="border: none;" accept="video/*">
									<button type="button" class="btnStyle sendBtn btn btn-primary" onclick="checkValue(this);">영상 추가하기</button>
								</div>
							</form>
						</div>
					</div>
					<br>
					<hr style="background-color: lightgray; border: 0; height: 1px;">
				</c:forEach>
				<br><br>
					<jsp:include page="../../common/Paging.jsp" />
				<br>
				<!-- <button class="btn-mokcha" data-toggle="modal" data-target="#addMokchaModal">추가</button> -->
				<div class="modal fade" id="addMokchaModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel" style="text-align: center;">클래스 목차 추가하기</h4>
							</div>
							<form action="${ pageContext.servletContext.contextPath }/jandi/class/registLecture" method="post">
								<div class="modal-body" align="left">
									목차 제목 ( <span id="titleCheck">0</span> / 30자 )<br> 
								<input type="text" class="inputSyle" name="mockchaName" 
									placeholder="목차 제목을 입력하세요." onkeyup="checkLength(this, $('#titleCheck'), 30);" style="width: 550px;"> 
									<br>
								<br> 목차 내용( <span id="contentsCheck">0</span> / 500자 )<br>
								<textarea name="contents" class="contents" placeholder="목차 내용을 입력하세요." onkeyup="checkLength(this, $('#contentsCheck'), 500);" style="width: 550px;" ></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default btnBD"
										data-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-primary" style="margin: 10px;">추가</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>