function checkSubmit() {
    var title = document.getElementById("title");
    var author = document.getElementById("author");
    var publisher = document.getElementById("publisher");
    var pubdate = document.getElementById("pubdate");
    var price = document.getElementById("price");
    var description = document.getElementById("description");

    if(!title.value){
        alert("Book Title은 공백일 수 없습니다.");
        title.focus();
        return false;
    }
    if(!author.value){
        alert("Author는 공백일 수 없습니다.");
        author.focus();
        return false;
    }
    if(!publisher.value){
        alert("Publisher는 공백일 수 없습니다.");
        publisher.focus();
        return false;
    }
    if(!pubdate.value){
        alert("Pubdate는 공백일 수 없습니다.");
        pubdate.focus();
        return false;
    }else{
        if(!regex.test(pubdate.value)){
            str = "<span style='color:red;'>" + "입력형식이 올바르지 않습니다." + "</span>";
            alert("Pubdate의 입력 형식이 틀렸습니다.");
            $("#pubdateHelp").html(str);
            return false;
        }else {
            str = "<span style='color:limegreen;'>" + "확인완료." + "</span>";
            $("#pubdateHelp").html(str);
        }
    }
    if(!price.value){
        alert("Price는 공백일 수 없습니다.");
        price.focus();
        return false;
    }else{
        if(price.value.length > 7){
            str ="<span style='color:red;'>" + "입력할 수 있는 금액을 넘었습니다." + "</span>";
            alert("Price의 입력 형식이 틀렸습니다.");
            $("#priceHelp").html(str);
            return false;
        }else{
            str ="<span style='color:limegreen;'>" + "금액 입력 완료." + "</span>";
            $("#priceHelp").html(str);
        }
    }
    if(!description.value){
        alert("Dscription은 공백일 수 없습니다.");
        description.focus();
        return false;
    }
    return true;
}

var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);

$("#pubdate").keyup(function() {
    
    var pubdate = $("#pubdate").val();

    if (!regex.test(pubdate)) {
        str = "<span style='color:red;'>" + "입력형식이 올바르지 않습니다." + "</span>";
        $("#pubdateHelp").html(str);
    } else {
        str = "<span style='color:limegreen;'>" + "확인완료." + "</span>";
        $("#pubdateHelp").html(str);
    }
});

$("#price").keyup(function() {
   
   var price = $("#price").val();
    

   if(price.length > 7){
       str ="<span style='color:red;'>" + "입력할 수 있는 금액을 넘었습니다." + "</span>";
       $("#priceHelp").html(str);
   }else{
       str ="<span style='color:limegreen;'>" + "금액 입력 완료." + "</span>";
       $("#priceHelp").html(str);
   }
});