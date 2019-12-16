<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 商城 </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
    <link href="/css/main.css" rel="stylesheet">
    <link href="/css/app.css" rel="stylesheet">
    <link href="/vendors/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
    <link href="/vendors/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="/css/pages/icon.css" rel="stylesheet">
    <link href="/vendors/owl.carousel/css/owl.carousel.css" rel="stylesheet">
    <link href="/vendors/owl.carousel/css/owl.theme.css" rel="stylesheet">
    <link href="/vendors/owl.carousel/css/owl.transitions.css" rel="stylesheet">
    <link href="/css/pages/carousel.css" rel="stylesheet">
</head>
<body>
<div class="wrapper main_page">
    <section class="content">
        <div class="box-body" style="height: 165px;">
            <i class="fa fa-fw fa-angle-left" style="font-size: 22px; position: absolute; top: 5px; left: 0;z-index: 99;" onclick="goBack()"></i>
            <!--carousel starts-->
            <div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: 100%">
                <!-- Wrapper for slides -->
                <div class="carousel-inner" style="height: 100%;">
                    <div class="item active" style="height: 100%;">
                        <img src="img/mall_banner.png" class="img-responsive" alt="image1">
                    </div>
                    <!-- End Item -->
                    <div class="item" style="height: 100%;">
                        <img src="img/mall_banner.png" class="img-responsive" alt="image1">
                    </div>

                    <div class="item" style="height: 100%;">
                        <img src="img/mall_banner.png" class="img-responsive" alt="image1">
                    </div>

                    <div class="item" style="height: 100%;">
                        <img src="img/mall_banner.png" class="img-responsive" alt="image1">
                    </div>
                </div>
            </div>
            <!--carousel ends-->
        </div>
    </section>

    <section class="content">
        <div class="row">
            <c:forEach var="product" varStatus="status" items="${products}">
                <div class="col-xs-6" style="padding:10px; background-color: white; margin-top: 10px;">
                    <a href="<%=request.getContextPath()%>/product-detail/${product.id}">
                        <div>
                            <img src="${product.imageUrl}" style="width: 100%; height: 120px;">
                        </div>
                        <div style="float: left;">
                            <div class="one-line-text"style="white-space:nowrap;overflow: hidden;text-overflow: ellipsis;"><c:out value="${product.name}" /></div>
                            <div style="color: rgb(255, 87, 34);">¥<c:out value="${product.price}" /></div>
                            <div style="float:right;">
                                <span style="font-size: 12px; color: rgb(148, 148, 148);"><c:out value="${product.purchaseMemberCount}" />人已购买</span>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </section>

</div>
<script src="/js/app.js"></script>
<script src="/vendors/owl.carousel/js/owl.carousel.min.js"></script>
<script src="/js/pages/carousel.js"></script>
<script>
    function goBack() {
        window.history.go(-1);
    }
</script>
</body>
</html>