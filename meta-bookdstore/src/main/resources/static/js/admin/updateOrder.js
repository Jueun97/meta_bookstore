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