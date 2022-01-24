<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<!-- isAuthenticated() : 인증된 정보(세션)에 접근하는 방법 -->
	<sec:authentication property="principal" var="principal"/>
	<!-- var="principal" : 세션정보를 담을 변수 => $principal.member~~}이런식으로 다른 jsp에서 쓰기--> 
</sec:authorize>
<!-- 위에꺼 header에 공통적으로씀 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
	메인페이지입니다.
	<sec:authorize access="not authenticated">
			로그인안한상태
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<input type="text" name="id" placeholder="유저네임"
		value="${principal.member.id}" readonly="readonly" />
<!-- 		principal.getMember().getId();	 -->
	</sec:authorize>
	멤버아디
</body>
</html>