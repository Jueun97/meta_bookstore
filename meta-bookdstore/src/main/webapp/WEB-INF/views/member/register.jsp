<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url var="R" value="/" />
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
  <h1>회원 가입</h1>
 <form:form method="post" modelAttribute="memberRegDto">
    <div>
      <label>아이디:</label>
      <form:input path="id" />
      <form:errors path="id" class="error" />
    </div>
    <div>
      <label>비밀번호:</label>
      <form:password path="password1" />
      <form:errors path="password1" class="error" />
    </div>
    <div>
      <label>비밀번호 확인:</label>
      <form:password path="password2" />
      <form:errors path="password2" class="error" />
    </div>
    <div>
      <label>이름:</label>
      <form:input path="name" />
      <form:errors path="name" class="error" />
    </div>
    <div>
      <label>전화번호:</label>
      <form:input path="phone" />
      <form:errors path="phone" class="error" />
    </div>
    <div>
      <label>주소:</label>
      <form:input path="address" />
      <form:errors path="address" class="error" />
    </div>
    <div>
      <label>이메일:</label>
      <form:input path="email" />
      <form:errors path="email" class="error" />
    </div>
    <button type="submit" class="btn">회원가입</button>
  </form:form>
</div>
</body>
</html>
