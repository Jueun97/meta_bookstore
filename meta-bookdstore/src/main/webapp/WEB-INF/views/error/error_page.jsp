<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 오류</title>
</head>
<body>
	<div class="container">
		<h3>페이지 오류</h3>
		<div class="alert alert-danger">
			요청하신 페이지에 오류가 있습니다.
		</div>
		
		<div class="well">
			<h4>${exception.message}</h4>
			<ul>
				<c:forEach items="${exception.stackTrace}" var="stack">
					<li><c:out value="${stack}"/></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>