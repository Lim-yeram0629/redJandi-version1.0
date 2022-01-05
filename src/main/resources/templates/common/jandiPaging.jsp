<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- 	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css"> --%>

    <script src="https://code.jquery.com/jquery-3.1.1.min.js" 
                integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous">
    </script>
<%--     <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
 --%>
</head>
<body>

	<div style="text-align : center">
	<div class="manager-paging">
	  <ul class="ui pagination menu">
	  
		<!-- 이전 페이지 버튼 -->
		<c:if test="${ sessionScope.selectCriteria.pageNo <= 1 }">
	 	<li>
			<a href="#" aria-label="Previous" style="cursor:pointer;">
			 <span aria-hidden="true">&laquo;</span>
	  	    </a>
		</li>
		</c:if>
		<c:if test="${ sessionScope.selectCriteria.pageNo > 1 }">
	 	<li id="prevPage">
			<a href="#" aria-label="Previous" style="cursor:pointer;">
			 <span aria-hidden="true">&laquo;</span>
	  	    </a>
		</li>
		</c:if>
		
		<!-- 숫자 버튼 -->
	    <c:forEach var="p" begin="${ sessionScope.selectCriteria.startPage }" end="${ sessionScope.selectCriteria.endPage }" step="1">
		
		<c:if test="${ sessionScope.selectCriteria.pageNo eq p }">
			<li><a disabled style="cursor:pointer;"><c:out value="${ p }"/></a></li>
		</c:if>
	      
	    <c:if test="${ sessionScope.selectCriteria.pageNo ne p }">
	   		<li><a onclick="pageButtonAction(this.innerText);" style="cursor:pointer;"><c:out value="${ p }"/></a></li>
		</c:if>
		</c:forEach> 
		
		
	    
	    <!-- 다음 페이지 버튼 -->
	    <c:if test="${ sessionScope.selectCriteria.pageNo >= sessionScope.selectCriteria.maxPage }">
	    <li>  
	      <a href="#" aria-label="Next" style="cursor:pointer;">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>    
	    </c:if>
		<c:if test="${ sessionScope.selectCriteria.pageNo < sessionScope.selectCriteria.maxPage }">
		<li>
		 <a href="#" aria-label="Next" style="cursor:pointer;">
	        <span aria-hidden="true" id="nextPage">&raquo;</span>
	     </a> 
	     </li>  
		</c:if>
	  </ul>  
	  </div>      
  	</div>
						
	<script>
	
		const link = "${ pageContext.servletContext.contextPath }/manager/mentolist";
		let searchText = "";
		
		if(${ !empty sessionScope.selectCriteria.searchCondition? true: false }) {
			searchText += "&searchCondition=${ sessionScope.selectCriteria.searchCondition }";
		}
		
		if(${ !empty sessionScope.selectCriteria.searchValue? true: false }) {
			searchText += "&searchValue=${ sessionScope.selectCriteria.searchValue }";
		}
			
		if(document.getElementById("startPage")) {
			const $startPage = document.getElementById("startPage");
			$startPage.onclick = function() {
				location.href = link + "?currentPage=1" + searchText;
			}
		}
		
		if(document.getElementById("prevPage")) {
			const $prevPage = document.getElementById("prevPage");
			$prevPage.onclick = function() {
				location.href = link + "?currentPage=${ sessionScope.selectCriteria.pageNo - 1 }" + searchText;
			}
		}
		
		if(document.getElementById("nextPage")) {
			const $nextPage = document.getElementById("nextPage");
			$nextPage.onclick = function() {
				location.href = link + "?currentPage=${ sessionScope.selectCriteria.pageNo + 1 }" + searchText;
			}
		}
		
		if(document.getElementById("maxPage")) {
			const $maxPage = document.getElementById("maxPage");
			$maxPage.onclick = function() {
				location.href = link + "?currentPage=${ sessionScope.selectCriteria.maxPage }" + searchText;
			}
		}
		
		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text + searchText;
		}
	</script>
</body>
</html>