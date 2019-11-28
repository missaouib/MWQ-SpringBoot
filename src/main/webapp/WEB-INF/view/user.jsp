<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 个人中心 </title>
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
    <section class="content">
        <div class="row">
            <div class="user_top_div">
                <div class="col-xs-10">
                    <img src="/img/v2_pvfw1g.png" style="width: 12%; border-radius: 50%;">
                    <span class="site_font">&nbsp; &nbsp;凌风 &nbsp;</span>
                    <span class="site_font user_verify_span">认证会员</span>
                </div>
               <div class="col-xs-2">
                   <button class="user_setting_button">
                       <i class="fa fa-fw fa-cog" style="font-size: 22px;"></i>
                   </button>
               </div>
            </div>
        </div>
    </section>
    <section class="content border_bottom_line" style="padding-bottom: 1rem;">
        <div class="row">
            <div style="background-image: url('/img/v2_pxxp69.jpg'); height: 135px; width: 92%; margin-left: auto; margin-right: auto; border-top-left-radius: 7px; border-top-right-radius: 7px; color: white;">
                <div class="col-xs-4">
                    <div style="padding-top: 27px;"><span class="site_font" style="font-size: 12px;">我的余额</span></div>
                    <div style="padding-top: 6px;"><span class="site_font" style="font-size: 20px;">54</span></div>
                    <div style="padding-top: 8px;"><span class="site_font" style="font-size: 12px;">我的消费</span></div>
                    <div style="padding-top: 3px;"><span class="site_font">2000</span></div>
                </div>
                <div class="col-xs-4">
                    <div style="padding-top: 85px;"><span class="site_font" style="font-size: 12px;">我的帖子</span></div>
                    <div style="padding-top: 3px;"><span class="site_font">14</span></div>
                </div>
                <div class="col-xs-4">
                    <div style="padding-top: 85px;"><span class="site_font" style="font-size: 12px;">我的跟单</span></div>
                    <div style="padding-top: 3px;"><span class="site_font">20</span></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div style="height: 40px; width: 92%; margin-left: auto; margin-right: auto; background-color: rgb(255, 152, 0);">
                <div class="col-xs-8">
                    <img src="/img/v2_pxxlkt.png" style="width: 24%;">
                    <span class="site_font" style="font-size: 12px; color: rgba(255, 255, 255, 0.75);">&nbsp; &nbsp;充值优惠进行中~</span>
                </div>
                <div class="col-xs-4 text-right" style="padding-top: 8px; color: white;">
                    <button class="user_setting_button">
                        立即充值
                    </button>
                </div>
            </div>
        </div>
    </section>
    <section class="content border_bottom_line">
        <div class="row text-center" style="padding-top: 2rem; padding-bottom: 1rem;">
            <div class="col-xs-3">
                <img src="/img/v2_pxxlpo.png" style="width: 70%; border-radius: 50%;">
                <p class="site_font" style="font-size: 12px;">申请大神</p>
            </div>
            <div class="col-xs-3">
                <img src="/img/v2_pxxlxb.png" style="width: 70%; border-radius: 50%;">
                <p class="site_font" style="font-size: 12px;">购买喇叭</p>
            </div>
            <div class="col-xs-3">
                <img src="/img/v2_pxxlxh.png" style="width: 70%; border-radius: 50%;">
                <p class="site_font" style="font-size: 12px;">我的订单</p>
            </div>
            <div class="col-xs-3">
                <img src="/img/v2_pxxlxm.png" style="width: 70%; border-radius: 50%;">
                <p class="site_font" style="font-size: 12px;">商城</p>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="row" style="padding-top: 1rem;">
            <div class="user_top_div">
                <div class="col-xs-10">
                    <img src="/img/user_phone.png" style="width: 12%; border-radius: 50%;">&nbsp;
                    <button class="user_setting_button">绑定手机</button>
                </div>
                <div class="col-xs-2">
                    <button class="user_setting_button">
                        <i class="fa fa-fw fa-angle-right" style="font-size: 22px;"></i>
                    </button>
                </div>
            </div>
        </div>
        <div class="row" style="padding-top: 1rem;">
            <div class="user_top_div">
                <div class="col-xs-10">
                    <img src="/img/user_other.png" style="width: 12%; border-radius: 50%;">&nbsp;
                    <button class="user_setting_button">联系客服</button>
                </div>
                <div class="col-xs-2">
                    <button class="user_setting_button">
                        <i class="fa fa-fw fa-angle-right" style="font-size: 22px;"></i>
                    </button>
                </div>
            </div>
        </div>
        <div class="row" style="padding-top: 1rem;">
            <div class="user_top_div">
                <div class="col-xs-10">
                    <img src="/img/user_other.png" style="width: 12%; border-radius: 50%;">&nbsp;
                    <button class="user_setting_button">联系客服</button>
                </div>
                <div class="col-xs-2">
                    <button class="user_setting_button">
                        <i class="fa fa-fw fa-angle-right" style="font-size: 22px;"></i>
                    </button>
                </div>
            </div>
        </div>
        <div class="row" style="padding-top: 1rem;">
            <div class="user_top_div">
                <div class="col-xs-10">
                    <img src="/img/user_other.png" style="width: 12%; border-radius: 50%;">&nbsp;
                    <button class="user_setting_button">邀请好友</button>
                </div>
                <div class="col-xs-2">
                    <button class="user_setting_button">
                        <i class="fa fa-fw fa-angle-right" style="font-size: 22px;"></i>
                    </button>
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