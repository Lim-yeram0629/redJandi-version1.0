<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>수강중인 클래스</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>

    <style>
       .takingtable thead tr th {border-bottom: none !important;} /* 수강중인 클래스 테이블 */
       .finish-go {color: #52734D !important;}
       .dropsearch {margin-left: 14%;}
       .dropdown { position: relative;}
    </style>
</head>
<body>
	 <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
      <jsp:include page="../common/mypagesidebar.jsp" />
      <div class="sidebar-content">
        <p class="taking-title">수강중인 클래스</p>
        <br>
        <div class="dropsearch">
          <form action="${ pageContext.servletContext.contextPath }/mypage/taking" method="get">
            <input type="hidden" name="currentPage" value="1" />
		<select class="ui dropdown" id="searchCondition" name="searchCondition">
  			<option value="1">카테고리</option>
  			<option value="2">클래스명</option>
  			<option value="3">잔디 닉네임</option>
		</select>
    <div class="ui search">
      <div class="ui icon input">
        <input class="prompt" type="search" name="searchValue" id="searchValue" value="<c:out value="${ sessionScope.selectCriteria.searchValue }"/>">
        <button id="searchbtn" style="border: none; background:none; position: relative; right: 18%;"><img src="${ pageContext.servletContext.contextPath }/resources/images/search.png" style="width:25px;"></button>
      </div>
      <div class="results"></div>
    </div>
  </div>
</form>
  <br><br><br><br><br>
<c:choose>
  <c:when test="${ empty classList }">
    <div class="unlist-text">
      수강이 진행중인 클래스가 없거나, 조회된 결과가 없습니다.
      <br><br><br>
    <a href="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain" class="finish-go"><u>클래스 신청하러가기</u></a>
    </div>
  </c:when>
  <c:when test="${ not empty classList }">
<table class="ui single line table takingtable">
  <thead>
    <tr>
      <th>카테고리</th>
      <th>클래스제목</th>
      <th>강사닉네임</th>
      <th>수강기간</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="size" begin="0" end="${ fn:length(classList)-1 }">
    <tr class="classInfo${ size + 1 }">
      <td>${ classList[size].categoryDTO.categoryName }</td>
      <td>${ classList[size].classDTO.title }</td>
      <td>${ classList[size].jandiDTO.nickName }</td>
      <td>${ classList[size].paymentDTO.payDate } - ${ classList[size].endDate }</td>
    </tr>

    <script>

      /* 마우스 커서 이벤트 */
      $(function(){
        $(".classInfo${ size + 1 }").hover(
          function() {
            $(this).css("color" , "green").css("cursor", "pointer");
          },
          function() {
            $(this).css("color", "black").css("cursor", "default");
          }
        );
      });

      /* 클릭 시 클래스 인포로 이동 */
      $(function() {
        $(".classInfo${ size + 1 }").click(function(){
          location.href="${ pageContext.servletContext.contextPath }/mypage/class/classRoom?classCode=${ classList[size].classDTO.classCode }";
        });
      });

      /* 검색 조건 유지 */
      $(function(){
      $("#searchCondition").val("${ selectCriteria.searchCondition }");
      });
    </script>
    
    </c:forEach>
  </tbody>
</table>
<jsp:include page="../common/Paging.jsp" />
</c:when>
</c:choose>
      </div>
    </div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>