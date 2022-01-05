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
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/findJandi/findJandiMain.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/findJandi/findJandiMain.css">   
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
		 <div class="card-body little-profile text-center">
		 <div class="mentor-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/mentor1.png" alt="user"> <p style="margin-top:15px;">비탈릭 부테린</p> </div>
		 </div>
		<h3 class="my-4" style="border-bottom:1.5px solid #91c788; padding-bottom:8px;"> 멘토경력 </h3>
		
        <div class="introduce">
           	<p>2012  국제정보 올림피아드 동메달</p>
           	<p>2014 world Technology Awards(세계 기술 대상) IT Software부분 대상</p>
        </div>
        <br>
        <br>
        <h3 class="my-4" style="border-bottom:1.5px solid #91c788; padding-bottom:8px;"> 소개 </h3>
    
        <div class="introduce">
          <div>
            <p>2011년에 고등학생의 나이로 비트코인 매거진을 운영한 바[4] 있다. 2013년에는 다니던 워털루 대학교를 자퇴하고 이스라엘, 네덜란드, 미국 등으로 여행을 시작했다. 이 때에도 아버지는 다니던 학교를 계속 다니면 안정적인 직장이 기다리겠지만, 그만 둘 경우 더 큰 가능성이 있을 것이라고 조언했다. 그는 이때 부터 암호화폐에 대해 깊이 파고들기 시작하여, 프로젝트를 시작했다. 2012년부터는 본격적으로 팀을 구성하고 이더리움 백서를 작성했다.
</p>
          </div>
        </div>
        
        <div class="warn">
        </div>
        <div class="warining">
        <p style="border-bottom:1.5px solid #91c788; padding-bottom:8px;">멘토님의 진행중인 클래스들</p>
        <div class="container">
            <div class="row">
            	 <div class="col-sm">
			      <img
              src="${ pageContext.servletContext.contextPath }/resources/images/mentorClass1.png" style="width:300px; height:200px;"
            />
			    </div>
			    <div class="col-sm">
			      <img
              src="${ pageContext.servletContext.contextPath }/resources/images/mentorClass2.png" style="width:300px; height:200px;"
            />
			    </div>
			    <div class="col-sm">
			       <img
              src="${ pageContext.servletContext.contextPath }/resources/images/mentorClass3.png" style="width:300px; height:200px;"
            />
			    </div>
            </div>
          </div>
      </div>
      </div>
    </div>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
