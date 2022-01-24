<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="${R}common.css">
  <style>
    h1 { text-align: center; }
    form { padding: 10px 30px 30px 30px; width: 300px; }
    button { margin-top: 20px; margin-left: 50px; }
    .error { color: red; }
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script>
  	$(function(){
  		${(empty msg)?"":"alert('" += msg += "');"};
  	});
  </script>
</head>
<body>
<div class="container">
  <form method="post" action="${R}member/login" class="box">
    <h1>로그인</h1>
    <!-- csrf공격방어 -->
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <table>
      <tr>
        <td>아이디:</td>
        <td><input type="text" name="id" /></td>
      </tr>
      <tr>
        <td>비밀번호:</td>
        <td><input type="password" name="password" /></td>
      </tr>
    </table>
    <button type="submit" class="btn">로그인</button>
    <button type="button" class="btn" onclick="location.href='/member/register';">회원가입</button>

    <c:if test="${ param.error != null }">
      <div class="error">로그인 실패</div>
    </c:if>
  </form>
</div>
</body>
</html>
