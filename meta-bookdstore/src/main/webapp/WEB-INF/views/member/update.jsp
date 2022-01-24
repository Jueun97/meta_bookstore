<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:url var="R" value="/" />

<sec:authorize access="isAuthenticated()">
	<!-- isAuthenticated() : 인증된 정보(세션)에 접근하는 방법 -->
	<sec:authentication property="principal" var="principal"/>
	<!-- var="principal" : 세션정보를 담을 변수 => $principal.user~~}이런식으로 다른 jsp에서 쓰기--> 
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${R}member_register.css">
<style>
  label { display: block; margin-top:10px; }
  .error { color: red; display: block; }
  button { margin-top: 20px; }
</style>
</head>
<body>
<div class="container">
  <h1>회원 수정</h1>
 <form:form method="post" modelAttribute="memberUpdateDto">
    <input type="hidden" name="m_no" value="${principal.member.m_no}">
    <div>
      <label>아이디:</label>
      <form:input path="id" value="${principal.member.id}"/>
      <form:errors path="id" class="error" />
    </div>
    <div>
      <label>비밀번호:</label>
      <form:password path="password" />
      <form:errors path="password" class="error" />
    </div>
    <div>
      <label>이름:</label>
      <form:input path="name" value="${principal.member.name}"/>
      <form:errors path="name" class="error" />
    </div>
    <div>
      <label>전화번호:</label>
      <form:input path="phone" value="${principal.member.phone}"/>
      <form:errors path="phone" class="error" />
    </div>
    <div>
      <label>주소:</label>
      <form:input path="address" value="${principal.member.address}"/>
      <form:errors path="address" class="error" />
    </div>
    <div>
      <label>이메일:</label>
      <form:input path="email" value="${principal.member.email}"/>
      <form:errors path="email" class="error" />
    </div>
    <button type="submit" class="btn">회원수정</button>
  </form:form>
</div>
</body>
</html>
