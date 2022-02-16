<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="/css/order/order.css">
<script src="/js/register.js"></script>
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
	<div id="content" class="site-content  space-bottom-3">
		<div class="col-full container">
			<div id="primary" class="content-area">
				<main id="main" class="site-main">
					<article id="post-6"
						class="post-6 page type-page status-publish hentry">
						<header class="entry-header space-top-2 space-bottom-1 mb-2">
							<h4 class="entry-title font-size-7 text-center">Checkout</h4>
						</header>
						<!-- .entry-header -->
						<div class="entry-content">
							<div class="woocommerce">

								<form name="checkout" method="post"
									class="checkout-form checkout woocommerce-checkout row mt-8"
									action="/order/received" enctype="multipart/form-data"
									novalidate="novalidate">
									<div class="col2-set col-md-6 col-lg-7 col-xl-8 mb-6 mb-md-0"
										id="customer_details">
										<div class="px-4 pt-5 bg-white border">
											<div class="woocommerce-billing-fields">
												<div class="d-flex">
													<h3 class="mb-4 font-size-3">Billing details</h3>
													<div class="checkout-header">
														주문자 정보와 동일 <input type="checkbox" id="checkout-checkbox">
													</div>
												</div>
												<div class="p-4 p-md-6">
													<!-- Form Group -->
													<div class="form-group mb-4">
														<div class="js-form-message js-focus-state">
															<label id="name" class="form-label" for="name">이름</label>
															<input path="name" type="text" style="width: 100%"
																class="form-control rounded-0 height-4 px-4 "
																name="receiver_name" id="nameForm"
																placeholder="이름을 입력하세요" /> <input type="hidden"
																name="m_no" value="${principal.member.m_no}">
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
																<input path="tel1" type="text" maxlength="3" size="4"
																	id="tel1" onkeyup="to_auto_tel('tel1','tel2',3);"
																	class="tel_form form-control rounded-0 height-4 px-4" />
																- <input path="tel2" type="text" maxlength="4" size="5"
																	id="tel2" onkeyup="to_auto_tel('tel2','tel3',4);"
																	class="tel_form form-control rounded-0 height-4 px-4" />
																- <input path="tel3" type="text" maxlength="4" size="5"
																	id="tel3"
																	class="tel_form form-control rounded-0 height-4 px-4" />
																<input type="hidden" name="receiver_phone" id="phone" />
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
															<label class="form-label">이메일</label> <br> <input
																path="email1" type="text"
																style="width: 30%; display: inline-block;"
																class="form-control rounded-0 height-4 px-4"
																name="receiver_email" id="email1" placeholder="이메일을 입력" />
															@ <input path="emailDomain" type="text"
																class="form-control rounded-0 height-4 px-4"
																id="emailDomain" name="receiver_emailDomain"
																style="width: 30%; display: inline-block;" /> <select
																name="receiver_emailDomain" id="emailDomain"
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

													</div>
													<!-- End Form Group -->
													<!-- Form Group -->
													<div class="form-group mb-4">
														<div class="js-form-message js-focus-state">
															<label class="form-label">주소</label>
															<div class="addrBtn">
																<input type="text" style="width: 30%"
																	class="form-control rounded-0 height-2 px-2 order-form"
																	name="receiver_zipcode" id="zipcode" placeholder="우편번호"
																	readonly />
																<button type="button" class="btn btn-info"
																	onClick="goPopup();">주소검색</button>
															</div>
															<c:if test="${!empty errorMap}">
																<strong style="color: red;">${errorMap.zipcode}</strong>
															</c:if>
															<br /> 도로명 주소 <input type="text" path="roadAddress"
																style="margin-top: 10px;"
																class="form-control rounded-0 height-4 px-4"
																name="receiver_roadAddress" id="roadAddress"
																placeholder="주소검색을 해주세요" readonly />
															<c:if test="${!empty errorMap}">
																<strong style="color: red;">${errorMap.roadAddress}</strong>
															</c:if>
															<br /> 상세 주소 <input type="text" path="otherAddress"
																type="text" style="margin-top: 10px;"
																class="form-control rounded-0 height-4 px-4"
																name="receiver_otherAddress" id="otherAddress"
																placeholder="상세주소" /> <br />
															<c:if test="${!empty errorMap}">
																<strong style="color: red;">${errorMap.otherAddress}</strong>
															</c:if>
														</div>
													</div>
													<!-- End Form Group -->


												</div>
											</div>
										</div>

										<div class="px-4 pt-5 bg-white border border-top-0 mt-n-one">
											<div class="woocommerce-additional-fields">
												<h3 class="mb-4 font-size-3">Additional information</h3>
												<div class="woocommerce-additional-fields__field-wrapper">
													<p class="col-12 mb-4d75 px-0 form-row notes"
														id="order_comments_field" data-priority="">
														<label for="order_comments" class="form-label">Order
															notes (optional)</label>
														<textarea name="msg" class="input-text form-control"
															id="order_comments"
															placeholder="Notes about your order, e.g. special notes for delivery."
															rows="8" cols="5"></textarea>
													</p>
												</div>
											</div>
										</div>
									</div>

									<h3 id="order_review_heading" class="d-none">Your order</h3>

									<div id="order_review"
										class="col-md-6 col-lg-5 col-xl-4 woocommerce-checkout-review-order">
										<div id="checkoutAccordion"
											class="border border-gray-900 bg-white mb-5">
											<div class="p-4d875 border">
												<div id="checkoutHeadingOnee" class="checkout-head">
													<a href="#"
														class="text-dark d-flex align-items-center justify-content-between"
														data-toggle="collapse" data-target="#checkoutCollapseOnee"
														aria-expanded="true" aria-controls="checkoutCollapseOnee">

														<h3
															class="checkout-title mb-0 font-weight-medium font-size-3">Your
															order</h3> <svg class="mins"
															xmlns="http://www.w3.org/2000/svg"
															xmlns:xlink="http://www.w3.org/1999/xlink" width="15px"
															height="2px">
                                                            <path
																fill-rule="evenodd" fill="rgb(22, 22, 25)"
																d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                                        </svg> <svg
															class="plus" xmlns="http://www.w3.org/2000/svg"
															xmlns:xlink="http://www.w3.org/1999/xlink" width="15px"
															height="15px">
                                                            <path
																fill-rule="evenodd" fill="rgb(22, 22, 25)"
																d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                                        </svg>
													</a>
												</div>

												<div id="checkoutCollapseOnee"
													class="mt-4 checkout-content collapse show"
													aria-labelledby="checkoutHeadingOnee"
													data-parent="#checkoutAccordion">
													<table
														class="shop_table woocommerce-checkout-review-order-table">
														<thead class="d-none">
															<tr>
																<th class="product-name">Product</th>
																<th class="product-total">Total</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${checkoutList}" var="list">
																<input type="hidden" name="cart_no"
																	value="${list.cart_no}">
																<tr class="cart_item">
																	<td class="product-name">${list.title }&nbsp;<strong
																		class="product-quantity">×
																			${list.cart_book_qt}</strong>
																	</td>
																	<td class="product-total"><span
																		class="woocommerce-Price-amount amount d-flex"><span
																			class="woocommerce-Price-currencySymbol">₩</span> <fmt:formatNumber
																				value="${list.cart_total_price}" pattern="###,###"></fmt:formatNumber></span></td>
																</tr>
															</c:forEach>


														</tbody>
														<tfoot class="d-none">
															<tr class="cart-subtotal">
																<th>Subtotal</th>
																<td><span class="woocommerce-Price-amount amount"><span
																		class="woocommerce-Price-currencySymbol">₩</span> <fmt:formatNumber
																			value="${sub_total_price}" pattern="###,###"></fmt:formatNumber></span></td>
															</tr>

															<tr class="order-total">
																<th>Total</th>
																<td><strong><span
																		class="woocommerce-Price-amount amount "><span
																			class="woocommerce-Price-currencySymbol">₩</span> <fmt:formatNumber
																				value="${sub_total_price}" pattern="###,###"></fmt:formatNumber></span></strong></td>
															</tr>
														</tfoot>
													</table>
												</div>
											</div>

											<div class="p-4d875 border">
												<div id="checkoutHeadingOne" class="checkout-head">
													<a href="#"
														class="text-dark d-flex align-items-center justify-content-between"
														data-toggle="collapse" data-target="#checkoutCollapseOne"
														aria-expanded="true" aria-controls="checkoutCollapseOne">

														<h3
															class="checkout-title mb-0 font-weight-medium font-size-3">Cart
															Totals</h3> <svg class="mins"
															xmlns="http://www.w3.org/2000/svg"
															xmlns:xlink="http://www.w3.org/1999/xlink" width="15px"
															height="2px">
                                                            <path
																fill-rule="evenodd" fill="rgb(22, 22, 25)"
																d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                                        </svg> <svg
															class="plus" xmlns="http://www.w3.org/2000/svg"
															xmlns:xlink="http://www.w3.org/1999/xlink" width="15px"
															height="15px">
                                                            <path
																fill-rule="evenodd" fill="rgb(22, 22, 25)"
																d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                                        </svg>
													</a>
												</div>

												<div id="checkoutCollapseOne"
													class="mt-4 checkout-content collapse show"
													aria-labelledby="checkoutHeadingOne"
													data-parent="#checkoutAccordion">
													<table class="shop_table shop_table_responsive">
														<tbody>
															<tr class="checkout-subtotal">
																<th>Subtotal</th>
																<td data-title="Subtotal"><span
																	class="woocommerce-Price-amount amount d-flex"><span
																		class="woocommerce-Price-currencySymbol">₩</span>
																	<fmt:formatNumber value="${sub_total_price}"
																			pattern="###,###"></fmt:formatNumber></span></td>
															</tr>

															<tr class="order-shipping">
																<th>Shipping</th>
																<td data-title="Shipping">Free Shipping</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>

										</div>
										<div class="form-row place-order">
											<input type="hidden" name="order_price"
												value="${sub_total_price}"> <input type="button"
												class="form-button button alt btn btn-dark btn-block rounded-0 py-4"
												id="place_order" value="Place order"
												data-value="Place order"> <input type="hidden"
												id="_wpnonce" value="926470d564"><input
												type="hidden"
												value="/storefront/?wc-ajax=update_order_review">
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- .entry-content -->
					</article>
					<!-- #post-## -->
				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>
		<!-- .col-full -->
	</div>




	<!-- footer 자리 -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/script.jsp"></c:import>
	<script src="/js/auth/register.js"></script>
	<script>
		$('#checkout-checkbox')
				.change(
						function() {
							console.log("hey")
							if ($(this).is(":checked")) {

								let name = '<c:out value='${principal.member.name}'/>';
								let phone = '<c:out value='${principal.member.phone}'/>';
								let email = '<c:out value='${principal.member.email}'/>';
								let roadAddress = '<c:out value='${principal.member.roadAddress}'/>';
								let zipcode = '<c:out value='${principal.member.zipcode}'/>';
								let otherAddress = '<c:out value='${principal.member.otherAddress}'/>';

								console.log(name)
								$("#nameForm").val(name);

								let phoneArr = phone.split("-");
								$("#tel1").val(phoneArr[0]);
								$("#tel2").val(phoneArr[1]);
								$("#tel3").val(phoneArr[2]);

								let emailArr = email.split("@");
								$("#email1").val(emailArr[0]);
								$("#emailDomain").val(emailArr[1]);

								$("#roadAddress").val(roadAddress);
								$("#zipcode").val(zipcode);
								$("#otherAddress").val(otherAddress);
							} else {
								console.log("unchecked")
								$("#nameForm").val('');

								$("#tel1").val('');
								$("#tel2").val('');
								$("#tel3").val('');

								$("#email1").val('');
								$("#emailDomain").val('');

								$("#roadAddress").val('');
								$("#zipcode").val('');
								$("#otherAddress").val('');
							}

						})

		$('.form-button').on(
				'click',
				function() {
					$('#phone').val(
							$("#tel1").val() + '-' + $("#tel2").val() + '-'
									+ $("#tel3").val());

					$('.checkout-form').submit();

				})
	</script>

</body>
</html>


