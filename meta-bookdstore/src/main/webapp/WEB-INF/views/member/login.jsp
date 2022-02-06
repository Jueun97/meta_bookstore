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
	<form class="account">
		<!-- Login -->
		<div id="login" data-target-group="idForm">
			<!-- Title -->
			<header class="border-bottom px-4 px-md-6 py-4">
				<h2 class="font-size-3 mb-0 d-flex align-items-center">
					<i class="flaticon-user mr-3 font-size-5"></i>Account
				</h2>
			</header>
			<!-- End Title -->

			<div class="p-4 p-md-6">
				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label id="signinEmailLabel" class="form-label" for="signinEmail">Username
							or email *</label> <input type="email"
							class="form-control rounded-0 height-4 px-4" name="email"
							id="signinEmail" placeholder="creativelayers088@gmail.com"
							aria-label="creativelayers088@gmail.com"
							aria-describedby="signinEmailLabel" required>
					</div>
				</div>
				<!-- End Form Group -->

				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label id="signinPasswordLabel" class="form-label"
							for="signinPassword">Password *</label> <input type="password"
							class="form-control rounded-0 height-4 px-4" name="password"
							id="signinPassword" placeholder="" aria-label=""
							aria-describedby="signinPasswordLabel" required>
					</div>
				</div>
				<!-- End Form Group -->

				<div class="d-flex justify-content-between mb-5 align-items-center">
					<!-- Checkbox -->
					<div class="js-form-message">
						<div
							class="custom-control custom-checkbox d-flex align-items-center text-muted">
							<input type="checkbox" class="custom-control-input"
								id="termsCheckbox" name="termsCheckbox" required> <label
								class="custom-control-label" for="termsCheckbox"> <span
								class="font-size-2 text-secondary-gray-700"> Remember me
							</span>
							</label>
						</div>
					</div>
					<!-- End Checkbox -->

					<a
						class="text-dark font-size-2 t-d-u link-muted font-weight-medium"
						href="/member/find"
						data-target="#forgotPassword" data-link-group="idForm"
						data-animation-in="fadeIn">Forgot Password?</a>
				</div>

				<div class="mb-4d75">
					<button type="submit" class="btn btn-block py-3 rounded-0 btn-dark">Sign
						In</button>
				</div>

				<div class="mb-2">
					<a href="/member/register"
						class=" btn btn-block py-3 rounded-0 btn-outline-dark font-weight-medium"
						data-target="#signup" data-link-group="idForm"
						data-animation-in="fadeIn">Create Account</a>
				</div>
			</div>
		</div>
	</form>




	<!-- footer 자리 -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/script.jsp"></c:import>

</body>
</html>


