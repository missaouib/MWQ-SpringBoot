<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 主页 </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
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
    <section class="content-header" style="background-color: red;">
        <div class="paddingtopbottom_5px" style="width: 70%; height: 45px; margin: auto;">
            <form role="form">
                <div class="form-group input-group">
                    <input type="search" class="form-control" style="border-radius: 17px; outline: none;">
                    <span class="input-group-btn">
                    <button id="search_button" class="btn btn-default btn_outline_none" type="button" style="background-color: transparent; border-color: transparent; color: white;">
                        <i class="fa fa-search"></i>
                    </button>
                </span>
                </div>
            </form>
        </div>
    </section>
    <section class="content" style="margin-bottom: 1rem;">
       <div class="box-body" style="height: 150px;">
            <!--carousel starts-->
            <div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: 100%">
                <!-- Wrapper for slides -->
                <div class="carousel-inner" style="height: 100%;">
                    <div class="item active" style="height: 100%;">
                        <img src="img/v2_pxxkdo.jpg" class="img-responsive" alt="image1">
                    </div>
                    <!-- End Item -->
                    <div class="item" style="height: 100%;">
                        <img src="img/v2_pxxkbt.jpg" class="img-responsive" alt="image1">
                    </div>
                </div>
            </div>
            <!--carousel ends-->
        </div>
    </section>
    <section class="content platform_section">
        <div class="col-md-12 paddingtopbottom_5px">
            <span class="home_text">平台公告</span><i class="fa fa-fw fa-volume-down" style="color: rgb(229, 28, 35)"></i>
            <span class="site_font" style="margin-left: 2rem;">${notices}</span>
        </div>
    </section>
    <section class="content" style="background-color: white; ">
        <div class="row border_bottom_line" style="padding-top: 1rem; padding-bottom: 1rem;">
            <div class="col-xs-5">
                <button type="button" class="home_page_button">
                    <img src="/img/btn_mycircle.png" style="width: 100%;">
                </button>
            </div>
            <div class="col-xs-5">
                <button type="button" class="home_page_button">
                    <img src="/img/btn_circleofconcern.png" style="width: 100%;">
                </button>
            </div>
         </div>
    </section>
    <section class="content" style="background-color: white; ">
        <div class="row">
            <div style="padding-top: 1rem; padding-bottom: 1rem;">
                <span class="site_font" style="margin-left: 2rem;">热门圈子</span>
            </div>
        </div>
        <div class="row text-center border_bottom_line" style="padding-bottom: 1rem;">
            <c:forEach var="group" varStatus="status" items="${popularGroups}">
                <div class="col-xs-3">
                    <a href="<%=request.getContextPath()%>/circle/${group.id}">
                        <div>
                            <img src="${group.logoUrl}" style="width: 100%; border-radius: 10px;">
                        </div>
                        <div style="height:18px;">
                            <span class="site_font" style="font-size: 13px;"><c:out value="${group.title}" /></span>
                        </div>
                        <div>
                            <span class="site_font" style="color: lightgrey; font-size: 12px;"><c:out value="${group.userCount}" />人</span>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </section>
    <section class="content" style="background-color: white; ">
        <div class="row">
            <div style="padding-top: 1rem; padding-bottom: 1rem;">
                <span class="site_font hot_topic_title">火热话题</span>
            </div>
        </div>
        <div class="row">
            <div class="paddingtopbottom_5px">
                <div class="col-xs-2 text-center">
                    <span class="site_font hot_topic_contain">顶置</span>
                </div>
                <div class="col-xs-8">
                    <span class="hot_topic_contain_1">双色球019799期大师预测，围观进行中~</span>
                </div>
                <span class="hot_topic_contain_1">双色球</span>
            </div>
        </div>
        <div class="row">
            <div class="paddingtopbottom_5px">
                <div class="col-xs-2 text-center">
                    <span class="site_font hot_topic_contain">顶置</span>
                </div>
                <div class="col-xs-8">
                    <span class="hot_topic_contain_">双色球019799期大师预测，围观进行中~</span>
                </div>
                <span class="hot_topic_contain_1">足球</span>
            </div>
        </div>
        <div class="row border_bottom_line" style="padding-bottom: 1rem;">
            <div class="paddingtopbottom_5px">
                <div class="col-xs-2 text-center">
                    <span class="site_font hot_topic_contain">顶置</span>
                </div>
                <div class="col-xs-8">
                    <span class="hot_topic_contain_">双色球019799期大师预测，围观进行中~</span>
                </div>
                <span class="hot_topic_contain_1">福彩</span>
            </div>
        </div>
    </section>
    <section class="content" style="background-color: white; ">
        <div class="row">
            <div style="padding-top: 1rem;">
                <p class="site_font" style="margin-left: 2rem;">热门资讯</p>
                <p style="padding-left: 6px; padding-right: 6px;">中国体育彩票如何规划？在线专家为你解答最新走势，热门话题正在进行中~</p>
            </div>
        </div>
        <c:forEach var="article" varStatus="status" items="${popularArticles}">
            <div class="row">
                <div class="paddingtopbottom_5px" style="height: 70px;">
                    <div class="col-xs-4" style="height: 100%;">
                        <img src="${article.imageUrl}" style="width: 100%; height: 100%">
                    </div>
                    <div class="col-xs-8">
                        <span style="font-size: 13px;">${article.content}</span>
                        <div class="col-xs-6 text-left">
                            <span style="font-size: 12px;"><fmt:formatDate value="${article.updatedAt}" pattern="yyyy年MM月dd日"/></span>
                        </div>
                        <div class="col-xs-6 text-right">
                            <span style="font-size: 12px;">${article.readCount}人阅读</span>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </section>
    <section class="content" style="background-color: white;">
        <div class="row">
            <div style="padding-top: 1rem; padding-bottom: 1rem;">
                <span class="site_font" style="margin-left: 2rem;">热门话题</span>
            </div>
        </div>
        <div class="row border_bottom_line" style="padding-bottom: 1rem;">
            <div class="col-xs-1">
                <div style="background-color: yellow; width: 25px; height: 25px; border-radius: 12.5px;"></div>
            </div>
            <div class="col-xs-11">
                <div class="col-xs-12">
                    <span class="site_font" style="font-size: 12px; margin-left: 1rem;">TAXIS &nbsp;  问 &nbsp;</span>
                    <img src="/img/img_vip.png" style="width: 43px;">
                    <p>时时彩，超高倍率投注，有一起投单的吗？老铁们欢迎来个神评论~</p>
                </div>
                <div class="col-xs-5">
                    <img src="/img/raw_1514134111.png" style="width: 100%; height: 180px;">
                </div>
                <div class="col-xs-3"></div>
                <div class="col-xs-4">
                    <div style="height: 180px; width: 100%; padding: 50% 1% 0% 12%;">
                        <div class="btn_marster_sticker">
                            <span class="site_font" style="font-size: 12px; color: white;">大师贴</span>
                        </div>
                    </div>
                </div>
                <div class="col-xs-5 text-center" style="padding-top: 1rem;">
                    <span class="site_font" style="font-size: 12px; color: lightgrey;">2018-12-13</span>
                </div>
                <div class="col-xs-3"></div>
                <div class="col-xs-4 text-center" style="padding-top: 1rem;">
                    <span class="site_font" style="font-size: 12px; color: rgb(255, 64, 129)">评论: 155</span>
                </div>
            </div>
        </div>

        <div class="row" style="padding-top: 1rem;">
            <div class="col-xs-1">
                <div style="background-color: yellow; width: 25px; height: 25px; border-radius: 12.5px;"></div>
            </div>
            <div class="col-xs-11">
                <div class="col-xs-12">
                    <span class="site_font" style="font-size: 12px; margin-left: 1rem;">TAXIS &nbsp;  问 &nbsp;</span>
                    <span class="site_font" style="font-size: 12px;">胜率：</span>
                    <span class="site_font" style="font-size: 12px; color: rgba(255, 152, 0, 1)">84%</span>
                    <p>时时彩，超高倍率投注，有一起投单的吗？老铁们欢迎来个神评论~</p>
                </div>
                <div class="col-xs-12">
                    <div style="width: 100%; height: 180px;">
                        <img src="/img/v2_pxxpk8.png" style="width: 100%;">
                    </div>

                </div>
                <div class="col-xs-5 text-center" style="padding-top: 1rem;">
                    <span class="site_font" style="font-size: 12px; color: lightgrey;">2018-12-13</span>
                </div>
                <div class="col-xs-3"></div>
                <div class="col-xs-4 text-center" style="padding-top: 1rem;">
                    <span class="site_font" style="font-size: 12px; color: rgb(255, 64, 129)">评论: 155</span>
                </div>
            </div>
        </div>
    </section>
    <div class="page_footer">
        <div class="row" style="height: 100%; margin: 0; padding: 0;">
            <c:forEach var="barItem" varStatus="status" items="${bottomBar}">
                <div class="col-xs-3" style="width: 25%;height: 100%; margin: 0; padding: 0;" id="bar-item-${status.index}" url="${barItem.url}">
                    <div style="text-align: center;width: 100%;height: 60%;">
                        <img src="${barItem.icon}" style="height: 90%;margin: 4px;">
                    </div>
                    <div style="text-align: center;width: 100%;height: 40%;">
                        <span style="font-family: PingFangSC-Regular;
                                font-size: 10px;
                                color: ${barItem.color};
                                letter-spacing: 0;
                                line-height: 10px;font-weight: bold;">${barItem.title}</span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<script src="/js/app.js"></script>
<script src="/vendors/owl.carousel/js/owl.carousel.min.js"></script>
<script src="/js/pages/carousel.js"></script>

<script>
    $(document).ready(function(){
        if($('#response_message').val() == 'not exist')
            swal("警告", "此用户不存在。", "warning");
        else if($('#response_message').val() == 'wrong password')
            swal("警告", "密码错误。", "warning");
        else if($('#response_message').val() == 'inactive')
            swal("警告", "帐户正在等待审核。", "warning");

        var cnt = ${bottomBar.size()};
        for (var i = 0; i < cnt; i++) {
            $("#bar-item-" + i).click(function(){
                location.href = "<%=request.getContextPath()%>" + $(this).attr('url');
            });
        }
    });
</script>

</body>
</html>