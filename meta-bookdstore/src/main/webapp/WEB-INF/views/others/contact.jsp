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
<title>include</title>
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
		<div class="py-3 py-lg-7">
			<h6 class="font-weight-medium font-size-7 text-center my-1">Contact
				Us</h6>
		</div>
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4305.093522671271!2d126.99290336805144!3d37.567930320720606!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e6172ee243%3A0x724f226c9b2c836f!2z66mU7YOA64S3!5e0!3m2!1sko!2skr!4v1645429743414!5m2!1sko!2skr"
			height="500" style="border: 0; width: 100%;" allowfullscreen=""></iframe>
		<div class="container">
			<div class="space-bottom-1 space-bottom-lg-2">
				<div class="pb-4">
					<div class="col-lg-8 mx-auto">
						<div
							class="bg-white mt-n10 mt-md-n13 pt-5 pt-lg-7 px-3 px-md-5 pl-xl-10 pr-xl-3">
							<div class="ml-xl-4">
								<div class="mb-4 mb-lg-7">
									<h6 class="font-weight medium font-size-10 mb-4 mb-lg-7">Contact
										Information</h6>
									<p>우리는 Metanet DT의 인터넷 서점 MetaBookStore 입니다.</p>
									<p>저희 홈페이지에 방문하신 모든 고객분들께 감사의 인사드립니다.</p>
								</div>
								<div class="mb-4 mb-lg-8">
									<div class="row">
										<div class="col-md-6">
											<h6 class="font-weight-medium font-size-4 mb-4">종로
												Office</h6>
											<address class="font-size-2 mb-5">
												<span class="mb-2 font-weight-normal text-dark"> 서울특별시 종로구 연지동 종로33길 15</span>
											</address>
											<div>
												<a href="mailto:sale@bookworm.com"
													class="font-size-2 d-block link-black-100 mb-1">info@metanet.co.kr</a>
												<a href="02-3704-5000"
													class="font-size-2 d-block link-black-100">02-3704-5000</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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


