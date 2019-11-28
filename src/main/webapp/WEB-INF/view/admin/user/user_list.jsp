<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!-- global css -->
    <link href="/css/app.css" rel="stylesheet">
    <link href="/css/admin_style.css" rel="stylesheet">
    <!-- end of global css -->
    <!--page level css -->
    <link rel="stylesheet" href="/vendors/select2/css/select2.min.css"/>
    <link rel="stylesheet" href="/vendors/select2/css/select2-bootstrap.css"/>
    <link rel="stylesheet" href="/vendors/datatables/css/dataTables.bootstrap.css"/>
    <link rel="stylesheet" href="/vendors/datatables/css/buttons.bootstrap.css">
    <link rel="stylesheet" href="/vendors/datatables/css/colReorder.bootstrap.css"/>
    <link rel="stylesheet" href="/vendors/datatables/css/dataTables.bootstrap.css"/>
    <link rel="stylesheet" href="/vendors/datatables/css/rowReorder.bootstrap.css">
    <link rel="stylesheet" href="/vendors/datatables/css/buttons.bootstrap.css"/>
    <link href="/css/pages/tables.css" rel="stylesheet"/>
    <!--end of page level css-->
</head>

<body class="skin-josh">

<jsp:include page="../header.jsp"/>

<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="../sliderbar.jsp"/>
    <!-- Right side column. Contains the navbar and content of the page -->
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>用户列表</h1>
            <ol class="breadcrumb">
                <li>
                    <a href="/admin">
                        <i class="livicon" data-name="home" data-size="14" data-loop="true"></i>
                        仪表板
                    </a>
                </li>
                <li>用户管理</li>
                <li class="active">用户列表</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Second Data Table -->
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="panel panel-danger table-edit">
                        <div class="panel-body">
                            <div id="sample_editable_1_wrapper" class="">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer text-center vertical-middle"
                                       id="sample_editable_1" role="grid">
                                    <thead class="table_head">
                                        <tr role="row">
                                            <th class="text-center" tabindex="0" aria-controls="sample_editable_1"
                                                rowspan="1" colspan="1">头像
                                            </th>
                                            <th class="sorting text-center" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                colspan="1" aria-label="
                                                     Phone
                                                : activate to sort column ascending">手机号码
                                            </th>
                                            <th class="sorting text-center" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                colspan="1" aria-label="
                                                     Username
                                                : activate to sort column ascending">姓名
                                            </th>
                                            <th class="sorting text-center" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                colspan="1" aria-label="
                                                     Created Date
                                                : activate to sort column ascending">注册日期
                                            </th>
                                            <th class="sorting text-center" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                colspan="1" aria-label="
                                                     Status
                                                : activate to sort column ascending">状态
                                            </th>
                                            <th class="sorting text-center" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                colspan="1" aria-label="
                                                     Action
                                                : activate to sort column ascending">操作
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="user" varStatus="status" items="${users}">
                                            <c:choose>
                                                <c:when test="${status.index % 2 == 1}">
                                                    <c:set value="odd" var="class_type" />
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set value="even" var="class_type" />
                                                </c:otherwise>
                                            </c:choose>
                                            <tr role="row" class="${class_type}" data-id="${user.id}">
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${user.photo != null}">
                                                            <c:set value="${user.photo}" var="photo_path" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:set value="/img/v2_pxxlpo.png" var="photo_path" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <img src="${photo_path}" class="user_avata">
                                                </td>
                                                <td>
                                                    <c:set value="${fn:length(user.phoneNumber)}" var="phone_length" />
                                                    <c:out value="${fn:substring(user.phoneNumber, 0, 3)}" /> *** <c:out value="${fn:substring(user.phoneNumber, phone_length - 4, phone_length)}" />
                                                </td>
                                                <td><c:out value="${user.name}" /></td>
                                                <td><fmt:formatDate value="${user.createdAt}" pattern="yyyy年MM月dd日"/></td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${user.status == 0}">
                                                            <div class="badge badge-secondary round"><span>已停用</span></div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="badge badge-success round"><span>有效</span></div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a class="delete btn danger btn-xs black" href="javascript:;">
                                                        <i class="livicon" data-name="trash" data-loop="true" data-color="#fff" data-hovercolor="black" data-size="14"></i>
                                                        <span style="color: white;">删除</span>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        <!-- END EXAMPLE TABLE PORTLET-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- content -->
        <div class="modal fade" id="user_list_deleteConfirmModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">删除项目</h4>
                    </div>
                    <div class="modal-body">
                        <p>确定要删除吗？</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-danger" id="user_list_delete_item" data-dismiss="modal">删除
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </aside>
    <!-- right-side -->
</div>
<!-- ./wrapper -->
<a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button" title="Return to top"
   data-toggle="tooltip" data-placement="left">
    <i class="livicon" data-name="plane-up" data-size="18" data-loop="true" data-c="#fff" data-hc="white"></i>
</a>
<!-- global js -->
<script src="/js/app.js" type="text/javascript"></script>
<!-- end of global js -->
<!-- begining of page level js -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="/vendors/select2/js/select2.js"></script>
<script src="/vendors/datatables/js/jquery.dataTables.js"></script>
<script src="/vendors/datatables/js/dataTables.bootstrap.js"></script>
<script src="/vendors/datatables/js/dataTables.buttons.js"></script>
<script src="/vendors/datatables/js/dataTables.colReorder.js"></script>
<script src="/vendors/datatables/js/dataTables.responsive.js"></script>
<script src="/vendors/datatables/js/dataTables.rowReorder.js"></script>
<script src="/vendors/datatables/js/buttons.colVis.js"></script>
<script src="/vendors/datatables/js/buttons.html5.js"></script>
<script src="/vendors/datatables/js/buttons.print.js"></script>
<script src="/vendors/datatables/js/buttons.bootstrap.js"></script>
<script src="/vendors/datatables/js/pdfmake.js"></script>
<script src="/vendors/datatables/js/vfs_fonts.js"></script>
<script src="/vendors/datatables/js/dataTables.scroller.js"></script>
<script src="/js/admin/user_list_table.js"></script>
<!-- end of page level js -->

</body>
</html>
