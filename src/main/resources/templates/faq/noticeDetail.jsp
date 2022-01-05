<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>

    <title>공지사항 상세보기</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/managermain.css"
      rel="stylesheet"
    />
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/addnotice.css"
      rel="stylesheet"
    />

  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <div class="sidebar-content"  style="margin: 0 auto;">
        <h1>공지사항 조회</h1>
        <br /><br />

        <div class="notice">
           <div class="notice-div">
              <div class="notice-title"><h2><c:out value="${ faq.title }" /> </h2></div>
             <div class="notice-date"><h6><c:out value="${ faq.writeDate }" /></h6></div>
          </div>
          <br/> <hr> <br>
          <input name="postCode" style="visibility: hidden;" value="${ faq.postCode }" >         
           <textarea name="contents" id="contents" readonly="true">${ faq.contents }</textarea>
        </div>

          <script>
            function modifycontents() {
               $('#contents').attr("readonly",false); 
               $('#contents').attr("style","border:1px solid black"); 
               $('#changecontents').attr("style","display:block")
    }
          </script>
      </div>
    </div>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
