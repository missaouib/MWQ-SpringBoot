<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 在线充值 </title>
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
    <section class="content" style="height: 45px; width: 100%; background-color: #f8f8f8">
        <div class="paddingtopbottom_5px" style="float: left;">
            <div style="float:left;">
                <button class="user_setting_button" onclick="goBack()">
                    <i class="fa fa-fw fa-angle-left" style="font-size: 20px;"></i>
                </button>
            </div>
            <div class="top_title_with_back">
                <span>在线充值</span>
            </div>
        </div>
    </section>
    <div class="row" style="margin-top: 5rem;">
        <div class="col-xs-2"></div>
        <div class="col-xs-4">
            <button class="text-center btn_outline_none online_recharge_selected">
                100元
            </button>
        </div>
        <div class="col-xs-4">
            <button class="text-center btn_outline_none online_recharge_deselected" >
                200元
            </button>
        </div>
        <div class="col-xs-2"></div>
    </div>

    <div class="row" style="margin-top: 2rem;">
        <div class="col-xs-2"></div>
        <div class="col-xs-4">
            <button class="text-center btn_outline_none online_recharge_deselected">
                300元
            </button>
        </div>
        <div class="col-xs-4">
            <button class="text-center btn_outline_none online_recharge_deselected">
                400元
            </button>
        </div>
        <div class="col-xs-2"></div>
    </div>

    <div class="row">
        <div class="col-xs-2"></div>
        <div class="col-xs-8">
            <button class="text-center btn_outline_none buy_horn_pay_button">
                立即充值
            </button>
        </div>
        <div class="col-xs-2"></div>
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