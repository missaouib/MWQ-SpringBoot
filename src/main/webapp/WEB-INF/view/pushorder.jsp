<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 推单 </title>
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
<div class="wrapper main_page">
    <section class="content" >
        <div class="row">
            <div class="push_order_banner_div">
                <div style="float: left; padding-top: 50px;">
                     <img src="img/btn_god.png" style="width: 60%; margin-left: 45%;">
                </div>
                <div class="text-right" style="float:right; padding-top: 6px; padding-right: 6px;">
                    <img src="img/jewelry.png" style="width: 22%;">
                    <span class="site_font" style="font-size: 12px; color: rgb(255, 152, 0)">权益解读</span>
                </div>
            </div>
            <div class="push_order_cover_div">
                <div class="text-center" style="padding-top: 1rem;">
                    <p class="site_font" style="color: rgb(255, 152, 0); font-size: 12px;">大神权益</p>
                    <p class="site_font" style="font-size: 12px; color: rgba(79, 79, 79, 0.72);">
                        推荐好友一起加入，享受最高60%的收益佣金，推广越多赚越多！
                    </p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="border_bottom_line" style="background-color: white; width: 100%; height: 120px;">
                <div class="col-xs-4">
                    <div class="text-center" style="padding-top: 4rem;">
                        <a href="<%=request.getContextPath()%>/latestlist">
                            <img src="img/gift.png" style="width: 50%;"> <br>
                            <span class="site_font" style="font-size: 12px;">最新榜单</span>
                        </a>
                    </div>
                </div>
                <div class="col-xs-4">
                    <div class="text-center" style="padding-top: 4rem;">
                        <img src="img/folder.png" style="width: 50%;"> <br>
                        <span class="site_font" style="font-size: 12px;">神预测</span>
                    </div>
                </div>
                <div class="col-xs-4">
                    <div class="text-center" style="padding-top: 4rem;">
                        <img src="img/cup.png" style="width: 50%;"> <br>
                        <span class="site_font" style="font-size: 12px;">实力专家</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div style="background-color: white;">
            <div class="row">
                <div style="padding-top: 6px; padding-bottom: 1rem;">
                    <span class="site_font" style="margin-left: 2rem;">推荐专家</span>
                </div>
            </div>
            <div class="main_page text-center" style="height: 100px; background-color: white;">
                <div class="recommanded_div_contain">
                    <span class="site_font recommanded_span">7连红</span>
                    <img src="img/v2_pvfw1g.png" class="recommanded_img">
                    <p class="site_font" style="font-size: 12px;">体彩王</p>
                </div>
                <div class="recommanded_div_contain">
                    <span class="site_font recommanded_span">7连红</span>
                    <img src="img/v2_pvfw1g.png" class="recommanded_img">
                    <p class="site_font" style="font-size: 12px;">体彩王</p>
                </div>
                <div class="recommanded_div_contain">
                    <span class="site_font recommanded_span">7连红</span>
                    <img src="img/v2_pvfw1g.png" class="recommanded_img">
                    <p class="site_font" style="font-size: 12px;">体彩王</p>
                </div>
                <div class="recommanded_div_contain">
                    <span class="site_font recommanded_span">7连红</span>
                    <img src="img/v2_pvfw1g.png" class="recommanded_img">
                    <p class="site_font" style="font-size: 12px;">体彩王</p>
                </div>
                <div class="recommanded_div_contain">
                    <span class="site_font recommanded_span">7连红</span>
                    <img src="img/v2_pvfw1g.png" class="recommanded_img">
                    <p class="site_font" style="font-size: 12px;">体彩王</p>
                </div>
            </div>
        </div>

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