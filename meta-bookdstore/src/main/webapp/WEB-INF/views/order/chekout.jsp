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
								<div class="woocommerce-info p-4 bg-white border">
									Have a coupon? <a class="showcoupon" data-toggle="collapse"
										href="#collapseExample9" role="button" aria-expanded="false"
										aria-controls="collapseExample9"> Click here to enter your
										code </a>
								</div>

								<form id="collapseExample9"
									class="collapse checkout_coupon mt-4 p-4 bg-white border"
									method="post">
									<div class="row d-flex">
										<p
											class="col-md-4 d-inline form-row form-row-first mb-3 mb-md-0">
											<input type="text" name="coupon_code1"
												class="input-text form-control" placeholder="Coupon code"
												id="coupon_code1" value="">
										</p>

										<p class="col-md-3 d-inline form-row form-row-last">
											<input type="submit"
												class="button form-control border-0 height-4 btn btn-dark rounded-0"
												name="apply_coupon" value="Apply coupon">
										</p>
									</div>

									<div class="clear"></div>
								</form>

								<form name="checkout" method="post"
									class="checkout woocommerce-checkout row mt-8"
									action="http://127.0.0.1:5501/html/shop/order-received.html"
									enctype="multipart/form-data" novalidate="novalidate">
									<div class="col2-set col-md-6 col-lg-7 col-xl-8 mb-6 mb-md-0"
										id="customer_details">
										<div class="px-4 pt-5 bg-white border">
											<div class="woocommerce-billing-fields">

												<h3 class="mb-4 font-size-3">Billing details</h3>

												<div class="woocommerce-billing-fields__field-wrapper row">
													<p
														class="col-lg-6 mb-4d75 form-row form-row-first validate-required woocommerce-invalid woocommerce-invalid-required-field"
														id="billing_first_name_field" data-priority="10">
														<label for="billing_first_name" class="form-label">First
															name <abbr class="required" title="required">*</abbr>
														</label> <input type="text" class="input-text form-control"
															name="billing_first_name" id="billing_first_name"
															placeholder="" value="" autocomplete="given-name"
															autofocus="autofocus">
													</p>

													<p
														class="col-lg-6 mb-4d75 form-row form-row-last validate-required"
														id="billing_last_name_field" data-priority="20">
														<label for="billing_last_name" class="form-label">Last
															name <abbr class="required" title="required">*</abbr>
														</label> <input type="text" class="input-text form-control"
															name="billing_last_name" id="billing_last_name"
															placeholder="" value="" autocomplete="family-name">
													</p>

													<p class="col-12 mb-4d75 form-row form-row-wide"
														id="billing_company_field" data-priority="30">
														<label for="billing_company" class="form-label">Company
															name</label> <input type="text" class="input-text form-control"
															name="billing_company" id="billing_company"
															placeholder="" value="" autocomplete="organization">
													</p>

													<p
														class="col-12 mb-4d75 form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated"
														id="billing_country_field" data-priority="40">
														<label for="billing_country" class="form-label">Country
															<abbr class="required" title="required">*</abbr>
														</label> <select name="billing_country" id="billing_country"
															class="form-control country_to_state country_select  select2-hidden-accessible"
															autocomplete="country" tabindex="-1" aria-hidden="true">
															<option value="">Select a country…</option>
															<option value="AX">Åland Islands</option>
															<option value="AF">Afghanistan</option>
															<option value="AL">Albania</option>
															<option value="DZ">Algeria</option>
															<option value="AS">American Samoa</option>
															<option value="AD">Andorra</option>
															<option value="AO">Angola</option>
															<option value="AI">Anguilla</option>
															<option value="AQ">Antarctica</option>
															<option value="AG">Antigua and Barbuda</option>
															<option value="AR">Argentina</option>
															<option value="AM">Armenia</option>
															<option value="AW">Aruba</option>
															<option value="AU">Australia</option>
															<option value="AT">Austria</option>
															<option value="AZ">Azerbaijan</option>
															<option value="BS">Bahamas</option>
															<option value="BH">Bahrain</option>
															<option value="BD">Bangladesh</option>
															<option value="BB">Barbados</option>
															<option value="BY">Belarus</option>
															<option value="PW">Belau</option>
															<option value="BE">Belgium</option>
															<option value="BZ">Belize</option>
															<option value="BJ">Benin</option>
															<option value="BM">Bermuda</option>
															<option value="BT">Bhutan</option>
															<option value="BO">Bolivia</option>
															<option value="BQ">Bonaire, Saint Eustatius and
																Saba</option>
															<option value="BA">Bosnia and Herzegovina</option>
															<option value="BW">Botswana</option>
															<option value="BV">Bouvet Island</option>
															<option value="BR">Brazil</option>
															<option value="IO">British Indian Ocean
																Territory</option>
															<option value="VG">British Virgin Islands</option>
															<option value="BN">Brunei</option>
															<option value="BG">Bulgaria</option>
															<option value="BF">Burkina Faso</option>
															<option value="BI">Burundi</option>
															<option value="KH">Cambodia</option>
															<option value="CM">Cameroon</option>
															<option value="CA">Canada</option>
															<option value="CV">Cape Verde</option>
															<option value="KY">Cayman Islands</option>
															<option value="CF">Central African Republic</option>
															<option value="TD">Chad</option>
															<option value="CL">Chile</option>
															<option value="CN">China</option>
															<option value="CX">Christmas Island</option>
															<option value="CC">Cocos (Keeling) Islands</option>
															<option value="CO">Colombia</option>
															<option value="KM">Comoros</option>
															<option value="CG">Congo (Brazzaville)</option>
															<option value="CD">Congo (Kinshasa)</option>
															<option value="CK">Cook Islands</option>
															<option value="CR">Costa Rica</option>
															<option value="HR">Croatia</option>
															<option value="CU">Cuba</option>
															<option value="CW">Curaçao</option>
															<option value="CY">Cyprus</option>
															<option value="CZ">Czech Republic</option>
															<option value="DK">Denmark</option>
															<option value="DJ">Djibouti</option>
															<option value="DM">Dominica</option>
															<option value="DO">Dominican Republic</option>
															<option value="EC">Ecuador</option>
															<option value="EG">Egypt</option>
															<option value="SV">El Salvador</option>
															<option value="GQ">Equatorial Guinea</option>
															<option value="ER">Eritrea</option>
															<option value="EE">Estonia</option>
															<option value="ET">Ethiopia</option>
															<option value="FK">Falkland Islands</option>
															<option value="FO">Faroe Islands</option>
															<option value="FJ">Fiji</option>
															<option value="FI">Finland</option>
															<option value="FR">France</option>
															<option value="GF">French Guiana</option>
															<option value="PF">French Polynesia</option>
															<option value="TF">French Southern Territories</option>
															<option value="GA">Gabon</option>
															<option value="GM">Gambia</option>
															<option value="GE">Georgia</option>
															<option value="DE">Germany</option>
															<option value="GH">Ghana</option>
															<option value="GI">Gibraltar</option>
															<option value="GR">Greece</option>
															<option value="GL">Greenland</option>
															<option value="GD">Grenada</option>
															<option value="GP">Guadeloupe</option>
															<option value="GU">Guam</option>
															<option value="GT">Guatemala</option>
															<option value="GG">Guernsey</option>
															<option value="GN">Guinea</option>
															<option value="GW">Guinea-Bissau</option>
															<option value="GY">Guyana</option>
															<option value="HT">Haiti</option>
															<option value="HM">Heard Island and McDonald
																Islands</option>
															<option value="HN">Honduras</option>
															<option value="HK">Hong Kong</option>
															<option value="HU">Hungary</option>
															<option value="IS">Iceland</option>
															<option value="IN">India</option>
															<option value="ID">Indonesia</option>
															<option value="IR">Iran</option>
															<option value="IQ">Iraq</option>
															<option value="IE">Ireland</option>
															<option value="IM">Isle of Man</option>
															<option value="IL">Israel</option>
															<option value="IT">Italy</option>
															<option value="CI">Ivory Coast</option>
															<option value="JM">Jamaica</option>
															<option value="JP">Japan</option>
															<option value="JE">Jersey</option>
															<option value="JO">Jordan</option>
															<option value="KZ">Kazakhstan</option>
															<option value="KE">Kenya</option>
															<option value="KI">Kiribati</option>
															<option value="KW">Kuwait</option>
															<option value="KG">Kyrgyzstan</option>
															<option value="LA">Laos</option>
															<option value="LV">Latvia</option>
															<option value="LB">Lebanon</option>
															<option value="LS">Lesotho</option>
															<option value="LR">Liberia</option>
															<option value="LY">Libya</option>
															<option value="LI">Liechtenstein</option>
															<option value="LT">Lithuania</option>
															<option value="LU">Luxembourg</option>
															<option value="MO">Macao S.A.R., China</option>
															<option value="MK">Macedonia</option>
															<option value="MG">Madagascar</option>
															<option value="MW">Malawi</option>
															<option value="MY">Malaysia</option>
															<option value="MV">Maldives</option>
															<option value="ML">Mali</option>
															<option value="MT">Malta</option>
															<option value="MH">Marshall Islands</option>
															<option value="MQ">Martinique</option>
															<option value="MR">Mauritania</option>
															<option value="MU">Mauritius</option>
															<option value="YT">Mayotte</option>
															<option value="MX">Mexico</option>
															<option value="FM">Micronesia</option>
															<option value="MD">Moldova</option>
															<option value="MC">Monaco</option>
															<option value="MN">Mongolia</option>
															<option value="ME">Montenegro</option>
															<option value="MS">Montserrat</option>
															<option value="MA">Morocco</option>
															<option value="MZ">Mozambique</option>
															<option value="MM">Myanmar</option>
															<option value="NA">Namibia</option>
															<option value="NR">Nauru</option>
															<option value="NP">Nepal</option>
															<option value="NL">Netherlands</option>
															<option value="NC">New Caledonia</option>
															<option value="NZ">New Zealand</option>
															<option value="NI">Nicaragua</option>
															<option value="NE">Niger</option>
															<option value="NG">Nigeria</option>
															<option value="NU">Niue</option>
															<option value="NF">Norfolk Island</option>
															<option value="KP">North Korea</option>
															<option value="MP">Northern Mariana Islands</option>
															<option value="NO">Norway</option>
															<option value="OM">Oman</option>
															<option value="PK">Pakistan</option>
															<option value="PS">Palestinian Territory</option>
															<option value="PA">Panama</option>
															<option value="PG">Papua New Guinea</option>
															<option value="PY">Paraguay</option>
															<option value="PE">Peru</option>
															<option value="PH">Philippines</option>
															<option value="PN">Pitcairn</option>
															<option value="PL">Poland</option>
															<option value="PT">Portugal</option>
															<option value="PR">Puerto Rico</option>
															<option value="QA">Qatar</option>
															<option value="RE">Reunion</option>
															<option value="RO">Romania</option>
															<option value="RU">Russia</option>
															<option value="RW">Rwanda</option>
															<option value="ST">São Tomé and Príncipe</option>
															<option value="BL">Saint Barthélemy</option>
															<option value="SH">Saint Helena</option>
															<option value="KN">Saint Kitts and Nevis</option>
															<option value="LC">Saint Lucia</option>
															<option value="SX">Saint Martin (Dutch part)</option>
															<option value="MF">Saint Martin (French part)</option>
															<option value="PM">Saint Pierre and Miquelon</option>
															<option value="VC">Saint Vincent and the
																Grenadines</option>
															<option value="WS">Samoa</option>
															<option value="SM">San Marino</option>
															<option value="SA">Saudi Arabia</option>
															<option value="SN">Senegal</option>
															<option value="RS">Serbia</option>
															<option value="SC">Seychelles</option>
															<option value="SL">Sierra Leone</option>
															<option value="SG">Singapore</option>
															<option value="SK">Slovakia</option>
															<option value="SI">Slovenia</option>
															<option value="SB">Solomon Islands</option>
															<option value="SO">Somalia</option>
															<option value="ZA">South Africa</option>
															<option value="GS">South Georgia/Sandwich
																Islands</option>
															<option value="KR">South Korea</option>
															<option value="SS">South Sudan</option>
															<option value="ES">Spain</option>
															<option value="LK">Sri Lanka</option>
															<option value="SD">Sudan</option>
															<option value="SR">Suriname</option>
															<option value="SJ">Svalbard and Jan Mayen</option>
															<option value="SZ">Swaziland</option>
															<option value="SE">Sweden</option>
															<option value="CH">Switzerland</option>
															<option value="SY">Syria</option>
															<option value="TW">Taiwan</option>
															<option value="TJ">Tajikistan</option>
															<option value="TZ">Tanzania</option>
															<option value="TH">Thailand</option>
															<option value="TL">Timor-Leste</option>
															<option value="TG">Togo</option>
															<option value="TK">Tokelau</option>
															<option value="TO">Tonga</option>
															<option value="TT">Trinidad and Tobago</option>
															<option value="TN">Tunisia</option>
															<option value="TR">Turkey</option>
															<option value="TM">Turkmenistan</option>
															<option value="TC">Turks and Caicos Islands</option>
															<option value="TV">Tuvalu</option>
															<option value="UG">Uganda</option>
															<option value="UA">Ukraine</option>
															<option value="AE">United Arab Emirates</option>
															<option value="GB" selected="selected">United
																Kingdom (UK)</option>
															<option value="US">United States (US)</option>
															<option value="UM">United States (US) Minor
																Outlying Islands</option>
															<option value="VI">United States (US) Virgin
																Islands</option>
															<option value="UY">Uruguay</option>
															<option value="UZ">Uzbekistan</option>
															<option value="VU">Vanuatu</option>
															<option value="VA">Vatican</option>
															<option value="VE">Venezuela</option>
															<option value="VN">Vietnam</option>
															<option value="WF">Wallis and Futuna</option>
															<option value="EH">Western Sahara</option>
															<option value="YE">Yemen</option>
															<option value="ZM">Zambia</option>
															<option value="ZW">Zimbabwe</option>
														</select>
													</p>

													<p
														class="col-12 mb-3 form-row form-row-wide address-field validate-required"
														id="billing_address_1_field" data-priority="50">
														<label for="billing_address_1" class="form-label">Street
															address <abbr class="required" title="required">*</abbr>
														</label> <input type="text" class="input-text form-control"
															name="billing_address_1" id="billing_address_1"
															placeholder="House number and street name" value=""
															autocomplete="address-line1">
													</p>

													<p
														class="col-12 mb-4d75 form-row form-row-wide address-field"
														id="billing_address_2_field" data-priority="60">
														<input type="text" class="input-text form-control"
															name="billing_address_2" id="billing_address_2"
															placeholder="Apartment, suite, unit etc. (optional)"
															value="" autocomplete="address-line2">
													</p>

													<p
														class="col-12 mb-4d75 form-row form-row-wide address-field validate-required"
														id="billing_city_field" data-priority="70"
														data-o_class="form-row form-row-wide address-field validate-required">
														<label for="billing_city" class="form-label">Town
															/ City <abbr class="required" title="required">*</abbr>
														</label> <input type="text" class="input-text form-control"
															name="billing_city" id="billing_city" placeholder=""
															value="" autocomplete="address-level2">
													</p>

													<p
														class="col-12 mb-4d75 form-row form-row-wide address-field validate-state woocommerce-validated"
														id="billing_state_field" data-priority="80"
														data-o_class="form-row form-row-wide address-field validate-state">
														<label for="billing_state" class="form-label">County</label>
														<input type="text" class="input-text form-control"
															value="" placeholder="" name="billing_state"
															id="billing_state" autocomplete="address-level1">
													</p>

													<p
														class="col-12 mb-4d75 form-row form-row-wide address-field validate-postcode validate-required"
														id="billing_postcode_field" data-priority="90"
														data-o_class="form-row form-row-wide address-field validate-required validate-postcode">
														<label for="billing_postcode" class="form-label">Postcode
															<abbr class="required" title="required">*</abbr>
														</label> <input type="text" class="input-text form-control"
															name="billing_postcode" id="billing_postcode"
															placeholder="" value="" autocomplete="postal-code">
													</p>

													<p
														class="col-12 mb-4d75 form-row form-row-first validate-required validate-phone"
														id="billing_phone_field" data-priority="100">
														<label for="billing_phone" class="form-label">Phone
															<abbr class="required" title="required">*</abbr>
														</label> <input type="tel" class="input-text form-control"
															name="billing_phone" id="billing_phone" placeholder=""
															value="" autocomplete="tel">
													</p>

													<p
														class="col-12 mb-4d75 form-row form-row-last validate-required validate-email"
														id="billing_email_field" data-priority="110">
														<label for="billing_email" class="form-label">Email
															address <abbr class="required" title="required">*</abbr>
														</label> <input type="email" class="input-text form-control"
															name="billing_email" id="billing_email" placeholder=""
															value="" autocomplete="email">
													</p>
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
														<textarea name="order_comments"
															class="input-text form-control" id="order_comments"
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
															<tr class="cart_item">
																<td class="product-name">Touchscreen MP3
																	Player&nbsp; <strong class="product-quantity">×
																		1</strong>
																</td>
																<td class="product-total"><span
																	class="woocommerce-Price-amount amount"><span
																		class="woocommerce-Price-currencySymbol">£</span>79.99</span>
																</td>
															</tr>

															<tr class="cart_item">
																<td class="product-name">Happy Ninja&nbsp; <strong
																	class="product-quantity">× 1</strong>
																</td>
																<td class="product-total"><span
																	class="woocommerce-Price-amount amount"><span
																		class="woocommerce-Price-currencySymbol">£</span>18.00</span>
																</td>
															</tr>
														</tbody>
														<tfoot class="d-none">
															<tr class="cart-subtotal">
																<th>Subtotal</th>
																<td><span class="woocommerce-Price-amount amount"><span
																		class="woocommerce-Price-currencySymbol">£</span>97.99</span></td>
															</tr>

															<tr class="order-total">
																<th>Total</th>
																<td><strong><span
																		class="woocommerce-Price-amount amount"><span
																			class="woocommerce-Price-currencySymbol">£</span>97.99</span></strong>
																</td>
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
																	class="woocommerce-Price-amount amount"><span
																		class="woocommerce-Price-currencySymbol">£</span>79.99</span></td>
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
												<div id="checkoutHeadingTwo" class="checkout-head">
													<a href="#"
														class="text-dark d-flex align-items-center justify-content-between"
														data-toggle="collapse" data-target="#checkoutCollapseTwo"
														aria-expanded="false" aria-controls="checkoutCollapseTwo">

														<h3
															class="checkout-title mb-0 font-weight-medium font-size-3">Shipping</h3>

														<svg class="mins" xmlns="http://www.w3.org/2000/svg"
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

												<div id="checkoutCollapseTwo"
													class="mt-4 checkout-content collapse"
													aria-labelledby="checkoutHeadingTwo"
													data-parent="#checkoutAccordion">
													<!-- Checkboxes -->
													<ul id="shipping_method">
														<li><input type="radio" name="shipping_method[0]"
															data-index="0" id="shipping_method_0_flat_rate1"
															value="flat_rate:1" class="shipping_method"> <label
															for="shipping_method_0_flat_rate1">Free shipping</label>
														</li>

														<li><input type="radio" name="shipping_method[0]"
															data-index="0" id="shipping_method_0_flat_rate2"
															value="flat_rate:2" class="shipping_method"
															checked="checked"> <label
															for="shipping_method_0_flat_rate2">Flat rate: <span
																class="woocommerce-Price-amount amount"><span
																	class="woocommerce-Price-currencySymbol">$</span>15</span></label></li>

														<li><input type="radio" name="shipping_method[0]"
															data-index="0" id="shipping_method_0_flat_rate3"
															value="flat_rate:2" class="shipping_method"
															checked="checked"> <label
															for="shipping_method_0_flat_rate3">Local pickup::
																<span class="woocommerce-Price-amount amount"><span
																	class="woocommerce-Price-currencySymbol">$</span>8</span>
														</label></li>
													</ul>
													<!-- End Checkboxes -->
													<span class="font-size-2">Shipping to Turkey.</span><a
														href="#"
														class="font-weight-medium h-primary ml-3 font-size-2">Change
														Address</a>
												</div>
											</div>

											<div class="p-4d875 border">
												<div id="checkoutHeadingThree" class="checkout-head">
													<a href="#"
														class="text-dark d-flex align-items-center justify-content-between"
														data-toggle="collapse"
														data-target="#checkoutCollapseThree" aria-expanded="true"
														aria-controls="checkoutCollapseThree">

														<h3
															class="checkout-title mb-0 font-weight-medium font-size-3">Coupon</h3>

														<svg class="mins" xmlns="http://www.w3.org/2000/svg"
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

												<div id="checkoutCollapseThree"
													class="mt-4 checkout-content collapse show"
													aria-labelledby="checkoutHeadingThree"
													data-parent="#checkoutAccordion">
													<div class="coupon">
														<label for="coupon_code">Coupon:</label> <input
															type="text" name="coupon_code" class="input-text"
															id="coupon_code" value="" placeholder="Coupon code"
															autocomplete="off"> <input type="submit"
															class="button" name="apply_coupon" value="Apply coupon">
													</div>
												</div>
											</div>

											<div class="p-4d875 border">
												<table class="shop_table shop_table_responsive">
													<tbody>
														<tr class="order-total">
															<th>Total</th>
															<td data-title="Total"><strong><span
																	class="woocommerce-Price-amount amount"><span
																		class="woocommerce-Price-currencySymbol">£</span>97.99</span></strong>
															</td>
														</tr>
													</tbody>
												</table>
											</div>

											<div class="p-4d875 border">
												<div id="checkoutHeadingThreee" class="checkout-head">
													<a href="#"
														class="text-dark d-flex align-items-center justify-content-between"
														data-toggle="collapse"
														data-target="#checkoutCollapseThreee" aria-expanded="true"
														aria-controls="checkoutCollapseThreee">

														<h3
															class="checkout-title mb-0 font-weight-medium font-size-3">Payment</h3>

														<svg class="mins" xmlns="http://www.w3.org/2000/svg"
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

												<div id="checkoutCollapseThreee"
													class="mt-4 checkout-content collapse show"
													aria-labelledby="checkoutHeadingThreee"
													data-parent="#checkoutAccordion">
													<div id="payment" class="woocommerce-checkout-payment">
														<ul class="wc_payment_methods payment_methods methods">
															<li class="wc_payment_method payment_method_bacs"><input
																id="payment_method_bacs" type="radio"
																class="input-radio" name="payment_method" value="bacs"
																data-order_button_text=""> <label
																for="payment_method_bacs">Direct bank transfer </label>
																<div class="payment_box payment_method_bacs"
																	style="display: block;">
																	<p>Make your payment directly into our bank
																		account. Please use your Order ID as the payment
																		reference. Your order won’t be shipped until the funds
																		have cleared in our account.</p>
																</div></li>

															<li class="wc_payment_method payment_method_cheque">
																<input id="payment_method_cheque" type="radio"
																class="input-radio" name="payment_method" value="cheque"
																data-order_button_text=""> <label
																for="payment_method_cheque">Check payments </label>
																<div class="payment_box payment_method_cheque"
																	style="display: block;">
																	<p>Please send a check to Store Name, Store Street,
																		Store Town, Store State / County, Store Postcode.</p>
																</div>
															</li>

															<li class="wc_payment_method payment_method_cod"><input
																id="payment_method_cod" type="radio" class="input-radio"
																name="payment_method" value="cod" checked="checked"
																data-order_button_text=""> <label
																for="payment_method_cod">Cash on delivery </label>
																<div class="payment_box payment_method_cod"
																	style="display: block;">
																	<p>Pay with cash upon delivery.</p>
																</div></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div class="form-row place-order">
											<input type="submit"
												class="button alt btn btn-dark btn-block rounded-0 py-4"
												name="woocommerce_checkout_place_order" id="place_order"
												value="Place order" data-value="Place order"> <input
												type="hidden" id="_wpnonce" name="_wpnonce"
												value="926470d564"><input type="hidden"
												name="_wp_http_referer"
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

</body>
</html>


