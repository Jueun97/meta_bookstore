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
<link rel="stylesheet" href="/css/book/book.css">
</head>
<body>
	<!--header자리 -->
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/aside.jsp"></c:import>

	<!--     content here 내용은 여기에 넣어주세용  -->
	<div id="primary" class="content-area">
		<main id="main" class="site-main ">
			<div class="product">
				<div>
					<div class="container">
						<div class="row space-2">
							<div
								class="d-flex align-items-center col-md-6 col-lg-5 offset-lg-1 woocommerce-product-gallery woocommerce-product-gallery--with-images images">
								<img src="${bookInfo.image}" alt="Image Description"
									class="mx-auto img-fluid" style="width: 35%;">
							</div>
							<div class="col-md-6 col-lg-5 summary entry-summary">
								<div class="border bg-white">
									<div class="py-4 px-5">
										<div class="border-bottom mb-4">
											<h1 class="product_title entry-title font-size-26 mb-3">${bookInfo.title }</h1>
											<div class="font-size-2 mb-4">
												<span class="ml-3 font-weight-medium">By (author)</span> <span
													class="ml-2 text-gray-600">${bookInfo.author}</span> <span
													class="ml-3 font-weight-medium"> | </span> <span
													class="ml-3">${bookInfo.publisher}</span> <span
													class="ml-3 font-weight-medium"> | </span> <span
													class="ml-3">${bookInfo.pubdate}</span>
											</div>

										</div>
										<p
											class="price font-size-22 font-weight-medium mb-4 d-flex justify-content-between">
											<span class="woocommerce-Price-amount amount">가격 : <fmt:formatNumber
													value="${bookInfo.price}" pattern="###,###"></fmt:formatNumber>원
											</span> <span class="woocommerce-Price-amount amount-for-checkout"
												data-price="${bookInfo.price}">[ 주문금액 : <fmt:formatNumber
													value="${bookInfo.price}" pattern="###,###"></fmt:formatNumber>원
												]
											</span>
										</p>



										<div class="cart mb-4 d-md-flex align-items-end" method=""
											enctype="multipart/form-data">
											<c:choose>
												<c:when test="${bookInfo.stock > 0}">
													<div class="quantity mb-4 mb-md-0">
														<label class="form-label font-size-2 font-weight-medium">Quantity</label>
														<!-- Quantity -->
														<div class="border px-3 w-100 d-flex align-items-center">
															<div class="js-quantity">
																<div class="d-flex align-items-center">
																	<label class="screen-reader-text sr-only">Quantity</label>
																	<a class="js-minus text-dark" href="javascript:;">
																		<svg xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="10px" height="1px">
                                                                    <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M-0.000,-0.000 L10.000,-0.000 L10.000,1.000 L-0.000,1.000 L-0.000,-0.000 Z" />
                                                                </svg>
																	</a> <input type="number" id="input-number"
																		class="input-text qty text js-result form-control text-center border-0"
																		step="1" min="1" max="${bookInfo.stock}"
																		data-action="details" name="quantity" value="1"
																		title="Qty"> <a class="js-plus text-dark"
																		href="javascript:;"> <svg
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="10px" height="10px">
                                                                    <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M10.000,5.000 L6.000,5.000 L6.000,10.000 L5.000,10.000 L5.000,5.000 L-0.000,5.000 L-0.000,4.000 L5.000,4.000 L5.000,-0.000 L6.000,-0.000 L6.000,4.000 L10.000,4.000 L10.000,5.000 Z" />
                                                                </svg>
																	</a>
																</div>
															</div>
														</div>
														<!-- End Quantity -->
													</div>
													<button name="add-to-cart" value="7145"
														onClick="addToCart(${bookInfo.book_no},${bookInfo.price})"
														class="btn btn-block ml-md-3 btn-dark border-0 rounded-0 p-3 single_add_to_cart_button button alt">Add
														to cart</button>
												</c:when>
												<c:otherwise>
													<button name="add-to-cart" value="7145"
														class="btn btn-block ml-md-3 btn-dark border-0 rounded-0 p-3 single_add_to_cart_button button alt">품절</button>
												</c:otherwise>
											</c:choose>

										</div>


									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Features Section -->
				<div class="woocommerce-tabs wc-tabs-wrapper mb-10">
					<!-- Nav Classic -->
					<ul
						class="tabs wc-tabs nav border-bottom justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble"
						id="pills-tab" role="tablist">
						<li class="flex-shrink-0 flex-md-shrink-1 nav-item"><a
							class="py-4d75 nav-link font-weight-medium active"
							id="pills-one-example1-tab" data-toggle="pill"
							href="#pills-one-example1" role="tab"
							aria-controls="pills-one-example1" aria-selected="true">
								Description </a></li>
					</ul>
					<!-- End Nav Classic -->

					<!-- Tab Content -->
					<div class="tab-content container" id="pills-tabContent">
						<div
							class="woocommerce-Tabs-panel panel col-xl-8 offset-xl-2 entry-content wc-tab tab-pane fade pt-9 show active"
							id="pills-one-example1" role="tabpanel"
							aria-labelledby="pills-one-example1-tab"
							style="font-size: 1.135rem;">
							${bookInfo.description}
							<!-- End Mockup Block -->
						</div>
					</div>
					<!-- End Tab Content -->
				</div>
				<!-- End Features Section -->


				<section class="space-bottom-3">
					<div class="container">
						<header
							class="mb-5 d-md-flex justify-content-between align-items-center">
							<h2 class="font-size-7 mb-3 mb-md-0">Related Books</h2>
						</header>
						<div
							class="js-slick-carousel products no-gutters border-top border-left border-right"
							data-arrows-classes="u-slick__arrow u-slick__arrow-centered--y"
							data-arrow-left-classes="fas fa-chevron-left u-slick__arrow-inner u-slick__arrow-inner--left ml-lg-n10"
							data-arrow-right-classes="fas fa-chevron-right u-slick__arrow-inner u-slick__arrow-inner--right mr-lg-n10"
							data-slides-show="5"
							data-responsive='[{
                               "breakpoint": 1500,
                               "settings": {
                                 "slidesToShow": 4
                               }
                            },{
                               "breakpoint": 1199,
                               "settings": {
                                 "slidesToShow": 3
                               }
                            }, {
                               "breakpoint": 992,
                               "settings": {
                                 "slidesToShow": 2
                               }
                            }, {
                               "breakpoint": 554,
                               "settings": {
                                 "slidesToShow": 2
                               }
                            }]'>
							<!-- 여기서부터 반복 -->
							<c:if test="${empty related_BookList}">
								<div style="text-align: center;">데이터가 존재하지 않습니다.</div>
							</c:if>
							<c:if test="${!empty related_BookList}">
								<c:forEach items="${related_BookList}" var="related_Book">
									<div class="product">
										<div class="product__inner overflow-hidden p-3 p-md-4d875">
											<div
												class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
												<div class="woocommerce-loop-product__thumbnail">
													<a href="/book/detail/${related_Book.book_no}" class="d-block">
														<!-- 이미지 부분 --> <c:choose>
															<c:when
																test="${fn:substring(related_Book.image, 0, 5) eq 'https'}">
																<img src="${related_Book.image}"
																	class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
																	alt="image-description" style="max-width: 45%;">
															</c:when>
															<c:otherwise>
																<img src="/image/${related_Book.image}"
																	class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
																	alt="image-description" style="max-width: 45%;">
															</c:otherwise>
														</c:choose>
													</a>
													<!-- 기존 -->
												</div>
												<div
													class="woocommerce-loop-product__body product__body pt-3 bg-white">
													<h2
														class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
														<a href="/book/detail/${related_Book.book_no}">${related_Book.title}</a>
													</h2>
													<div class="font-size-2  mb-1 text-truncate">
														<span class="text-gray-700">${related_Book.author}</span>
													</div>
													<div
														class="price d-flex align-items-center font-weight-medium font-size-3">
														<span class="woocommerce-Price-amount amount"><fmt:formatNumber
													value="${related_Book.price}" pattern="###,###"></fmt:formatNumber>원</span>
													</div>
												</div>
												<c:choose>
													<c:when test="${related_Book.stock != 0}">
														<div class="product__hover d-flex align-items-center">
															<span class="product__add-to-cart-text"
																onClick="addToCart(${related_Book.book_no},${related_Book.price})">ADD
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
								</c:forEach>
							</c:if>
						</div>
					</div>
				</section>
			</div>
		</main>
	</div>





	<!-- footer 자리 -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/script.jsp"></c:import>

</body>
</html>


