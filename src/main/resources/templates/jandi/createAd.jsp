<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<title>클래스 광고 신청</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
a{
	color:black;
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
.border-1px-black{
	margin-top:10px;
	margin-bottom: 10px;
}

table{
	text-align: center;
}

</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<div class="common-sidebar">
		<jsp:include page="/WEB-INF/views/common/mentorsidebar.jsp" />
		<div class="sidebar-content">
			<form id="createAdForm" action="createAd" method="post" enctype="multipart/form-data">
				<h3>클래스 광고 신청</h3>
				<hr class="border-1px-black" />
				<h4 style="padding-left: 30px;">클래스 선택 : &nbsp;
				<select name="myClass" form="createAdForm" id="classesSelect">
					<c:forEach var="classes" items="${ requestScope.classesSelect }">
						<option>${ classes }</option>
					</c:forEach>
				</select>
				</h4>
				<script>
					let classArray = ${ requestScope.classes };
				
					for(let i in classArray){
						$('#classSelect').options[i].text=classArray[i];
						$('#classSelect').options[i].value=classArray[i];
					}
				</script>
				
				
				<br>

				<textArea name="adContents" cols="5" rows="5" placeholder="광고 문구를 입력해주세요."
				style="resize:none; margin-left: 30px; border:1px solid black; width:90%;"></textArea>
				<h4>등록할 이미지 파일을 선택해 주세요.</h4>
				<hr style="margin-top:10px; margin-bottom: 10px;">
				<input type="file" name="adPoster" style="margin-left: 30px;">
				<div style="margin: 20px;">
					광고 사진은 홈페이지 전면에 게재되기 때문에 좌우로 긴 사진을 사용하는 것이 좋습니다. 
					비율이 맞지 않는 경우 사진이 부득이하게 편집될 수 있습니다.
				</div>
				
				<br><br>
				<h4>광고 안내</h4>
				<hr style="margin-top:10px; margin-bottom: 10px;">
				<div style="margin: 20px;">
					해당 광고를 등록하면 일주일 동안 메인화면에 신청한 광고 이미지와 문구가 노출됩니다.<br>
					허위 혹은 과장 광고시 정책에 따라 법적인 조치를 취할 수 있습니다.<br>
					<br>
					클래스는 중복해서 광고를 올릴 수 없으며, 멘토당 하나의 클래스만 광고가 가능합니다.<br>
					<br>
					결제 완료한 그 다음날 부터 일주일 동안 광고가 노출됩니다.
					<br><br>
					<b>상기 내용에 대하여 충분히 인지하였습니다. <input type="checkbox" value="Y" id="checking"></b>
				</div>
				<br>
				<input class="btnStyle" type="submit" value="광고 신청하기" id="submitted">
			</form>
		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
