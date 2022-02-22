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
</head>
<body>
	<!--header자리 -->
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/aside.jsp"></c:import>

	<!--     content here 내용은 여기에 넣어주세용  -->
	<main id="content">
		<div class=" space-bottom-3">
			<div class="container">
				<div class="py-5 py-lg-7">
					<h6 class="font-weight-medium font-size-7 text-center mt-lg-1">Order
						Information</h6>
				</div>
				<div class="max-width-890 mx-auto">
					<div class="bg-white pt-6 border">
						<h6
							class="font-size-3 font-weight-medium text-center mb-4 pb-xl-1">Your
							order information is here</h6>
						<div
							class="border-bottom mb-5 pb-5 overflow-auto overflow-md-visible">
							<div class="pl-3">
								<table class="table table-borderless mb-0 ml-1">
									<thead>
										<tr>
											<th scope="col" class="font-size-2 font-weight-normal py-0">Order
												number:</th>
											<th scope="col" class="font-size-2 font-weight-normal py-0">Date:</th>
											<th scope="col"
												class="font-size-2 font-weight-normal py-0 text-md-center">Total:
											</th>
											<th scope="col"
												class="font-size-2 font-weight-normal py-0 text-md-right pr-md-9">Payment
												method:</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" class="pr-0 py-0 font-weight-medium">${orderInfo.order_no}</th>
											<td class="pr-0 py-0 font-weight-medium">${orderInfo.order_date}</td>
											<td class="pr-0 py-0 font-weight-medium text-md-center">
												<fmt:formatNumber value="${orderInfo.order_price}"
													pattern="###,###"></fmt:formatNumber>원
											</td>
											<td class="pr-md-4 py-0 font-weight-medium text-md-right">Direct
												bank transfer</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="border-bottom mb-5 pb-6">
							<div class="px-3 px-md-4">
								<div class="ml-md-2">
									<h6 class="font-size-3 on-weight-medium mb-4 pb-1">Order
										Details</h6>
									<table
										class="shop_table shop_table_responsive cart woocommerce-cart-form__contents">
										<thead>
											<tr>
												<th class="product-name">Product</th>
												<th class="product-price">Price</th>
												<th class="product-quantity">Quantity</th>
												<th class="product-subtotal">Total</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${orderItems}" var="item">
												<tr class="woocommerce-cart-form__cart-item order_items">
													<td class="product-name" data-title="Product"
														style="padding: 1.6rem 1rem;">
														<div class="d-flex align-items-center">
															<a href="/book/detail/${cart.book_no}"> <img
																src="${item.image}"
																class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image"
																alt="">
															</a>
															<div class="ml-3 m-w-200-lg-down">
																<a href="/book/detail/${item.book_no}">${item.title}</a>
																<a href="/book/detail/${item.book_no}"
																	class="text-gray-700 font-size-2 d-block" tabindex="0">${item.author}</a>
															</div>
														</div>
													</td>

													<td class="product-price" data-title="Price"
														style="padding: 1.6rem 1rem;"><span
														class="woocommerce-Price-amount amount"><fmt:formatNumber
																value="${item.price}" pattern="###,###"></fmt:formatNumber>원</span></td>

													<td class="product-quantity" data-title="Quantity"
														style="padding: 1.6rem 1rem;">
														<div class="quantity d-flex align-items-center">
															<!-- Quantity -->
															<div class="px-3">
																<div class="js-quantity">
																	<div class="d-flex align-items-center">
																		${item.order_qt} 개</div>
																</div>
															</div>
															<!-- End Quantity -->
														</div>
													</td>

													<td class="product-subtotal" data-title="Total"
														style="padding: 1.6rem 1rem;"><span
														class="woocommerce-Price-amount amount"
														style="width: max-content;"><fmt:formatNumber
																value="${item.total_price}" pattern="###,###"></fmt:formatNumber>원</span></td>

												</tr>
											</c:forEach>

										</tbody>
									</table>

								</div>
								<div>
									<h6 class="font-size-3 on-weight-medium mb-4 mt-4 pb-1">Order
										Notes</h6>
									<div style="padding: 1.6rem 1rem; border: 1px solid #eae8e4;">
										${orderInfo.msg}</div>
								</div>
							</div>

						</div>
						<div class="border-bottom mb-5 pb-5">
							<ul class="list-unstyled px-3 pl-md-5 pr-md-4 mb-0">
								<li class="d-flex justify-content-between py-2"><span
									class="font-weight-medium font-size-2">Subtotal:</span> <span
									class="font-weight-medium font-size-2"><fmt:formatNumber
											value="${orderInfo.order_price}" pattern="###,###"></fmt:formatNumber>원</span></li>
								<li class="d-flex justify-content-between py-2"><span
									class="font-weight-medium font-size-2">Shipping:</span> <span
									class="font-weight-medium font-size-2">Free Shipping</span></li>
								<li class="d-flex justify-content-between pt-2"><span
									class="font-weight-medium font-size-2">Payment Method:</span> <span
									class="font-weight-medium font-size-2">Direct bank
										transfer</span></li>
							</ul>
						</div>
						<div class="border-bottom mb-5 pb-4">
							<div class="px-3 pl-md-5 pr-md-4">
								<div class="d-flex justify-content-between">
									<span class="font-size-2 font-weight-medium">Total</span> <span
										class="font-weight-medium fon-size-2"><fmt:formatNumber
											value="${orderInfo.order_price}" pattern="###,###"></fmt:formatNumber>원</span>
								</div>
							</div>
						</div>
						<div class="px-3 pl-md-5 pr-md-4 mb-6 pb-xl-1">
							<div class="row row-cols-1 row-cols-md-2">
								<div class="col">
									<div class="mb-6 mb-md-0">
										<h6 class="font-weight-medium font-size-22 mb-3">Billing
											Address</h6>
										<address class="d-flex flex-column mb-0">
											<span class="text-gray-600 font-size-2">${principal.member.name}
												| ${principal.member.phone}</span> <span
												class="text-gray-600 font-size-2">${principal.member.roadAddress}</span>
											<span class="text-gray-600 font-size-2">${principal.member.otherAddress}</span>
											<span class="text-gray-600 font-size-2">${principal.member.zipcode}</span>
											<span class="text-gray-600 font-size-2">Republic Of
												Korea</span>
										</address>
									</div>
								</div>
								<div class="col">
									<h6 class="font-weight-medium font-size-22 mb-3">Shipping
										Address</h6>
									<address class="d-flex flex-column mb-0">
										<span class="text-gray-600 font-size-2">${orderInfo.receiver_name}
											| ${orderInfo.receiver_phone }</span> <span
											class="text-gray-600 font-size-2">${orderInfo.receiver_roadAddress }</span>
										<span class="text-gray-600 font-size-2">${orderInfo.receiver_otherAddress }</span>
										<span class="text-gray-600 font-size-2">${orderInfo.receiver_zipcode }</span>
										<span class="text-gray-600 font-size-2">Republic Of
											Korea</span>
									</address>
								</div>
							</div>
						</div>
					</div>
					<c:if test="${orderInfo.status_code==100}">
						<div class="d-flex justify-content-end" style="margin-top: 7px;">
							<form action="/order/myorder/update" method="POST"
								class="updateAddress">
								<input type="hidden" name="order_no"
									value="${orderInfo.order_no}"> <input type="button"
									value="배송지수정"
									class="updateAddressBtn btn btn-dark rounded-1 btn-short font-weight-medium"
									style="margin: 0 5px;">
							</form>
							<form action="/order/myorder/delete" method="POST"
								class="cancelOrder">
								<input type="hidden" name="order_no"
									value="${orderInfo.order_no}"> <input type="button"
									value="주문취소"
									class="cancelOrderBtn btn btn-dark rounded-1 btn-short font-weight-medium"
									style="margin: 0 5px;">
							</form>
						</div>
					</c:if>

				</div>
			</div>
		</div>
	</main>



	<!-- footer 자리 -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/script.jsp"></c:import>
	<script>
		$('.updateAddressBtn').on('click', function() {
			if (window.confirm("배송지를 수정하시겠습니까?")) {
				$('.updateAddress').submit();
			}
		})
		$('.cancelOrderBtn').on('click', function() {
			if (window.confirm("주문을 취소하시갰습니까?")) {
				$('.cancelOrder').submit();
			}
		})
	</script>

</body>
</html>


