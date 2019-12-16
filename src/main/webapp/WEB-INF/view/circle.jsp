<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            <div class="top_title_with_back" style="padding-left: 14rem;">
                <span>圈子</span>
            </div>
        </div>
    </section>

    <section class="content" style="height: 90px;">
        <div class="row" style="height: 100%;">
            <div style="background-image: url('/img/raw_1492697498.png'); height: 100%; padding: 18px 0; color: white;">
                <div class="col-xs-2">
                    <img src="${group.logoUrl}" style="width: 45px; height: 45px; border-radius: 50%;">
                </div>
                <div class="col-xs-6">
                    <p><c:out value="${group.title}" /></p>
                    <p>成员: <span id=""><c:out value="${group.userCount}" /></span>&nbsp;&nbsp;<span>帖子数: <c:out value="${group.approvedPosts.size()}" /></span></p>
                </div>
                <c:if test="${!isJoined}">
                    <div class="col-xs-4">
                        <button id="join_button" style="background-color: white; color: rgb(255, 152, 0); padding: 5px 22px; border: none; border-radius: 5px; margin-top: 9px; margin-left: 1rem;">关注</button>
                    </div>
                </c:if>
            </div>
        </div>
    </section>
    <section class="content paddingtopbottom_5px" style="height: 70px; width: 100%; background-color: white;">
        <div style="height: 100%; width: 100%;">
            <div class="col-xs-2" style="border-right: solid thin lightgrey;">
                <p>队长</p>
                <img src="/img/v2_pvfw1g.png" style="width: 100%; border-radius: 50%;">
            </div>
            <div class="col-xs-8">
                <p><c:out value="${group.userCount}" />人关注</p>
                <c:forEach var="user" items="${group.users}">
                    <c:choose>
                        <c:when test="${user.photo != null}">
                            <c:set value="${user.photo}" var="photo_path" />
                        </c:when>
                        <c:otherwise>
                            <c:set value="/img/user_placeholder.png" var="photo_path" />
                        </c:otherwise>
                    </c:choose>
                    <img src="${photo_path}" class="user_avata" style="width: 13%; border-radius: 50%;" alt="${user.name}">
                </c:forEach>
            </div>
            <div class="col-xs-2">
                <button class="user_setting_button" style="margin-top: 3rem;">
                    <i class="fa fa-fw fa-angle-right" style="font-size: 20px;"></i>
                </button>
            </div>
        </div>
    </section>

    <section class="content" style="background-color: white; margin-top: 1rem;">
        <div class="row">
            <div style="padding-top: 1rem; padding-bottom: 1rem;">
                <span class="site_font" style="margin-left: 2rem;">热门话题</span>
            </div>
        </div>
        <c:forEach var="post" items="${group.approvedPosts}">
        <div class="row border_bottom_line" style="padding-top:1rem;padding-bottom: 1rem;">
            <div class="col-xs-1">
                <div style="background-color: yellow; width: 25px; height: 25px; border-radius: 12.5px;"></div>
            </div>
<%--                <c:choose>--%>
<%--                    <c:when test="${post.user.photo != null}">--%>
<%--                        <c:set value="${post.user.photo}" var="photo_path" />--%>
<%--                    </c:when>--%>
<%--                    <c:otherwise>--%>
<%--                        <c:set value="/img/user_placeholder.png" var="photo_path" />--%>
<%--                    </c:otherwise>--%>
<%--                </c:choose>--%>
<%--                <img src="${photo_path}" class="user_avata" style="width: 13%; border-radius: 50%;">--%>
            <div class="col-xs-11">
                <div class="col-xs-12">
                    <span class="site_font" style="font-size: 12px; margin-left: 1rem;"><c:out value="${post.user.name}" /></span>
<%--                    <img src="/img/img_vip.png" style="width: 43px;">--%>
                    <p> <c:out value="${post.message}" /></p>
                </div>
                <div class="col-xs-12">
                    <c:forEach var="imageUrl" varStatus="status" items="${post.imageUrls}">
                        <div class="col-xs-4" style="margin-bottom: 5px; height: 50px;">
                            <img src="${imageUrl}" style="max-width: 100px; max-height: 50px;width: 100%; height: 100%;object-fit: cover;">
                        </div>
                    </c:forEach>
                </div>
<%--                <div class="col-xs-3"></div>--%>
<%--                <div class="col-xs-4">--%>
<%--                    <div style="height: 180px; width: 100%; padding: 50% 1% 0% 12%;">--%>
<%--                        <div class="btn_marster_sticker">--%>
<%--                            <span class="site_font" style="font-size: 12px; color: white;">大师贴</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="col-xs-5 text-center" style="padding-top: 1rem;">
                    <span class="site_font" style="font-size: 12px; color: lightgrey;"><fmt:formatDate value="${post.createdAt}" pattern="yyyy年MM月dd日"/></span>
                </div>
                <div class="col-xs-3"></div>
                <div class="col-xs-4 text-center" style="padding-top: 1rem;">
                    <span class="site_font" style="font-size: 12px; color: rgb(255, 64, 129)">评论: <c:out value="${post.comments.size()}" /></span>
                </div>
            </div>
        </div>
        </c:forEach>

    </section>
    <div class="page_footer text-center">
        <div class="row" style="height: 100%; margin: 0; padding-top: 11px; background-color: rgb(255, 152, 0); color: white;">
            <a href="<%=request.getContextPath()%>/releasepost?group_id=${group.id}">
            <span class="site_font" style="color: white;">发布话题</span>
            </a>
        </div>
    </div>

    <form action="<%=request.getContextPath()%>/join-group" method="post">
        <input type="hidden" id="response_status" value="${status}">
        <input type="hidden" id="group_id" name="id" value="${group.id}">
    </form>

    <!-- content -->
    <div class="modal fade" id="joinConfirmModal" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">关注圈子</h4>
                </div>
                <div class="modal-body">
                    <p>确定关注吗？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-success" id="join_group" data-dismiss="modal">关注
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<script src="/js/app.js"></script>
<script src="<%=request.getContextPath()%>/vendors/sweetalert/js/sweetalert.min.js"></script>
<script>
    $(document).ready(function(){
        if ($('#response_status').val() == 'true') {
            $('#joinConfirmModal').modal('hide');
            swal("成功！", "", "success");
        } else if ($('#response_status').val() == 'false') {
            $('#joinConfirmModal').modal('hide');
            swal("警告", "关注圈子失败。", "warning");
        }

        $("#join_button").click(function(){
            join();
        });
    });

    function goBack() {
        window.location.href="<%=request.getContextPath()%>/home"
    }

    function join() {

        var group_id = $('#group_id').val();

        $('#joinConfirmModal').data('id', group_id).modal('show');

        $('#join_group').click(function () {
            $('form').submit();
        });
    }
</script>
</body>
</html>