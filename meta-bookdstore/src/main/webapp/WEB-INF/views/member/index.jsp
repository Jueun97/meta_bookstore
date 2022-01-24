<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:url var="R" value="/" />

<sec:authorize access="isAuthenticated()">
	<!-- isAuthenticated() : 인증된 정보(세션)에 접근하는 방법 -->
	<sec:authentication property="principal" var="principal" />
	<!-- var="principal" : 세션정보를 담을 변수 => $principal.user~~}이런식으로 다른 jsp에서 쓰기-->
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${R}common.css">
<style>
div.box {
	padding: 50px;
	width: 300px;
}
</style>
<script>
  	$(function(){
  		${(empty msg)?"":"alert('" += msg += "');"};
  	});
  </script>
</head>
<body>
	<div class="container">
		<div class="box">
			<h1>멤버 인덱스 페이지</h1>
			<sec:authorize access="not authenticated">
				<a href="${R}member/login" class="btn">로그인</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<div>${principal.member.id}님의정보</div>
				<a href="${R}member/logout" class="btn">로그아웃</a>
				<a href="${R}member/${principal.member.m_no}/update" class="btn">회원정보수정</a>
			</sec:authorize>
		</div>
	</div>
</body>