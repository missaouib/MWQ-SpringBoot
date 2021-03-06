<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 最新榜单 </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
    <link href="/css/main.css" rel="stylesheet">
    <link href="/css/app.css" rel="stylesheet">
</head>
<body>
<div class="wrapper main_page" style="background-color: white;">
    <div class="text-center latest_list_top_div">
        <div style="float:left;">
            <button class="user_setting_button" onclick="goBack()">
                <i class="fa fa-fw fa-angle-left" style="font-size: 20px;"></i>
            </button>
        </div>
        <p class="text-left" style="font-size: 19px; margin-left: 15rem;">最新榜单</p>
        <button class="latest_list_cover_button">人气热榜</button>
    </div>
    <div class="row" style="height: 4rem; width: 100%;"></div>
    <div class="row" style="padding-bottom: 1rem;">
            <div class="col-xs-2">
                <img src="/img/1.png" style="width: 100%">
            </div>
            <div class="col-xs-2">
                <img src="/img/v2_pvfw1g.png" style="width: 100%; border-radius: 50%;">
            </div>
            <div class="col-xs-5">
                <div>
                    <span class="site_font">娜娜的店</span>
                </div>
                <div>
                    <span class="site_font" style="color: rgba(172, 172, 172, 1); font-size: 12px;">687892q</span>
                </div>
            </div>
            <div class="col-xs-3">
                <button style="background-color: rgb(255, 152, 0); color: white; border-radius: 5px; border: none; outline: none;">加入</button>
            </div>
    </div>
    <div class="row" style="padding-bottom: 1rem;">
        <div class="col-xs-2">
            <img src="/img/2.png" style="width: 100%">
        </div>
        <div class="col-xs-2">
            <img src="/img/v2_pvfw1g.png" style="width: 100%; border-radius: 50%;">
        </div>
        <div class="col-xs-5">
            <div>
                <span class="site_font">娜娜的店</span>
            </div>
            <div>
                <span class="site_font" style="color: rgba(172, 172, 172, 1); font-size: 12px;">687892q</span>
            </div>
        </div>
        <div class="col-xs-3">
            <button style="background-color: rgb(255, 152, 0); color: white; border-radius: 5px; border: none; outline: none;">加入</button>
        </div>
    </div>
    <div class="row" style="padding-bottom: 1rem;">
        <div class="col-xs-2">
            <img src="/img/3.png" style="width: 100%">
        </div>
        <div class="col-xs-2">
            <img src="/img/v2_pvfw1g.png" style="width: 100%; border-radius: 50%;">
        </div>
        <div class="col-xs-5">
            <div>
                <span class="site_font">娜娜的店</span>
            </div>
            <div>
                <span class="site_font" style="color: rgba(172, 172, 172, 1); font-size: 12px;">687892q</span>
            </div>
        </div>
        <div class="col-xs-3">
            <button style="background-color: rgb(255, 152, 0); color: white; border-radius: 5px; border: none; outline: none;">加入</button>
        </div>
    </div>
</div>
<script src="/js/app.js"></script>
<script>
    function goBack() {
        window.history.go(-1);
    }
</script>
</body>
</html>