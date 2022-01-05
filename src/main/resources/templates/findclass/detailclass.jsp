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

		<div> <p style="font-size: 55px; color: green; text-align: center; margin-bottom: 50px;">OH! 잔디의 JAVA클래스 </p></div>

		<h3 class="my-4" style="border-bottom:1.5px solid #91c788; padding-bottom:8px;"> 소개 </h3>
		
        <div class="introduce">
           	<p>이 클래스는 OH! 잔디만의 특급 공부 비법을 담은 JAVA 강의 클래스입니다. 지금까지의 JAVA는 다 잊어라!</p>
        	<div class="introduce-detail1">
            <img
              src="${ pageContext.servletContext.contextPath }/resources/images/detailclass.png"
            />
          </div>
        </div>
        
        <h3 class="my-4" style="border-bottom:1.5px solid #91c788; padding-bottom:8px;"> 강의 목차 </h3>
    
        <div class="introduce">
          <div>
            <p>chap01 - 리터럴</p>
            <p>chap02 - 변수</p>
            <p>chap03 - 리터럴</p>
            <p>chap04 - 리터럴</p>
          </div>
        </div>
        
        <div class="warn">
        </div>
        <div class="warining">
        <p style="border-bottom:1.5px solid #91c788; padding-bottom:8px;">리뷰</p>
        <div class="ui basic table warningtable">
         	<div style="display:inline-flex;">
         		<div style="width:485px;">별점</div>
         		<div style="width:485px; text-align:right;">고수잔디</div>
			</div>
		  	<div style="display:inline-flex;">
         		<div style="width:485px;">너무 알차고 좋은 구성입니다. 끝내줘요!</div>
         		<div style="width:485px; text-align:right;">2021-11-15</div>
			</div>
        </div>
        
          <div class="ui basic table warningtable">
         	<div style="display:inline-flex;">
         		<div style="width:485px;">별점</div>
         		<div style="width:485px; text-align:right;">고수잔디</div>
			</div>
		  	<div style="display:inline-flex;">
         		<div style="width:485px;">너무 알차고 좋은 구성입니다. 끝내줘요!</div>
         		<div style="width:485px; text-align:right;">2021-11-15</div>
			</div>
        </div>
      </div>
      </div>
    </div>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
