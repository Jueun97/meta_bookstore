<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<sec:authorize access="isAuthenticated()">
	<!-- isAuthenticated() : 인증된 정보(세션)에 접근하는 방법 -->
	<sec:authentication property="principal" var="principal"/>
	<!-- var="principal" : 세션정보를 담을 변수 => $principal.member~~}이런식으로 다른 jsp에서 쓰기--> 
</sec:authorize>
<header id="site-header" class="site-header__v3">
	<div class="topbar border-bottom d-none d-md-block">
		<div class="container">
			<div
				class="topbar__nav d-md-flex justify-content-between align-items-center font-size-2">
				<ul class="topbar__nav--left nav">
					<!-- 로그인 안한 경우 인삿말  -->
					<sec:authorize access="not authenticated">
						<li class="nav-item"><span class="link-black-100">환영합니다!
								<a href="/auth/login">로그인</a>을 진행해주세요 :)</span></li>
						
					</sec:authorize>
					<!-- 로그인 한 경우 인삿말  -->
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item"><span class="link-black-100">안녕하세요!
								${principal.member.id} 님! :)</span></li>
					</sec:authorize>

				</ul>
				<ul class="topbar__nav--right nav">
					<li class="nav-item"><a href="/others/storelocation"
						class="nav-link p-2 link-black-100 d-flex align-items-center"><i
							class="glph-icon flaticon-pin mr-2 font-size-3"></i>Store
							Location</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="masthead">
		<div class="bg-white">
			<div class="container py-3 py-md-4">
				<div class="d-flex align-items-center position-relative flex-wrap">
					<div class="site-branding pr-md-7 mx-auto mx-md-0">
						<a style="font-size: 3rem; color: black!important; font-family: 'CookieRun-Regular';" href="/main">MetaBook</a>
					</div>
					<div class="site-navigation mr-auto d-none d-xl-block">
						<ul class="nav">
							<li class="nav-item"><a href="/main"
								class="nav-link link-black-100 mx-3 px-0 py-3 font-weight-medium">Home</a></li>

							<li class="nav-item"><a href="/book/list"
								class="nav-link link-black-100 mx-3 px-0 py-3 font-weight-medium">Shop</a></li>
							<li class="nav-item dropdown"><a id="shopDropdownInvoker"
								href="#"
								class="dropdown-toggle nav-link link-black-100 mx-3 px-0 py-3 font-weight-medium d-flex align-items-center"
								aria-haspopup="true" aria-expanded="false"
								data-unfold-event="hover" data-unfold-target="#shopDropdownMenu"
								data-unfold-type="css-animation" data-unfold-duration="200"
								data-unfold-delay="50" data-unfold-hide-on-scroll="true"
								data-unfold-animation-in="slideInUp"
								data-unfold-animation-out="fadeOut"> Categories </a>
								<ul id="shopDropdownMenu"
									class="dropdown-unfold dropdown-menu font-size-2 rounded-0 border-gray-900"
									aria-labelledby="homeDropdownInvoker">
									<li><a href="/book/list?cate_no=100"
										class="dropdown-item link-black-100">Fiction</a></li>
									<li><a href="/book/list?cate_no=110"
										class="dropdown-item link-black-100">Poetry</a></li>
									<li><a href="/book/list?cate_no=120"
										class="dropdown-item link-black-100">Humanity</a></li>
									<li><a href="/book/list?cate_no=130"
										class="dropdown-item link-black-100">House</a></li>
									<li><a href="/book/list?cate_no=140"
										class="dropdown-item link-black-100">Health</a></li>
									<li><a href="/book/list?cate_no=150"
										class="dropdown-item link-black-100">Leisure</a></li>
									<li><a href="/book/list?cate_no=160"
									class="dropdown-item link-black-100">Economy</a></li>
								</ul></li>
							<li class="nav-item"><a href="/others/about"
								class="nav-link link-black-100 mx-3 px-0 py-3 font-weight-medium">About
									Us</a></li>
							<li class="nav-item"><a href="/others/contact"
								class="nav-link link-black-100 mx-3 px-0 py-3 font-weight-medium">Contact
									Us</a></li>
						</ul>
					</div>
					<div
						class="d-none d-md-flex align-items-center mt-3 mt-md-0 ml-md-auto">
						<!-- question -->
						<a href="mailto:info@bookworm.com" class="mr-4 mb-4 mb-md-0">
							<div
								class="d-flex align-items-center text-dark font-size-2 text-lh-sm">
								<i class="flaticon-question font-size-5 mt-2 mr-1"></i>
								<div class="ml-2">
									<span class="text-secondary-gray-1090 font-size-1">info@metanet.co.kr</span>
									<div class="h6 mb-0">Any questions</div>
								</div>
							</div>
						</a>
						<!-- End question -->

						<!-- Customer care -->
						<a href="tel:+1246-345-0695">
							<div
								class="d-flex align-items-center text-dark font-size-2 text-lh-sm">
								<i class="flaticon-phone font-size-5 mt-2 mr-1"></i>
								<div class="ml-2">
									<span class="text-secondary-gray-1090 font-size-1">02-3704-5000</span>
									<div class="h6 mb-0">Call toll-free</div>
								</div>
							</div>
						</a>
						<!-- End Customer care -->
					</div>
				</div>
			</div>
		</div>

		<div class="bg-primary-home-v3 py-2">
			<div class="container my-1">
				<div class="d-md-flex align-items-center position-relative py-1">
					<div
						class="offcanvas-toggler mr-md-8 d-flex d-md-block align-items-center">

						<a id="sidebarNavToggler2" href="javascript:;" role="button"
							class="cat-menu text-white" aria-controls="sidebarContent2"
							aria-haspopup="true" aria-expanded="false"
							data-unfold-event="click" data-unfold-hide-on-scroll="false"
							data-unfold-target="#sidebarContent2"
							data-unfold-type="css-animation"
							data-unfold-overlay='{
                                    "className": "u-sidebar-bg-overlay",
                                    "background": "rgba(0, 0, 0, .7)",
                                    "animationSpeed": 100
                                }'
							data-unfold-animation-in="fadeInLeft"
							data-unfold-animation-out="fadeOutLeft"
							data-unfold-duration="100"> <svg width="20px" height="18px">
                                    <path fill-rule="evenodd"
									fill="rgb(255, 255, 255)"
									d="M-0.000,-0.000 L20.000,-0.000 L20.000,2.000 L-0.000,2.000 L-0.000,-0.000 Z" />
                                    <path fill-rule="evenodd"
									fill="rgb(255, 255, 255)"
									d="M-0.000,8.000 L15.000,8.000 L15.000,10.000 L-0.000,10.000 L-0.000,8.000 Z" />
                                    <path fill-rule="evenodd"
									fill="rgb(255, 255, 255)"
									d="M-0.000,16.000 L20.000,16.000 L20.000,18.000 L-0.000,18.000 L-0.000,16.000 Z" />
                                </svg> <span class="ml-3">Browse
								categories</span>
						</a>

						<ul class="nav d-md-none ml-auto">
							<li class="nav-item">
								<!-- Account Sidebar Toggle Button - Mobile --> <a
								id="sidebarNavToggler9" href="javascript:;" role="button"
								class="px-2 nav-link text-white" aria-controls="sidebarContent9"
								aria-haspopup="true" aria-expanded="false"
								data-unfold-event="click" data-unfold-hide-on-scroll="false"
								data-unfold-target="#sidebarContent9"
								data-unfold-type="css-animation"
								data-unfold-overlay='{
                                            "className": "u-sidebar-bg-overlay",
                                            "background": "rgba(0, 0, 0, .7)",
                                            "animationSpeed": 500
                                        }'
								data-unfold-animation-in="fadeInRight"
								data-unfold-animation-out="fadeOutRight"
								data-unfold-duration="500"> <i
									class="glph-icon flaticon-user"></i>
							</a> <!-- End Account Sidebar Toggle Button - Mobile -->
							</li>
						</ul>
					</div>
					<div
						class="site-search ml-xl-0 ml-md-auto w-r-100 flex-grow-1 mr-md-5 mt-2 mt-md-0 py-2 py-md-0">
						<form class="form-inline my-2 my-xl-0" action="/book/list">
							<!-- 검색을 하면 새로운 페이지인 1페이지로 갈수있게 page=1 -->
							<input type="hidden" name="page" value="1"/> 
	  						<input type="hidden" name="perPageNum" value="10"/>
	  						<input type="hidden" name="cate_no" value="${bookPageObject.cate_no}"/>
							<div class="input-group input-group-borderless w-100">
								<input type="text" name="word" value="${bookPageObject.word}"
									class="form-control rounded-left-1 px-3 border-right"
									placeholder="Search for books by keyword"
									aria-label="Amount (to the nearest dollar)">
								<div class="input-group-append ml-0">
									<select name="key"
										class="d-none d-lg-block custom-select pr-7 pl-4 rounded-0 shadow-none border-0 text-dark"
										id="inputGroupSelect01">
										<option selected="selected" value="t" ${(bookPageObject.key == "t")?"selected":""}>Title</option>
										<option value="a" ${(bookPageObject.key == "a")?"selected":""}>Author</option>
										<option value="p" ${(bookPageObject.key == "p")?"selected":""}>Publisher</option>
									</select>
									<button class="btn btn-primary-yellow px-3 py-2" type="submit">
										<i class="mx-1 glph-icon flaticon-loupe text-dark"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
					<ul class="nav d-none d-md-flex align-items-center">
						<!-- 로그인 안한 경우 - 유저아이콘 클릭 시 로그인 페이지 이동 / 장바구니 사용 불가 -->
						<sec:authorize access="not authenticated">
							<li class="nav-item">
								<!-- Account Sidebar Toggle Button --> <a id="sidebarNavToggler"
								href="/auth/login" role="button" class="text-white"
								aria-controls="sidebarContent" aria-haspopup="true"
								aria-expanded="false" data-unfold-event="click"
								data-unfold-hide-on-scroll="false"
								data-unfold-target="#sidebarContent"
								data-unfold-type="css-animation"
								data-unfold-overlay='{
                                        "className": "u-sidebar-bg-overlay",
                                        "background": "rgba(0, 0, 0, .7)",
                                        "animationSpeed": 500
                                    }'
								data-unfold-animation-in="fadeInRight"
								data-unfold-animation-out="fadeOutRight"
								data-unfold-duration="500"> <i
									class="glph-icon flaticon-user font-size-4"></i>
							</a> <!-- End Account Sidebar Toggle Button -->
							</li>
						</sec:authorize>
						<!-- 로그인 한 경우 -->
						<sec:authorize access="isAuthenticated()">
							<li class="nav-item">
								<!-- Account Sidebar Toggle Button - 유저 아이콘 클릭 시 마이페이지 이동  --> 
								<a
								id="sidebarNavToggler" href="/member/mypage" role="button"
								class="text-white" aria-controls="sidebarContent"
								aria-haspopup="true" aria-expanded="false"
								data-unfold-event="click" data-unfold-hide-on-scroll="false"
								data-unfold-target="#sidebarContent"
								data-unfold-type="css-animation"
								data-unfold-overlay='{
                                        "className": "u-sidebar-bg-overlay",
                                        "background": "rgba(0, 0, 0, .7)",
                                        "animationSpeed": 500
                                    }'
								data-unfold-animation-in="fadeInRight"
								data-unfold-animation-out="fadeOutRight"
								data-unfold-duration="500"> <i
									class="glph-icon flaticon-user font-size-4"></i>
							</a> <!-- End Account Sidebar Toggle Button -->
							</li>
							<li class="nav-item">
								<!-- Cart Sidebar Toggle Button --> <a id="sidebarNavToggler1"
								href="/cart/details" role="button"
								class="nav-link pr-0 text-white position-relative d-flex align-items-center"
								aria-controls="sidebarContent1" aria-haspopup="true"
								aria-expanded="false" data-unfold-event="click"
								data-unfold-hide-on-scroll="false"
								data-unfold-target="#sidebarContent1"
								data-unfold-type="css-animation"
								data-unfold-overlay='{
                                        "className": "u-sidebar-bg-overlay",
                                        "background": "rgba(0, 0, 0, .7)",
                                        "animationSpeed": 500
                                    }'
								data-unfold-animation-in="fadeInRight"
								data-unfold-animation-out="fadeOutRight"
								data-unfold-duration="500"> 
									<i class="glph-icon flaticon-icon-126515 font-size-4"></i>
									<span
									class="bg-primary-yellow width-16 height-16 rounded-circle d-flex align-items-center justify-content-center text-dark font-size-n9 left-0">${principal.member.cartCount}</span>
							</a> <!-- End Cart Sidebar Toggle Button -->
							</li>
						</sec:authorize>

					</ul>
				</div>
			</div>
		</div>
	</div>
</header>