<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authorize access="isAuthenticated()">
   <!-- isAuthenticated() : 인증된 정보(세션)에 접근하는 방법 -->
   <sec:authentication property="principal" var="principal" />
   <!-- var="principal" : 세션정보를 담을 변수 => $principal.user~~}이런식으로 다른 jsp에서 쓰기-->
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>include</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
    <!--header자리 -->
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>


    <div class="line"></div>
    <content>
        <!--header자리 -->
		<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>

        <main>

        </main>

    </content>
    <!-- footer 자리 -->
    <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
    
</body>
</html>


