<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 我的订单 </title>
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
                <button class="user_setting_button">
                    <i class="fa fa-fw fa-angle-left" style="font-size: 20px;"></i>
                </button>
            </div>
            <div style="float: left; padding-left: 12rem; font-size: 18px;">
                <span>我的订单</span>
            </div>
        </div>
    </section>

    <div class="row">
        <div class="text-center" style="float: left; width: 100%; border-top: solid thin lightgrey; border-bottom: solid thin lightgrey; padding-top:8px; padding-bottom: 8px;">
            <div style="width: 20%; float: left;">
                <span style="color: rgb(255, 152, 0);">全部</span>
            </div>
            <div style="width: 20%; float: left;">
                <span>待付款</span>
            </div>
            <div style="width: 20%; float: left;">
                <span>待发货</span>
            </div>
            <div style="width: 20%; float: left;">
                <span>待收货</span>
            </div>
            <div style="width: 20%; float: left;">
                <span>退款/售后</span>
            </div>
        </div>
    </div>

    <div class="row">
        <div style="background-color: whitesmoke; border-bottom: solid thin rgb(187, 187, 187); height: 60px; padding-top: 5px;">
            <div class="col-xs-3">
                <img src="/img/raw_1517891489.png" style="width: 100%; height: 47px;">
            </div>
            <div class="col-xs-9">
                <div style="float: left; width: 100%;">
                    <div style="float:left; width: 50%;">
                        <p>商品名称</p>
                    </div>
                    <div class="text-right" style="float: right; width: 50%;">
                        <p>¥ <span>40.00</span></p>
                    </div>
                </div>
                <div style="float: left; width: 100%;">
                    <div style="float:left; width: 50%;">
                        <p>规格：xxxx</p>
                    </div>
                    <div class="text-right" style="float: right; width: 50%;">
                        <p>x 2</p>
                    </div>
                </div>
            </div>
        </div>
        <div style="width: 100%; height: 66px; background-color: whitesmoke;">
            <div class="col-xs-4"></div>
            <div class="col-xs-8">
                <p style="font-size: 12px;">共2件商品，合计：49（含运费0.00）</p>
                <div class="col-xs-6">
                    <button class="user_setting_button" style="background-color: rgb(190, 194, 201); color: white;">取消订单</button>
<%--                    待发货--%>
<%--                    联系客服--%>
<%--                    已发货--%>
<%--                    查看物流--%>
                </div>
                <div class="col-xs-6">
                    <button class="user_setting_button" style="background-color: rgb(255, 152, 0); color: white;">付款</button>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="/js/app.js"></script>
</body>
</html>