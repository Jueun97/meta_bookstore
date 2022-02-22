function makebookList(AjaxBookdata) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	var string = `<div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 row-cols-wd-6">`;
	for (let i = 0; i < AjaxBookdata.length; i++) {
		string += `<div class="col">
									<div class="mb-5 products">
										<div class="product product__space border rounded-md bg-white">
											<div class="product__inner overflow-hidden p-3 p-md-4d875">
												<div
													class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
													<div class="woocommerce-loop-product__thumbnail">
														<a href="/book/detail/${AjaxBookdata[i].book_no}" class="d-block">`;

		string += (AjaxBookdata[i].image.substr(0, 5) == 'https') ? `<img src="${AjaxBookdata[i].image}"
																class="d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
																alt="image-description">` : `<img src="/image/${AjaxBookdata[i].image}"
																	 class="d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
																	 alt="image-description">`
		string += `</a>
													</div>
													<div
														class="woocommerce-loop-product__body product__body pt-3 bg-white">

														<h2
															class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
															<a href="/book/detail/${AjaxBookdata[i].book_no}">${AjaxBookdata[i].title}</a>
														</h2>
														<div class="font-size-2  mb-1 text-truncate">
															<a href="../others/authors-single.html"
																class="text-gray-700">${AjaxBookdata[i].author}</a>
														</div>
														<div
															class="price d-flex align-items-center font-weight-medium font-size-3">
															<span class="woocommerce-Price-amount amount">${AjaxBookdata[i].price.toString().replace(regexp, ',')}원</span>
														</div>
												
													</div>
													
													<div class="product__hover d-flex align-items-center">
														<span class="product__add-to-cart-text" onClick="addToCart(${AjaxBookdata[i].book_no},${AjaxBookdata[i].price})">ADD TO CART</span> 
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>`
	}
	string += `</div>`;
	return string;
}

$("#cate_hover li").hover(function() {
	var cateNo = $(this).data('cateno');

	$(this).children('a:eq(0)').attr("class", "nav-link font-weight-medium active nav-link-caret");
	$(this).children('a:eq(0)').attr("aria-selected", "true");
	$.ajax({
		type: "get",
		url: "/viewMainBook?cate_no=" + cateNo,
		data: cateNo
	}).done(res => {
		//alert("성공");

		let bookItem = makebookList(res);

		$(".book_div_start").html(bookItem);

	}).fail(error => {
		alert("실패");

	});
}, function() { //마우스에서 떨어졌을때!..
	$(this).children('a:eq(0)').attr("class", "nav-link font-weight-medium nav-link-caret");
	$(this).children('a:eq(0)').attr("aria-selected", "false");
}
);

