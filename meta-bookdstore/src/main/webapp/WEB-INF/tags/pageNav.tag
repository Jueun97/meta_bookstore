<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="pageObject" 
	type="com.meta.util.PageObject"%>
<%@ attribute name="listURI" required="true" type="java.lang.String"%>
<%@ attribute name="query" required="false" type="java.lang.String"%>

<%
/*
 * 사용방법 :<pageObject:pageNav listURI="호출 List URL"
 			pageObject= "페이지 객체" query="댓글 페이지, 검색등 뒤에 붙이는 쿼리" />
  */
%>

<nav aria-label="Page navigation example">
	<ul
		class="pagination pagination__custom justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble">
		<li class="flex-shrink-0 flex-md-shrink-1 page-item"><a
			class="page-link" href="#">Previous</a></li>
		<li class="flex-shrink-0 flex-md-shrink-1 page-item"><a
			class="page-link" href="#">1</a></li>
		<li class="flex-shrink-0 flex-md-shrink-1 page-item"><a
			class="page-link" href="#">2</a></li>
		<li class="flex-shrink-0 flex-md-shrink-1 page-item active"
			aria-current="page"><a class="page-link" href="#">3</a></li>
		<li class="flex-shrink-0 flex-md-shrink-1 page-item"><a
			class="page-link" href="#">4</a></li>
		<li class="flex-shrink-0 flex-md-shrink-1 page-item"><a
			class="page-link" href="#">5</a></li>
		<li class="flex-shrink-0 flex-md-shrink-1 page-item"><a
			class="page-link" href="#">Next</a></li>
	</ul>
</nav>