<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>

    <title>공지사항</title>
    
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/faq/notice.css"
      rel="stylesheet"
    />
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/faq.css"
      rel="stylesheet"
    />

  </head>

  <!-- Channel Plugin Scripts -->
  <script>
    (function () {
      var w = window;
      if (w.ChannelIO) {
        return (window.console.error || window.console.log || function () {})(
          "ChannelIO script included twice."
        );
      }
      var ch = function () {
        ch.c(arguments);
      };
      ch.q = [];
      ch.c = function (args) {
        ch.q.push(args);
      };
      w.ChannelIO = ch;
      function l() {
        if (w.ChannelIOInitialized) {
          return;
        }
        w.ChannelIOInitialized = true;
        var s = document.createElement("script");
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js";
        s.charset = "UTF-8";
        var x = document.getElementsByTagName("script")[0];
        x.parentNode.insertBefore(s, x);
      }
      if (document.readyState === "complete") {
        l();
      } else if (window.attachEvent) {
        window.attachEvent("onload", l);
      } else {
        window.addEventListener("DOMContentLoaded", l, false);
        window.addEventListener("load", l, false);
      }
    })();
    ChannelIO("boot", {
      pluginKey: "b05edd24-961c-4a18-8d6f-1d8a717414b4",
    });
  </script>
  <!-- End Channel Plugin -->
  <body>
    <!-- <div class="background"></div> -->
    <jsp:include page="../common/nav.jsp" />

    <main>
      <div class="faq-1">
        <h1>공지사항</h1>
        <hr style="border: 2px solid black" />
      </div>
     <table class="notice-table">
          <thead>
            <tr>
              <th style="width:80%;">제목</th>
              <th>날짜</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="faq" items="${ faqList }">
              <tr onclick="location.href='${pageContext.servletContext.contextPath}/faq/noticeDetail/${ faq.postCode }'">
                <td class="text-left">${ faq.title }</td>
                <td>${ faq.writeDate }</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
         <input type="hidden" name="currentPage" value="1" />
        <jsp:include page="../common/Paging.jsp" />
    </main>
  
  </body>
    <jsp:include page="../common/footer.jsp" />


</html>
