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

	<div class="site-content" id="content">
		<div class="container">
			<div class="row justify-content-center">
				<div id="primary" class="content-area order-2" style="width: 100%;">
					<div
						class="shop-control-bar d-lg-flex justify-content-between align-items-center mt-5 mb-5 text-center text-md-left">
						<div class="shop-control-bar__left mb-4 m-lg-0">
							<p class="woocommerce-result-count m-0">Showing 1–12 of 126
								results</p>
						</div>
						<div class="shop-control-bar__right d-md-flex align-items-center">
							<form class="woocommerce-ordering mb-4 m-md-0" method="get">
								<!-- Select -->
								<select class="js-select selectpicker dropdown-select orderby"
									name="orderby" id="sel_cateNo"
									data-style="border-bottom shadow-none outline-none py-2">
									<option value="" selected="selected">All Books</option>
									<option value="100"
										${(bookPageObject.cate_no == 100)?"selected":"" }>Fiction</option>
									<option value="110"
										${(bookPageObject.cate_no == 110)?"selected":"" }>Poetry</option>
									<option value="120"
										${(bookPageObject.cate_no == 120)?"selected":"" }>Humanity</option>
									<option value="130"
										${(bookPageObject.cate_no == 130)?"selected":"" }>House</option>
									<option value="140"
										${(bookPageObject.cate_no == 140)?"selected":"" }>Health</option>
									<option value="150"
										${(bookPageObject.cate_no == 150)?"selected":"" }>Leisure</option>
									<option value="160"
										${(bookPageObject.cate_no == 160)?"selected":"" }>Economy</option>
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
									data-width="fit" id="sel_perPageNum">
									<option value="10" selected="selected"
										${(bookPageObject.perPageNum == 10)?"selected":"" }>Show
										10</option>
									<option value="15"
										${(bookPageObject.perPageNum == 15)?"selected":"" }>Show
										15</option>
									<option value="20"
										${(bookPageObject.perPageNum == 20)?"selected":"" }>Show
										20</option>
									<option value="25"
										${(bookPageObject.perPageNum == 25)?"selected":"" }>Show
										25</option>
									<option value="30"
										${(bookPageObject.perPageNum == 30)?"selected":"" }>Show
										30</option>
								</select>
								<!-- End Select -->
							</form>
						</div>
					</div>

					<!-- Tab Content -->
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-one-example1"
							role="tabpanel" aria-labelledby="pills-one-example1-tab">
							<!--bookList 데이터가 없는 경우 표시 -->
							<c:if test="${empty bookList}">
								<div style="text-align: center;">데이터가 존재하지 않습니다.</div>
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
																		alt="image-description"  style="max-width: 45%;">
																</c:when>
																<c:otherwise>
																	<img src="/image/${bookVo.image}"
																		class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
																		alt="image-description"  style="max-width: 45%;">
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
															<a href="/book/detail/${bookVo.book_no}">${bookVo.title}</a>
														</h2>
														<div class="font-size-2  mb-1 text-truncate">
															<span class="text-gray-700">${bookVo.author}</span>
														</div>
														<div
															class="price d-flex align-items-center font-weight-medium font-size-3">
															<span class="woocommerce-Price-amount amount"><span
																class="woocommerce-Price-currencySymbol">$</span>${bookVo.price}</span>
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
										</li>
										<!-- DB뿌리기 끝 c:if종료 -->
									</c:forEach>
								</ul>
							</c:if>
						</div>
						<br>
						<hr>
						<!-- pageNation -->
						<nav aria-label="Page navigation example">
							<ul
								class="pagination pagination__custom justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble">
								<li class="flex-shrink-0 flex-md-shrink-1 page-item"
									data-page="${bookPageObject.startPage-1}">
									<!-- ◀에 해당되는 Previous기능 --> <c:if
										test="${bookPageObject.startPage>1}">
										<c:if test="${!empty bookPageObject.cate_no}">
											<a class="page-link"
												href="/book/list?cate_no=${bookPageObject.cate_no}&page=${bookPageObject.startPage-1}&perPageNum=${bookPageObject.perPageNum}&key=${bookPageObject.key }&word=${bookPageObject.word }">
												Previous </a>
										</c:if>
										<c:if test="${empty bookPageObject.cate_no}">
											<a class="page-link"
												href="/book/list?page=${bookPageObject.startPage-1}&perPageNum=${bookPageObject.perPageNum}&key=${bookPageObject.key }&word=${bookPageObject.word }">
												Previous </a>
										</c:if>
									</c:if> <c:if test="${bookPageObject.startPage==1}">
										<a href="" onclick="return false" class="page-link">
											Previous </a>
									</c:if>
								</li>
								<!-- c:forEach : 숫자부분 -->
								<c:forEach begin="${bookPageObject.startPage}"
									end="${bookPageObject.endPage}" var="cnt">
									<li
										${(bookPageObject.page==cnt)?"class=\"flex-shrink-0 flex-md-shrink-1 page-item active\" aria-current=\"page\" ":"class=\"flex-shrink-0 flex-md-shrink-1\" page-item "}
										data-page="${cnt}">
										<!-- 페이지와 cnt가 같으면 링크가 없음 --> <c:if
											test="${bookPageObject.page==cnt}">
											<a href="" onclick="return false" class="page-link">${cnt}</a>
										</c:if> <!--페이지와 cnt가 같지않으면 링크가 있음--> <c:if
											test="${bookPageObject.page!=cnt}">
											<!-- 카테고리 번호가 있을경우 -->
											<c:if test="${!empty bookPageObject.cate_no}">
												<a
													href="/book/list?cate_no=${bookPageObject.cate_no}&page=${cnt}&perPageNum=${bookPageObject.perPageNum}&key=${bookPageObject.key }&word=${bookPageObject.word }"
													class="page-link"> ${cnt} </a>
											</c:if>
											<!-- 카테고리 번호가 없을 경우 -->
											<c:if test="${empty bookPageObject.cate_no}">
												<a
													href="/book/list?page=${cnt}&perPageNum=${bookPageObject.perPageNum}&key=${bookPageObject.key }&word=${bookPageObject.word }"
													class="page-link"> ${cnt} </a>
											</c:if>
										</c:if>
									</li>
								</c:forEach>
								<!-- ▶부분 -->
								<c:if test="${bookPageObject.endPage<bookPageObject.totalPage}">
									<li class="flex-shrink-0 flex-md-shrink-1 page-item"
										data-page="${bookPageObject.endPage+1}">
										<!-- 카테고리 번호가 있을경우 --> <c:if
											test="${!empty bookPageObject.cate_no}">
											<a
												href="/book/list?cate_no=${bookPageObject.cate_no}&page=${bookPageObject.endPage+1}&perPageNum=${bookPageObject.perPageNum}&key=${bookPageObject.key }&word=${bookPageObject.word }"
												class="page-link"> Next </a>
										</c:if> <!-- 카테고리 번호가 없을 경우 --> <c:if
											test="${empty bookPageObject.cate_no}">
											<a
												href="/book/list?page=${bookPageObject.endPage+1}&perPageNum=${bookPageObject.perPageNum}&key=${bookPageObject.key }&word=${bookPageObject.word }"
												class="page-link"> Next </a>
										</c:if>
									</li>
								</c:if>
								<c:if test="${bookPageObject.endPage==bookPageObject.totalPage}">
									<li class="flex-shrink-0 flex-md-shrink-1 page-item"
										data-page="${bookPageObject.endPage+1}"><a href=""
										onclick="return false" class="page-link"> Next </a></li>
								</c:if>
							</ul>
						</nav>
						<!-- end PageNation -->
					</div>
					<div id="secondary" class="sidebar widget-area order-1"
						role="complementary"></div>
				</div>
			</div>
		</div>
	</div>


	<!-- footer 자리 -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/include/script.jsp"></c:import>
	<script>
			$("#sel_perPageNum").change(function(){
				// 다시 리스트 불러오기 - 전달 정보는 페이지:1, perPageNum을 선택된 값을 전달.
				location = "/book/list?page=1&perPageNum="+$(this).val();
			});
			$("#sel_cateNo").change(function(){
				console.log("값 변경",$(this).val());
				if(!$(this).val()){
					location = "/book/list";
				}else{
					location = "/book/list?cate_no="+$(this).val();
				}
			});
		</script>
</body>
</html>


