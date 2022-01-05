<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>

    <title>회원정보수정</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/modify.css" rel="stylesheet"/>

    <style>
    .warningtable tbody {text-align: center;} /* 누적 경고 테이블 */

    .warningtable thead {background-color: #E3FFEC; text-align: center;}
    
    .introduce-detail img {width: 60%; height: 60%; text-align: center;} /* 내 이미지 */

    p {font-weight: bold; font-size: 20px;}

    .myinfo{border-radius:10px; height:40px; width: 250px; font-size: 18px; padding-left: 15px; background-color: #e2e2e2 !important;} /* 내 정보 input */
    #modify_myinfo {width: 90px; height: 40px; background-color: #91C788; color: white; border: none; border-radius: 10px; position: relative; left: 45%;} /* 수정 버튼 */
    #name {position: relative; left: 30%; text-align: left; margin-left: 2%;} /* 내 정보 input */
    #email {position: relative; left: 21%; text-align: left;}
    #nickName { position: relative; left: 27%; text-align: left; margin-left: 2%;}
    #dupCheck { position: relative; left: 27%; bottom:3px;}
    #phone, .phone { position: relative; left: 21%; text-align: left;}
    .phoneCheck { position: relative; left: 45%;}
    .introduce-detail1 > div > label {position: relative; left: 15%;} /* 내 정보 그룹 */
    .warningtable thead tr th {border-bottom: none !important;} /* 누적 경고 테이블 */
    </style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/mypagesidebar.jsp" />
      <div class="sidebar-content">
        <div class="introduce">
          <div class="introduce-detail">
            <img
              src="${ pageContext.servletContext.contextPath }/resources/images/join2.png"
            />
          </div>
          <div class="introduce-detail1">
            <div>
              <label for="name" class="name"><span>이름</span></label>
              <input type="text" class="myinfo" name="member_info" id="name" value="${ sessionScope.loginMember.name }" readonly>
          </div>

          <div>
              <label for="email" class="email"><span>이메일주소</span></label>
              <input type="text" class="myinfo" name="member_info" id="email" value="${ sessionScope.loginMember.email }" readonly>
          </div>

          <div>
              <label for="nickname" class="nickname"><span>닉네임</span></label>
              <input type="text" class="myinfo" name="member_info" id="nickName" value="${ sessionScope.loginMember.nickName }" >
              <button id="dupCheck" type="button" class="onButton" onclick="return duplicationCheck2()">중복확인</button>
              <input type="checkbox" id="nickBoolean" style="display: none" />
          </div>

          <div>
              <label for="phone" class="phone"><span>핸드폰번호</span></label>
              <input type="text" class="myinfo" name="member_info" id="phone" value="${ sessionScope.loginMember.phone }" >
              <div class="phoneCheck"></div>
              <input type="checkbox" id="phoneBoolean" style="display: none" />
          </div>
          <br><br>
          <div>
            <button type="submit" id="modify_myinfo" class="onButton" onclick="return modifymyinfo();">수정 완료</button>
        </div>
          </div>
        </div>

        <script>

          /* 핸드폰 번호 정규식 체크 */
          $(function () {
          $("#phone").keyup(function () {
            let filter = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

            if (!filter.test($(this).val())) {
              $(".phoneCheck")
                .html("올바르지 않은 번호 형식입니다.")
                .css("color", "red");
              $(this).focus().css("background", "lightpink");
              $("#phoneBoolean").prop("checked", false);
            } else {
              $(".phoneCheck")
                .html("올바른 번호 형식입니다.")
                .css("color", "blue");
              $(this).focus().css("background", "palegreen");
              $("#phoneBoolean").prop("checked", true);
            }
          });
        });

        /* 닉네임 중복 체크 */
        function duplicationCheck2() {
          let nickName = $("#nickName").val();

          if (!nickName) {
            showModal("닉네임을 입력해주세요.");
          } else {
            $.ajax({
              url: "${ pageContext.servletContext.contextPath }/member/nickDupCheck",
              type: "post",
              data: { nickName: nickName },
              success: function (data) {
                if (data == "true") {
                  showModal("중복된 닉네임입니다.");
                  $("#nickBoolean").prop("checked", false);
                } else {
                  showModal("사용 가능한 닉네임입니다.");
                  $("#nickBoolean").prop("checked", true);
                }
              },
              error: function (error) {
                console.log(error);
              },
            });
          }
          return false;
        }

        /* 정보 수정 함수 */
          function modifymyinfo() {

            let nickName = $("#nickName").val();
            let phone = $("#phone").val();
            let nickBool = $("#nickBoolean").prop("checked");
            let phoneBool = $("#phoneBoolean").prop("checked");

            /* 수정 사항이 없을 경우 체크 */
            if((nickName == "${ sessionScope.loginMember.nickName }") && (phone == "${ sessionScope.loginMember.phone }")) {
              showModal("수정된 사항이 없습니다.");
              return false;
            }

            /* 닉네임만 바뀌었을 경우 중복 체크 */
            if(!(nickName == "${ sessionScope.loginMember.nickName }")) {
              if(!nickBool) {
                showModal("닉네임을 다시 확인해주세요.");
                return false;
              }
            }

            /* 핸드폰 번호만 바뀌었을 경우 정규식 체크 */
            if(!(phone == "${ sessionScope.loginMember.phone }")) {
              if(!phoneBool) {
                showModal("핸드폰 번호를 다시 확인해주세요.");
                return false;
              }
            }

            /* 회원 정보 수정 */
              $.ajax({
                url: "${ pageContext.servletContext.contextPath }/mypage/modify",
                type: "post",
                data: { nickName : nickName, phone : phone },
                success: function(data) {
                  if(data == "true") {
                    $("#nextModal").fadeIn();
                    $(".btn").click(function(){
                      location.href="${ pageContext.servletContext.contextPath }/mypage/main";
                    });
                  } else {
                    showModal("회원 정보 수정에 실패했습니다.");
                  }
                } 
              });
              return false;
            }
          

           /* 모달창 띄워주는 함수 */
           function showModal(str) {
            $("#modalTitle").html(str);
            $("#Modal").fadeIn();
              $(".btn").click(function () {
                $("#Modal").fadeOut();
              });
          };

          /* 마우스 커서 이벤트 */
          $(".onButton").hover(
              function () {
                $(this).css("color", "black").css("cursor", "pointer");
              },
              function () {
                $(this).css("color", "white").css("cursor", "default");
              }
            );  


        </script>
      </div>
    </div>
    <!-- 정보 수정 확인 모달창 -->
    <div class="ui mini modal" id="modifymodal">
      <div class="content modifycontent">
        <p class="modify-content-title">정보를 수정하시겠습니까?</p>
        <div class="re-modal-btn">
        <button class="ui button btn modifybtn">확인</button>
        <button class="ui button btn modifybtn">취소</button>
      </div>
      </div>
    </div>

  </body>
  <jsp:include page="../common/footer.jsp" />
</html>

<!-- 모달창 모아두는 곳 -->

<div class="ui mini modal" id="nextModal">
  <div class="contents">
    <p class="titles">회원 정보 수정이 완료되었습니다.</p>
    <div class="re-modal-btn">
      <button id="goMain" class="ui button btn">확인</button>
    </div>
  </div>
</div>

<div class="ui mini modal" id="Modal">
  <div class="contents">
    <p class="titles" id="modalTitle"></p>
    <div class="re-modal-btn">
      <button class="ui button btn">확인</button>
    </div>
  </div>
</div>
