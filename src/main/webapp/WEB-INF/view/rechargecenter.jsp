<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 充值中心 </title>
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
                <button class="user_setting_button btn_outline_none" onclick="goBack()">
                    <i class="fa fa-fw fa-angle-left" style="font-size: 20px;"></i>
                </button>
            </div>
            <div style="float: left; padding-left: 12rem; font-size: 18px; margin-top: 5px;">
                <span>充值中心</span>
            </div>
        </div>
    </section>

    <div class="row">
        <div class="col-xs-8"></div>
        <div class="col-xs-4 text-right">
            <button class="user_setting_button">使用说明</button>
        </div>
    </div>
    <div class="row text-center">
        <div class="col-xs-4"></div>
        <div class="col-xs-4">
            <p style="font-size: 28px; color: rgba(255, 152, 0, 1)">2034</p>
            <p style="color: rgb(120, 120, 120);">当前余额</p>
        </div>
        <div class="col-xs-4"></div>
    </div>

    <div class="row" style="padding-top: 5rem;">
        <div class="col-xs-4">
            <div style="border: solid thin blue; text-align: center; padding: 25px 0;">
                <span>10元/10点币</span>
            </div>
        </div>
        <div class="col-xs-4">
            <div style="border: solid thin blue; text-align: center; padding: 25px 0;">
                <span>10元/10点币</span>
            </div>
        </div>
        <div class="col-xs-4">
            <div style="border: solid thin blue; text-align: center; padding: 25px 0;">
                <span>10元/10点币</span>
            </div>
        </div>
    </div>

    <div class="row" style="padding-top: 1rem;">
        <div class="col-xs-4">
            <div style="border: solid thin blue; text-align: center; padding: 25px 0;">
                <span>10元/10点币</span>
            </div>
        </div>
        <div class="col-xs-4">
            <div style="border: solid thin blue; text-align: center; padding: 25px 0;">
                <span>10元/10点币</span>
            </div>
        </div>
        <div class="col-xs-4">
            <div style="border: solid thin blue; text-align: center; padding: 25px 0;">
                <span>10元/10点币</span>
            </div>
        </div>
    </div>

    <div class="row" style=" padding-top: 14rem;">
        <div class="col-xs-3"></div>
        <div class="col-xs-6 text-center">
            <span>充值历史</span> &nbsp; &nbsp;| &nbsp; &nbsp;
            <span> 账单记录</span>
        </div>
        <div class="col-xs-3"></div>
    </div>

    <div class="page_footer text-center">
        <div class="row" style="height: 100%; margin: 0; padding-top: 11px; background-color: rgb(255, 152, 0); color: white;">
            <span class="site_font">立即充值</span>
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