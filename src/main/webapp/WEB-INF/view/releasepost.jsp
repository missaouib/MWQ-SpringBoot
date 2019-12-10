<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 圈子 </title>
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
    <section class="content" style="height: 45px; width: 100%; position: fixed; top: 0; left: 0; padding-top: 1rem;">
        <div class="row ">
            <div class="col-xs-3 text-left">
                <span style="font-family: PingFangSC; color: #8C8C8C;" onclick="goBack()">取消</span>
            </div>
            <div class="col-xs-6 text-center">
                <span style="font-family: PingFangSC; font-size: 16px;">发布帖子</span>
            </div>
            <div class="col-xs-3 text-right">
                <span style="font-family: PingFangSC; color: #8C8C8C;">下一步</span>
            </div>
        </div>
    </section>

    <section class="content" style="margin-top: 45px; padding-bottom: 1rem;">
        <div class="row">
            <div class="col-xs-4" style="padding-right: 5px;">
<%--                <button class="user_setting_button">--%>
                    <i class="fa fa-fw fa-plus-square" style="color: rgb(141, 142, 212); font-size: 19px;"></i>
                    <span style="font-size: 12px;">实力玩家互动</span>
<%--                </button>--%>
            </div>
            <div class="col-xs-4">
                <i class="fa fa-fw fa-calendar-o" style="color: rgb(212, 137, 180); font-size: 19px;"></i>
                <span style="font-size: 12px;">快速审核</span>
            </div>
            <div class="col-xs-4">
                <i class="fa fa-fw fa-lock" style="color: rgb(142, 199, 212); font-size: 19px;"></i>
                <span style="font-size: 12px;">隐私保护</span>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <textarea class="form-control resize_vertical" id="message" name="message" placeholder="输入你的话题" rows="5"></textarea>
            </div>
        </div>
    </section>
    <section class="content">

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