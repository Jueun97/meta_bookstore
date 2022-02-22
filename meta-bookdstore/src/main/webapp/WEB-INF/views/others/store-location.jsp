<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<sec:authorize access="isAuthenticated()">
	<!-- isAuthenticated() : 인증된 정보(세션)에 접근하는 방법 -->
	<sec:authentication property="principal" var="principal" />
	<!-- var="principal" : 세션정보를 담을 변수 => $principal.user~~}이런식으로 다른 jsp에서 쓰기-->
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MetaBookStore</title>
<!-- Title -->
<title>base</title>

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
		<div class="row no-gutters">
			<div class="col-lg-5 order-1 order-lg-0">
				<div class="p-2 px-md-7 pt-md-7 pb-md-8">
					<h6 class="font-weight-medium font-size-7 mb-5">Preview</h6>
					<img src="/img/metabookstore.png" style="width: 100%;">
				</div>
				<div class="js-scrollbar height-100vh-main pt-8">
					<h6 class="font-size-7 font-weight-medium mb-4 pl-4 pl-md-9">Our
						Store</h6>
					<ul class="list-unstyled">
						<li class="px-5 px-md-9">
							<div class="border-bottom mb-5 pb-5">
								<h6 class="font-size-3 font-weight-medium">Seoul</h6>
								<address class="font-size-2 mb-2">
									<span class="font-weight-normal text-gray-600"> 서울특별시
										종로구 연지동 종로33길 15 </span>
								</address>
								<span class="font-size-2 d-block link-black-100">02-3704-5000s</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-7 height-400-md-down mt-8" >
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4305.093522671271!2d126.99290336805144!3d37.567930320720606!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e6172ee243%3A0x724f226c9b2c836f!2z66mU7YOA64S3!5e0!3m2!1sko!2skr!4v1645429743414!5m2!1sko!2skr"
					style="border: 0; width: 95%; height: 80%;" allowfullscreen=""
					loading="lazy"></iframe>
			</div>
		</div>
	</main>




	<!-- footer 자리 -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/script.jsp"></c:import>

</body>
</html>


