<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 商品主页 </title>
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
    <section class="content" style="height: 212px;">
        <div class="row">
            <i class="fa fa-fw fa-angle-left" style="font-size: 22px; position: absolute; top: 5px; left: 0;z-index: 99;" onclick="goBack()"></i>
            <img src="${product.imageUrl}" class="img-responsive" alt="image1">
        </div>
    </section>
    <section class="content" style="background-color: white; padding-top: 2rem;">
        <div class="row">
            <div class="col-xs-12">
                <p style="font-size: 20px; color: rgb(255, 152, 0);">¥<span><c:out value="${product.price}" /></span></p>
                <p><c:out value="${product.name}" /></p>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6">
               <span>快递：</span><span><c:out value="${product.expressDeliveryCost}" /></span>
            </div>
            <div class="col-xs-6 text-right">
                <span>已售：</span><span><c:out value="${product.sellCount}" />件</span>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div style="padding-top: 3rem; padding-bottom: 3rem;">
                    <span style="color: silver;">参数&nbsp;&nbsp;&nbsp;</span><span><c:out value="${product.parameter}" /></span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div>
                    <p style="color: silver;">详情</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <p class="text-center"><c:out value="${product.detail}" /></p>
            </div>
        </div>

    </section>
    <div class="page_footer">
        <div class="row" style="height: 100%; width: 100%; margin: 0; padding: 0; float: left;">
            <div style="height: 100%; width: 15%; float: left; cursor:pointer;">
                <div style="text-align: center;width: 100%;height: 60%;">
                    <img src="<%=request.getContextPath()%>/img/headphone.png" style="height: 90%;margin: 4px;">
                </div>
                <div style="text-align: center;width: 100%;height: 40%;">
                        <span style="font-family: PingFangSC-Regular;
                                font-size: 10px;
                                letter-spacing: 0;
                                line-height: 10px;font-weight: bold;">客服</span>
                </div>
            </div>
            <div style="height: 100%; width: 15%; float: left; cursor:pointer;">
                <div style="text-align: center;width: 100%;height: 60%;">
                    <img src="<%=request.getContextPath()%>/img/heart.png" style="height: 90%;margin: 4px;">
                </div>
                <div style="text-align: center;width: 100%;height: 40%;">
                        <span style="font-family: PingFangSC-Regular;
                                font-size: 10px;
                                letter-spacing: 0;
                                line-height: 10px;font-weight: bold;">收藏</span>
                </div>
            </div>
            <div class="text-center product_detail_b_l_btn">
                加入购物车
            </div>
            <div class="text-center product_detail_b_r_btn">
                <a href="<%=request.getContextPath()%>/confirmorder" style="color: white;">
                    立即购买
                </a>
            </div>
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