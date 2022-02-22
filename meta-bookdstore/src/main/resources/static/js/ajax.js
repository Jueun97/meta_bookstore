var regexp = /\B(?=(\d{3})+(?!\d))/g;

function addToCart(book_no, price) {
	var quantity = $("[name=quantity]").val() !== undefined ? $("[name=quantity]").val() : 1;

	var data = { book_no: book_no, cart_book_qt: quantity, cart_total_price: price * quantity };
	$.ajax({
		url: "/cart/add",
		type: "post",
		data: data,
		dataType: "json",
		success: function(result) {
			if (result === 1) {
				alert("장바구니에 추가하였습니다.");
			} else if (result === 0) {
				alert("로그인 후 장바구니에 추가해주세요.");
			} else {
				alert("이미 장바구니에 있습니다.");
			}
		}
	})

}

$('.js-result').on('click', function() {
	if ($(this).data('action') === 'cart') {
		var quantity = $(this).val();
		var total_price = $(this).data('price') * quantity;
		var data = {
			cart_no: $(this).data('cart_no'),
			book_no: $(this).data('book_no'),
			cart_book_qt: quantity,
			m_no: $(this).data('m_no'),
			cart_total_price: total_price
		};

		$container = $(this).closest('td').parent()
			.find('.product-subtotal')
			.find('.woocommerce-Price-amount');
		$checkbox = $(this).closest('td').parent().find('.cart-checkbox');
		$subTotalContainer = $('#cartAccordion').find('.woocommerce-Price-amount');

		$.ajax({
			url: '/cart/modify/quantity',
			type: 'post',
			data: data,
			dataType: 'json',
			success: function(modifiedData) {
				var total_price = modifiedData['cart_total_price'];
				var sub_total_price = modifiedData['sub_total_price'];

				if ($checkbox.is(':checked')) {
					$subTotalContainer.html(`${sub_total_price.toString().replace(regexp, ',')}원 `)
				}

				$container.html(`${total_price.toString().replace(regexp, ',')}원`);

			}

		})
	} else {
		var quantity = $(this).val();
		var price = $('.amount-for-checkout').data('price');
		var total_price = price * quantity;
		$('.amount-for-checkout').html(
			`[ 주문금액 : ${total_price.toString().replace(regexp, ',')}원 ]`
		)
	}
})

$('.product-remove-icon').on('click', function() {
	if (window.confirm("장바구니에서 제거하시겠습니까?")) {
		var data = {
			cart_no: $(this).data('cart_no')
		};
		$subTotalContainer = $('#cartAccordion').find('.woocommerce-Price-amount');
		$cartCaontainer = $(this);
		$.ajax({
			url: '/cart/delete',
			type: 'post',
			data: data,
			dataType: 'json',
			success: function(sub_total_price) {
				$cartCaontainer.closest('tr').remove();
				$('.cart-count').data('cart', $('.cart-count').data('cart') - 1)
				$('.cart-count').text(`Your cart:
					${$('.cart-count').data('cart')} items`)
				if (sub_total_price == 0) {
					$('#cart-container').remove();
				}
				var newData = [];
				$('.cart-checkbox').each(function() {
					if ($(this).is(":checked")) {
						newData.push({ cart_no: $(this).data('cart_no') })
					}
				})
				$.ajax({
					url: '/cart/choose',
					type: 'post',
					data: { data: JSON.stringify(newData) },
					dataType: 'json',
					success: function(sub_total_price) {
						$subTotalContainer.html(`${sub_total_price.toString().replace(regexp, ',')}원`)
					}


				})

			}
		})
	}
})

$('.delete_cart-all').on('click', function() {
	var data = [];
	$subTotalContainer = $('#cartAccordion').find('.woocommerce-Price-amount');
	$cartCaontainer = $(this);
	if(window.confirm("선택하신 상품을 제거하시겠습니까?")){
	$('.cart-checkbox').each(function() {
		if ($(this).is(":checked")) {
			data.push({ cart_no: $(this).data('cart_no') })
		}
	})
	$.ajax({
		url: '/cart/delete/selected',
		type: 'post',
		data: { data: JSON.stringify(data) },
		dataType: 'json',
		success: function() {
			$subTotalContainer.html(`${0}원`);
			$('.cart-count').data('cart', $('.cart-count').data('cart') - data.length)
			$('.cart-count').text(`Your cart:
					${$('.cart-count').data('cart')} items`);
			$('.cart-checkbox').each(function() {
				if ($(this).is(":checked")) {
					$(this).closest('tr').remove();

				}
			})

			if ($('.cart-count').data('cart') == 0) {
				$('#cart-container').remove();
			}
		}
	})
	}
})

$('.cart-checkbox-all').change(function() {
	var data = [];
	$subTotalContainer = $('#cartAccordion').find('.woocommerce-Price-amount');

	if ($(this).is(':checked')) {
		$('.cart-checkbox').each(function() {
			$(this).prop("checked", true);
			data.push({ cart_no: $(this).data('cart_no') })
		})
	} else {
		$('.cart-checkbox').each(function() {
			$(this).prop("checked", false);
		})
	}
	$.ajax({
		url: '/cart/choose',
		type: 'post',
		data: { data: JSON.stringify(data) },
		dataType: 'json',
		success: function(sub_total_price) {
			$subTotalContainer.html(`${sub_total_price.toString().replace(regexp, ',')}원`)
		}


	})
})

$('.cart-checkbox').change(function() {
	var data = [];
	$subTotalContainer = $('#cartAccordion').find('.woocommerce-Price-amount');
	$formContainer = $('.wc-proceed-to-checkout');
	$('.cart-checkbox-all').prop('checked', false);
	$('.cart-checkbox').each(function() {
		if ($(this).is(":checked")) {
			data.push({ cart_no: $(this).data('cart_no') })

		}
	})
	$.ajax({
		url: '/cart/choose',
		type: 'post',
		data: { data: JSON.stringify(data) },
		dataType: 'json',
		success: function(sub_total_price) {
			$subTotalContainer.html(`${sub_total_price.toString().replace(regexp, ',')}원`)
		}


	})
})

$('.checkout-button').on('click', function() {
	$checkoutForm = $('.checkout-form');
	$('.cart-checkbox').each(function() {
		if ($(this).is(":checked")) {
			$checkoutForm.append($('<input/>', { type: 'hidden', name: 'cart_no', value: $(this).data('cart_no') }));
		}
	})
	$checkoutForm.submit();
})



