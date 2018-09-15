$(function(){
    $(".zhucaidan").click(function () {
        $("#zhucaidan").find(".cijicaidan").hide();
        $(this).next().toggle()
    })

   /* $(".cijicaidan li").click(function () {
        /!*alert($(this).index());*!/
        var $index = $(this).index();
        switch ($index) {
            case 0: $("iframe").prop("src","add.html");break;
            case 1:$("iframe").prop("src","manager.html");break
            case 2:break;
            case 3:break;
        }
    })*/
})