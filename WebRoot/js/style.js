
$(function () {


    var i=1;
    /*var $link = {'#','baidu.com','#','#','#','#'};*/

    function lunboleft() {
        $("#daohanglunbo").css('background-image','url("resources/top_grid/0'+i+'.jpg")');
        /*$(".button1").find("a").prop('src',$link[i]);
        $(".button2").find("a").prop('src',$link[i]);*/
        i--;
        if(i<1) {
            i = 6;
        }
    }

    //实现鼠标滑动个人中心
    $("#personcenter").hover(
        function(){

            $(this).find('a').css('color','black');
            $(this).find(".downmenu").slideDown();
            $(this).css("background-color","white");
        },function () {
            $(this).css("background-color","#222222");
            $(this).find('a').css('color','rgb(225,225,225)');
            $(this).find(".downmenu").hide();
        }
    )

    $("#personcenter a").hover(function () {
        $(this).css('color','#FF6700');
    },function () {
        $(this).css('color','black');
    })

    $("#personcenter .downmenu a").hover(function () {
        $(this).css('background-color','rgba(225,225,225,.5)')
    },function () {
        $(this).css("background-color","white");
        $(this).css('color','black');
        }
    )

    //实现购物车显示和隐藏
    $("#topnavbar #topnavbarright #shopcart").hover(
        function () {
            $(this).find("#shopcartbox").slideDown();;
        },function () {
            $(this).find("#shopcartbox").hide();
        }
    )

    //实现下拉菜单二的收放
    $('.topbutton').hover(function () {
        $(this).find('.downmenu2').slideDown();

        },
        function () {
            $(this).find('.downmenu2').hide();
        }
        )

  //右侧展开栏
    $(".daohanghandle").hover(function () {
        var $top=$(this).parent().offset().top;
        var $left = $(this).offset().left;
        $(this).find(".rightdaohang").css("top",$top+'px');
        $(this).find(".rightdaohang").css("left",$left+231.8+'px');
        $(this).find(".rightdaohang").toggle();
    })



    function lunboright() {
        $("#daohanglunbo").css('background-image','url("resources/top_grid/0'+i+'.jpg")');
        i++;
        if(i>6) {
            i = 1;
        }
    }
    setInterval(lunboright,3000);

   
    //搜索框展开与关闭
    $(".mynav3 input").focus(function () {
        $(".mynav3 .dropdown").find("ul").css('display','block');
    })
    $(".mynav3 input").blur(function () {
        $(".mynav3 .dropdown").find("ul").css('display','none');
    })
    $(".mynav3 .dropdown").mouseleave(function () {
        $(".mynav3 .dropdown").find("ul").css('display','none');
    })

   


    //展开栏按钮
    $(".button").hover(function () {
        $(this).find("img").toggle();
    })

    //切换轮播图片
    $("#button1").on('click',function () {
        lunboleft();
    })
    $("#button2").on('click',function () {
        lunboright()
    })

})
