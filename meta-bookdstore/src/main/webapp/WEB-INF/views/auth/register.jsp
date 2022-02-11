<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<!-- 직접 만든 css -->
<link rel="stylesheet" href="/css/auth/register.css">

</head>
<body>
	<!--header자리 -->
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/aside.jsp"></c:import>
	<!--     content here 내용은 여기에 넣어주세용  -->
	<form:form class="account" method="post" action="/auth/register" modelAttribute="memberRegDto"
		onsubmit="return checkSubmit();">
		<!-- Signup -->
		<div id="signup" data-target-group="idForm">
			<!-- Title -->
			<header class="border-bottom px-4 px-md-6 py-4">
				<h2 class="font-size-3 mb-0 d-flex align-items-center">
					<i class="flaticon-resume mr-3 font-size-5"></i>회원 가입
				</h2>
			</header>
			<!-- End Title -->

			<div class="p-4 p-md-6">
				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label class="form-label" for="id">아이디</label> <form:input path="id" type="text"
							style="width: 30%;" class="form-control rounded-0 height-4 px-4"
							name="id" title="영어,숫자만 가능합니다" id="id" placeholder="아이디를 입력하세요"
							pattern="^[a-zA-Z0-9]+$"/>
						<c:if test="${!empty errorMap}">
							<strong style="color: red;">${errorMap.id}</strong>
						</c:if>
						<div id="checkId"></div>
					</div>
				</div>
				<!-- End Form Group -->

				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label class="form-label">비밀번호</label> <input type="password"
							style="width: 30%;" class="form-control rounded-0 height-4 px-4"
							name="password" id="password" placeholder="비밀번호를 입력하세요"
							aria-label="" aria-describedby="signinPasswordLabel1">
					</div>
					<c:if test="${!empty errorMap}">
						<strong style="color: red;">${errorMap.password}</strong>
					</c:if>
				</div>
				<!-- End Form Group -->

				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label class="form-label">비밀번호 확인</label> <input type="password"
							style="width: 30%;" class="form-control rounded-0 height-4 px-4"
							name="password1" id="password1" placeholder="다시 비밀번호를 입력해주세요"
							aria-label="" aria-describedby="signupConfirmPasswordLabel">
					</div>
					<div id="passwordCheck"></div>
				</div>
				<!-- End Form Group -->
				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label id="name" class="form-label" for="name">이름</label> 
						<form:input path="name" 
							type="text" style="width: 30%"
							class="form-control rounded-0 height-4 px-4" name="name"
							id="name" placeholder="이름을 입력하세요"/>
					</div>
					<c:if test="${!empty errorMap}">
						<strong style="color: red;">${errorMap.name}</strong>
					</c:if>
				</div>
				<!-- End Form Group -->

				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label class="form-label">전화번호</label>
						<div class="telDiv">
							<form:input path="tel1" type="text" maxlength="3" size="4" id="tel1"
								onkeyup="to_auto_tel('tel1','tel2',3);"
								class="tel_form form-control rounded-0 height-4 px-4"/> -
							<form:input path="tel2" type="text" maxlength="4" size="5" id="tel2"
								onkeyup="to_auto_tel('tel2','tel3',4);"
								class="tel_form form-control rounded-0 height-4 px-4"/> -
							<form:input path="tel3" type="text" maxlength="4" size="5" id="tel3"
								class="tel_form form-control rounded-0 height-4 px-4"/> <input
								type="hidden" name="phone" id="phone" />
						</div>
					</div>
					<c:if test="${!empty errorMap}">
						<strong style="color: red;">${errorMap.phone}</strong>
					</c:if>
				</div>
				<!-- End Form Group -->
				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label class="form-label">이메일</label> <br> <form:input path="email1"  type="text"
							style="width: 30%; display: inline-block;"
							class="form-control rounded-0 height-4 px-4" name="email1"
							id="email1" placeholder="이메일을 입력"/> @ <form:input path="emailDomain"  type="text"
							class="form-control rounded-0 height-4 px-4" id="emailDomain"
							name="emailDomain" style="width: 30%; display: inline-block;"/>
						<select name="emailDomain" id="emailDomain"
							onChange="selectEmailChange(this.value);" title="직접입력"
							style="width: 20%;">
							<option value="">직접입력</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="naver.com">naver.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="paran.com">paran.com</option>
							<option value="nate.com">nate.com</option>
							<option value="google.com">google.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="empal.com">empal.com</option>
							<option value="korea.com">korea.com</option>
							<option value="freechal.com">freechal.com</option>
						</select>
					</div>
					<c:if test="${!empty errorMap}">
						<strong style="color: red;">${errorMap.email}</strong>
					</c:if>
					<input type="hidden" name="email" id="email" />
				</div>
				<!-- End Form Group -->
				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label class="form-label">주소</label>
						<div class="addrBtn">
							<input type="text" style="width: 30%"
								class="form-control rounded-0 height-2 px-2" name="zipcode"
								id="zipcode" placeholder="우편번호" readonly/>
							<button type="button" class="btn btn-info" onClick="goPopup();">주소검색</button>
						</div>
					<c:if test="${!empty errorMap}">
						<strong style="color: red;">${errorMap.zipcode}</strong>
					</c:if>
					<br />
						도로명 주소 <input type="text" path="roadAddress" style="margin-top: 10px;"
							class="form-control rounded-0 height-4 px-4" name="roadAddress"
							id="roadAddress" placeholder="주소검색을 해주세요" readonly/>
					<c:if test="${!empty errorMap}">
						<strong style="color: red;">${errorMap.roadAddress}</strong>
					</c:if>
					<br />
						 상세 주소
						<input type="text" path="otherAddress" type="text" style="margin-top: 10px;"
							class="form-control rounded-0 height-4 px-4" name="otherAddress"
							id="otherAddress" placeholder="상세주소"/>
					<br />
					<c:if test="${!empty errorMap}">
						<strong style="color: red;">${errorMap.otherAddress}</strong>
					</c:if>
					</div>
				</div>
				<!-- End Form Group -->

				<!-- End Input -->
				<div class="mb-3">
					<button type="submit" class="btn btn-block py-3 rounded-0 btn-dark">Create
						Account</button>
				</div>

				<div class="text-center mb-4">
					<span class="small text-muted">Already have an account?</span> <a
						class=" small" href="/auth/login" data-target="#login"
						data-link-group="idForm" data-animation-in="fadeIn">Login </a>
				</div>
			</div>
		</div>
		<!-- End Signup -->
  </form:form>

	<!-- footer 자리 -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/script.jsp"></c:import>
	<script src="/js/auth/register.js"></script>
</body>
</html>


