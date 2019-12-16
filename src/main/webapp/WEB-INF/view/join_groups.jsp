<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 关注清单 </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
    <link href="/css/main.css" rel="stylesheet">
    <link href="/css/app.css" rel="stylesheet">
    <link href="/vendors/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
    <link href="/vendors/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="/vendors/sweetalert/css/sweetalert.css" rel="stylesheet">
    <link href="/css/pages/icon.css" rel="stylesheet">
</head>
<body>
<div class="wrapper main_page">
    <section class="content" style="height: 45px; width: 100%;">
        <div class="paddingtopbottom_5px" style="float: left;">
            <div style="float:left;">
                <button class="user_setting_button btn_outline_none" onclick="goBack()">
                    <i class="fa fa-fw fa-angle-left" style="font-size: 20px;"></i>
                </button>
            </div>
            <div class="top_title_with_back" style="padding-left: 12rem;">
                <span>关注清单</span>
            </div>
        </div>
    </section>

    <section class="content" style="height: 90px; background-color: white;">
        <div class="row" style="height: 100%;">
            <div style="height: 100%; padding: 18px 0;">
                <div class="col-xs-2">
                    <img src="${group.logoUrl}" style="width: 45px; height: 45px; border-radius: 50%;">
                </div>
                <div class="col-xs-6">
                    <p><c:out value="${group.title}" />asdasd</p>
                    <p>成员: <span id=""><c:out value="${group.userCount}" /></span>&nbsp;&nbsp;&nbsp;&nbsp; <span>帖子数: 578</span></p>
                </div>
            </div>
        </div>
    </section>
</div>
<script src="/js/app.js"></script>
<script src="<%=request.getContextPath()%>/vendors/sweetalert/js/sweetalert.min.js"></script>
<script>
    function goBack() {
        window.location.href="<%=request.getContextPath()%>/home"
    }

</script>
</body>
</html>