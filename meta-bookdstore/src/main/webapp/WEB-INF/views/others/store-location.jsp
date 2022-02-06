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
		<div class="row no-gutters">
			<div class="col-lg-5 order-1 order-lg-0">
				<div class="p-4 px-md-9 pt-md-9 pb-md-10">
					<h6 class="font-weight-medium font-size-7 mb-5">Locate a Store</h6>
					<div class="mb-5">
						<!-- Search Property Input -->
						<form class="js-focus-state">
							<div class="input-group border">
								<input type="text"
									class="form-control rounded-0 border-0 placeholder-color-3 pl-4 font-size-2"
									name="email" id="searchSrEmailExample1"
									placeholder="Country/Region, state, city, street…"
									aria-label="Your email address"
									aria-describedby="searchButtonExample2" required>
								<div class="input-group-append">
									<button
										class="btn bg-white pr-3 rounded-0 box-shadow-focus-none"
										type="submit" id="searchButtonExample2">
										<span class="flaticon-loupe text-dark"></span>
									</button>
								</div>
							</div>
						</form>
						<!-- Search Property Input -->
					</div>
					<div>
						<button type="submit"
							class="btn btn-wide btn-dark text-white rounded-0 transition-3d-hover height-60 w-100">Near
							Me</button>
					</div>
				</div>
				<div class="js-scrollbar height-100vh-main pt-8">
					<h6 class="font-size-7 font-weight-medium mb-4 pl-4 pl-md-9">Our
						Stores</h6>
					<ul class="list-unstyled">
						<li class="px-5 px-md-9">
							<div class="border-bottom mb-5 pb-5">
								<h6 class="font-size-3 font-weight-medium">London</h6>
								<address class="font-size-2 mb-2">
									<span class="font-weight-normal text-gray-600"> Bedford
										St, Covent Garden, London WC2E 9ED <br> United Kingdom
									</span>
								</address>
								<span class="font-size-2 d-block link-black-100">+1
									246-345-0695 </span>
							</div>
						</li>
						<li class="px-5 px-md-9">
							<div class="border-bottom mb-5 pb-5">
								<h6 class="font-size-3 font-weight-medium">London</h6>
								<address class="font-size-2 mb-2">
									<span class="font-weight-normal text-gray-600"> Bedford
										St, Covent Garden, London WC2E 9ED <br> United Kingdom
									</span>
								</address>
								<span class="font-size-2 d-block link-black-100">+1
									246-345-0695 </span>
							</div>
						</li>
						<li class="px-5 px-md-9">
							<div class="border-bottom mb-5 pb-5">
								<h6 class="font-size-3 font-weight-medium">London</h6>
								<address class="font-size-2 mb-2">
									<span class="font-weight-normal text-gray-600"> Bedford
										St, Covent Garden, London WC2E 9ED <br> United Kingdom
									</span>
								</address>
								<span class="font-size-2 d-block link-black-100">+1
									246-345-0695 </span>
							</div>
						</li>
						<li class="px-5 px-md-9">
							<div class="border-bottom mb-5 pb-5">
								<h6 class="font-size-3 font-weight-medium">London</h6>
								<address class="font-size-2 mb-2">
									<span class="font-weight-normal text-gray-600"> Bedford
										St, Covent Garden, London WC2E 9ED <br> United Kingdom
									</span>
								</address>
								<span class="font-size-2 d-block link-black-100">+1
									246-345-0695 </span>
							</div>
						</li>
						<li class="px-5 px-md-9">
							<div class="border-bottom mb-0 pb-5">
								<h6 class="font-size-3 font-weight-medium">London</h6>
								<address class="font-size-2 mb-2">
									<span class="font-weight-normal text-gray-600"> Bedford
										St, Covent Garden, London WC2E 9ED <br> United Kingdom
									</span>
								</address>
								<span class="font-size-2 d-block link-black-100">+1
									246-345-0695 </span>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-7 height-400-md-down">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15544.315136188916!2d80.28787859999998!3d13.09419335!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x7f6b00bf787831af!2sApollo%20City%20Centre%20Hospital%20Sowcarpet!5e0!3m2!1sen!2sin!4v1580992215999!5m2!1sen!2sin"
					style="border: 0; width: 100%; height: 100%;" allowfullscreen=""></iframe>
			</div>
		</div>
	</main>




	<!-- footer 자리 -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/script.jsp"></c:import>

</body>
</html>


