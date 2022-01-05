<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>멘토 프로필</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/mentor/mentormain.css" rel="stylesheet"/>
<link href="${ pageContext.servletContext.contextPath }/resources/css/mentor/mentorsidebar.css" rel="stylesheet"/>

<style>
.warningtable tbody {
	text-align: center;
}

.warningtable thead {
	background-color: #E3FFEC;
	text-align: center;
}

.imgBox {
	width: 250px;
	heigth: 250px;
	border-radius: 50%;
}

.imgStyle {
	border-radius: 70%;
	width: 200px;
	height: 200px;
	overflow: hidden;
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

.areaStyle {
	border: none;
	outline: none;
	width: 100%;
	resize: none;
}

.areaStyle: focus {
	border: none;
	width: 100%;
	resize: none;
}

.inputStyle {
	border: none;
	width: 100%;
	text-align: center;
}

.inputStyle {
	border: none;
	text-align: center;
}

.pro-img {
	margin-top: -53px;
	margin-bottom: 20px
}

.little-profile .pro-img img {
	width: 72px;
	height: 72px;
	-webkit-box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
	border-radius: 100%
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<div class="common-sidebar">
		<jsp:include page="/WEB-INF/views/common/findJandisidebar.jsp" />
		<div class="sidebar-content">
			<div class="introduce">
				<div align="center">
					<div class="imgBox">
						<img
							src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/${ jandiInfo.profile_path}"
							class="imgStyle" id="profile">
					</div>
					<h3>
						<input id="nickNameInput" type="text" name="nickName" readonly
							class="inputStyle" value="${ jandiInfo.nickName }">
					</h3>
				</div>
			</div>
			<br>
			<div class="introduce" style="padding: 3%">
				<h2>잔디 경력</h2> 
				<hr class="border-1px-black" />
				<textarea class="areaStyle" name="career" rows="10" cols="20" id="careeaText" readonly
					wrap="hard" placeholder="경력을 작성해 주세요.">${ jandiInfo.career }</textarea>
				<br> <br>
				<h2>소개</h2>
				<hr class="border-1px-black" />
				<textarea class="areaStyle" name="introduce" id="introText"
					rows="20" cols="20" wrap="hard" readonly placeholder="소개를 작성해 주세요.">${ jandiInfo.intro }</textarea>
				<div>
					<br>
					<a style="float:right;" href="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain?categoryCode=&searchValue=${ jandiInfo.nickName }">더 보기</a>
					<p>"${ jandiInfo.nickName }" 잔디님의 진행중인 클래스</p>
					<hr class="border-1px-black" />
					
					<div class="row">
						<c:forEach var="findClassList" items="${ thumbNailClassList }">
							<div class="col-lg-4 col-sm-6 mb-4">
								<div class="card" style="border: 1px solid green;">
									<img class="card-img-top" style=" height: 200px; width:100%;"
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
												<h3 class="m-b-0 font-light">₩ ${ findClassList.price } <br>등록일 : ${ findClassList.createDate }</h3>
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
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
