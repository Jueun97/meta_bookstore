<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="/css/font.css">
<style>
figure.mb-0 {
	display: flex;
	flex-direction: column;
	align-items: center;
}

figure.mb-0 img {
	width: 50%;
}

figure.mb-0 span {
	margin-top: 20px;
}
</style>
</head>
<body>
	<!--header자리 -->
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/aside.jsp"></c:import>

	<!--  content here 내용은 여기에 넣어주세용 -->
	<section class="space-bottom-3 mt-5">
		<div class="container">
			<div class="js-slick-carousel u-slick"
				data-pagi-classes="d-xl-none text-center u-slick__pagination u-slick__pagination mt-7"
				data-arrows-classes="d-none d-xl-block u-slick__arrow u-slick__arrow--v1 u-slick__arrow-centered--y rounded-circle"
				data-arrow-left-classes="flaticon-back u-slick__arrow-inner u-slick__arrow-inner--left ml-lg-2"
				data-arrow-right-classes="flaticon-next u-slick__arrow-inner u-slick__arrow-inner--right mr-lg-2">
				<div class="bg-primary-yellow rounded-md px-5 px-xl-11 space-1"
					style="height: 500px;">
					<div class="hero-slider">
						<div class="media row" style="width: 85%; margin: auto;">
							<div
								class="col-md-6 col-xl-4 hero__body media-body align-self-center mb-5 mb-lg-0">
								<p
									class="hero__pretitle text-uppercase text-primary-home-v3 opacity-md font-weight-bold mb-2 pb-1">HURRY
									UP BEFORE OFFER WILL END</p>
								<h2 class="hero__title text-primary-home-v3 font-size-14 mb-4">
									이달의 작가</h2>
								<a href=""
									class="hero__btn btn btn-primary-home-v3 text-primary-yellow btn-wide rounded-md">Hire
									Now</a>
							</div>
							<div class="col-md-6 col-xl position-relative mb-5 mb-lg-0">

							</div>
							<div class="col-xl-4 align-self-center test">
								<img src="/img/jueun.jpeg" class="img-fluid align-self-center "
									alt="image-description">
								<div
									class="d-none badge badge-lg badge-primary-home-v3 position-absolute badge-pos--top-right text-primary-yellow rounded-circle d-xl-flex flex-column align-items-center justify-content-center"
									style="top: 30px;">
									<h6 class="font-weight-medium mb-n2">추천</h6>
									<span class="font-size-5 font-weight-medium">Best</span>
								</div>
								<div class="deal-progress">
									<span class="font-size-4 font-weight-medium ">2022 메타넷 대우정보 인턴3기</span>
									<br> <span class="font-size-3 ">장주은</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="bg-primary-yellow rounded-md px-5 px-xl-11 space-1"
					style="height: 500px;">
					<div class="hero-slider">
						<div class="media row" style="width: 85%; margin: auto;">
							<div
								class="col-md-6 col-xl-4 hero__body media-body align-self-center mb-5 mb-lg-0">
								<p
									class="hero__pretitle text-uppercase text-primary-home-v3 opacity-md font-weight-bold mb-2 pb-1">HURRY
									UP BEFORE OFFER WILL END</p>
								<h2 class="hero__title text-primary-home-v3 font-size-14 mb-4">
									<span class="hero__title--1 font-weight-regular d-block">이달의
										작가 
								</h2>
								<a href=""
									class="hero__btn btn btn-primary-home-v3 text-primary-yellow btn-wide rounded-md">Hire
									Now</a>
							</div>
							<div class="col-md-6 col-xl position-relative mb-5 mb-lg-0">

							</div>
							<div class="col-xl-4 align-self-center test">
								<img src="/img/uihyoen.jpeg"
									class="img-fluid align-self-center " alt="image-description"
									style="height: 280px;">
								<div
									class="d-none badge badge-lg badge-primary-home-v3 position-absolute badge-pos--top-right text-primary-yellow rounded-circle d-xl-flex flex-column align-items-center justify-content-center"
									style="top: 30px;">
									<h6 class="font-weight-medium mb-n2">추천</h6>
									<span class="font-size-5 font-weight-medium">Best</span>
								</div>
								<div class="deal-progress">
									<span class="font-size-4 font-weight-medium ">2022 메타넷 대우정보 인턴3기</span>
									<br> <span class="font-size-3 ">김의현</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="bg-primary-yellow rounded-md px-5 px-xl-11 space-1"
					style="height: 500px;">
					<div class="hero-slider">
						<div class="media row" style="width: 85%; margin: auto;">
							<div
								class="col-md-6 col-xl-4 hero__body media-body align-self-center mb-5 mb-lg-0">
								<p
									class="hero__pretitle text-uppercase text-primary-home-v3 opacity-md font-weight-bold mb-2 pb-1">HURRY
									UP BEFORE OFFER WILL END</p>
								<h2 class="hero__title text-primary-home-v3 font-size-14 mb-4">
									이달의 작가</h2>
								<a href=""
									class="hero__btn btn btn-primary-home-v3 text-primary-yellow btn-wide rounded-md">Hire
									Now</a>
							</div>
							<div class="col-md-6 col-xl position-relative mb-5 mb-lg-0">

							</div>
							<div class="col-xl-4 align-self-center test">
								<img src="/img/mk.jpeg" class="img-fluid align-self-center "
									alt="image-description" style="height: 280px;">
								<div
									class="d-none badge badge-lg badge-primary-home-v3 position-absolute badge-pos--top-right text-primary-yellow rounded-circle d-xl-flex flex-column align-items-center justify-content-center"
									style="top: 30px;">
									<h6 class="font-weight-medium mb-n2">추천</h6>
									<span class="font-size-5 font-weight-medium">Best</span>
								</div>
								<div class="deal-progress">
									<span class="font-size-4 font-weight-medium ">2022 메타넷 대우정보 인턴3기</span>
									<br> <span class="font-size-3">여민기</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="space-bottom-3">
		<div class="container">
			<header
				class="d-md-flex justify-content-between align-items-center mb-5">
				<h2 class="font-size-7 mb-4 mb-md-0">Featured Categories</h2>
				<a href="/book/list" class="d-flex h-primary">All Categories<span
					class="flaticon-next font-size-3 ml-2"></span>
				</a>
			</header>

			<ul id="cate_hover"
				class="px-5 nav justify-content-between bg-gray-200 rounded-md pb-2 py-md-3 mb-5 flex-nowrap  overflow-auto overflow-xl-visible"
				role="tablist">
				<li class="nav-item flex-shrink-0 flex-xl-shrink-1"
					data-cateno="100"><a
					class="nav-link font-weight-medium active nav-link-caret"
					id="pills-one-example2-tab" href="/book/list?cate_no=100"
					role="tab" aria-controls="pills-one-example2" aria-selected="true">
						<div class="text-center">
							<figure class="mb-0 text-primary-indigo">
								<!-- 								<i class="glyph-icon flaticon-gallery font-size-12"></i> -->
								<img src="/img/mainImg/100_fiction.png" alt="fiction" />
								<span class="tabtext font-size-3 font-weight-medium text-dark">Fiction</span>
							</figure>
						</div>
				</a></li>
				<li class="nav-item flex-shrink-0 flex-xl-shrink-1"
					data-cateno="110"><a
					class="nav-link font-weight-medium nav-link-caret"
					id="pills-two-example2-tab" href="/book/list?cate_no=110"
					role="tab" aria-controls="pills-two-example2" aria-selected="true">
						<div class="text-center">
							<figure class="mb-0 text-tangerine">
								<!-- 								<i class="glyph-icon flaticon-cook font-size-12"></i> -->
								<img src="/img/mainImg/110_poetry.png" alt="Poetry" />
								<span class="tabtext font-size-3 font-weight-medium text-dark">Poetry</span>
							</figure>
						</div>
				</a></li>
				<li class="nav-item flex-shrink-0 flex-xl-shrink-1"
					data-cateno="120"><a
					class="nav-link font-weight-medium nav-link-caret"
					id="pills-three-example2-tab" href="/book/list?cate_no=120"
					role="tab" aria-controls="pills-three-example2"
					aria-selected="true">
						<div class="text-center">
							<figure class="mb-0 text-chili">
								<!-- 								<i class="glyph-icon flaticon-like font-size-12"></i> -->
								<img src="/img/mainImg/120_Humanity.png" alt="Humanity" />
								<span class="tabtext font-size-3 font-weight-medium text-dark">Humanity</span>
							</figure>
						</div>
				</a></li>
				<li class="nav-item flex-shrink-0 flex-xl-shrink-1"
					data-cateno="130"><a
					class="nav-link font-weight-medium nav-link-caret"
					id="pills-four-example2-tab" href="/book/list?cate_no=130"
					role="tab" aria-controls="pills-four-example2" aria-selected="true">
						<div class="text-center">
							<figure class="mb-0 text-carolina">
								<!-- 									<i class="glyph-icon flaticon-doctor font-size-12"></i> -->
								<img src="/img/mainImg/130_house.png" alt="house" />
								<span class="tabtext font-size-3 font-weight-medium text-dark">House</span>
							</figure>

						</div>
				</a></li>
				<li class="nav-item flex-shrink-0 flex-xl-shrink-1"
					data-cateno="140"><a
					class="nav-link font-weight-medium nav-link-caret"
					id="pills-five-example2-tab" href="/book/list?cate_no=140"
					role="tab" aria-controls="pills-five-example2" aria-selected="true">
						<div class="text-center">
							<figure class="mb-0 text-punch">
								<!-- 								<i class="glyph-icon flaticon-resume font-size-12"></i> -->
								<img src="/img/mainImg/140_Health.png" alt="health" />
								<span class="tabtext font-size-3 font-weight-medium text-dark">Health</span>
							</figure>
						</div>
				</a></li>
				<li class="nav-item flex-shrink-0 flex-xl-shrink-1"
					data-cateno="150"><a
					class="nav-link font-weight-medium nav-link-caret"
					id="pills-six-example2-tab" href="/book/list?cate_no=150"
					role="tab" aria-controls="pills-six-example2" aria-selected="true">
						<div class="text-center">
							<figure class="mb-0">
								<!-- 								<i class="icon glyph-icon flaticon-jogging font-size-12"></i> -->
								<img src="/img/mainImg/150_Leisure.png" alt="Leisure" />
								<span class="tabtext font-size-3 font-weight-medium text-dark">Leisure</span>
							</figure>
						</div>
				</a></li>
				<li class="nav-item flex-shrink-0 flex-xl-shrink-1"
					data-cateno="160"><a
					class="nav-link font-weight-medium nav-link-caret"
					id="pills-seven-example2-tab" href="/book/list?cate_no=160"
					role="tab" aria-controls="pills-seven-example2"
					aria-selected="true">
						<div class="text-center">
							<figure class="mb-0">
								<!-- 								<i class="icon glyph-icon flaticon-baby-boy font-size-12"></i> -->
								<img src="/img/mainImg/160_Economy.png" alt="Economy" />
								<span class="tabtext font-size-3 font-weight-medium text-dark">Economy</span>
							</figure>
						</div>
				</a></li>
			</ul>
		</div>
		<div class="container">
			<div class="tab-content">
				<div class="tab-pane fade active show" id="pills-one-example2"
					role="tabpanel" aria-labelledby="pills-one-example2-tab">
					<div class="pt-2 book_div_start">
						<!-- 여기서부터 바꾸기 -->
						<div class="pt-2">
							<div
								class="row row-cols-2 row-cols-md-3 row-cols-lg-4 row-cols-wd-6 ">

								<c:forEach items="${bookList}" var="bookVo">
									<div class="col">
										<div class="mb-5 products">
											<div
												class="product product__space border rounded-md bg-white">
												<div class="product__inner overflow-hidden p-3 p-md-4d875">
													<div
														class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
														<div class="woocommerce-loop-product__thumbnail">
															<a href="/book/detail/${bookVo.book_no}" class="d-block">
																<c:choose>
																	<c:when
																		test="${fn:substring(bookVo.image, 0, 5) eq 'https'}">
																		<img src="${bookVo.image}"
																			class="d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
																			alt="image-description" style="max-width: 45%;">
																	</c:when>
																	<c:otherwise>
																		<img src="/image/${bookVo.image}"
																			class="d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
																			alt="image-description" style="max-width: 45%;">
																	</c:otherwise>
																</c:choose>
															</a>
														</div>
														<div
															class="woocommerce-loop-product__body product__body pt-3 bg-white">

															<h2
																class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
																<a href="/book/detail/${bookVo.book_no}">${bookVo.title}</a>
															</h2>
															<div class="font-size-2  mb-1 text-truncate">
																<span class="text-gray-700">${bookVo.author}</span>
															</div>
															<div
																class="price d-flex align-items-center font-weight-medium font-size-3">
																<span class="woocommerce-Price-amount amount"><fmt:formatNumber
																		value="${bookVo.price}" pattern="###,###"></fmt:formatNumber>원</span>
															</div>

														</div>
														<c:choose>
															<c:when test="${bookVo.stock != 0}">
																<div class="product__hover d-flex align-items-center">
																	<span class="product__add-to-cart-text"
																		onClick="addToCart(${bookVo.book_no},${bookVo.price})">ADD
																		TO CART</span>
																</div>
															</c:when>
															<c:otherwise>
																<div class="product__hover d-flex align-items-center">
																	<span style="color: red;">품절</span>
																</div>
															</c:otherwise>
														</c:choose>

													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- footer 자리 -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/script.jsp"></c:import>
</body>
</html>


