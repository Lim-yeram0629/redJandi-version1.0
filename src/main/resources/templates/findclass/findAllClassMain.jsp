<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />

    <title>전체 클래스 조회</title>
    
    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet"/>
   	<link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/findclass/findclassmain.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  </head>
 <style>
  
.tagBtn.color-1 {
    background-image: linear-gradient( to right, #3dbe86, #3cba92, #30dd8a, #2bb673 );
}

.tagBtn {
   width: 10%;
    font-size: 12px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    margin: 10px;
    height: 30px;
    text-align: center;
    border: none;
    background-size: 300% 50%;
    border-radius: 50px;

}
.dropsearch {margin-left: 14%; width: 90%;}
  </style>
  
  <body>

	<jsp:include page="../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../common/findclasssidebar.jsp" />
		<div class="container" style="width: 75%; margin-top: 150px">

			<!-- Page Heading -->
			<h1 class="my-4">
				전체 클래스 | <small style="color:#117800;">
					<c:if test="${ not empty categoryName }">
						${ categoryName } 
					</c:if>
				</small>
			</h1>
			<br>
			<div class="row">
				<div class="row" style="margin-bottom:10px;">
					<div class="dropsearch">
					<form id="searchform" action="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain" method="get" >
						<input type="hidden" name="categoryCode" value="${ categoryCode }">
						<select class="ui dropdown" id="searchCondition" name="searchCondition" style="margin-left:120px; float:left; border-radius: 1.5rem;">
							<option value="1">최신순</option>
							<option value="2" >인기순</option>
			        		<option value="3">별점 높은순</option>
			        		<option value="4">별점 낮은순</option>
						</select>
			        	<div class="main-searchbox" style="width:350px;">
					        <input type="search" id="searchValue" name="searchValue" placeholder="찾으시는 강의가 있으신가요?" value="<c:out value="${
								selectCriteria.searchValue }" />">
				          	<button type="submit">
				           		<img src="${ pageContext.servletContext.contextPath }/resources/images/research.png"/>
				         	</button>
						</div>
					</form>
			        	</div>
					  <br><br><br><br><br>
				</div>

				<c:forEach var="findClassList" items="${ findClassList }">
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="card" style="border: 1px solid green;">
						<img class="card-img-top" style=" height: 200px;"
							src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/classImage/${ findClassList.filePath}"
							alt="Card image cap">
						<div class="card-body little-profile text-center">
							<div class="pro-img">
								<img
									src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/${ findClassList.profilePath }"
									alt="user">
							</div>
							<h5 class="m-b-0"></h5>
							<p>${ findClassList.title}</p>
							<a href="javascript:void(0)"
								class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded"
								style="margin-bottom: 16px; background-color: #91c788; border: 1px solid green;" data-abc="true"
								onclick="location.href='${ pageContext.servletContext.contextPath}/findclass/class/viewsUp?classCode=${ findClassList.classCode }'">자세히보기</a>
							<div class="row text-center m-t-20">
								<div class="col-lg-1 col-md-4 m-t-20">
									<h3 class="m-b-0 font-light"></h3>
									<small> </small>
								</div>
								<div class="col-lg-10 col-md-4 m-t-20">
									<h3 class="m-b-0 font-light">₩ ${ findClassList.price } <br>${ findClassList.nickName }</h3>
									<small> 
										<c:if test="${ findClassList.avgStar == '0'}">
											<span style="color:lightgray;"><i class="star icon"></i></span>
										</c:if>
										<c:if test="${ findClassList.avgStar != '0'}">
										<c:forEach begin="1" end="${ findClassList.avgStar }">
									    	<span style="color:#ffcc00;"><i class="star icon"></i></span>
										</c:forEach>  
									    </c:if>
										(${ findClassList.rvCount })
										/ ${ findClassList.categoryName }
									</small>
								</div>
								<div class="col-lg-1 col-md-4 m-t-20">
									<h3 class="m-b-0 font-light"></h3>
									<small> </small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>

			<script>
				$(function(){

					/* 셀렉트박스 선택 시 페이지 리로드 */
					$("#searchCondition").on("change", function(){
						$("#searchform").submit();
					});

					/* 페이지 리로드 시 셀렉트 박스 값 유지하기 */
					$("#searchCondition").val("${ selectCriteria.searchCondition }");

					/* 페이지 리로드 시 검색값 유지하기 */
					$("#searchValue").val("${ selectCriteria.searchValue }");
				

					/* 마우스 커서 이벤트 */
					$(".btn-rounded").hover(
					function () {
						$(this).css("color", "black").css("cursor", "pointer");
					},
					function () {
						$(this).css("color", "white").css("cursor", "default");
					}
					);

					/* 페이지 로드 시 리스트가 없다면 알러창 띄워주기 */
					let findClassList = "${ empty findClassList }";

					if(findClassList == "true") {
						alert("아직 생성된 클래스가 없는 카테고리입니다.");
						history.back();
					}
				});
			</script>

			<br>
			<jsp:include page="../common/Paging.jsp" />
		</div>
		</div>
	</div>
	
</body>
  <jsp:include page="../common/footer.jsp" />
</html>
