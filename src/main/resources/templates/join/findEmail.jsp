<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>이메일 찾기</title>

   <link href="${ pageContext.servletContext.contextPath }/resources/css/findPwd.css?" rel="stylesheet" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css"
    />
  </head>

  <body>
    <jsp:include page="../common/nav.jsp" />

    <main class="fullJoin">
       
        <div class="head">
            <div id="timage"><img src="${ pageContext.servletContext.contextPath }/resources/images/join.png" style="width: 70px; height: 70px; "></div>
            <div class="thumbnail" id="ttext">이메일 찾기 </div>
        </div>
 
        <br><br><br><br>
        <form method="post" id="submitForm">
        <div class="content">
            <div class="title">이름</div>
            <input type="text" placeholder="이름을 입력하세요" name="name" id="name">
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">핸드폰 번호</div>
            <input type="text" placeholder="-를 생략하고 입력해주세요" name="phone" id="phone">
        </div>

       
        <br><br><br><br><br><br><br><br>
        <div style="position: relative; left: 38%; bottom: 90px;" class="emailbtn">
            <button id="goFind" type="submit">확인</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button id="reset" type="reset">취소</button>
        </div>
      </form>

      <script>
        $(function() {
          $("#goFind").click(function(e){
            e.preventDefault();

            let name = $("#name").val();
            let phone = $("#phone").val();

            if(!name) {
              showModal("이름을 입력해주세요");
            } else if (!phone) {
              showModal("핸드폰 번호를 입력해주세요");
            } else {
              
              $.ajax({
                url: "${ pageContext.servletContext.contextPath }/member/findEmail",
                type: "post",
                data: {name : name, phone : phone},
                success: function(data) {
                  if(!data) {
                    showModal("찾으시는 이메일이 존재하지 않습니다.");
                  } else {
                    showModal("찾으시는 이메일은 <br>" + data + "입니다.");
                  }
                },
                error: function(error) {
                  console.log(error);
                }
              });
            }
            return false;
          });
        });

        /* 모달창 띄워주는 함수 */
        function showModal(str) {
            $("#modalTitle").html(str);
            $("#Modal").fadeIn();
              $(".btn").click(function () {
                $("#Modal").fadeOut();
              });
          };

      /* 마우스 커서 이벤트 */
      $(function() {
        $(".emailbtn > button").hover(
          function () {
            $(this).css("color", "black").css("cursor", "pointer");
          },
          function () {
            $(this).css("color", "white").css("cursor", "default");
          }
        );
      });

      </script>
    </main>
    <jsp:include page="../common/footer.jsp" />
  </body>
</html>

<!-- 모달창 모아두는 곳 -->

<div class="ui mini modal" id="Modal">
  <div class="contents">
    <p class="titles" id="modalTitle"></p>
    <div class="re-modal-btn">
      <button class="ui button btn">확인</button>
    </div>
  </div>
</div>