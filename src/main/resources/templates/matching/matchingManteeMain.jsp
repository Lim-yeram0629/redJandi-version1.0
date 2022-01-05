<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

main { width: 90% !important;}
.common-sidebar{ width: 80% !important;}

</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
<main>
	<div class="common-sidebar">
		<jsp:include page="../common/matching_mantee_sidebar.jsp" />
		<div class="introduce" style="width:70%">

			<div class="matching-content">
				<div class="request-list">
					<p class="explain">견적서 현황</p>
					<div id="allrequest">
						<table style="width: 100%; text-align: center;" class="estimateList">
						
							<thead>
								<tr class="table_title">
									<th>No</th>
									<th>제목</th>
									<th>진행상태</th>
								</tr>
							</thead>
							<tbody>
								<tr></tr>
								
							<c:forEach var="estimate" items="${ estimateList }">
								<tr class="table_title2">
									<th width="10">${ estimate.rnum }</th>
									<th width="60"><a href="${ pageContext.servletContext.contextPath }/matching/detailEstimate?estimateCode=${estimate.estimateCode}">${ estimate.title }</a></th>
									<th width="30">${ estimate.isMatched }</th> 
								
								</tr>
								</c:forEach>
								<!-- <tr>
									<th width="10">2</th>
									<th width="60">재미있게 강습하고 싶어요~</th>
									<th width="30">N</th>
								</tr> -->
								
							</tbody>
						</table>
					</div>
					<br>
							<div class="write">
								<a href="${ pageContext.servletContext.contextPath }/matching/manteeWrite">
								<button class="writeBtn">견적서 작성</button>
								</a>
							</div>
			 <jsp:include page="../common/Paging.jsp" />
						</div>
					</div>
				</div>
			</div>
</main>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
