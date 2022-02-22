
function checkSubmit() {
    
    makeConvention();

    var id = document.getElementById("id");
    var newpassword = document.getElementById("newpassword");
    var name = document.getElementById("name");
    var zipcode = document.getElementById("zipcode");
    var roadAddress = document.getElementById("roadAddress");


    if(!id.value){
        alert("id는 공백일 수 없습니다.");
        id.focus();
        return false;
    }
    if(!(newpassword.value)){
        alert("newpassword는 공백일 수 없습니다.");
        newpassword.focus();
        return false;
    }
    if(!name.value){
        alert("이름은 공백일 수 없습니다.");
        name.focus();
        return false;
    }
    if(!zipcode.value){
        alert("우편번호는 공백일 수 없습니다.");
        zipcode.focus();
        return false;
    }
    if(!roadAddress.value){
        alert("주소는 공백일 수 없습니다.");
        roadAddress.focus();
        return false;
    }

    return true;
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

function goPopup() {
    var pop = window.open("/auth/jusoPopup", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
}

function to_auto_tel(thisStr, nextStr, len) {
    var data = document.getElementById(thisStr).value;
    if (data.length >= len) {
        document.getElementById(nextStr).focus();
    }
}

function toggle(element) {

    var gradeCheck = document.getElementById("grade")
    if(element.checked){
        gradeCheck.value = "ADMIN"
    }else{
        gradeCheck.value = "USER"
    }
}
