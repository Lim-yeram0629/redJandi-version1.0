<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />

    <title>Signin Template for Bootstrap</title>

  </head>

  <body>
    <div id="sidebar">
      <div class="sidebar-inner-name">
        <h1>멘토 보기</h1>
        <hr class="border-1px-black" />
      </div>
      <div class="sidebar-inner-name1">
        <ul>
          
          <li><a href="${ pageContext.servletContext.contextPath }/findJandi/findAllJandiMain">전체 멘토</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/findJandi/findTopJandiMain">인기 멘토</a></li>
        </ul>
      </div>
    </div>
  </body>

</html>
