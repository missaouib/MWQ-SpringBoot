<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 成为会员 </title>
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
                <span>成为会员</span>
            </div>
        </div>
    </section>

    <div style="height: 44px; background-color: rgb(255, 152, 0); padding-top: 1rem;">
        <div class="row">
            <div class="col-xs-4">
                <span style="color: white;">结算台</span>
            </div>
            <div class="col-xs-4"></div>
            <div class="col-xs-4"></div>
        </div>
    </div>

    <div class="row text-center">
        <div class="col-xs-4"></div>
        <div class="col-xs-4" style="padding: 7rem 0;">
            <span style="font-size: 20px; color: rgb(255, 152, 0); font-weight: bold;">100元/月</span>
        </div>
        <div class="col-xs-4"></div>
    </div>

    <div class="row">
        <div class="col-xs-4">
            <i class="icon ion-chatbubbles" style="font-size: 20px;"></i> &nbsp;微信支付
        </div>
        <div class="col-xs-4"></div>
        <div class="col-xs-4"></div>
    </div>

    <div class="row">
        <div class="col-xs-4" style="padding-top: 5px;">
            <i class="icon ion-card" style="font-size: 20px;"></i> &nbsp;余额充值
        </div>
        <div class="col-xs-4"></div>
        <div class="col-xs-4"></div>
    </div>

    <div class="row">
        <div class="col-xs-4" style="padding-top: 1rem;">
            本次支付
        </div>
        <div class="col-xs-4"></div>
        <div class="col-xs-4 text-right" style="padding-top: 1rem;">
            25141 <span style="color: rgb(63, 87, 223);">元</span>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-8" style="padding-top: 1rem;">
            剩余金额：<span style="color: rgb(63, 87, 223);">45154</span>
        </div>
        <div class="col-xs-4 text-right" style="padding-top: 1rem;">
            <span style="color: rgb(63, 87, 223);">立即充值</span>
        </div>
    </div>



    <div class="page_footer text-center">
        <div class="row" style="height: 100%; margin: 0; padding-top: 11px; background-color: rgb(255, 152, 0); color: white;">
            <span class="site_font">立即支付</span>
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