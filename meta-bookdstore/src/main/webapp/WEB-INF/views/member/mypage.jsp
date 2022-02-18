<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<!-- 직접 만든 css -->
<link rel="stylesheet" href="/css/member/mypage.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!--header자리 -->
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/aside.jsp"></c:import>
	<!--     content here 내용은 여기에 넣어주세용  -->
	<main id="content">
		<div class="container">
			<div class="row">
				<div class="col-md-3 border-right">
					<h6
						class="font-weight-medium font-size-7 pt-5 pt-lg-8  mb-5 mb-lg-7">My
						account</h6>
					<div class="tab-wrapper">
						<ul class="my__account-nav nav flex-column mb-0" role="tablist"
							id="pills-tab">
							<li class="nav-item mx-0"><a
								class="nav-link d-flex align-items-center px-0"
								id="pills-two-example1-tab" href="/order/myorder" role="tab"
								aria-controls="pills-two-example1" aria-selected="false"> <span
									class="font-weight-normal text-gray-600">Orders</span>
							</a></li>

							<li class="nav-item mx-0"><a
								class="nav-link d-flex align-items-center px-0"
								id="pills-five-example1-tab" href="/member/mypage" role="tab"
								aria-controls="pills-five-example1" aria-selected="false"> <span
									class="font-weight-normal text-gray-600">Account details</span>
							</a></li>
							<li class="nav-item mx-0"><a
								class="nav-link d-flex align-items-center px-0" href="/logout">
									<span class="font-weight-normal text-gray-600">Logout</span>
							</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-9">
					<div class="tab-content" id="pills-tabContent">

						<div class="tab-pane fade show active" id="pills-five-example1"
							role="tabpanel" aria-labelledby="pills-five-example1-tab">
							<div class="border-bottom mb-6 pb-6 mb-lg-8 pb-lg-9">
								<div class="pt-5 pl-md-5 pt-lg-8 pl-lg-9">
									<h6
										class="font-weight-medium font-size-7 ml-lg-1 mb-lg-8 pb-xl-1">회원
										정보 조회</h6>
									<div class="font-weight-medium font-size-22 mb-4 pb-xl-1">회원
										정보 수정</div>
									<form:form action="/member/mypage" method="post"
										modelAttribute="memberUpdateDto"
										onsubmit="return checkSubmit();">
										<form:input path="m_no" type="hidden"
											value="${principal.member.m_no}" />
										<div class="row">
											<div class="col-md-12 mb-4">
												<div class="js-form-message">
													<label class="form-label">아이디 </label> <input type="text"
														style="width: 30%;" name="id"
														class="form-control rounded-0 height-4 px-4"
														readonly="true" value="${principal.member.id}" />
												</div>
											</div>
											<div class="col-md-12 mb-4">
												<div class="js-form-message">
													<label class="form-label">현재 비밀번호</label> <input
														type="password" style="width: 30%;"
														class="form-control rounded-0 height-4 px-4"
														name="password" id="password" placeholder="현재 비밀번호를 입력하세요">
												</div>
												<c:if test="${!empty errorMap}">
													<strong style="color: red;">${errorMap.password}</strong>
												</c:if>
											</div>
											<div class="col-md-12 mb-4">
												<div class="js-form-message">
													<label class="form-label">새로운 비밀번호</label> <input
														type="password" style="width: 30%;"
														class="form-control rounded-0 height-4 px-4"
														name="newpassword" id="newpassword"
														placeholder="새로운 비밀번호를 입력하세요">
												</div>
												<c:if test="${!empty errorMap}">
													<strong style="color: red;">${errorMap.newpassword}</strong>
												</c:if>
											</div>
											<div class="col-md-12 mb-4">
												<div class="js-form-message">
													<label class="form-label">이름 </label> <input type="text"
														style="width: 30%;" name="name"
														class="form-control rounded-0 height-4 px-4"
														readonly="true" value="${principal.member.name}" />
												</div>
											</div>
											<div class="col-md-12 mb-4">
												<div class="js-form-message js-focus-state">
													<label class="form-label">전화번호</label>
													<div class="telDiv">
														<form:input path="tel1" type="text" maxlength="3" size="4"
															id="tel1" onkeyup="to_auto_tel('tel1','tel2',3);"
															class="tel_form form-control rounded-0 height-4 px-4" />
														-
														<form:input path="tel2" type="text" maxlength="4" size="5"
															id="tel2" onkeyup="to_auto_tel('tel2','tel3',4);"
															class="tel_form form-control rounded-0 height-4 px-4" />
														-
														<form:input path="tel3" type="text" maxlength="4" size="5"
															id="tel3"
															class="tel_form form-control rounded-0 height-4 px-4" />
														<input type="hidden" name="phone" id="phone" />
													</div>
												</div>
												<c:if test="${!empty errorMap}">
													<strong style="color: red;">${errorMap.phone}</strong>
												</c:if>
											</div>
											<div class="col-md-12 mb-4">
												<div class="js-form-message">
													<label class="form-label">이메일</label> <br>
													<form:input path="email1" type="text"
														style="width: 30%; display: inline-block;"
														class="form-control rounded-0 height-4 px-4" name="email1"
														id="email1" placeholder="이메일을 입력" />
													@
													<form:input path="emailDomain" type="text"
														class="form-control rounded-0 height-4 px-4"
														id="emailDomain" name="emailDomain"
														style="width: 30%; display: inline-block;" />
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
											<div class="col-md-12 mb-4">
												<div class="js-form-message">
													<label class="form-label">주소</label>
													<div class="addrBtn">
														<input type="text" style="width: 30%"
															value="${principal.member.zipcode}"
															class="form-control rounded-0 height-2 px-2"
															name="zipcode" id="zipcode" placeholder="우편번호" readonly>
														<button type="button" class="btn btn-info"
															onClick="goPopup();">주소검색</button>
													</div>
													<c:if test="${!empty errorMap}">
														<strong style="color: red;">${errorMap.zipcode}</strong>
													</c:if>
													도로명 주소 <input type="text" style="margin-top: 10px;"
														value="${principal.member.roadAddress}"
														class="form-control rounded-0 height-4 px-4"
														name="roadAddress" id="roadAddress"
														placeholder="주소검색을 해주세요" readonly>
													<c:if test="${!empty errorMap}">
														<strong style="color: red;">${errorMap.roadAddress}</strong>
													</c:if>
													상세 주소 <input type="text" style="margin-top: 10px;"
														value="${principal.member.otherAddress}"
														class="form-control rounded-0 height-4 px-4"
														name="otherAddress" id="otherAddress" placeholder="상세주소">
													<br />
													<c:if test="${!empty errorMap}">
														<strong style="color: red;">${errorMap.otherAddress}</strong>
													</c:if>
												</div>
											</div>
										</div>
										<div class="ml-3">
											<button type="submit" style="margin-top: 10px;"
												class="btn btn-wide btn-dark text-white rounded-0 transition-3d-hover height-60 width-390">
												회원 정보 수정</button>
										</div>
									</form:form>
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
	<script>
		let principalPhone = '<c:out value='${principal.member.phone}'/>';
		let phoneArr = principalPhone.split("-");
		$("#tel1").val(phoneArr[0]);
		$("#tel2").val(phoneArr[1]);
		$("#tel3").val(phoneArr[2]);
		
		let completeEmail = '<c:out value='${principal.member.email}'/>';
		let emailArr = completeEmail.split("@");
		$("#email1").val(emailArr[0]);
		$("#emailDomain").val(emailArr[1]);
	  	$(function(){
	  		${(empty msg)?"":"alert('" += msg += "');"};
	  	});
	</script>
	<script src="/js/member/mypage.js"></script>
</body>
</html>


