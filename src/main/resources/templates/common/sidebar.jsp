<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />

    <title>Signin Template for Bootstrap</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/sidebar.css"
      rel="stylesheet"
    />

    <link href="${ pageContext.servletContext.contextPath }/resources/css/glyphicons-halflings-regular.svg" rel="stylesheet" />

    <script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/bootstrap.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <style>
      .sidebar-content {
        width: 70%;
        height: 1500px;
        /*overflow: auto; */
        /* border: 1px solid red; */
      }
    </style>
  </head>

  <body>
    <div id="sidebar">
      <div class="sidebar-inner-name">
        <h1>환잔디 님</h1>
        <hr class="border-1px-black" />
      </div>
      <div class="sidebar-inner-name1">
        <ul>
          <h3>클래스 관리</h3>
          <!-- <hr class="border-1px-black" /> -->
          <li><a href="my/attending">수강중인 클래스</a></li>
          <li><a href="#">수강완료 클래스</a></li>
          <li><a href="#">찜한 클래스</a></li>
          <li><a href="#">구매내역</a></li>
          <li><a href="#">클래스 후기</a></li>
        </ul>
        <ul>
          <h3>설정</h3>
          <!-- <hr class="border-1px-black" /> -->
          <li><a href="#">정보수정</a></li>
          <li><a href="#">비밀번호 변경</a></li>
          <li><a href="#">회원탈퇴</a></li>
        </ul>
      </div>
    </div>
  </body>

  <!-- <script src="css/ie10-viewport-bug-workaround.js"></script> -->
</html>
