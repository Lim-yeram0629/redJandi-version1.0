<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Signin Template for Bootstrap</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
    .warningtable tbody {
      text-align: center;
    }

    .warningtable thead {
      background-color: #E3FFEC;
      text-align: center;
    }
    
    .introduce-detail img {
      width: 60%;
      height: 60%;
      text-align: center;
    }
    

    </style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
    <jsp:include page="../common/matching_mantee_sidebar.jsp" />
        <div class="introduce">
          
          <div class="matching-content">
          	<div class="nothing-comment">
            	<p>앗, 요청한 매칭이 없어요!</p>
            	<p> 😅 견적서를 작성하여 잔디를 만나보세요!</p>
          	<div class="write">
            <button class="writeBtn">견적서 작성</button>
            </div>
          	</div>
          </div>
          
      </div>
    </div>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
