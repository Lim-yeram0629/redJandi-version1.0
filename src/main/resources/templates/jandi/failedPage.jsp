<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<jsp:include page="/WEB-INF/views/common/mentorsidebar.jsp" />

	<div class="sidebar-content">
		<div align="center">
			<img src="${ pageContext.servletContext.contextPath }/resources/images/레드잔디.png">
		</div>
		<h1 align="center">${ requestScope.message }</h1>
	</div>

</body>
<jsp:include page="../common/footer.jsp" />
</html>
