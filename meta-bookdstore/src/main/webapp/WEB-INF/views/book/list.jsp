<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
</head>
<body>
	<!--header자리 -->
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/aside.jsp"></c:import>

	<!--     content here 내용은 여기에 넣어주세용  -->
	<div class="page-header border-bottom mb-8">
		<div class="container">
			<div
				class="d-md-flex justify-content-between align-items-center py-4">
				<h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">Shop</h1>
				<nav class="woocommerce-breadcrumb font-size-2">
					<a href="../shop/v1.html" class="h-primary">Category</a> <span
						class="breadcrumb-separator mx-1"><i
						class="fas fa-angle-right"></i></span>[search word]
				</nav>
			</div>
		</div>
	</div>
	<div class="site-content" id="content">
		<div class="container">
			<div class="row">
				<div id="primary" class="content-area order-2">
					<div
						class="shop-control-bar d-lg-flex justify-content-between align-items-center mb-5 text-center text-md-left">
						<div class="shop-control-bar__left mb-4 m-lg-0">
							<p class="woocommerce-result-count m-0">Showing 1–12 of 126
								results</p>
						</div>
						<div class="shop-control-bar__right d-md-flex align-items-center">
							<form class="woocommerce-ordering mb-4 m-md-0" method="get">
								<!-- Select -->
								<select class="js-select selectpicker dropdown-select orderby"
									name="orderby"
									data-style="border-bottom shadow-none outline-none py-2">
									<option value="popularity">Sort by popularity</option>
									<option value="default" selected="selected">Default
										sorting</option>
									<option value="date">Sort by newness</option>
									<option value="price">Sort by price: low to high</option>
									<option value="price-desc">Sort by price: high to low</option>
								</select>
								<!-- End Select -->
							</form>

							<form
								class="number-of-items ml-md-4 mb-4 m-md-0 d-none d-xl-block"
								method="get">
								<!-- Select -->
								<select class="js-select selectpicker dropdown-select orderby"
									name="orderby"
									data-style="border-bottom shadow-none outline-none py-2"
									data-width="fit">
									<option value="show10">Show 10</option>
									<option value="show15">Show 15</option>
									<option value="show20" selected="selected">Show 20</option>
									<option value="show25">Show 25</option>
									<option value="show30">Show 30</option>
								</select>
								<!-- End Select -->
							</form>

							<ul
								class="nav nav-tab ml-lg-4 justify-content-center justify-content-md-start ml-md-auto"
								id="pills-tab" role="tablist">
								<li class="nav-item border"><a
									class="nav-link p-0 height-38 width-38 justify-content-center d-flex align-items-center active"
									id="pills-one-example1-tab" data-toggle="pill"
									href="#pills-one-example1" role="tab"
									aria-controls="pills-one-example1" aria-selected="true"> <svg
											xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="17px"
											height="17px">
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M-0.000,0.000 L3.000,0.000 L3.000,3.000 L-0.000,3.000 L-0.000,0.000 Z" />
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M7.000,0.000 L10.000,0.000 L10.000,3.000 L7.000,3.000 L7.000,0.000 Z" />
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M14.000,0.000 L17.000,0.000 L17.000,3.000 L14.000,3.000 L14.000,0.000 Z" />
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M-0.000,7.000 L3.000,7.000 L3.000,10.000 L-0.000,10.000 L-0.000,7.000 Z" />
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M7.000,7.000 L10.000,7.000 L10.000,10.000 L7.000,10.000 L7.000,7.000 Z" />
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M14.000,7.000 L17.000,7.000 L17.000,10.000 L14.000,10.000 L14.000,7.000 Z" />
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M-0.000,14.000 L3.000,14.000 L3.000,17.000 L-0.000,17.000 L-0.000,14.000 Z" />
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M7.000,14.000 L10.000,14.000 L10.000,17.000 L7.000,17.000 L7.000,14.000 Z" />
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M14.000,14.000 L17.000,14.000 L17.000,17.000 L14.000,17.000 L14.000,14.000 Z" />
                                        </svg>
								</a></li>
								<li class="nav-item border"><a
									class="nav-link p-0 height-38 width-38 justify-content-center d-flex align-items-center"
									id="pills-two-example1-tab" data-toggle="pill"
									href="#pills-two-example1" role="tab"
									aria-controls="pills-two-example1" aria-selected="false"> <svg
											xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="23px"
											height="17px">
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M-0.000,0.000 L3.000,0.000 L3.000,3.000 L-0.000,3.000 L-0.000,0.000 Z" />
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M7.000,0.000 L23.000,0.000 L23.000,3.000 L7.000,3.000 L7.000,0.000 Z" />
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M-0.000,7.000 L3.000,7.000 L3.000,10.000 L-0.000,10.000 L-0.000,7.000 Z" />
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M7.000,7.000 L23.000,7.000 L23.000,10.000 L7.000,10.000 L7.000,7.000 Z" />
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M-0.000,14.000 L3.000,14.000 L3.000,17.000 L-0.000,17.000 L-0.000,14.000 Z" />
                                            <path fill-rule="evenodd"
												fill="rgb(25, 17, 11)"
												d="M7.000,14.000 L23.000,14.000 L23.000,17.000 L7.000,17.000 L7.000,14.000 Z" />
                                        </svg>
								</a></li>
							</ul>
							<!-- Account Sidebar Toggle Button -->
							<a id="sidebarNavToggler4" class="ml-3 h-primary"
								href="javascript:;" role="button"
								aria-controls="sidebarContent4" aria-haspopup="true"
								aria-expanded="false" data-unfold-event="click"
								data-unfold-hide-on-scroll="false"
								data-unfold-target="#sidebarContent4"
								data-unfold-type="css-animation"
								data-unfold-overlay='{
                                    "className": "u-sidebar-bg-overlay",
                                    "background": "rgba(0, 0, 0, .7)",
                                    "animationSpeed": 500
                                }'
								data-unfold-animation-in="fadeInRight"
								data-unfold-animation-out="fadeOutRight"
								data-unfold-duration="500"> <i class="flaticon-filter mr-2"></i>Filter
								By
							</a>
							<!-- End Account Sidebar Toggle Button -->

							<!-- Sidebar Navigation -->
							<aside id="sidebarContent4"
								class="u-sidebar u-sidebar__md js-scrollbar"
								aria-labelledby="sidebarNavToggler4">
								<div class="u-sidebar__scroller">
									<div class="u-sidebar__container">
										<div class="u-header-sidebar__footer-offset">
											<!-- Toggle Button -->
											<div
												class="d-flex align-items-center justify-content-between py-4 px-4 border-bottom mb-5">
												<div class="font-size-3">
													<i class="flaticon-filter mr-2"></i>Filter By
												</div>
												<button type="button"
													class="close font-size-3 text-dark d-flex align-items-center"
													aria-controls="sidebarContent4" aria-haspopup="true"
													aria-expanded="false" data-unfold-event="click"
													data-unfold-hide-on-scroll="false"
													data-unfold-target="#sidebarContent4"
													data-unfold-type="css-animation"
													data-unfold-animation-in="fadeInRight"
													data-unfold-animation-out="fadeOutRight"
													data-unfold-duration="500">
													close <span aria-hidden="true"><i
														class="ml-2 flaticon-error"></i></span>
												</button>
											</div>
											<!-- End Toggle Button -->

											<!-- Content -->
											<div class="u-sidebar__body px-4">
												<div class="u-sidebar__content u-header-sidebar__content">
													<div class="sidebar widget-area">
														<div id="widgetAccordion">
															<div id="woocommerce_product_categories-2"
																class="widget p-4d875 border woocommerce widget_product_categories">
																<div id="widgetHeadingOne" class="widget-head">
																	<a
																		class="d-flex align-items-center justify-content-between text-dark"
																		href="#" data-toggle="collapse"
																		data-target="#widgetCollapseOne" aria-expanded="true"
																		aria-controls="widgetCollapseOne">

																		<h3
																			class="widget-title mb-0 font-weight-medium font-size-3">Categories</h3>

																		<svg class="mins" xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="2px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                                                        </svg>

																		<svg class="plus" xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="15px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                                                        </svg>
																	</a>
																</div>

																<div id="widgetCollapseOne"
																	class="mt-3 widget-content collapse show"
																	aria-labelledby="widgetHeadingOne"
																	data-parent="#widgetAccordion">
																	<ul class="product-categories">
																		<li class="cat-item cat-item-9 cat-parent"><a
																			href="#/clothing">Clothing</a>
																			<ul class="children">
																				<li class="cat-item cat-item-121"><a
																					href="#/clothing/bags/">Bags</a></li>
																				<li class="cat-item cat-item-44"><a
																					href="#/clothing/blouses/">Blouses</a></li>
																				<li class="cat-item cat-item-41"><a
																					href="#/clothing/dresses/">Dresses</a></li>
																				<li class="cat-item cat-item-56"><a
																					href="#/clothing/footwear/">Footwear</a></li>
																				<li class="cat-item cat-item-54"><a
																					href="#/clothing/hats/">Hats</a></li>
																				<li class="cat-item cat-item-10"><a
																					href="#/clothing/hoodies/">Hoodies</a></li>
																				<li class="cat-item cat-item-55"><a
																					href="#/clothing/shirts/">Shirts</a></li>
																				<li class="cat-item cat-item-47"><a
																					href="#/clothing/skirts/">Skirts</a></li>
																				<li class="cat-item cat-item-14"><a
																					href="#/clothing/t-shirts/">T-shirts</a></li>
																				<li class="cat-item cat-item-49"><a
																					href="#/clothing/trousers/">Trousers</a></li>
																			</ul></li>
																		<li class="cat-item cat-item-69 cat-parent"><a
																			href="#/electronics/">Electronics</a>
																			<ul class="children">
																				<li class="cat-item cat-item-71 cat-parent"><a
																					href="#/electronics/cameras/">Cameras</a>
																					<ul class="children">
																						<li class="cat-item cat-item-114"><a
																							href="#/electronics/cameras/accessories/">Accessories</a></li>
																						<li class="cat-item cat-item-112"><a
																							href="#/electronics/cameras/lenses/">Lenses</a></li>
																					</ul></li>
																				<li class="cat-item cat-item-99"><a
																					href="#/electronics/dvd-players/">DVD Players</a></li>
																				<li class="cat-item cat-item-72"><a
																					href="#/electronics/headphones/">Headphones</a></li>
																				<li class="cat-item cat-item-91"><a
																					href="#/electronics/mp3-players/">MP3 Players</a></li>
																				<li class="cat-item cat-item-90"><a
																					href="#/electronics/radios/">Radios</a></li>
																				<li class="cat-item cat-item-70"><a
																					href="#/electronics/televisions/">Televisions</a></li>
																			</ul></li>
																		<li class="cat-item cat-item-65 cat-parent"><a
																			href="#/kitchen/">Kitchen</a>
																			<ul class="children">
																				<li class="cat-item cat-item-102"><a
																					href="#/kitchen/blenders/">Blenders</a></li>
																				<li class="cat-item cat-item-103"><a
																					href="#/kitchen/colanders/">Colanders</a></li>
																				<li class="cat-item cat-item-68"><a
																					href="#/kitchen/kettles/">Kettles</a></li>
																				<li class="cat-item cat-item-101"><a
																					href="#/kitchen/knives/">Knives</a></li>
																				<li class="cat-item cat-item-66"><a
																					href="#/kitchen/pots-pans/">Pots &amp; Pans</a></li>
																				<li class="cat-item cat-item-67"><a
																					href="#/kitchen/toasters/">Toasters</a></li>
																			</ul></li>
																		<li class="cat-item cat-item-11 cat-parent"><a
																			href="#/music/">Music</a>
																			<ul class="children">
																				<li class="cat-item cat-item-15"><a
																					href="#/music/albums/">Albums</a></li>
																				<li class="cat-item cat-item-100"><a
																					href="#/music/mp3/">MP3</a></li>
																				<li class="cat-item cat-item-13"><a
																					href="#/music/singles/">Singles</a></li>
																			</ul></li>
																		<li class="cat-item cat-item-12"><a
																			href="#/posters/">Posters</a></li>
																		<li class="cat-item cat-item-31"><a
																			href="#/scuba-gear/">Scuba gear</a></li>
																		<li class="cat-item cat-item-45"><a
																			href="#/sweatshirts/">Sweatshirts</a></li>
																	</ul>
																</div>
															</div>

															<div id="Authors"
																class="widget widget_search widget_author p-4d875 border">
																<div id="widgetHeading21" class="widget-head">
																	<a
																		class="d-flex align-items-center justify-content-between text-dark"
																		href="#" data-toggle="collapse"
																		data-target="#widgetCollapse21" aria-expanded="true"
																		aria-controls="widgetCollapse21">

																		<h3
																			class="widget-title mb-0 font-weight-medium font-size-3">Author</h3>

																		<svg class="mins" xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="2px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                                                        </svg>

																		<svg class="plus" xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="15px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                                                        </svg>
																	</a>
																</div>

																<div id="widgetCollapse21"
																	class="mt-4 widget-content collapse show"
																	aria-labelledby="widgetHeading21"
																	data-parent="#widgetAccordion">
																	<form class="form-inline my-2 overflow-hidden">
																		<div class="input-group flex-nowrap w-100">
																			<div class="input-group-prepend">
																				<i
																					class="glph-icon flaticon-loupe py-2d75 bg-white-100 border-white-100 text-dark pl-3 pr-0 rounded-0"></i>
																			</div>
																			<input
																				class="form-control bg-white-100 py-2d75 height-4 border-white-100 rounded-0"
																				type="search" placeholder="Search"
																				aria-label="Search">
																		</div>
																		<button
																			class="btn btn-outline-success my-2 my-sm-0 sr-only"
																			type="submit">Search</button>
																	</form>
																	<ul class="product-categories">
																		<li class="cat-item cat-item-9 cat-parent"><a
																			href="#/clothing">A. J. Finn</a></li>
																		<li class="cat-item cat-item-69 cat-parent"><a
																			href="#/electronics/">Anne Frank</a></li>
																		<li class="cat-item cat-item-65 cat-parent"><a
																			href="#/kitchen/">Camille Pagán</a></li>
																		<li class="cat-item cat-item-11 cat-parent"><a
																			href="#/music/">Daniel H. Pink</a></li>
																		<li class="cat-item cat-item-12"><a
																			href="#/posters/">Danielle Steel</a></li>
																		<li class="cat-item cat-item-31"><a
																			href="#/scuba-gear/">David Quammen</a></li>
																	</ul>
																</div>
															</div>

															<div id="Language" class="widget p-4d875 border">
																<div id="widgetHeading22" class="widget-head">
																	<a
																		class="d-flex align-items-center justify-content-between text-dark"
																		href="#" data-toggle="collapse"
																		data-target="#widgetCollapse22" aria-expanded="true"
																		aria-controls="widgetCollapse22">

																		<h3
																			class="widget-title mb-0 font-weight-medium font-size-3">Language</h3>

																		<svg class="mins" xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="2px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                                                        </svg>

																		<svg class="plus" xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="15px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                                                        </svg>
																	</a>
																</div>

																<div id="widgetCollapse22"
																	class="mt-4 widget-content collapse show"
																	aria-labelledby="widgetHeading22"
																	data-parent="#widgetAccordion">
																	<ul class="product-categories">
																		<li class="custom-control custom-checkbox mb-2 pb-2">
																			<input type="checkbox" class="custom-control-input"
																			id="brandEnglish"> <label
																			class="custom-control-label" for="brandEnglish">English</label>
																		</li>
																		<li class="custom-control custom-checkbox mb-2 pb-2">
																			<input type="checkbox" class="custom-control-input"
																			id="brandGerman"> <label
																			class="custom-control-label" for="brandGerman">German</label>
																		</li>
																		<li class="custom-control custom-checkbox mb-2 pb-2">
																			<input type="checkbox" class="custom-control-input"
																			id="brandFrench"> <label
																			class="custom-control-label" for="brandFrench">French</label>
																		</li>
																		<li class="custom-control custom-checkbox mb-2 pb-2">
																			<input type="checkbox" class="custom-control-input"
																			id="brandSpanish"> <label
																			class="custom-control-label" for="brandSpanish">Spanish</label>
																		</li>
																		<li class="custom-control custom-checkbox"><input
																			type="checkbox" class="custom-control-input"
																			id="brandTurkish"> <label
																			class="custom-control-label" for="brandTurkish">Turkish</label>
																		</li>
																	</ul>
																</div>
															</div>

															<div id="Format" class="widget p-4d875 border">
																<div id="widgetHeading23" class="widget-head">
																	<a
																		class="d-flex align-items-center justify-content-between text-dark"
																		href="#" data-toggle="collapse"
																		data-target="#widgetCollapse23" aria-expanded="true"
																		aria-controls="widgetCollapse23">

																		<h3
																			class="widget-title mb-0 font-weight-medium font-size-3">Format</h3>

																		<svg class="mins" xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="2px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                                                        </svg>

																		<svg class="plus" xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="15px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                                                        </svg>
																	</a>
																</div>

																<div id="widgetCollapse23"
																	class="mt-3 widget-content collapse show"
																	aria-labelledby="widgetHeading23"
																	data-parent="#widgetAccordion">
																	<ul class="product-categories">
																		<li class="cat-item cat-item-9 cat-parent"><a
																			href="#/clothing">Audio CD</a></li>
																		<li class="cat-item cat-item-69 cat-parent"><a
																			href="#/electronics/">Audio Book</a></li>
																		<li class="cat-item cat-item-65 cat-parent"><a
																			href="#/kitchen/">Hardcover</a></li>
																		<li class="cat-item cat-item-11 cat-parent"><a
																			href="#/music/">Kindle Books</a></li>
																		<li class="cat-item cat-item-12"><a
																			href="#/posters/">Paperback</a></li>
																	</ul>
																</div>
															</div>

															<div id="woocommerce_price_filter-2"
																class="widget p-4d875 border woocommerce widget_price_filter">
																<div id="widgetHeadingTwo" class="widget-head">
																	<a
																		class="d-flex align-items-center justify-content-between text-dark"
																		href="#" data-toggle="collapse"
																		data-target="#widgetCollapseTwo" aria-expanded="true"
																		aria-controls="widgetCollapseTwo">

																		<h3
																			class="widget-title mb-0 font-weight-medium font-size-3">Filter
																			by price</h3> <svg class="mins"
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="2px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                                                        </svg>

																		<svg class="plus" xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="15px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                                                        </svg>
																	</a>
																</div>

																<div id="widgetCollapseTwo"
																	class="mt-4 widget-content collapse show"
																	aria-labelledby="widgetHeadingTwo"
																	data-parent="#widgetAccordion">
																	<form method="get"
																		action="https://themes.woocommerce.com/storefront/shop/">
																		<div class="price_slider_wrapper">
																			<div
																				class="price_slider ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"
																				style="">
																				<div
																					class="ui-slider-range ui-widget-header ui-corner-all"
																					style="left: 0%; width: 100%;"></div>
																				<span
																					class="ui-slider-handle ui-state-default ui-corner-all"
																					tabindex="0" style="left: 0%;"></span><span
																					class="ui-slider-handle ui-state-default ui-corner-all"
																					tabindex="0" style="left: 98%;"></span>
																			</div>
																			<div class="price_slider_amount">
																				<input type="text" id="min_price" name="min_price"
																					value="2" data-min="2" placeholder="Min price"
																					style="display: none;"> <input type="text"
																					id="max_price" name="max_price" value="1495"
																					data-max="1495" placeholder="Max price"
																					style="display: none;">
																				<button type="submit" class="button d-none">Filter</button>
																				<div class="mx-auto price_label mt-2" style="">
																					Price: <span class="from">£2</span> — <span
																						class="to">£1,495</span>
																				</div>
																			</div>
																		</div>
																	</form>
																</div>
															</div>

															<div id="Review" class="widget p-4d875 border">
																<div id="widgetHeading24" class="widget-head">
																	<a
																		class="d-flex align-items-center justify-content-between text-dark"
																		href="#" data-toggle="collapse"
																		data-target="#widgetCollapse24" aria-expanded="true"
																		aria-controls="widgetCollapse24">

																		<h3
																			class="widget-title mb-0 font-weight-medium font-size-3">By
																			Review</h3> <svg class="mins"
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="2px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                                                        </svg>

																		<svg class="plus" xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="15px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                                                        </svg>
																	</a>
																</div>

																<div id="widgetCollapse24"
																	class="mt-4 widget-content collapse show"
																	aria-labelledby="widgetHeading24"
																	data-parent="#widgetAccordion">
																	<div
																		class="form-group d-flex align-items-center justify-content-between font-size-1 text-lh-md text-secondary mb-2 pb-1">
																		<div class="custom-control custom-checkbox">
																			<input type="checkbox" class="custom-control-input"
																				id="rating5"> <label
																				class="custom-control-label" for="rating5">
																				<span class="d-block text-yellow-darker mt-plus-3">
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="fas fa-star font-size-2 "></span>
																			</span>
																			</label>
																		</div>
																		<small class="font-size-2 text-gray-600">24</small>
																	</div>
																	<div
																		class="form-group d-flex align-items-center justify-content-between font-size-1 text-lh-md text-secondary mb-2 pb-1">
																		<div class="custom-control custom-checkbox">
																			<input type="checkbox" class="custom-control-input"
																				id="rating4"> <label
																				class="custom-control-label" for="rating4">
																				<span class="d-block text-yellow-darker mt-plus-3">
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="far fa-star font-size-2 "></span>
																			</span>
																			</label>
																		</div>
																		<small class="font-size-2 text-gray-600">15</small>
																	</div>
																	<div
																		class="form-group d-flex align-items-center justify-content-between font-size-1 text-lh-md text-secondary mb-2 pb-1">
																		<div class="custom-control custom-checkbox">
																			<input type="checkbox" class="custom-control-input"
																				id="rating3"> <label
																				class="custom-control-label" for="rating3">
																				<span class="d-block text-yellow-darker mt-plus-3">
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="far fa-star font-size-2 mr-1"></span>
																					<span class="far fa-star font-size-2 "></span>
																			</span>
																			</label>
																		</div>
																		<small class="font-size-2 text-gray-600">43</small>
																	</div>
																	<div
																		class="form-group d-flex align-items-center justify-content-between font-size-1 text-lh-md text-secondary mb-2 pb-1">
																		<div class="custom-control custom-checkbox">
																			<input type="checkbox" class="custom-control-input"
																				id="rating2"> <label
																				class="custom-control-label" for="rating2">
																				<span class="d-block text-yellow-darker mt-plus-3">
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="far fa-star font-size-2 mr-1"></span>
																					<span class="far fa-star font-size-2 mr-1"></span>
																					<span class="far fa-star font-size-2"></span>
																			</span>
																			</label>
																		</div>
																		<small class="font-size-2 text-gray-600">78</small>
																	</div>
																	<div
																		class="form-group d-flex align-items-center justify-content-between font-size-1 text-lh-md text-secondary mb-0">
																		<div class="custom-control custom-checkbox">
																			<input type="checkbox" class="custom-control-input"
																				id="rating1"> <label
																				class="custom-control-label" for="rating1">
																				<span class="d-block text-yellow-darker mt-plus-3">
																					<span class="fas fa-star font-size-2 mr-1"></span>
																					<span class="far fa-star font-size-2 mr-1"></span>
																					<span class="far fa-star font-size-2 mr-1"></span>
																					<span class="far fa-star font-size-2 mr-1"></span>
																					<span class="far fa-star font-size-2"></span>
																			</span>
																			</label>
																		</div>
																		<small class="font-size-2 text-gray-600">21</small>
																	</div>
																</div>
															</div>

															<div id="Featuredbooks" class="widget p-4d875 border">
																<div id="widgetHeading25" class="widget-head">
																	<a
																		class="d-flex align-items-center justify-content-between text-dark"
																		href="#" data-toggle="collapse"
																		data-target="#widgetCollapse25" aria-expanded="true"
																		aria-controls="widgetCollapse25">

																		<h3
																			class="widget-title mb-0 font-weight-medium font-size-3">Featured
																			Books</h3> <svg class="mins"
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="2px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                                                        </svg>

																		<svg class="plus" xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="15px" height="15px">
                                                                            <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                                                        </svg>
																	</a>
																</div>

																<div id="widgetCollapse25"
																	class="mt-5 widget-content collapse show"
																	aria-labelledby="widgetHeading25"
																	data-parent="#widgetAccordion">
																	<div class="mb-5">
																		<div class="media d-md-flex">
																			<a class="d-block"
																				href="../shop/single-product-v6.html"> <img
																				class="img-fluid" src="https://placehold.it/60x92"
																				alt="Image-Description">
																			</a>
																			<div class="media-body ml-3 pl-1">
																				<h6
																					class="font-size-2 text-lh-md font-weight-normal">
																					<a href="../shop/single-product-v6.html">Lessons
																						Learned from 15 Years as CEO...</a>
																				</h6>
																				<span class="font-weight-medium">$37</span>
																			</div>
																		</div>
																	</div>
																	<div class="mb-5">
																		<div class="media d-md-flex">
																			<a class="d-block"
																				href="../shop/single-product-v6.html"> <img
																				class="img-fluid" src="https://placehold.it/60x92"
																				alt="Image-Description">
																			</a>
																			<div class="media-body ml-3 pl-1">
																				<h6
																					class="font-size-2 text-lh-md font-weight-normal">
																					<a href="../shop/single-product-v6.html">Love,
																						Livestock, and Big Life Lessons...</a>
																				</h6>
																				<span class="font-weight-medium">$21</span>
																			</div>
																		</div>
																	</div>
																	<div>
																		<div class="media d-md-flex">
																			<a class="d-block"
																				href="../shop/single-product-v6.html"> <img
																				class="img-fluid" src="https://placehold.it/60x92"
																				alt="Image-Description">
																			</a>
																			<div class="media-body ml-3 pl-1">
																				<h6
																					class="font-size-2 text-lh-md font-weight-normal">
																					<a href="../shop/single-product-v6.html">Sleeper
																						Cells, Ghost Stories, and Hunt...</a>
																				</h6>
																				<span class="font-weight-medium">$182</span>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- End Content -->
										</div>
									</div>
								</div>
							</aside>
							<!-- End Sidebar Navigation -->
						</div>
					</div>

					<!-- Tab Content -->
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-one-example1"
							role="tabpanel" aria-labelledby="pills-one-example1-tab">
							<!--bookList 데이터가 없는 경우 표시 -->
							<c:if test="${empty bookList}">
								<tr>
									<td>데이터가 존재하지 않습니다..</td>
								</tr>
							</c:if>
							<!-- DB뿌리기 c:if 시작-->
							<c:if test="${!empty bookList}">
								<ul
									class="products list-unstyled row no-gutters row-cols-2 row-cols-lg-3 row-cols-xl-5 border-top border-left mb-6">
									<c:forEach items="${bookList}" var="bookVo">
										<li class="product col">
											<div class="product__inner overflow-hidden p-3 p-md-4d875">
												<div
													class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
													<div class="woocommerce-loop-product__thumbnail">
														<a href="/book/detail/${bookVo.book_no}" class="d-block">
															<!-- 이미지 부분 --> <c:choose>
																<c:when
																	test="${fn:substring(bookVo.image, 0, 5) eq 'https'}">
																	<img src="${bookVo.image}"
																		class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
																		alt="image-description">
																</c:when>
																<c:otherwise>
																	<img src="/image/${bookVo.image}"
																		class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
																		alt="image-description">
																</c:otherwise>
															</c:choose>
														</a>
														<!-- 기존 -->
													</div>
													<div
														class="woocommerce-loop-product__body product__body pt-3 bg-white">
														<!-- 책제목 -->
														<h2
															class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
															<a href="../shop/single-product-v6.html">${bookVo.title}</a>
														</h2>
														<div class="font-size-2  mb-1 text-truncate">
															<a href="../others/authors-single.html"
																class="text-gray-700">${bookVo.author}</a>
														</div>
														<div
															class="price d-flex align-items-center font-weight-medium font-size-3">
															<span class="woocommerce-Price-amount amount"><span
																class="woocommerce-Price-currencySymbol">$</span>${bookVo.price}</span>
														</div>
													</div>
													<div class="product__hover d-flex align-items-center">
														<a href="../shop/single-product-v6.html"
															class="text-uppercase text-dark h-dark font-weight-medium mr-auto"
															data-toggle="tooltip" data-placement="right" title=""
															data-original-title="ADD TO CART"> <span
															onClick="addToCart(${bookVo.book_no},${bookVo.price})"
															class="product__add-to-cart">ADD TO CART</span> <span
															class="product__add-to-cart-icon font-size-4"><i
																class="flaticon-icon-126515"></i></span>
														</a>
													</div>
												</div>
											</div>
										</li>
										<!-- DB뿌리기 끝 c:if종료 -->
									</c:forEach>
								</ul>
							</c:if>
						</div>
						<nav aria-label="Page navigation example">
							<ul
								class="pagination pagination__custom justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble">
								<li class="flex-shrink-0 flex-md-shrink-1 page-item"><a
									class="page-link" href="#">Previous</a></li>
								<li class="flex-shrink-0 flex-md-shrink-1 page-item"><a
									class="page-link" href="#">1</a></li>
								<li class="flex-shrink-0 flex-md-shrink-1 page-item"><a
									class="page-link" href="#">2</a></li>
								<li class="flex-shrink-0 flex-md-shrink-1 page-item active"
									aria-current="page"><a class="page-link" href="#">3</a></li>
								<li class="flex-shrink-0 flex-md-shrink-1 page-item"><a
									class="page-link" href="#">4</a></li>
								<li class="flex-shrink-0 flex-md-shrink-1 page-item"><a
									class="page-link" href="#">5</a></li>
								<li class="flex-shrink-0 flex-md-shrink-1 page-item"><a
									class="page-link" href="#">Next</a></li>
							</ul>
						</nav>
					</div>
					<div id="secondary" class="sidebar widget-area order-1"
						role="complementary"></div>
				</div>
			</div>
		</div>




		<!-- footer 자리 -->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<c:import url="/WEB-INF/views/include/script.jsp"></c:import>
</body>
</html>


