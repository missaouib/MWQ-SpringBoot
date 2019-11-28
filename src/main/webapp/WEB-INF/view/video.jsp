<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 直播 </title>
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
    <section class="content" style="margin-bottom: 1rem;">
        <div class="box-body" style="height: 212px;">
            <!--carousel starts-->
            <div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: 100%">
                <!-- Wrapper for slides -->
                <div class="carousel-inner" style="height: 100%;">
                    <div class="item active" style="height: 100%;">
                        <img src="img/v2_pxxpts.jpg" class="img-responsive" alt="image1">
                    </div>
                    <!-- End Item -->
                    <div class="item" style="height: 100%;">
                        <img src="img/v2_pxxpts.jpg" class="img-responsive" alt="image1">
                    </div>
                </div>
            </div>
            <!--carousel ends-->
        </div>
    </section>
    <section class="content" style="background-color: white;">
        <div class="paddingtopbottom_5px">
            <span class="site_font" style="font-size: 12px; margin-left: 2rem;">直播列表</span>
        </div>
        <div class="row">
            <div class="text-center" style="width: 100%; height: 350px; padding-top: 45%;">
                <span class="site_font" style="color: lightgrey;">当前无直播</span>
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