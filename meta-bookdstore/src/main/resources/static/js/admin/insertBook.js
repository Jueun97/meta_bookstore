var isPubdateChecked = false;

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
    if(!isPubdateChecked){
        alert("Pubdate의 형식이 올바르지 않습니다.");
        pubdate.focus();
        return false;
    }
    if(!price.value){
        alert("Price는 공백일 수 없습니다.");
        price.focus();
        return false;
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
    console.log("hihi 찍히는중");
    var pubdate = $("#pubdate").val();

    if (!regex.test(pubdate)) {
        str = "<span style='color:red;'>" + "입력형식이 올바르지 않습니다." + "</span>";
        $("#pubdateHelp").html(str);
        isPubdateChecked = false;
    } else {
        str = "<span style='color:limegreen;'>" + "확인완료." + "</span>";
        $("#pubdateHelp").html(str);
        isPubdateChecked = true;
    }
});