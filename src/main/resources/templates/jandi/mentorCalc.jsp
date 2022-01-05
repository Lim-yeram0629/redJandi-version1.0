<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>정산 내역</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
a{
	color:black;
}
p {
	font-weight: bold;
	font-size: 20px;
}

.border-1px-black{
	margin-top:10px;
	margin-bottom: 10px;
}

.learnTable thead {
   background-color: #e3ffec;
   text-align: center;   
  }

.learnTable tbody {
   text-align: center;   
  }
  
.learnTable tfoot{
   text-align: center;  
 }
 
.learnTable tfoot th{
   font-weight: bold;
 }
 
table{
	text-align: center;
}

.title-div h3{
	float:left;
}


</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<div class="common-sidebar">
		<jsp:include page="/WEB-INF/views/common/mentorsidebar.jsp" />
		<div class="sidebar-content">
		
			<div class="title-div">
				<h3>정산 계좌</h3>
				<br>
				<button type="button" style="border:none; background: none; padding:1px; float:right;"
						data-toggle="modal" data-target="#messageModal"><b>정산 계좌 수정은 어떻게 하나요?</b></button>
			</div>
			<br>
			
			<hr class="border-1px-black" />
			
			<div class="account" style="padding-left:30px;">
				<h4>은행 : ${ requestScope.bank }</h4>
				<h4>계좌 : ${ requestScope.account }</h4>
				<h4>예금주 : ${ requestScope.accName }</h4>
			</div>
			<br><br>
			<form action="${ pageContext.servletContext.contextPath }/jandi/jandiModifyCalc" method="get">
				<div class="title-div">
					<h3>정산 내역 : ${ requestScope.calStartDay }  -  ${ requestScope.calEndDay }</h3>
					<div style="float:right;">
						<input type="date" id="calStartDate" name="calStartDate" value="${ requestScope.calStartDay }"> ~ <input type="date" id="calEndDate" name="calEndDate" value="${ requestScope.calEndDay }">
						<button type="submit" id="calBtn" style="border:none; background: none; padding:5px; font-size: 15px;"><b>조회</b></button>
					</div>
				</div>
					<br><br>
					<hr class="border-1px-black" />
					<table class="ui basic table learnTable" style="width:100%;">
						<thead>
							<tr>
								<th width="50">정산 날짜</th>
								<th width="10">수익</th>
								<th width="10">수수료</th>
								<th width="20">정산 금액(원)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="feeSet" items="${ requestScope.feeSetList }">
								<tr>
									<td>${ feeSet.calDate }</td>
									<td>${ feeSet.fullFee }</td>
									<td>${ feeSet.fees }</td>
									<td>${ feeSet.realFeeSet }</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>총 합계</th>
								<th>${ fullFeeSum }</th>
								<th>${ feeSum }</th>
								<th>${ realFeeSum }</th>
							</tr>
						</tfoot>
					</table>
	
				
				<br><br>
				<div class="title-div">
		
						<h3>광고 결제 내역</h3>
	
				</div>
				<br><br>
				<hr class="border-1px-black" />
				<table class="ui basic table learnTable" style="width:100%;">
					<thead>
						<tr>
							<th width="30">결제 날짜</th>
							<th width="50">클래스</th>
							<th width="20">정산 금액(원)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ad" items="${ requestScope.adList }">
							
								<tr>
									<td>${ ad.payDate }</td>
									<td>${ ad.className }</td>
									<td>${ ad.pay }</td>
								</tr>
							
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<th>총 합계</th>
							<th></th>
							<th>${ adPaySum }</th>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>
		<!-- Modal -->
		<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">정산 계좌 수정 방법 안내</h4>
					</div>
					<form action="" method="post" id="modalForm">
						<div class="modal-body" align="center">
							<br>
							정산 계좌는 한달에 한번 고객센터를 통해서만 변경이 가능합니다.
							<br>
							자세한 문의는 고객센터로 문의 바랍니다.
							<br>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default btnBD"
								data-dismiss="modal">확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
