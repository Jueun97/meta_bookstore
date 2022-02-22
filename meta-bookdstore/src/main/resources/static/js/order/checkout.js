function goPopup() {
	var pop = window.open("/auth/jusoPopup", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
}

function jusoCallBack(roadAddrPart1, addrDetail, zipNo) {
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	var addressEl = document.querySelector("#roadAddress");
	addressEl.value = roadAddrPart1;
	var addrDetailEl = document.querySelector("#otherAddress");
	addrDetailEl.value = addrDetail;
	var zipNoEl = document.querySelector("#zipcode");
	zipNoEl.value = zipNo;
}
function selectEmailChange(value) {
	//alert("값 변경 테스트" + value);
	var emailDomain = document.getElementById("emailDomain");
	emailDomain.value = value;
}
function to_auto_tel(thisStr, nextStr, len) {
	var data = document.getElementById(thisStr).value;
	if (data.length >= len) {
		document.getElementById(nextStr).focus();
	}
}

function makeConvention() {
	var telForm = $("#tel1").val() + "-" + $("#tel2").val() + "-" + $("#tel3").val();
	$("#phone").val(telForm);
	//console.log("텔폼",telForm);
	//console.log("폰 : "+$("#phone").val());
	var emailForm = $("#email1").val() + "@" + $("#emailDomain").val();
	$("#email").val(emailForm);
	//console.log("이메일 폼",emailForm);
	//console.log("이메일 : " , $("#email").val());
}


function checkBoxOnChange(name, phone, email, roadAddress, zipcode, otherAddress) {
	if ($('#checkout-checkbox').is(":checked")) {
		
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
}



$('.form-button').on(
	'click',
	function() {

		$('#phone').val(
			$("#tel1").val() + '-' + $("#tel2").val() + '-'
			+ $("#tel3").val());

		$('#receiver_email').val($("#email1").val() + '@' + $("#emailDomain").val());

		let message = "";
		if ($(this).data('status') === 'checkout') {
			message = "주문진행하시겠습니까?";
		} else {
			message = "수정완료하시겠습니까?"
		}

		if (window.confirm(message)) {
			if (checkSubmitForm()) {
				$('.checkout-form').submit();
			}
		}

	})

function checkSubmitForm() {
	const tel1Reg = /^01(0|1[6-9])$/;
	const tel2Reg = /^(\d{3,4})$/;
	const tel3Reg = /^(\d{4})$/;



	if ($('#nameForm').val() === '') {
		alert("폼을 다 채워주세요.");
		$('#nameForm').addClass('changeplaceholder');
		return false;
	} else if ($('#tel1').val() === '') {
		$('#tel1').addClass('changeplaceholder');
		alert("폼을 다 채워주세요.");
		return false;
	} else if (tel1Reg.test($('#tel1').val()) === false) {
		alert("번호를 올바르게 적어주세요");
		return false;
	} else if ($('#tel2').val() === '') {
		alert("폼을 다 채워주세요.");
		$('#tel2').addClass('changeplaceholder');
		return false;
	} else if (tel2Reg.test($('#tel2').val()) === false) {
		alert("번호를 올바르게 적어주세요");
		return false;
	} else if ($('#tel3').val() === '') {
		alert("폼을 다 채워주세요.");
		$('#tel3').addClass('changeplaceholder');
		return false;
	} else if (tel3Reg.test($('#tel3').val()) === false) {
		alert("번호를 올바르게 적어주세요");
		return false;
	} else if ($('#email1').val() === '') {
		alert("폼을 다 채워주세요.");
		$('#email1').addClass('changeplaceholder');
		return false;
	} else if ($('#emailDomain').val() === '') {
		alert("폼을 다 채워주세요.");
		$('#emailDomain').addClass('changeplaceholder');
		return false;
	} else if ($('#zipcode').val() === '') {
		alert("폼을 다 채워주세요.");
		$('#zipcode').addClass('changeplaceholder');
		return false;
	} else if ($('#roadAddress').val() === '') {
		alert("폼을 다 채워주세요.");
		$('#roadAddress').addClass('changeplaceholder');
		return false;
	} else if ($('#otherAddress').val() === '') {
		alert("폼을 다 채워주세요.");
		$('#otherAddress').addClass('changeplaceholder');
		return false;
	} else {
		return true;
	}


}