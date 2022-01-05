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
.content {
	width: 90%;
	border: none !important;
}

.classImg{
	width: 80%;
	text-align: center;
	border: 1px solid green;
	border-radius: 0.5rem;
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
<body>
	<jsp:include page="../../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../../common/mypagesidebar.jsp" />
		<div class="sidebar-content">
			<jsp:include page="./classRoomNav.jsp" />
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div>
				<h2>강의 소개 ${ requestScope.errMessageMap.errMessage }</h2>
				<hr>
				<br>
				<div id="contents">
					<textarea class="areaStyle" id="contents" name="contents" rows="10" wrap="hard"
						placeholder="아직 강의 소개가 없습니다." readonly>${ classDTO.contents }</textarea>
				</div>
				<div align="center">
					<img class="classImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/classImage/${ classDTO.filePath }">
				</div>
				<br>
				<br>
				<div class="tag">
				</div>
				<br>
				<input class="areaStyle" name="tag" id="tag" type="hidden" value="${ classDTO.tag }">
				<script>
					$(function(){
						let tags = $('#tag').val().replace(" ","");
						let tagArr = tags.split('#');
						for(let tag of tagArr){
							if(tag !== ""){
								$('.tag').append(
								"<div class='ui button' style='margin:3px;' data-position='top left'>"
								+ tag + "</div>");
							}
						}
					});
				</script>
				<hr>
				<h2>강의 목차</h2>
				<br>
				<c:forEach var="mokcha" items="${ mokchaList }">
					<p class="contents">
						${ mokcha.mokchaName }
					</p>
				</c:forEach>
				<a href="${ pageContext.servletContext.contextPath }/mypage/class/classLecture">..더 보기</a>
				
				<c:if test="${ empty reviewList }">
					<h3 align="center">아직 작성된 후기가 없습니다.</h3>
				</c:if>
			<c:if test="${ !empty reviewList }">
				<div class="after">
					<h2>후기 ( ${ classStar } / 5 )</h2>
					<p>총 ${ reviewCount }개 </p>
					 <form id="searchform" action="${ pageContext.servletContext.contextPath }/mypage/class/classRoom" method="get" >
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
								<c:forEach begin="1" end="${ review.star }">
									<i class="star icon"></i>
								</c:forEach>
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
				<script>
					$(function(){
						if('${ selectCriteria.searchCondition }' != ''){
							$("#searchCondition").val("${ selectCriteria.searchCondition }");
						}
					});
					
					$('#searchCondition').change(function(){
						$('#searchform').submit();
					});
				</script>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>