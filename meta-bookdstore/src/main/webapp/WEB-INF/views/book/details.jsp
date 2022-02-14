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
	<div id="primary" class="content-area">
		<main id="main" class="site-main ">
			<div class="product">
				<div>
					<div class="container">
						<div class="row space-2">
							<div
								class="col-md-6 col-lg-5 offset-lg-1 woocommerce-product-gallery woocommerce-product-gallery--with-images images">
								<figure class="woocommerce-product-gallery__wrapper mb-6 b-md-0">
									<div class="js-slick-carousel u-slick"
										data-pagi-classes="position-absolute text-center left-0 u-slick__pagination flex-column u-slick__pagination-centered--y ml-md-n4 ml-lg-0 mr-lg-5 mb-0"
										data-vertical="true">
										<div class="js-slide">
											<img src="${bookInfo.image}" alt="Image Description"
												class="mx-auto img-fluid">
										</div>
									</div>
								</figure>
							</div>
							<div class="col-md-6 col-lg-5 summary entry-summary">
								<div class="border bg-white">
									<div class="py-4 px-5">
										<div class="border-bottom mb-4">
											<h1 class="product_title entry-title font-size-26 mb-3">${bookInfo.title }</h1>
											<div class="font-size-2 mb-4">
												<span class="text-yellow-darker"> <span
													class="fas fa-star"></span> <span class="fas fa-star"></span>
													<span class="fas fa-star"></span> <span class="fas fa-star"></span>
													<span class="fas fa-star"></span>
												</span> <span class="ml-3">(3,714)</span> <span
													class="ml-3 font-weight-medium">By (author)</span> <span
													class="ml-2 text-gray-600">${bookInfo.author }</span>
											</div>

										</div>
										<p class="price font-size-22 font-weight-medium mb-4">
											<span class="woocommerce-Price-amount amount">가격 :
												${bookInfo.price} <span
												class="woocommerce-Price-currencySymbol">원</span>
											</span>
										</p>



										<div class="cart mb-4 d-md-flex align-items-end" method=""
											enctype="multipart/form-data">

											<div class="quantity mb-4 mb-md-0">
												<label class="form-label font-size-2 font-weight-medium">Quantity</label>
												<!-- Quantity -->
												<div class="border px-3 w-100 d-flex align-items-center">
													<div class="js-quantity">
														<div class="d-flex align-items-center">

															<label class="screen-reader-text sr-only">Quantity</label>
															<a class="js-minus text-dark" href="javascript:;"> <svg
																	xmlns="http://www.w3.org/2000/svg"
																	xmlns:xlink="http://www.w3.org/1999/xlink" width="10px"
																	height="1px">
                                                                    <path
																		fill-rule="evenodd" fill="rgb(22, 22, 25)"
																		d="M-0.000,-0.000 L10.000,-0.000 L10.000,1.000 L-0.000,1.000 L-0.000,-0.000 Z" />
                                                                </svg>
															</a> <input type="number" id="input-number"
																class="input-text qty text js-result form-control text-center border-0"
																step="1" min="1" max="100" name="quantity" value="1"
																title="Qty"> <a class="js-plus text-dark"
																href="javascript:;"> <svg
																	xmlns="http://www.w3.org/2000/svg"
																	xmlns:xlink="http://www.w3.org/1999/xlink" width="10px"
																	height="10px">
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
							aria-labelledby="pills-one-example1-tab">
							<!-- Mockup Block -->
							<p class="mb-0">We aim to show you accurate product
								information. Manufacturers, suppliers and others provide what
								you see here, and we have not verified it. See our disclaimer</p>
							<p class="mb-0">#1 New York Times Bestseller</p>
							<p class="mb-0">A Reese Witherspoon x Hello Sunshine Book
								Club Pick</p>
							<p class="mb-4">"I can't even express how much I love this
								book! I didn't want this story to end!"--Reese Witherspoon</p>
							<p class="mb-4">"Painfully beautiful."--The New York Times
								Book Review</p>
							<p>"Perfect for fans of Barbara Kingsolver."--Bustle</p>
							<p class="mb-4">For years, rumors of the "Marsh Girl" have
								haunted Barkley Cove, a quiet town on the North Carolina coast.
								So in late 1969, when handsome Chase Andrews is found dead, the
								locals immediately suspect Kya Clark, the so-called Marsh Girl.
								But Kya is not what they say. Sensitive and intelligent, she has
								survived for years alone in the marsh that she calls home,
								finding friends in the gulls and lessons in the sand. Then the
								time comes when she yearns to be touched and loved. When two
								young men from town become intrigued by her wild beauty, Kya
								opens herself to a new life--until the unthinkable happens.</p>
							<p class="mb-4">Perfect for fans of Barbara Kingsolver and
								Karen Russell, Where the Crawdads Sing is at once an exquisite
								ode to the natural world, a heartbreaking coming-of-age story,
								and a surprising tale of possible murder. Owens reminds us that
								we are forever shaped by the children we once were, and that we
								are all subject to the beautiful and violent secrets that nature
								keeps</p>
							<p>WHERE THE CRAWDADS LP</p>
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
							<div class="product">
								<div class="product__inner overflow-hidden p-3 p-md-4d875">
									<div
										class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
										<div class="woocommerce-loop-product__thumbnail">
											<a href="../shop/single-product-v4.html" class="d-block"><img
												src="../../assets/img/sample/book-sample.jpg"
												class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
												alt="image-description"></a>
										</div>
										<div
											class="woocommerce-loop-product__body product__body pt-3 bg-white">
											<div class="text-uppercase font-size-1 mb-1 text-truncate">
												<a href="../shop/single-product-v4.html">Paperback</a>
											</div>
											<h2
												class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
												<a href="../shop/single-product-v4.html">Think Like a
													Monk: Train Your Mind for Peace and Purpose Everyday</a>
											</h2>
											<div class="font-size-2  mb-1 text-truncate">
												<a href="../others/authors-single.html"
													class="text-gray-700">Jay Shetty</a>
											</div>
											<div
												class="price d-flex align-items-center font-weight-medium font-size-3">
												<span class="woocommerce-Price-amount amount"><span
													class="woocommerce-Price-currencySymbol">$</span>29</span>
											</div>
										</div>
										<div class="product__hover d-flex align-items-center">
											<a href="../shop/single-product-v4.html"
												class="text-uppercase text-dark h-dark font-weight-medium mr-auto">
												<span class="product__add-to-cart">ADD TO CART</span> <span
												class="product__add-to-cart-icon font-size-4"><i
													class="flaticon-icon-126515"></i></span>
											</a> <a href="../shop/single-product-v4.html"
												class="mr-1 h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-switch"></i>
											</a> <a href="../shop/single-product-v4.html"
												class="h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-heart"></i>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="product">
								<div class="product__inner overflow-hidden p-3 p-md-4d875">
									<div
										class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
										<div class="woocommerce-loop-product__thumbnail">
											<a href="../shop/single-product-v4.html" class="d-block"><img
												src="../../assets/img/sample/book-sample.jpg"
												class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
												alt="image-description"></a>
										</div>
										<div
											class="woocommerce-loop-product__body product__body pt-3 bg-white">
											<div class="text-uppercase font-size-1 mb-1 text-truncate">
												<a href="../shop/single-product-v4.html">Kindle Edition</a>
											</div>
											<h2
												class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
												<a href="../shop/single-product-v4.html">The Overdue
													Life of Amy Byler</a>
											</h2>
											<div class="font-size-2  mb-1 text-truncate">
												<a href="../others/authors-single.html"
													class="text-gray-700">Kelly Harms</a>
											</div>
											<div
												class="price d-flex align-items-center font-weight-medium font-size-3">
												<span class="woocommerce-Price-amount amount"><span
													class="woocommerce-Price-currencySymbol">$</span>29</span>
											</div>
										</div>
										<div class="product__hover d-flex align-items-center">
											<a href="../shop/single-product-v4.html"
												class="text-uppercase text-dark h-dark font-weight-medium mr-auto">
												<span class="product__add-to-cart">ADD TO CART</span> <span
												class="product__add-to-cart-icon font-size-4"><i
													class="flaticon-icon-126515"></i></span>
											</a> <a href="../shop/single-product-v4.html"
												class="mr-1 h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-switch"></i>
											</a> <a href="../shop/single-product-v4.html"
												class="h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-heart"></i>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="product">
								<div class="product__inner overflow-hidden p-3 p-md-4d875">
									<div
										class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
										<div class="woocommerce-loop-product__thumbnail">
											<a href="../shop/single-product-v4.html" class="d-block"><img
												src="../../assets/img/sample/book-sample.jpg"
												class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
												alt="image-description"></a>
										</div>
										<div
											class="woocommerce-loop-product__body product__body pt-3 bg-white">
											<div class="text-uppercase font-size-1 mb-1 text-truncate">
												<a href="../shop/single-product-v4.html">Paperback</a>
											</div>
											<h2
												class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
												<a href="../shop/single-product-v4.html">All You Can
													Ever Know: A Memoir</a>
											</h2>
											<div class="font-size-2  mb-1 text-truncate">
												<a href="../others/authors-single.html"
													class="text-gray-700">Jay Shetty</a>
											</div>
											<div
												class="price d-flex align-items-center font-weight-medium font-size-3">
												<span class="woocommerce-Price-amount amount"><span
													class="woocommerce-Price-currencySymbol">$</span>29</span>
											</div>
										</div>
										<div class="product__hover d-flex align-items-center">
											<a href="../shop/single-product-v4.html"
												class="text-uppercase text-dark h-dark font-weight-medium mr-auto">
												<span class="product__add-to-cart">ADD TO CART</span> <span
												class="product__add-to-cart-icon font-size-4"><i
													class="flaticon-icon-126515"></i></span>
											</a> <a href="../shop/single-product-v4.html"
												class="mr-1 h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-switch"></i>
											</a> <a href="../shop/single-product-v4.html"
												class="h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-heart"></i>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="product">
								<div class="product__inner overflow-hidden p-3 p-md-4d875">
									<div
										class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
										<div class="woocommerce-loop-product__thumbnail">
											<a href="../shop/single-product-v4.html" class="d-block"><img
												src="../../assets/img/sample/book-sample.jpg"
												class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
												alt="image-description"></a>
										</div>
										<div
											class="woocommerce-loop-product__body product__body pt-3 bg-white">
											<div class="text-uppercase font-size-1 mb-1 text-truncate">
												<a href="../shop/single-product-v4.html">Kindle Edition</a>
											</div>
											<h2
												class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
												<a href="../shop/single-product-v4.html">The Last Sister
													(Columbia River Book 1)</a>
											</h2>
											<div class="font-size-2  mb-1 text-truncate">
												<a href="../others/authors-single.html"
													class="text-gray-700">Kelly Harms</a>
											</div>
											<div
												class="price d-flex align-items-center font-weight-medium font-size-3">
												<span class="woocommerce-Price-amount amount"><span
													class="woocommerce-Price-currencySymbol">$</span>29</span>
											</div>
										</div>
										<div class="product__hover d-flex align-items-center">
											<a href="../shop/single-product-v4.html"
												class="text-uppercase text-dark h-dark font-weight-medium mr-auto">
												<span class="product__add-to-cart">ADD TO CART</span> <span
												class="product__add-to-cart-icon font-size-4"><i
													class="flaticon-icon-126515"></i></span>
											</a> <a href="../shop/single-product-v4.html"
												class="mr-1 h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-switch"></i>
											</a> <a href="../shop/single-product-v4.html"
												class="h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-heart"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="product">
								<div class="product__inner overflow-hidden p-3 p-md-4d875">
									<div
										class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
										<div class="woocommerce-loop-product__thumbnail">
											<a href="../shop/single-product-v4.html" class="d-block"><img
												src="../../assets/img/sample/book-sample.jpg"
												class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
												alt="image-description"></a>
										</div>
										<div
											class="woocommerce-loop-product__body product__body pt-3 bg-white">
											<div class="text-uppercase font-size-1 mb-1 text-truncate">
												<a href="../shop/single-product-v4.html">Paperback</a>
											</div>
											<h2
												class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
												<a href="../shop/single-product-v4.html">Think Like a
													Monk: Train Your Mind for Peace and Purpose Everyday</a>
											</h2>
											<div class="font-size-2  mb-1 text-truncate">
												<a href="../others/authors-single.html"
													class="text-gray-700">Jay Shetty</a>
											</div>
											<div
												class="price d-flex align-items-center font-weight-medium font-size-3">
												<span class="woocommerce-Price-amount amount"><span
													class="woocommerce-Price-currencySymbol">$</span>29</span>
											</div>
										</div>
										<div class="product__hover d-flex align-items-center">
											<a href="../shop/single-product-v4.html"
												class="text-uppercase text-dark h-dark font-weight-medium mr-auto">
												<span class="product__add-to-cart">ADD TO CART</span> <span
												class="product__add-to-cart-icon font-size-4"><i
													class="flaticon-icon-126515"></i></span>
											</a> <a href="../shop/single-product-v4.html"
												class="mr-1 h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-switch"></i>
											</a> <a href="../shop/single-product-v4.html"
												class="h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-heart"></i>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="product">
								<div class="product__inner overflow-hidden p-3 p-md-4d875">
									<div
										class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
										<div class="woocommerce-loop-product__thumbnail">
											<a href="../shop/single-product-v4.html" class="d-block"><img
												src="../../assets/img/sample/book-sample.jpg"
												class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
												alt="image-description"></a>
										</div>
										<div
											class="woocommerce-loop-product__body product__body pt-3 bg-white">
											<div class="text-uppercase font-size-1 mb-1 text-truncate">
												<a href="../shop/single-product-v4.html">Kindle Edition</a>
											</div>
											<h2
												class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
												<a href="../shop/single-product-v4.html">The Overdue
													Life of Amy Byler</a>
											</h2>
											<div class="font-size-2  mb-1 text-truncate">
												<a href="../others/authors-single.html"
													class="text-gray-700">Kelly Harms</a>
											</div>
											<div
												class="price d-flex align-items-center font-weight-medium font-size-3">
												<span class="woocommerce-Price-amount amount"><span
													class="woocommerce-Price-currencySymbol">$</span>29</span>
											</div>
										</div>
										<div class="product__hover d-flex align-items-center">
											<a href="../shop/single-product-v4.html"
												class="text-uppercase text-dark h-dark font-weight-medium mr-auto">
												<span class="product__add-to-cart">ADD TO CART</span> <span
												class="product__add-to-cart-icon font-size-4"><i
													class="flaticon-icon-126515"></i></span>
											</a> <a href="../shop/single-product-v4.html"
												class="mr-1 h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-switch"></i>
											</a> <a href="../shop/single-product-v4.html"
												class="h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-heart"></i>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="product">
								<div class="product__inner overflow-hidden p-3 p-md-4d875">
									<div
										class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
										<div class="woocommerce-loop-product__thumbnail">
											<a href="../shop/single-product-v4.html" class="d-block"><img
												src="../../assets/img/sample/book-sample.jpg"
												class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
												alt="image-description"></a>
										</div>
										<div
											class="woocommerce-loop-product__body product__body pt-3 bg-white">
											<div class="text-uppercase font-size-1 mb-1 text-truncate">
												<a href="../shop/single-product-v4.html">Paperback</a>
											</div>
											<h2
												class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
												<a href="../shop/single-product-v4.html">All You Can
													Ever Know: A Memoir</a>
											</h2>
											<div class="font-size-2  mb-1 text-truncate">
												<a href="../others/authors-single.html"
													class="text-gray-700">Jay Shetty</a>
											</div>
											<div
												class="price d-flex align-items-center font-weight-medium font-size-3">
												<span class="woocommerce-Price-amount amount"><span
													class="woocommerce-Price-currencySymbol">$</span>29</span>
											</div>
										</div>
										<div class="product__hover d-flex align-items-center">
											<a href="../shop/single-product-v4.html"
												class="text-uppercase text-dark h-dark font-weight-medium mr-auto">
												<span class="product__add-to-cart">ADD TO CART</span> <span
												class="product__add-to-cart-icon font-size-4"><i
													class="flaticon-icon-126515"></i></span>
											</a> <a href="../shop/single-product-v4.html"
												class="mr-1 h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-switch"></i>
											</a> <a href="../shop/single-product-v4.html"
												class="h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-heart"></i>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="product">
								<div class="product__inner overflow-hidden p-3 p-md-4d875">
									<div
										class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
										<div class="woocommerce-loop-product__thumbnail">
											<a href="../shop/single-product-v4.html" class="d-block"><img
												src="../../assets/img/sample/book-sample.jpg"
												class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
												alt="image-description"></a>
										</div>
										<div
											class="woocommerce-loop-product__body product__body pt-3 bg-white">
											<div class="text-uppercase font-size-1 mb-1 text-truncate">
												<a href="../shop/single-product-v4.html">Kindle Edition</a>
											</div>
											<h2
												class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
												<a href="../shop/single-product-v4.html">The Last Sister
													(Columbia River Book 1)</a>
											</h2>
											<div class="font-size-2  mb-1 text-truncate">
												<a href="../others/authors-single.html"
													class="text-gray-700">Kelly Harms</a>
											</div>
											<div
												class="price d-flex align-items-center font-weight-medium font-size-3">
												<span class="woocommerce-Price-amount amount"><span
													class="woocommerce-Price-currencySymbol">$</span>29</span>
											</div>
										</div>
										<div class="product__hover d-flex align-items-center">
											<a href="../shop/single-product-v4.html"
												class="text-uppercase text-dark h-dark font-weight-medium mr-auto">
												<span class="product__add-to-cart">ADD TO CART</span> <span
												class="product__add-to-cart-icon font-size-4"><i
													class="flaticon-icon-126515"></i></span>
											</a> <a href="../shop/single-product-v4.html"
												class="mr-1 h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-switch"></i>
											</a> <a href="../shop/single-product-v4.html"
												class="h-p-bg btn btn-outline-primary border-0"> <i
												class="flaticon-heart"></i>
											</a>
										</div>
									</div>
								</div>
							</div>

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


