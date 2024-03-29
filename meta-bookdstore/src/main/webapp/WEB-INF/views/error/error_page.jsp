<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>403권한없음.</title>
<!-- Title -->
<title>403권한없음.</title>

<!-- Required Meta Tags Always Come First -->


<!-- Favicon -->
<link rel="shortcut icon" href="/img/favicon.png">

<!-- Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="/vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="/vendor/flaticon/font/flaticon.css">
<link rel="stylesheet" href="/vendor/animate.css/animate.css">
<link rel="stylesheet"
	href="/vendor/bootstrap-select/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="/vendor/slick-carousel/slick/slick.css" />
<link rel="stylesheet"
	href="/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">

<!-- CSS Bookworm Template -->
<link rel="stylesheet" href="/css/theme.css">
</head>
<body>
	<!--header자리 -->
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/aside.jsp"></c:import>

	<!--     content here 내용은 여기에 넣어주세용  -->
	<main id="content">
		<div class="container">
			<div class="space-bottom-1 space-top-xl-2 space-bottom-xl-4">
				<div
					class="d-flex flex-column align-items-center pt-lg-7 pb-lg-4 pb-lg-6">
					<div
						class="font-weight-medium font-size-200 font-size-xs-170 text-lh-sm mt-xl-1">500</div>
					<h6 class="font-size-4 font-weight-medium mb-2">내부 오류가 있습니다. 관리자에게 문의하세요!</h6>
					<span class="font-size-2 mb-6">You could either go back or
						go to homepage</span>
					<div class="d-flex align-items-center flex-column">
						<button type="submit" onclick="history.back()"
							class="btn btn-dark rounded-0 btn-wide height-60 width-250 font-weight-medium">Go
							Back</button>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- footer 자리 -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/script.jsp"></c:import>

</body>
</html>


