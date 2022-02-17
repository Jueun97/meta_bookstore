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
								class="nav-link d-flex align-items-center px-0" href="#"> <span
									class="font-weight-normal text-gray-600">Logout</span>
							</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-9">
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-two-example1"
							role="tabpanel" aria-labelledby="pills-two-example1-tab">
							<div
								class="pt-5 pl-md-5 pt-lg-8 pl-lg-9 space-bottom-lg-2 mb-lg-4">
								<h6
									class="font-weight-medium font-size-7 ml-lg-1 mb-lg-8 pb-xl-1">orders</h6>
								<table class="table">
									<thead>
										<tr class="border">
											<th scope="col"
												class="py-3 border-bottom-0 font-weight-medium pl-3 pl-lg-5">Order</th>
											<th scope="col"
												class="py-3 border-bottom-0 font-weight-medium">Date</th>
											<th scope="col"
												class="py-3 border-bottom-0 font-weight-medium">Staus</th>
											<th scope="col"
												class="py-3 border-bottom-0 font-weight-medium">Total</th>
											<th scope="col"
												class="py-3 border-bottom-0 font-weight-medium">Actions</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${orderList}" var="order">
											<tr class="border">
												<th
													class="pl-3 pl-md-5 font-weight-normal align-middle py-6">${order.order_no}</th>
												<td class="align-middle py-5">${order.order_date}</td>
												<td class="align-middle py-5">${order.status}</td>
												<td class="align-middle py-5"><span
													class="text-primary">₩<fmt:formatNumber
															value="${order.order_price}" pattern="###,###"></fmt:formatNumber></span>
													for ${order.order_count} items</td>
												<td class="align-middle py-5">
													<div class="d-flex justify-content-center">
														<form action="/order/myorder/details" method="POST">
														<input type="hidden" name="order_no" value="${order.order_no}">
															<input type="submit" value="View"
																class="btn btn-dark rounded-0 btn-wide font-weight-medium">

														</form>
													</div>
												</td>
											</tr>
										</c:forEach>


									</tbody>
								</table>
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

</body>
</html>


