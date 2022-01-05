<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />

    <title>find class</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css"
      rel="stylesheet"
    />
    
        <link
      href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
      rel="stylesheet"
    />
<%--     <link
      href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css"
      rel="stylesheet"
    /> --%>

    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/findclass/findclassmain.css">
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  </head>
  <body>

    <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
    <jsp:include page="../common/findclasssidebar.jsp" />
      
      <div class="container" style="width:75%; margin-top:150px">

  <!-- Page Heading -->
  <h1 class="my-4">클래스 | 프로그래밍 언어
  </h1>

		<h3 class="my-4" style="border-bottom:1.5px solid #91c788; padding-bottom:8px;"> 4개의 목차 </h3>
		
        <div class="introduce">
           	<p>chap01 - 리터럴</p>
        	<div>
            <img
              src="${ pageContext.servletContext.contextPath }/resources/images/class1.PNG" style="width:500px; height:300px"
            />
          </div>
          <br>
          <p>chap02 - 변수</p>
        	<div>
            <img
              src="${ pageContext.servletContext.contextPath }/resources/images/class1.PNG" style="width:500px; height:300px"
            />
          </div>
        </div>
        
        <h3 class="my-4" style="border-bottom:1.5px solid #91c788; padding-bottom:8px;"> </h3>
    
        <div class="introduce">
          <div>
            <p>chap03 - 메소드</p>
            <p>chap04 - 배열</p>
          </div>
        </div>
        
        <div class="warn">
        </div>

      </div>
    </div>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
