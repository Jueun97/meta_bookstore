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
	<form class="account">
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
						<label id="id" class="form-label"
							for="signinEmail1">아이디</label> <input type="id"
							class="form-control rounded-0 height-4 px-4" name="id"
							id="signinEmail1" placeholder="아이디를 입력하세요" required>
					</div>
				</div>
				<!-- End Form Group -->

				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label id="password" class="form-label"
							for="password">비밀번호</label> <input type="password"
							class="form-control rounded-0 height-4 px-4" name="password"
							id="password" placeholder="비밀번호를 입력하세요" aria-label=""
							aria-describedby="signinPasswordLabel1" required>
					</div>
				</div>
				<!-- End Form Group -->

				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label id="password" class="form-label"
							for="password">비밀번호 확인</label> <input
							type="password" class="form-control rounded-0 height-4 px-4"
							name="password" id="signupConfirmPassword" placeholder="비밀번호를 동일하게 한번 더 입력해주세요"
							aria-label="" aria-describedby="signupConfirmPasswordLabel"
							required>
					</div>
				</div>
				<!-- End Form Group -->
				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label id="name" class="form-label"
							for="name">이름</label> <input type="text"
							class="form-control rounded-0 height-4 px-4" name="name"
							id="name" placeholder="이름을 입력하세요" required>
					</div>
				</div>
				<!-- End Form Group -->
				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label class="form-label">전화번호</label>
						<div class="telDiv">
						<input type="text" maxlength="3" size="4" id="tel1" class="tel_form form-control rounded-0 height-4 px-4"> 
			            - <input type="text" maxlength="4" size="5" id="tel2" class="tel_form form-control rounded-0 height-4 px-4"> 
			            - <input type="text" maxlength="4" size="5" id="tel3" class="tel_form form-control rounded-0 height-4 px-4">
            		</div> 
					</div>
				</div>
				<!-- End Form Group -->
				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label class="form-label">이메일</label> <br>	
						<input type="text" style="width: 30%; display:inline-block;"
						class="form-control rounded-0 height-4 px-4" name="email1"
						id="email1" placeholder="이메일을 입력" required>
						@ <input type="text" class="form-control rounded-0 height-4 px-4" id="email2" name="email2" style="width: 30%; display:inline-block;">
						<select name="email2" onChange="selectEmailChange(this.value);"	title="직접입력" style="width: 20%;">
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
				</div>
				<!-- End Form Group -->
				<!-- Form Group -->
				<div class="form-group mb-4">
					<div class="js-form-message js-focus-state">
						<label class="form-label" for="address">주소</label> 
							<div class="addrBtn">
								<input type="text" style="width: 30%"
								class="form-control rounded-0 height-2 px-2" name="zipcode"
								id="zipcode" placeholder="우편번호" required readonly>
								<button type="button" class="btn btn-info" onClick="goPopup();">주소검색</button>								
							</div>
							도로명 주소
							<input type="text" style="margin-top: 10px;"
							class="form-control rounded-0 height-4 px-4" name="address"
							id="address" placeholder="주소검색을 해주세요" required readonly>
							상세 주소
							<input type="text" style="margin-top: 10px;"
							class="form-control rounded-0 height-4 px-4" name="otheraddress"
							id="otheraddress" placeholder="상세주소" required>
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
						class=" small" href="/auth/login"
						data-target="#login" data-link-group="idForm"
						data-animation-in="fadeIn">Login </a>
				</div>
			</div>
		</div>
		<!-- End Signup -->
	</form>





	<!-- footer 자리 -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/script.jsp"></c:import>
<script>
	function goPopup(){
		var pop = window.open("/auth/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			var addressEl = document.querySelector("#address");
			addressEl.value = roadAddrPart1;
			var addrDetailEl = document.querySelector("#otheraddress");
			addrDetailEl.value = addrDetail;
			var zipNoEl = document.querySelector("#zipcode");
			zipNoEl.value = zipNo;
	}
	function selectEmailChange(value){
		//alert("값 변경 테스트" + value);
		var email2 = document.getElementById("email2");
		email2.value = value;
	}
</script>
</body>
</html>


