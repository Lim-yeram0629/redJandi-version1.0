<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>마이페이지 슬라이더바</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/mypage/mypagesidebar.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
    <style>
      /* 회원탈퇴 모달창 */
    #endmodal { height: 603px; left: 40%; top: 20%; }
    .modal-header{text-align: center;}
    .end-content{height: 533px;}
    .modal-content-text { border: 2px solid; padding: 3%; background-color: #91C788; border-color: #91C788;}
    .context-modal-btn { position: relative; left: 40%; top: 30px;}
    .inputpwd2 {
            width: 600px; 
            height: 50px; 
            color: gray;
            border: 3px solid #91c788; 
            border-radius: 10px; 
            padding-left: 2%;
            position: relative;
            left: 4%;
        }
    
    #endbtnhmodal {height: 150px; top: 40%; left: 47%;}
  
    .endcontent{
    height: 150px;
    text-align: center;
    background-color: #91C788 !important;
  }
  
  .end-content-title {
    position: relative;
    top: 8%;
    font-weight: 800;
  }

 
  
  a:hover { color: #91C788 !important; }
    </style>
  </head>

  <body>
    <div id="sidebar">
      <div class="sidebar-inner-name">
        <h1>${ sessionScope.loginMember.nickName } 님</h1>
        <hr class="border-1px-black" />
      </div>
      <div class="sidebar-inner-name1">
        <ul>
          <h3>클래스 관리</h3>
          <!-- <hr class="border-1px-black" /> -->
          <li><a href="${ pageContext.servletContext.contextPath }/mypage/taking">수강중인 클래스</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/mypage/finish">수강완료 클래스</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/mypage/jjim">찜한 클래스</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/mypage/buy">구매내역</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/mypage/review">클래스 후기</a></li>
        </ul>
        <ul>
          <h3>설정</h3>
          <!-- <hr class="border-1px-black" /> -->
          <li><a href="${ pageContext.servletContext.contextPath }/mypage/main">내정보</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/mypage/modify">정보수정</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/mypage/modifyPwd">비밀번호 변경</a></li>
          <li><a href="#" id="endbtn">회원탈퇴</a></li>
        </ul>
      </div>
    </div>
  <!-- 회원탈퇴 모달창 -->
  <div class="ui small modal" id="endmodal">
     <div class="header modal-header"><h2>회원탈퇴</h2></div>
      <div class="content end-content">
          <br>
          <h3>회원탈퇴 안내사항</h3>
          <br>
          <div class="modal-content-text">숨은잔디에 만족하지 못하셨나요? 탈퇴하기 전에 먼저 개선 요청을 해보시는 건 어떨까요?<br>
          그래도 탈퇴하시겠다면 탈퇴 전에 아래 유의사항을 꼭 읽어주세요!<br>
          감사합니다. <br>
          <br>
          1. 회원이 작성한 콘텐츠(동영상, 게시물, 댓글 등)는 자동적으로 삭제되지 않으며, <br>
          &nbsp&nbsp 만일 삭제를 원하시면 탈퇴 이전에 삭제가 필요합니다.<br>
          2. 탈퇴 후 동일한 메일로 다시 가입할 수 없습니다.<br>
          3. 현재 비밀번호를 입력하고 탈퇴하기를 누르시면 위 내용에 동의하는 것으로 간주됩니다.<br>
          <hr>
          <input type="password" class="inputpwd2" id="pwd" placeholder="현재 비밀번호">
          </div>
            <div class="context-modal-btn">
            <button class="ui button btn1" id="con-btn" style="background-color: #91C788 !important;">확인</button>
            <button class="ui button btn1" id='end-btn' style="background-color: lightgray !important;">취소</button>
            </div>
          </div>
        </div>
      <!-- 회원탈퇴 완료 버튼 모달창 -->
        <div class="ui mini modal" id="endbtnhmodal">
      <div class="content endcontent">
        <div class="end-content-title">회원탈퇴가 완료되었습니다.<br> 메인화면으로 되돌아갑니다.</div>
        <div class="re-modal-btn">
        <button class="ui button endmainbtn" id="endmainbtn" style="background-color: white;">확인</button>
      </div>
      </div>
    </div>
      
  <script>
  
  /* 회원 탈퇴 클릭 시 탈퇴 모달 띄워주기 */
  $(function(){
    $('#endbtn').click(function(){
      $('#endmodal').fadeIn();
    }); 
  });
  
  /* 회원 탈퇴 처리 */
  $(function(){
    $('#con-btn').click(function(){

      let pwd = $("#pwd").val();

      if(!pwd) {
        showModal("비밀번호를 입력해주세요.");
        return false;
      } else {
        
        $.ajax({
          url: "${ pageContext.servletContext.contextPath }/mypage/exit",
          type: "post",
          data: {pwd : pwd},
          success: function(data) {
            if(data == "true") {
              $('#endbtnhmodal').fadeIn();
            } else if(data == "false") {
              showModal("비밀번호가 틀립니다.");
            } else {
              showModal("회원 탈퇴에 실패했습니다.");
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
  
  /* 탈퇴 취소 클릭 시 모달 끄기 */
  $(function(){
	    $('#end-btn').click(function(){
	      $('#endmodal').fadeOut();
	    });
	  });
  
  /* 메인으로 돌아가는 함수 */ 
  $(function(){
	    $('#endmainbtn').click(function(){
	      $('#endbtnhmodal').fadeOut();
	      $(location).attr('href',"${ pageContext.servletContext.contextPath }");
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
  </script>
  </body>
</html>

<!-- 모달창 -->
<div class="ui mini modal" id="Modal">
  <div class="contents">
    <p class="titles" id="modalTitle"></p>
    <div class="re-modal-btn">
      <button class="ui button btn">확인</button>
    </div>
  </div>
</div>
