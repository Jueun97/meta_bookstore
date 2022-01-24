<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            <ul>
                <li>category1</li>
                <li>category2</li>
                <li>category3</li>
                <li>category4</li>
                <li>category5</li>
                <li>category6</li>
            </ul>

        <main>

        </main>

    </content>
    <!-- footer 자리 -->
    <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
    
</body>
</html>


