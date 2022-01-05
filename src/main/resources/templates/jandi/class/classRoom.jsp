<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>클래스룸</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<style>
.classImg{
	width: 80%;
	text-align: center;
	border: 1px solid green;
	border-radius: 0.5rem;
}

.content {
	width: 90%;
	border: none !important;
}

.areaStyle {
	border: none;
	width: 100%;
	resize: none;
}

.areaStyle:focus {
	outline: none;
}

</style>

<script>
$(function(){
	// 업로드 성공 여부 리다이렉트 메세지
	if('${ requestScope.uploadMessage }' != ''){
		alert('${ requestScope.uploadMessage }');
		console.log('${ requestScope.uploadMessage }');
	}
	
	// 클래스룸 변경 성고 여부 리다이렉트 메세지
	let message = '${ requestScope.modifyMessage }';
	if( message != "" ){
		alert(message);
	}
	
	/* 태그 분리 해서 페이지에 보여주기 */
	let tags = $('#tag').val().replace(" ","");
	let tagArr = tags.split('#');
	for(let tag of tagArr){
		if(tag !== ""){
			$('.tag').append(
			"<div class='ui button' style='margin:3px;' data-position='top left'>"
			+ tag + "</div>");
		}
	}
	
	// 내용 길이 체크
	$('#tagCheck').html($('#tag').val().length);
	$('#contentsCheck').html($('#classContents').val().length);
	
	$('#modifyClassFormBtn').click(function(){
		if(confirm("강의 소개 페이지를 수정하시겠습니까?")){
			$('#modifyClassForm').submit();
		}
	});
	
});

/* 
 * 글자 길이 체크 메소드 
 * 
 * parameters
 * inputItem : 글자가 담겨져 있는 input태그
 * spanItem  : 글자 길이를 보여줄 span태그
 * maxLength : 길이를 제한할 글자 수
 * 
 * 임예람
 */
function checkLength(inputItem, spanItem, maxLength){
	let $item = $(inputItem);
	spanItem.html($item.val().length);
	
	// 길이 제한을 넘기면 max길이 만큼 다시 자른다.
	if($item.val().length > maxLength){
		alert(maxLength + "자를 초과할 수 없습니다.");
		$item.val($item.val().substr(0, (maxLength-1)));
		$item.focus();
		spanItem.html($item.val().length);
	}
}

/* 페이징 처리 스크립트 */
$(function(){
	if('${ selectCriteria.searchCondition }' != ''){
		$("#searchCondition").val("${ selectCriteria.searchCondition }");
	}
});
// 셀렉트 값이 바뀔 때 마다 정렬
$('#searchCondition').change(function(){
	$('#searchform').submit();
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
			<form action="${ pageContext.servletContext.contextPath }/jandi/class/modifyClass" method="post" id="modifyClassForm">
				<button type="button" class="btn btn-primary" style="float:right" id="modifyClassFormBtn">수정</button>
				<h2>강의 소개</h2>
				<hr>
				<p style="float:right;">( <span id="contentsCheck"></span> / 500자 )</p>
				<br>
				<div id="contents">
					<textarea class="areaStyle" id="classContents" name="contents" rows="10" wrap="hard"
						placeholder="강의 소개를 입력해주세요." onkeyup="checkLength(this, $('#contentsCheck'), 500);">${ classDTO.contents }</textarea>
				</div>
				<br>
				<br>
				<h4>썸네일 <button type="button" style="margin-left:50px; border-radius:1rem;  border: 3px solid #91C788; background: none; padding:5px;"
						data-toggle="modal" data-target="#imageModal">썸네일 변경하기</button>
				</h4>
				<div align="center">
					<img class="classImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/classImage/${ classDTO.filePath }">
				</div>
				<br>
				<br>
				<div class="tag">
				</div>
				<br>
				<p class="tagName">태그 수정   ( <span id="tagCheck"></span> / 150자 ) </p>
				<textarea class="areaStyle" name="tag" id="tag" rows="2" wrap="hard" 
					placeholder="태그를 입력해주세요." onkeyup="checkLength(this, $('#tagCheck'), 150);">${ classDTO.tag }</textarea>
				<hr>
				<h2>강의 목차</h2>
				<c:forEach var="mokcha" items="${ mokchaList }">
					<p class="contents">
						${ mokcha.mokchaName }
					</p>
				</c:forEach>
				<a href="${ pageContext.servletContext.contextPath }/jandi/class/classLecture">더 보기</a>
				<hr>
				<br>
			</form>
			<c:if test="${ empty reviewList }">
				<h3 align="center">아직 작성된 후기가 없습니다.</h3>
			</c:if>
			<c:if test="${ !empty reviewList }">
				<div class="after">
					<h2>후기 ( ${ classStar } / 5 )</h2>
					<p>총 ${ reviewCount }개 </p>
					 <form id="searchform" action="${ pageContext.servletContext.contextPath }/jandi/class/classRoom" method="get" >
					 	<input type="hidden" name="classCode" value=${ classDTO.classCode }>
						<select class="ui dropdown" id="searchCondition" name="searchCondition" style="margin-left:0px; float:right;">
			  				<option value="recently" >최신순</option>
			        		<option value="starDESC">별점 높은순</option>
			        		<option value="starASC">별점 낮은순</option>
		        		</select>
					</form>
				</div>
				
				<c:forEach var="review" items="${ reviewList }">
					<div class="ui card" id="aftercard" style="margin: 5%; margin-top:0px; width: 90%;">
						<div class="content">
							<div class="left aligned header afterheader">
								<c:if test="${ review.star != '0'}">
								<c:forEach begin="1" end="${ review.star }">
							   		<span style="color:#ffcc00;"><i class="star icon"></i></span>
								</c:forEach>  
							    </c:if>
								<span>( ${ review.star } / 5)</span>
							</div>
							<div class="left aligned description">
								<p>${ review.contents }</p>
							</div>
						</div>
						<div class="extra content" id="name-date-content">
							<div class="right aligned author">
								${ review.nickName } ${ review.writeDate }
							</div>
						</div>
					</div>
				</c:forEach>
			
				<jsp:include page="../../common/Paging.jsp" />
				
				</c:if>
		</div>
	</div>
	
	<!-- Modal -->
		<div class="modal fade" id="imageModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">썸네일 변경하기</h4>
					</div>
					<div class="modal-body" align="center">
						<form action="${pageContext.servletContext.contextPath }/jandi/class/uploadClassFile" 
							method="post" enctype="multipart/form-data" id="uploadForm">
							<input type="hidden" value="${ classDTO.classCode }" name="classCode">
							<br>
							<b>파일 업로드</b> 
							<br> 
							<input type="file" id="fileInput" name="file" style="border: none;" accept="image/*">
							<br>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btnBD"
							data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="modifyBtn">변경하기</button>
					</div>
				</div>
			</div>
		</div>
		<script>
			$('#modifyBtn').click(function() {
				if ($('#fileInput').val() != "") {
					$('#uploadForm').submit();
				}else{
					alert("변경할 썸네일을 선택해 주세요.");
				}
			});
		</script>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>