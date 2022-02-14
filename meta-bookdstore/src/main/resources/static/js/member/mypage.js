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

function makeConvention(){
	var telForm = $("#tel1").val() + "-" + $("#tel2").val() + "-" + $("#tel3").val();
	$("#phone").val(telForm);
	//alert("텔폼"+telForm);
	//console.log("폰 : ",$("#phone").val());
	var emailForm = $("#email1").val() + "@" +$("#emailDomain").val();
	$("#email").val(emailForm);
	//console.log("이메일 폼",emailForm);
	//console.log("이메일 : " , $("#email").val());
}


function checkSubmit() {
	makeConvention();
	return true;
}