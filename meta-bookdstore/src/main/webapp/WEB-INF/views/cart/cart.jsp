<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div class="page-header border-bottom">
		<div class="container">
			<div
				class="d-md-flex justify-content-between align-items-center py-4">
				<h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">Shop
					Single</h1>
				<nav class="woocommerce-breadcrumb font-size-2">
					<a href="#" class="h-primary">Home</a> <span
						class="breadcrumb-separator mx-1"><i
						class="fas fa-angle-right"></i></span> <a href="#" class="h-primary">Shop</a>
					<span class="breadcrumb-separator mx-1"><i
						class="fas fa-angle-right"></i></span>Shop Single
				</nav>
			</div>
		</div>
	</div>
	<div class="site-content  overflow-hidden" id="content">
		<div class="container">
			<header
				class="entry-header cart-count-header space-top-2 space-bottom-1 mb-2">
				<h1 class="entry-title font-size-7 cart-count"
					data-cart="${cartList.size()} ">Your cart: ${cartList.size()}
					items</h1>
			</header>
			<c:if test="${cartList.size()>0}">
				<div class="row pb-8" id="cart-container">
					<div id="primary" class="content-area">
						<main id="main" class="site-main ">
							<div class="page type-page status-publish hentry">
								<!-- .entry-header -->
								<div class="entry-content">
									<div class="woocommerce">
										<table
											class="shop_table shop_table_responsive cart woocommerce-cart-form__contents">
											<thead>
												<tr>
													<th class="product-name">Product</th>
													<th class="product-price">Price</th>
													<th class="product-quantity">Quantity</th>
													<th class="product-subtotal">Total</th>
													<th class="product-remove"><input type="checkbox"
														class="cart-checkbox-all" checked></th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${cartList}" var="cart">
													<tr class="woocommerce-cart-form__cart-item cart_item">
														<td class="product-name" data-title="Product">
															<div class="d-flex align-items-center">
																<a href="/book/detail/${cart.book_no }"> <img
																	src="${cart.image }"
																	class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image"
																	alt="">
																</a>
																<div class="ml-3 m-w-200-lg-down">
																	<a href="/book/detail/${cart.book_no}">${cart.title}</a>
																	<a href="/book/detail/${cart.book_no}"
																		class="text-gray-700 font-size-2 d-block" tabindex="0">${cart.author }s</a>
																</div>
															</div>
														</td>

														<td class="product-price" data-title="Price"><span
															class="woocommerce-Price-amount amount"><span
																class="woocommerce-Price-currencySymbol">₩</span> <fmt:formatNumber
																	value="${cart.price}" pattern="###,###"></fmt:formatNumber></span></td>

														<td class="product-quantity" data-title="Quantity">
															<div class="quantity d-flex align-items-center">
																<!-- Quantity -->
																<div class="border px-3 width-120">
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
																			</a> <input type="number"
																				class="input-text qty text js-result form-control text-center border-0"
																				step="1" min="1" max="100" name="quantity"
																				value="${cart.cart_book_qt}" title="Qty"
																				data-book_no="${cart.book_no}"
																				data-m_no="${cart.m_no}" data-price="${cart.price}"
																				data-cart_no="${cart.cart_no}"> <a
																				class="js-plus text-dark" href="javascript:;"> <svg
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
														</td>

														<td class="product-subtotal" data-title="Total"><span
															class="woocommerce-Price-amount amount"><span
																class="woocommerce-Price-currencySymbol">₩</span> <fmt:formatNumber
																	value="${cart.cart_total_price }" pattern="###,###"></fmt:formatNumber></span></td>
														<td class="product-remove"><input type="checkbox"
															class="cart-checkbox" data-cart_no="${cart.cart_no}"
															checked> <svg class="product-remove-icon"
																data-cart_no="${cart.cart_no}"
																xmlns="http://www.w3.org/2000/svg"
																xmlns:xlink="http://www.w3.org/1999/xlink" width="15px"
																height="15px">                                                                 <path
																	fill-rule="evenodd" fill="rgb(22, 22, 25)"
																	d="M15.011,13.899 L13.899,15.012 L7.500,8.613 L1.101,15.012 L-0.012,13.899 L6.387,7.500 L-0.012,1.101 L1.101,-0.012 L7.500,6.387 L13.899,-0.012 L15.011,1.101 L8.613,7.500 L15.011,13.899 Z" />
															                                                            </svg>
														</td>
													</tr>
												</c:forEach>
												<tr>
													<td colspan="5" class="actions">
														<!-- <div class="coupon">
                                                            <label for="coupon_code">Coupon:</label>
                                                            <input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="Coupon code" autocomplete="off"> <input type="submit" class="button" name="apply_coupon" value="Apply coupon">
                                                        </div> --> <input
														type="button" class="button delete_cart-all"
														value="Delete">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!-- .entry-content -->
							</div>
						</main>
					</div>
					<div id="secondary" class="sidebar cart-collaterals order-1"
						role="complementary">
						<div id="cartAccordion"
							class="border border-gray-900 bg-white mb-5">
							<div class="p-4d875 border">
								<div id="cartHeadingOne" class="cart-head">
									<a
										class="d-flex align-items-center justify-content-between text-dark"
										href="#" data-toggle="collapse" data-target="#cartCollapseOne"
										aria-expanded="true" aria-controls="cartCollapseOne">

										<h3 class="cart-title mb-0 font-weight-medium font-size-3">Cart
											Totals</h3> <svg class="mins" xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="15px"
											height="2px">
                                        <path fill-rule="evenodd"
												fill="rgb(22, 22, 25)"
												d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                    </svg> <svg class="plus"
											xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="15px"
											height="15px">
                                        <path fill-rule="evenodd"
												fill="rgb(22, 22, 25)"
												d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                    </svg>
									</a>
								</div>

								<div id="cartCollapseOne"
									class="mt-4 cart-content collapse show"
									aria-labelledby="cartHeadingOne" data-parent="#cartAccordion">
									<table class="shop_table shop_table_responsive">
										<tbody>
											<tr class="cart-subtotal">
												<th>Subtotal</th>
												<td data-title="Subtotal"><span
													class="woocommerce-Price-amount amount"><span
														class="woocommerce-Price-currencySymbol">₩</span>${subTotalPrice }</span></td>
											</tr>

											<tr class="order-shipping">
												<th>Shipping</th>
												<td data-title="Shipping">Free Shipping</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>


							<div class="p-4d875 border">
								<table class="shop_table shop_table_responsive">
									<tbody>
										<tr class="order-total">
											<th>Total</th>
											<td data-title="Total"><strong><span
													class="woocommerce-Price-amount amount"><span
														class="woocommerce-Price-currencySymbol">₩</span>${subTotalPrice}원
												</span></strong></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<form action="/order/checkout" method="post" class="checkout-form">
							<div class="wc-proceed-to-checkout">
								<input type="button" value="Proceed to checkout"
									class="checkout-button button alt wc-forward btn btn-dark btn-block rounded-0 py-4">
							</div>
						</form>
					</div>
				</div>
			</c:if>

		</div>
	</div>




	<!-- footer 자리 -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/script.jsp"></c:import>

</body>
</html>


