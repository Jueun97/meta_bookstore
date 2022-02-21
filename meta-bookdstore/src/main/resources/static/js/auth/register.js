var isIdChecked = false;
var isPwAgainChecked = false;

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
	//alert("값 변경 테스트 : " + value);
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
	//console.log("텔폼",telForm);
	//console.log("폰 : "+$("#phone").val());
	var emailForm = $("#email1").val() + "@" +$("#emailDomain").val();
	$("#email").val(emailForm);
	//console.log("이메일 폼",emailForm);
	//console.log("이메일 : " , $("#email").val());
}

function checkSubmit() {
	makeConvention();
	var id = document.getElementById("id");
	var password1 = document.getElementById("password1");
	if(!id.value){
		alert("id는 공백일 수 없습니다.");
		id.focus();
		return false;
	}
	if(isIdChecked==false){
		alert("아이디 중복 여부를 확인해주세요!");
		id.focus();
		return false;
	}
	if(isPwAgainChecked==false){
		alert("비밀번호를 동일하게 입력해주셨는지 확인해주세요!");
		password1.focus();
		return false;
	}
	return true;
}

//정규표현식 : id는 영어,숫자만 입력가능
const idreg = /[a-zA-z0-9]/;

$("#id").keyup(function() {
	//공백제거
	var id = $.trim($(this).val());
	$(this).val(id);
	//한글제거
	isIdreg = idreg.test(id);
	$.ajax({
		url: "/checkId.do",
		type: "POST",
		data: { "id": id },
		dataType:"text",//응답받을 데이터의 타입
		success: function(data) {
			if(isIdreg==true){
				if (data) {
					str = "<span style='color:tomato;'>" + data + "</span>은(는) 사용불가능한 아이디 입니다.";
					$("#checkId").html(str);
					isIdChecked=false;
				} else {
					str = "<span style='color:green;'>" + id + "</span>은(는) 사용 가능한 아이디 입니다.";
					$("#checkId").html(str);
					isIdChecked=true;
				}
			}else{
				str = "<span style='color:red;'>" + "영어,숫자로만 된 아이디만 입력해주세요!" + "</span>";
				$("#checkId").html(str);
				isIdChecked=false;
			}
			if(id==''){
				$("#checkId").html('');
			}
		},//end success
		error: function() { alert("error"); }
	});
});

$("#password1").keyup(function(){
	var password = $("#password").val();
	var password1 = $(this).val();
	if(password!=password1){
		str="<span style='color:red;'>" + "비밀번호가 일치하지 않습니다." + "</span>";
		$("#passwordCheck").html(str);
		isPwAgainChecked = false;
	}else{
		str="<span style='color:green;'>" + "비밀번호가 일치합니다." + "</span>";
		$("#passwordCheck").html(str);
		isPwAgainChecked = true;
	}
	if(password1==''){
		$("#passwordCheck").html('');
	}

});