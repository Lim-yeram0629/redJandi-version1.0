<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />

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
			<div class="introduce">
	
				<div class="matching-content">
					<p class="estimate_title">견적서 작성하기</p>
						<form action="${ pageContext.servletContext.contextPath }/matching/estimateSend/${ sessionScope.loginMember.email }" id="writeForm" method="post">
							<table class="estimate_tableW" style="width: 100%">
						
								<tr>
									<th class="table_head" style="padding-left : 60px;">제목</th>
							<!-- <th width="30">절 성장시켜주실 고수분!</th> -->
									<th class="table_content1"><input class="input_title" type="text" name="title"></th>
								</tr>
						
								<tr>
									<th class="table_head">카테고리</th>
									<th class="table_content1">
										<select id="category_cb" name="categoryCode">
											<option value="">선택하세요.</option>
											<c:forEach var="category" items="${categoryList}" >
												<option value="${category.categoryCode}">${category.categoryName}</option>
											</c:forEach>
										</select>
									</th>
								</tr>
						 
									<tr>
										<th class="table_head" style="padding-left : 60px;">내용</th>
										<th class="table_content1" style="padding-bottom:10px;">
											<textarea class="content_area" name="contents"></textarea>
										</th>
									</tr>
	
						</table>
						
					
	
					<div class="write" >
						<input type="text" value="${ sessionScope.loginMember.email }" name="email" style="display:none">
							<button type="button" class="writeBtn"id="matchingbtn">매칭 요청</button>
					</div>
					
					
					
					</form>
				
				</div>
	
			</div>
		</div>
		
		
		
		<script>
		 /* 매칭요청 클릭하면 컨펌창 띄워주기 */
		  $(function(){
		    $('#matchingbtn').click(function(){
				if(confirm("저장하시겠습니까?")){
			     	 $('#writeForm').submit();
				}	     
		    }); 
		  });
		</script>
	</main>
<jsp:include page="../common/footer.jsp" />
</body>
</html>