<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 确认下单 </title>
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
<body>
<div class="wrapper main_page" style="background-color: white;">
    <section class="content" style="height: 45px; width: 100%;">
        <div class="paddingtopbottom_5px" style="float: left;">
            <div style="float:left;">
                <button class="user_setting_button" onclick="goBack()">
                    <i class="fa fa-fw fa-angle-left" style="font-size: 20px;"></i>
                </button>
            </div>
            <div class="top_title_with_back">
                <span style="color: rgb(110, 110, 110);">确认下单</span>
            </div>
        </div>
    </section>

    <div class="row">
        <div class="col-xs-12 text-center" style="padding-top: 2rem; padding-bottom: 2rem;">
           <button class="user_setting_button">＋ 收货地址</button>
        </div>
    </div>

    <div class="row" style="padding-top: 1rem; padding-bottom: 1rem;">
        <div class="col-xs-4">
            <span>已选商品</span>
        </div>
        <div class="col-xs-4"></div>
        <div class="col-xs-4 text-right" >
            <span style="color: rgb(255, 168, 0);">联系客服？</span>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-3">
            <img src="/img/raw_1534857014.png" style="width: 100%; border: solid thin lightgrey;">
        </div>
        <div class="col-xs-9">
            <div> <span style="font-size: 16px;">宝素康系列，d2w维生素</span></div>
            <div class="col-xs-5" style="padding-left: 5px;">
                <span style="color: rgb(110, 110, 110);">数量： 20节</span>
            </div>
            <div class="col-xs-7">
                <span style="color: rgb(110, 110, 110);">单价：¥323.00元</span>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12" style="padding-top: 2rem; padding-bottom: 2rem;">
            支付方式
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12">
            <i class="icon fa fa-wechat" style="color: rgb(139, 195, 74);"></i>&nbsp; 微信支付
        </div>
    </div>

    <div class="page_footer text-center">
        <div class="row" style="height: 100%; margin: 0; padding-top: 11px; background-color: rgb(255, 152, 0); color: white;">
            <span class="site_font">立即支付</span>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-6"></div>
        <div class="col-xs-6 text-right" style="padding-top: 1rem; padding-bottom: 1rem;">
            <span style="color: rgb(255, 168, 0);">合计：¥ 3243.00 </span>
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