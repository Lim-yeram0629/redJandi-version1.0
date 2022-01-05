<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Signin Template for Bootstrap</title>

<link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/mentor/mentormain.css" rel="stylesheet"/>
<link href="${ pageContext.servletContext.contextPath }/resources/css/mentor/mentorsidebar.css" rel="stylesheet"/>

<style>
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
	border-color: #91C788
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

 a:hover { color: #91C788 !important; }
 
 .titleInput{
 	border: 0.5px solid black;
 }
</style>

</head>
<body>
	<div id="sidebar">
		<div class="sidebar-inner-name">
			<h1>${ sessionScope.jandi.nickName } 님</h1>
			<hr class="border-1px-black" />
		</div>
		<div class="sidebar-inner-name1">
			<ul>
				<li><a href="${ pageContext.servletContext.contextPath }/jandi/jandiProfile">내 정보</a></li>
			</ul>
			<ul>
				<h3>내 클래스</h3>
				<c:forEach var="classes" items="${ sessionScope.classList }" >
					<li><a href="${ pageContext.servletContext.contextPath }/jandi/class/classRoom?classCode=${classes.CLASS_CODE}">
						<c:out value="${ classes.TITLE }" /></a>
					</li>
				</c:forEach>
 				<li><button type="button" style="border:none; background: none; padding:1px;"
						data-toggle="modal" data-target="#addClassModal">클래스 생성하기</button></li>
			</ul>
			<ul>
				<h3>정산 관리</h3>
				<li><a href="${ pageContext.servletContext.contextPath }/jandi/jandiCalc">정산 내역</a></li>
			</ul>
			<ul>
				<h3>광고 관리</h3>
				<li><a href="${ pageContext.servletContext.contextPath }/jandi/createAd">클래스 광고 신청</a></li>
				<li><a href="${ pageContext.servletContext.contextPath }/jandi/myAd">광고 현황</a></li>
			</ul>
<!-- 		<ul><button type="button" class="btn" style="color: white !important; background-color: #91C788;"
				data-toggle="modal" data-target="#addClassModal">클래스 생성하기</button>	</ul> -->
		</div>

		<!-- Modal -->
		<div class="modal fade" id="addClassModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">클래스 추가하기</h4>
					</div>
					<form action="${ pageContext.servletContext.contextPath }/jandi/class/createClass" method="post" id="modalForm">
						<div class="modal-body" align="center">
							카테고리 <select name="categoryCode">
								<c:forEach var="category" items="${ categoryList }">
									<option value="${ category.CATEGORY_CODE }">${ category.CATEGORY_NAME }</option>
								</c:forEach>
							</select> <br>
							<br> 클래스 제목 <input type="text" name="title" id="classTitle" class="titleInput"><br>
							<br> 클래스 정원 <input type="number" name="maxCount" id="maxCount"> 명 <br>
							<br> 클래스 가격 <input type="number" name="price" id="price"> 원
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default btnBD"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" id="okBtn">클래스
								생성</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script>
			$('#okBtn').click(function() {
				if (confirm("한번 설정된 클래스의 설정은 변경할 수 없습니다. 생성하시겠습니까?")) {
					let result = true;
					if($('#classTitle').val().length >= 300){
						alert("제목은 300byte를 초과할 수 없습니다.");
						$('#title').focus();
						$('#title').val().substr(0, 300);
					}
					if($('#okBtn'))
					$('#modalForm').submit();
				}
			});
		</script>
	</div>
</body>

</html>
