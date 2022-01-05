<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />

    <title>find class</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css"  rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/findJandi/findJandiMain.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


  </head>
  <body>

    <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
    <jsp:include page="../common/findJandisidebar.jsp" />
      
      <div class="container" style="width:75%; margin-top:150px">

  <!-- Page Heading -->
  <h1 class="my-4">멘토 보기 | 
    <small>인기 멘토</small>
  </h1>
  

  <div class="row">
    
    <c:forEach var="jandi" items="${ jandiTopList }"> 
		    <div class="col-lg-4 col-sm-6 mb-4">
			      <div class="card">
			            <div class="card-body little-profi text-center">
			                <div class="intmentor-img"><img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/${ jandi.profile_path }" alt="user"  
			                	onclick="location.href='${ pageContext.servletContext.contextPath}/findJandi/jandiProfile/${ jandi.email }'"></div>
			                <p>${ jandi.nickname }</p>
			            </div>
			      </div>
		    </div> 
	   </c:forEach>
    
    
  </div>
  
  
  <!-- /.row -->

  

</div>
    </div>
	
<!-- /.container -->

  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
