<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 申请入驻 </title>
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
    <section class="content" style="height: 45px; width: 100%; background-color: whitesmoke;">
        <div class="paddingtopbottom_5px" style="float: left;">
            <div style="float:left;">
                <button class="user_setting_button">
                    <i class="fa fa-fw fa-angle-left" style="font-size: 20px;"></i>
                </button>
            </div>
            <div style="float: left; padding-left: 12rem; font-size: 18px;">
                <span>申请入驻</span>
            </div>
        </div>
    </section>

    <div class="row text-center">
        <div class="col-xs-12">
            <img src="" style="width: 100%; height: 120px;">
        </div>
    </div>

    <div class="row">
        <div class="col-xs-4"></div>
        <div class="col-xs-4" style="padding-top: 1rem; padding-bottom: 1rem;">
            <button class="user_setting_button" style="width: 100%; height: 9rem; border-radius: 50%; border: solid thin lightgrey;">上传头像</button>
        </div>
        <div class="col-xs-4"></div>
    </div>
    <div class="row">
        <div class="col-xs-12" style="padding-bottom: 1rem;">
            <input id="name" name="name" type="text" placeholder="姓名" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12" style="padding-bottom: 1rem;">
            <input id="phone" name="phone" type="text" placeholder="手机" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12" style="padding-bottom: 1rem;">
            <input id="idnumber" name="idnumber" type="text" placeholder="身份证号" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12" style="padding-bottom: 1rem;">
            <input id="city" name="city" type="text" placeholder="城市" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12" style="padding-bottom: 1rem;">
            <input id="address" name="address" type="text" placeholder="联系地址" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12" style="padding-bottom: 1rem;">
            <input id="employer" name="employer" type="text" placeholder="工作单位" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12" style="padding-bottom: 1rem;">
            <input id="goodat" name="goodat" type="text" placeholder="擅长领域" class="form-control">
        </div>
    </div>

    <div class="page_footer text-center">
        <a href="<%=request.getContextPath()%>/submitsuccess">
        <div class="row" style="height: 100%; margin: 0; padding-top: 11px; background-color: rgb(255, 152, 0); color: white;">
            <span class="site_font">提交申请</span>
        </div>
        </a>
    </div>
</div>
<script src="/js/app.js"></script>
</body>
</html>