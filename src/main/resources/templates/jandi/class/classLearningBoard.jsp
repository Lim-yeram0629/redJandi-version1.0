<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<title>학습방</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>

.border-1px-black{
	margin-top:10px;
	margin-bottom: 10px;
}

.learnTable thead {
  background-color: #e3ffec;
   text-align: center;   
  }

.learnTable tbody {
   text-align: center;   
  }
  
  
table{
	text-align: center;
}

</style>
<script>
	// 해당 포스트 번호로 게시물 주소 요청
	function movePost(item){
		let postCode = $(item).prev().val();
		console.log(postCode);
		location.href="${pageContext.servletContext.contextPath}/jandi/class/classLearningPost?postCode=" + postCode; 
	};
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
			<p>
			<table style="width:100%;">
				<tr>
					<th align="center" width="50"><h3>${ sessionScope.classDTO.title } 클래스룸 학습방</h3></th>
				</tr>
			</table>
			<br>
			<hr class="border-1px-black" />
				<a href="${pageContext.servletContext.contextPath}/jandi/class/registLearningPost" style="float: right; margin: 2%; font-weight: 700;">작성하기</a>
				<table class="learnTable ui basic table " style="width:100%;">
				<thead>
					<tr class="trStyle">
						<th width="20">멘토</th>
						<th width="60">제목</th>
						<th width="20">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="learningPost" items="${ requestScope.learningPostList }">
 					<c:set var="writeDate" value="${ learningPost.writeDate }"/>
						<input type="hidden" value="${ learningPost.postCode }">
						<tr onclick="movePost(this)">
							<td>${ learningPost.nickName }</td>
							<td>${ learningPost.title }</td>
							<td>${ fn:substring(writeDate, 0, 10) }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			<br><br>
				<jsp:include page="../../common/Paging.jsp" />
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>