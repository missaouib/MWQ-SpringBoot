<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 订单记录 </title>
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
                <span>订单记录</span>
            </div>
        </div>
    </section>

    <div class="row text-center" style="color: rgba(79, 79, 79, 0.72); padding: 1rem 0;">
        <div class="col-xs-4">消费项目</div>
        <div class="col-xs-4">金额</div>
        <div class="col-xs-4">时间</div>
    </div>
    <div class="row text-center" style="color: rgba(79, 79, 79, 0.72); padding: 1rem 0;">
        <div class="col-xs-4">购买喇叭</div>
        <div class="col-xs-4" style="color: rgb(255, 152, 0);">200</div>
        <div class="col-xs-4">2019-11-14</div>
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