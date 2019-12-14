<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 公告 </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
    <link href="/css/main.css" rel="stylesheet">
    <link href="/css/app.css" rel="stylesheet">
    <link href="/vendors/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
    <link href="/vendors/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="/css/pages/icon.css" rel="stylesheet">
</head>
<body style="background-color: white;">
<div class="wrapper main_page" style="background-color: white;">
    <section class="content" style="height: 45px; width: 100%;">
        <div class="paddingtopbottom_5px" style="float: left;">
            <div style="float:left;">
                <button class="user_setting_button" onclick="goBack()">
                    <i class="fa fa-fw fa-angle-left" style="font-size: 20px;"></i>
                </button>
            </div>
            <div class="top_title_with_back">
                <span>公告</span>
            </div>
        </div>
    </section>

    <section class="content" style="background-color: white;">
        <div class="row border_bottom_line" style="padding-bottom: 1rem;">
            <div class="col-xs-12">
                <div class="col-xs-9">
                    <span class="site_font" style="font-size: 12px; margin-left: 1rem;">TAXIS &nbsp;  问 &nbsp;</span>
                </div>
                <div class="col-xs-3">
                    <span class="site_font" style="font-size: 12px; color: rgb(255, 64, 129)">2018-12-13</span>
                </div>
                <div class="col-xs-12">
                    <p>时时彩，超高倍率投注，有一起投单的吗？老铁们欢迎来个神评论~</p>
                </div>
                <div class="col-xs-5">
                    <img src="/img/raw_1514134111.png" style="width: 100%; height: 180px;">
                </div>
                <div class="col-xs-3"></div>
                <div class="col-xs-4">
                    <div style="height: 180px; width: 100%; padding: 50% 1% 0% 12%;">
                        <div class="btn_marster_sticker">
                            <span class="site_font" style="font-size: 12px; color: white;">大师贴</span>
                        </div>
                    </div>
                </div>
                <div class="col-xs-5 text-center" style="padding-top: 1rem;">
                    <span class="site_font" style="font-size: 12px; color: lightgrey;"></span>
                </div>
                <div class="col-xs-3"></div>
                <div class="col-xs-4 text-center" style="padding-top: 1rem;">

                </div>
            </div>
        </div>


    </section>

</div>
<script src="/js/app.js"></script>
<script>
    function goBack() {
        window.history.go(-1);
    }
</script>
</body>
</html>