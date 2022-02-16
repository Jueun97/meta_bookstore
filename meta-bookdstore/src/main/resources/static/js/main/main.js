function makebookList(AjaxBookdata){
	var str = "";
	str += "";
}

$("#cate_hover li").hover(function(){
	var cateNo = $(this).data('cateno');
	console.log("카테번호",cateNo);
	$(this).children('a:eq(0)').attr("class","nav-link font-weight-medium active nav-link-caret");
	$(this).children('a:eq(0)').attr("aria-selected","true");
	$.ajax({
		type:"get",
		url:"/viewMainBook?cate_no="+cateNo,
		data:cateNo
	}).done(res=>{
		//alert("성공");
		console.log(res[0]);
		
	}).fail(error=>{
		//alert("실패");
		console.log(error);
	});
},function(){ //마우스에서 떨어졌을때!..
	$(this).children('a:eq(0)').attr("class","nav-link font-weight-medium nav-link-caret");
	$(this).children('a:eq(0)').attr("aria-selected","false");
}
);

