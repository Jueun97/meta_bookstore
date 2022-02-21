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
								로그인을 진행해주세요 :)</span></li>
						
					</sec:authorize>
					<!-- 로그인 한 경우 인삿말  -->
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item"><span class="link-black-100">안녕하세요!
								${principal.member.id} 님! :)</span></li>
					</sec:authorize>

				</ul>
				<ul class="topbar__nav--right nav">
					<li class="nav-item"><a href="#"
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
						<a href="/main" class="d-block pb-2d75"> <svg
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="170px"
								height="30px">
                                    <path fill-rule="evenodd"
									fill="rgb(4, 30, 66)"
									d="M166.225,28.691 L165.065,15.398 L160.598,28.691 L158.229,28.691 L153.762,15.398 L152.590,28.691 L148.928,28.691 L150.405,11.052 L155.629,11.052 L159.389,22.124 L163.198,11.052 L168.422,11.052 L169.875,28.691 L166.225,28.691 ZM142.641,28.691 L138.051,20.928 L136.989,20.928 L136.989,28.691 L133.327,28.691 L133.327,11.052 L139.724,11.052 C140.692,11.052 141.546,11.189 142.287,11.461 C143.028,11.734 143.620,12.112 144.063,12.596 C144.507,13.081 144.840,13.636 145.064,14.263 C145.288,14.889 145.400,15.577 145.400,16.326 C145.400,17.506 145.078,18.472 144.436,19.225 C143.793,19.978 142.869,20.484 141.665,20.745 L146.975,28.691 L142.641,28.691 ZM141.896,16.204 C141.896,15.544 141.673,15.028 141.225,14.653 C140.777,14.279 140.086,14.092 139.150,14.092 L136.989,14.092 L136.989,18.303 L139.150,18.303 C140.981,18.303 141.896,17.603 141.896,16.204 ZM125.570,27.831 C124.206,28.567 122.666,28.936 120.949,28.936 C119.224,28.936 117.680,28.567 116.317,27.831 C114.953,27.094 113.881,26.034 113.100,24.651 C112.319,23.267 111.928,21.672 111.928,19.866 C111.928,18.051 112.319,16.454 113.100,15.074 C113.881,13.695 114.953,12.639 116.317,11.907 C117.680,11.174 119.224,10.808 120.949,10.808 C122.674,10.808 124.217,11.174 125.576,11.907 C126.935,12.639 128.005,13.695 128.786,15.074 C129.567,16.454 129.958,18.051 129.958,19.866 C129.958,21.672 129.567,23.267 128.786,24.651 C128.005,26.034 126.933,27.094 125.570,27.831 ZM124.807,15.715 C123.797,14.690 122.512,14.177 120.949,14.177 C119.387,14.177 118.101,14.690 117.092,15.715 C116.083,16.741 115.578,18.124 115.578,19.866 C115.578,21.616 116.083,23.005 117.092,24.034 C118.101,25.064 119.387,25.579 120.949,25.579 C122.512,25.579 123.797,25.064 124.807,24.034 C125.816,23.005 126.320,21.616 126.320,19.866 C126.320,18.124 125.816,16.741 124.807,15.715 ZM66.872,28.691 L61.391,21.196 L60.097,21.196 L60.097,28.691 L56.435,28.691 L56.435,11.052 L60.097,11.052 L60.097,17.986 L61.342,17.986 L66.872,11.052 L71.340,11.052 L64.504,19.487 L71.547,28.691 L66.872,28.691 ZM48.677,27.831 C47.314,28.567 45.774,28.936 44.057,28.936 C42.332,28.936 40.788,28.567 39.425,27.831 C38.061,27.094 36.989,26.034 36.208,24.651 C35.427,23.267 35.036,21.672 35.036,19.866 C35.036,18.051 35.427,16.454 36.208,15.074 C36.989,13.695 38.061,12.639 39.425,11.907 C40.788,11.174 42.332,10.808 44.057,10.808 C45.782,10.808 47.324,11.174 48.684,11.907 C50.043,12.639 51.113,13.695 51.894,15.074 C52.675,16.454 53.066,18.051 53.066,19.866 C53.066,21.672 52.675,23.267 51.894,24.651 C51.113,26.034 50.040,27.094 48.677,27.831 ZM47.915,15.715 C46.905,14.690 45.620,14.177 44.057,14.177 C42.495,14.177 41.209,14.690 40.200,15.715 C39.191,16.741 38.686,18.124 38.686,19.866 C38.686,21.616 39.191,23.005 40.200,24.034 C41.209,25.064 42.495,25.579 44.057,25.579 C45.620,25.579 46.905,25.064 47.915,24.034 C48.924,23.005 49.428,21.616 49.428,19.866 C49.428,18.124 48.924,16.741 47.915,15.715 ZM28.487,27.831 C27.124,28.567 25.584,28.936 23.867,28.936 C22.141,28.936 20.597,28.567 19.234,27.831 C17.871,27.094 16.799,26.034 16.018,24.651 C15.236,23.267 14.846,21.672 14.846,19.866 C14.846,18.051 15.236,16.454 16.018,15.074 C16.799,13.695 17.871,12.639 19.234,11.907 C20.597,11.174 22.141,10.808 23.867,10.808 C25.592,10.808 27.134,11.174 28.493,11.907 C29.852,12.639 30.922,13.695 31.704,15.074 C32.485,16.454 32.875,18.051 32.875,19.866 C32.875,21.672 32.485,23.267 31.704,24.651 C30.922,26.034 29.850,27.094 28.487,27.831 ZM27.724,15.715 C26.715,14.690 25.429,14.177 23.867,14.177 C22.304,14.177 21.018,14.690 20.009,15.715 C19.000,16.741 18.496,18.124 18.496,19.866 C18.496,21.616 19.000,23.005 20.009,24.034 C21.018,25.064 22.304,25.579 23.867,25.579 C25.429,25.579 26.715,25.064 27.724,24.034 C28.733,23.005 29.238,21.616 29.238,19.866 C29.238,18.124 28.733,16.741 27.724,15.715 ZM11.672,27.367 C10.736,28.250 9.361,28.691 7.546,28.691 L0.283,28.691 L0.283,11.052 L5.996,11.052 C7.875,11.052 9.314,11.478 10.311,12.328 C11.308,13.178 11.806,14.365 11.806,15.886 C11.806,16.676 11.633,17.374 11.287,17.980 C10.941,18.586 10.431,19.052 9.755,19.377 C11.969,19.988 13.076,21.445 13.076,23.748 C13.076,25.278 12.608,26.484 11.672,27.367 ZM7.827,14.647 C7.420,14.277 6.821,14.092 6.032,14.092 L3.811,14.092 L3.811,18.242 L6.191,18.242 C6.940,18.242 7.501,18.047 7.875,17.656 C8.250,17.266 8.437,16.753 8.437,16.118 C8.437,15.508 8.233,15.018 7.827,14.647 ZM8.876,21.709 C8.445,21.278 7.749,21.062 6.789,21.062 L3.811,21.062 L3.811,25.554 L6.862,25.554 C7.782,25.554 8.455,25.347 8.883,24.932 C9.310,24.517 9.523,23.988 9.523,23.345 C9.523,22.686 9.308,22.140 8.876,21.709 Z" />
                                    <path fill-rule="evenodd"
									fill="rgb(4, 30, 66)"
									d="M105.996,23.499 C105.995,26.752 103.950,29.265 100.749,29.950 C100.713,29.958 100.681,29.983 100.647,30.000 C100.588,30.000 100.529,30.000 100.471,30.000 C100.467,28.585 100.460,27.170 100.466,25.756 C100.467,25.675 100.550,25.565 100.626,25.518 C101.352,25.067 101.714,24.425 101.711,23.571 C101.707,22.020 101.710,20.468 101.710,18.891 C103.133,18.891 104.546,18.891 105.996,18.891 C105.996,18.989 105.996,19.092 105.996,19.196 C105.996,20.630 105.997,22.064 105.996,23.499 ZM101.715,17.089 C101.715,15.990 101.684,14.917 101.724,13.847 C101.767,12.679 102.761,11.806 103.931,11.838 C105.060,11.869 105.978,12.794 105.993,13.940 C106.005,14.954 105.995,15.968 105.995,16.983 C105.995,17.011 105.987,17.040 105.980,17.089 C104.569,17.089 103.157,17.089 101.715,17.089 ZM96.421,29.234 C94.322,27.983 93.199,26.136 93.155,23.703 C93.108,21.137 93.145,18.571 93.146,16.004 C93.146,15.957 93.153,15.909 93.159,15.840 C94.572,15.840 95.976,15.840 97.426,15.840 C97.426,15.948 97.426,16.060 97.426,16.172 C97.426,18.601 97.430,21.031 97.423,23.461 C97.421,24.363 97.757,25.065 98.548,25.540 C98.629,25.588 98.688,25.740 98.689,25.844 C98.699,27.122 98.695,28.400 98.696,29.679 C98.696,29.786 98.703,29.893 98.707,30.000 C98.648,30.000 98.590,30.000 98.531,30.000 C97.799,29.823 97.075,29.624 96.421,29.234 ZM93.145,14.043 C93.145,13.935 93.145,13.823 93.145,13.710 C93.145,11.318 93.137,8.926 93.149,6.534 C93.154,5.624 92.818,4.927 92.023,4.460 C91.961,4.423 91.894,4.331 91.894,4.264 C91.886,2.850 91.888,1.435 91.888,-0.000 C93.423,0.231 94.703,0.889 95.731,2.008 C96.833,3.208 97.413,4.629 97.421,6.261 C97.433,8.790 97.427,11.319 97.427,13.848 C97.427,13.906 97.421,13.964 97.416,14.043 C96.005,14.043 94.600,14.043 93.145,14.043 ZM89.588,4.782 C89.034,5.128 88.866,5.768 88.869,6.431 C88.876,8.061 88.870,9.692 88.869,11.322 C88.869,12.142 88.869,12.962 88.867,13.783 C88.867,13.868 88.857,13.954 88.851,14.051 C87.434,14.051 86.035,14.051 84.588,14.051 C84.588,13.957 84.588,13.865 84.588,13.774 C84.588,11.294 84.579,8.813 84.590,6.333 C84.605,3.158 86.853,0.542 90.000,0.017 C90.029,0.012 90.058,0.017 90.125,0.017 C90.125,0.639 90.125,1.243 90.125,1.848 C90.125,2.404 90.109,2.961 90.130,3.517 C90.149,4.031 90.126,4.446 89.588,4.782 ZM84.585,15.837 C86.015,15.837 87.420,15.837 88.868,15.837 C88.868,15.951 88.868,16.065 88.868,16.178 C88.868,18.608 88.849,21.038 88.873,23.468 C88.908,27.007 86.358,29.492 83.589,29.955 C83.552,29.961 83.518,29.984 83.482,30.000 C83.424,30.000 83.365,30.000 83.306,30.000 C83.310,28.634 83.319,27.268 83.313,25.902 C83.312,25.691 83.376,25.579 83.559,25.467 C84.268,25.030 84.587,24.370 84.587,23.548 C84.587,21.099 84.586,18.650 84.585,16.200 C84.585,16.085 84.585,15.970 84.585,15.837 ZM81.366,30.000 C80.875,29.844 80.361,29.739 79.898,29.524 C77.435,28.380 76.120,26.440 76.027,23.732 C75.974,22.192 76.017,20.649 76.016,19.107 C76.016,19.040 76.016,18.973 76.016,18.886 C77.447,18.886 78.859,18.886 80.303,18.886 C80.303,19.000 80.303,19.104 80.303,19.209 C80.303,20.662 80.308,22.116 80.302,23.570 C80.298,24.426 80.666,25.064 81.387,25.518 C81.463,25.566 81.547,25.675 81.547,25.756 C81.553,27.170 81.546,28.585 81.542,30.000 C81.484,30.000 81.425,30.000 81.366,30.000 ZM76.017,17.096 C76.017,16.539 76.017,15.996 76.017,15.453 C76.017,14.965 76.012,14.477 76.018,13.990 C76.030,12.831 76.911,11.892 78.032,11.838 C79.203,11.781 80.217,12.619 80.282,13.797 C80.341,14.884 80.294,15.978 80.294,17.096 C78.857,17.096 77.452,17.096 76.017,17.096 Z" />
                                </svg>
						</a>
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
							<li class="nav-item"><a href="#"
								class="nav-link link-black-100 mx-3 px-0 py-3 font-weight-medium">About
									Us</a></li>
							<li class="nav-item"><a href="#"
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
	  						<input type="hidden" name="perPageNum" value="${bookPageObject.perPageNum}"/>
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