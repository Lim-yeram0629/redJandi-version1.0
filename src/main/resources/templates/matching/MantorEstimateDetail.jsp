<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>Signin Template for Bootstrap</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="${ pageContext.servletContext.contextPath }/resources/css/matching/matching_mantee.css" rel="stylesheet" />
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
		<div class="introduce">

			<div class="matching-content">
				<p class="estimate_title">견적서 현황</p>
				<br>
				<table class="estimate_table_detail" style="width: 100%;">

					<tr>
						<th class="detailJName">No</th>
						<th>${ estimateDetail[0].estimateCode }</th>
					</tr>
					
					<tr>
						<th class="detailJName"> 카테고리</th>
						<th >${ estimateDetail[0].categoryDTO.categoryName }</th>
					</tr> 
					
					<tr>
						<th class="detailJName">작성자</th>
						<th >${ estimateDetail[0].memberDTO.nickName }</th>
					</tr>
					
					<tr>
						<th class="detailJName">진행상태</th>
						<th >${ estimateDetail[0].isMatched }</th>
					</tr>
					<tr>
						<th class="detailJName">작성일</th>
						<th >${ estimateDetail[0].writeDate }</th>
					</tr>
					<tr>
						<th class="detailJName">제목</th>
						<th>${ estimateDetail[0].title }</th>
					</tr>
					<tr >
						<th class="detailJName">내용</th>
						<td style="margin-botton:30px; padding-right: 17px;">
						 <c:out value="${ estimateDetail[0].contents }"/>
						
						</td>
					</tr> 
				</table>
				<br><br>
					
					
					
				<div class="btns">
				<form action="${ pageContext.servletContext.contextPath }/matching/manteeMain/${ sessionScope.loginMember.email }">
					<input type="submit" value="목록으로" class="backBtn">
				</form>
					<a href="${ pageContext.servletContext.contextPath }/matching/chatting?estimateCode=${estimateDetail[0].estimateCode}&email=${ estimateDetail[0].email }&isMatched=${ estimateDetail[0].isMatched }">
					<input type="submit" value="채팅하기" class="chatBtn" id="chatBtn">
					</a>
				</div>
				
				
				

				<!-- <div class="write">
					<button class="writeBtn">멘토 요청보기</button>
				</div> -->
			</div>

		</div>
	</div>
</main>
<jsp:include page="../common/footer.jsp" />
</body>
</html>
