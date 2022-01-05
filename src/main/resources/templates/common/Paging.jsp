<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
	.pagination > li > a{
		position: relative;
	    float: left;
	    padding: 6px 12px;
	    margin-left: 2px;
	    line-height: 1.42857143;
	    color: #fff;
	    text-decoration: none;
	    background-color: #91c788;
	    border: 1px solid #91c788;
	    border-radius: 1.5rem;
	}
	.pagination > li > a, .pagination > li > span {
    	position: relative;
	    float: left;
	    padding: 6px 12px;
	    margin-left: 2px;
	    line-height: 1.42857143;
	    color: #fff;
	    text-decoration: none;
	    background-color: #91c788;
	    border: 1px solid #91c788;
	    border-radius: 1.5rem;
}
.pagination > li:first-child > a, .pagination > li:first-child > span,
.pagination > li:last-child > a, .pagination > li:last-child > span {
   	 	position: relative;
	    float: left;
	    padding: 5px 11px;
	    margin-left: 2px;
	    line-height: 1.42857143;
	    color: #fff;
	    text-decoration: none;
	    background-color: #91c788;
	    border: 1px solid #91c788;
	    border-radius: 1.5rem;
}

.pagination > li > a { color: white !important;}
.manager-paging > ul {list-style:none;}
</style>
<body>

	<div style="text-align : center">
	<div class="manager-paging">
	  <ul class="ui pagination menu">
	  
		<!-- 이전 페이지 버튼 -->
		<c:if test="${ selectCriteria.pageNo <= 1 }">
	 	<li >
			<a aria-label="Previous" style="cursor:pointer;" >
			 <span aria-hidden="true">&laquo;</span>
	  	    </a>
		</li>
		</c:if>
		<c:if test="${ selectCriteria.pageNo > 1 }">
	 	<li id="prevPage">
			<a aria-label="Previous" style="cursor:pointer;" class="bg_a">
			 <span aria-hidden="true">&laquo;</span>
	  	    </a>
		</li>
		</c:if>
		
		<!-- 숫자 버튼 -->
	    <c:forEach var="p" begin="${ selectCriteria.startPage }" end="${ selectCriteria.endPage }" step="1">
		
		<c:if test="${ selectCriteria.pageNo eq p }">
			<li><a disabled style="cursor:pointer;"><c:out value="${ p }"/></a></li>
		</c:if>
	      
	    <c:if test="${ selectCriteria.pageNo ne p }">
	   		<li><a onclick="pageButtonAction(this.innerText);" style="cursor:pointer;"><c:out value="${ p }"/></a></li>
		</c:if>
		</c:forEach> 
		
		
	    
	    <!-- 다음 페이지 버튼 -->
	    <c:if test="${ selectCriteria.pageNo >= selectCriteria.maxPage }">
	    <li>  
	      <a aria-label="Next" style="cursor:pointer;">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>    
	    </c:if>
		<c:if test="${ selectCriteria.pageNo < selectCriteria.maxPage }">
		<li>
		 <a aria-label="Next" style="cursor:pointer;">
	        <span aria-hidden="true" id="nextPage">&raquo;</span>
	     </a> 
	     </li>  
		</c:if>
	  </ul>  
	  </div>      
  	</div>
						
	<script>
	
		const link = window.location.pathname;
		let searchText = "";
		
		let mappingurl = link.substring(link.lastIndexOf('/'));
		if(mappingurl == '/classRoom'){
			searchText += "&classCode=${ classCode }";
		}
		
		if(${ !empty selectCriteria.searchCondition? true: false }) {
			searchText += "&searchCondition=${ selectCriteria.searchCondition }";
		}
		
		if(${ !empty selectCriteria.searchValue? true: false }) {
			searchText += "&searchValue=${ selectCriteria.searchValue }";
		}

		/* 클래스 찾기 페이지 카테고리 조건 추가 */
		if(${ !empty categoryCode? true: false }) {
			searchText += "&categoryCode=${ categoryCode }";
		}

		/* 마이페이지 구매내역 페이지 정렬 조건 추가 */
		if(${ !empty sort? true: false }) {
			searchText += "&sort=${ sort }";
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
				location.href = link + "?currentPage=${ selectCriteria.pageNo - 1 }" + searchText;
			}
		}
		
		if(document.getElementById("nextPage")) {
			const $nextPage = document.getElementById("nextPage");
			$nextPage.onclick = function() {
				location.href = link + "?currentPage=${ selectCriteria.pageNo + 1 }" + searchText;
			}
		}
		
		if(document.getElementById("maxPage")) {
			const $maxPage = document.getElementById("maxPage");
			$maxPage.onclick = function() {
				location.href = link + "?currentPage=${ selectCriteria.maxPage }" + searchText;
			}
		}
		
		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text + searchText;
		}
	</script>
</body>
</html>