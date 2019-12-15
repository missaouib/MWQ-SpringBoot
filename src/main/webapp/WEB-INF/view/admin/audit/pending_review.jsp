<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>待审核</title>
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
    <link href="/css/main.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/css/pages/tab.css" />
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
            <h1>待审核</h1>
            <ol class="breadcrumb">
                <li>
                    <a href="/admin">
                        <i class="livicon" data-name="home" data-size="14" data-loop="true"></i>
                        仪表板
                    </a>
                </li>
                <li>
                    <a href="#">审核管理</a>
                </li>
                <li class="active">待审核</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-info">
                        <div class="panel-body">
                            <!-- Custom Tabs -->
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#tab_1" data-toggle="tab">圈子</a>
                                    </li>
                                    <li>
                                        <a href="#tab_2" data-toggle="tab">主播</a>
                                    </li>
                                    <li>
                                        <a href="#tab_3" data-toggle="tab">喇叭</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="slim2">
                                    <div class="tab-pane active" id="tab_1">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                                <div class="panel panel-danger table-edit">

                                                    <div class="panel-body">
                                                        <div id="pending_review_table_1_wrapper" class="">
                                                            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                                                                   id="pending_review_table_1" role="grid">
                                                                <thead class="table_head">
                                                                    <tr role="row">
                                                                        <th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1"
                                                                            rowspan="1" colspan="1"> 圈子LOGO
                                                                        </th>
                                                                        <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                            colspan="1" > 圈子名称
                                                                        </th>
                                                                        <th class="sorting text-center" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                            colspan="1" > 更新日期
                                                                        </th>
                                                                        <th class="sorting text-center" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                            colspan="1"> 状态
                                                                        </th>
                                                                        <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                            colspan="1" > 操作
                                                                        </th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach var="group" varStatus="status" items="${groups}">
                                                                        <c:choose>
                                                                            <c:when test="${status.index % 2 == 1}">
                                                                                <c:set value="odd" var="class_type" />
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <c:set value="even" var="class_type" />
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <tr role="row" class="${class_type}" data-id="${group.id}">
                                                                            <td><c:out value="${group.title}" /></td>
                                                                            <td>
                                                                                <c:if test="${group.logoUrl != ''}">
                                                                                    <img src="${group.logoUrl}" style="max-width: 100px; max-height: 50px;">
                                                                                </c:if>
                                                                            </td>
                                                                            <td><fmt:formatDate value="${group.createdAt}" pattern="yyyy年MM月dd日"/></td>
                                                                            <td>
                                                                                <div class="status badge badge-secondary round" data-status="2"><span>待审核</span></div>
                                                                            </td>
                                                                            <td>
                                                                                <a class="enable btn success btn-xs black" href="javascript:;">
                                                                                    <i class="livicon" data-name="check" data-loop="true" data-color="#fff" data-hovercolor="black" data-size="14"></i>
                                                                                    <span style="color: white;">启用</span>
                                                                                </a>
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
                                    </div>
                                    <!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_2">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                                <div class="panel panel-danger table-edit">

                                                    <div class="panel-body">
                                                        <div id="pending_review_table_2_wrapper" class="">
                                                            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                                                                   id="pending_review_table_2" role="grid">
                                                                <thead class="table_head">
                                                                <tr role="row">
                                                                    <th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1"
                                                                        rowspan="1" colspan="1">图片
                                                                    </th>
                                                                    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                        colspan="1" aria-label="
                                                 Full Name
                                            : activate to sort column ascending">产品名称
                                                                    </th>
                                                                    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                        colspan="1" aria-label="
                                                 Full Name
                                            : activate to sort column ascending">产品价格
                                                                    </th>
                                                                    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                        colspan="1" aria-label="
                                                 Full Name
                                            : activate to sort column ascending">快递
                                                                    </th>
                                                                    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                        colspan="1" aria-label="
                                                 Full Name
                                            : activate to sort column ascending">参数
                                                                    </th>
                                                                    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                        colspan="1" aria-label="
                                                 Full Name
                                            : activate to sort column ascending">详情
                                                                    </th>
                                                                    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                        colspan="1" aria-label="
                                                 Delete
                                            : activate to sort column ascending">操作
                                                                    </th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr role="row" class="odd" data-id="1">
                                                                    <td class="sorting_1">iamge</td>
                                                                    <td>product title</td>
                                                                    <td>product price</td>
                                                                    <td>product express</td>
                                                                    <td>product parameter</td>
                                                                    <td>product detail</td>
                                                                    <td>
                                                                        <a class="btn success btn-xs black" href="javascript:;">
                                                                            <i class="livicon" data-name="edit" data-loop="true" data-color="#fff" data-hovercolor="black" data-size="14"></i>
                                                                            <span style="color: white;">编辑</span>
                                                                        </a>
                                                                        <a class="delete btn danger btn-xs black" href="javascript:;">
                                                                            <i class="livicon" data-name="trash" data-loop="true" data-color="#fff" data-hovercolor="black" data-size="14"></i>
                                                                            <span style="color: white;">删除</span>
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <!-- END EXAMPLE TABLE PORTLET-->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_3">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                                <div class="panel panel-danger table-edit">

                                                    <div class="panel-body">
                                                        <div id="pending_review_table_3_wrapper" class="">
                                                            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                                                                   id="pending_review_table_3" role="grid">
                                                                <thead class="table_head">
                                                                <tr role="row">
                                                                    <th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1"
                                                                        rowspan="1" colspan="1">图片
                                                                    </th>
                                                                    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                        colspan="1" aria-label="
                                                 Full Name
                                            : activate to sort column ascending">产品名称
                                                                    </th>
                                                                    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                        colspan="1" aria-label="
                                                 Full Name
                                            : activate to sort column ascending">产品价格
                                                                    </th>
                                                                    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                        colspan="1" aria-label="
                                                 Full Name
                                            : activate to sort column ascending">快递
                                                                    </th>
                                                                    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                        colspan="1" aria-label="
                                                 Full Name
                                            : activate to sort column ascending">参数
                                                                    </th>
                                                                    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                        colspan="1" aria-label="
                                                 Full Name
                                            : activate to sort column ascending">详情
                                                                    </th>
                                                                    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                                        colspan="1" aria-label="
                                                 Delete
                                            : activate to sort column ascending">操作
                                                                    </th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr role="row" class="odd" data-id="1">
                                                                    <td class="sorting_1">iamge</td>
                                                                    <td>product title</td>
                                                                    <td>product price</td>
                                                                    <td>product express</td>
                                                                    <td>product parameter</td>
                                                                    <td>product detail</td>
                                                                    <td>
                                                                        <a class="btn success btn-xs black" href="javascript:;">
                                                                            <i class="livicon" data-name="edit" data-loop="true" data-color="#fff" data-hovercolor="black" data-size="14"></i>
                                                                            <span style="color: white;">编辑</span>
                                                                        </a>
                                                                        <a class="delete btn danger btn-xs black" href="javascript:;">
                                                                            <i class="livicon" data-name="trash" data-loop="true" data-color="#fff" data-hovercolor="black" data-size="14"></i>
                                                                            <span style="color: white;">删除</span>
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <!-- END EXAMPLE TABLE PORTLET-->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.tab-pane -->
                                </div>
                                <!-- /.tab-content -->
                            </div>
                            <!-- nav-tabs-custom -->
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="modal fade" id="enableConfirmModal_1" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">启用项目</h4>
                    </div>
                    <div class="modal-body">
                        <p>确定要启用吗？</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-danger" id="enable_item_1" data-dismiss="modal">启用
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <div class="modal fade" id="deleteConfirmModal_1" tabindex="-1" role="dialog">
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
                        <button type="button" class="btn btn-danger" id="delete_item_1" data-dismiss="modal">删除
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <div class="modal fade" id="deleteConfirmModal_2" tabindex="-1" role="dialog">
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
                        <button type="button" class="btn btn-danger" id="delete_item_2" data-dismiss="modal">删除
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <div class="modal fade" id="deleteConfirmModal_3" tabindex="-1" role="dialog">
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
                        <button type="button" class="btn btn-danger" id="delete_item_3" data-dismiss="modal">删除
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
<script src="/js/admin/pending_review_table.js"></script>
<script src="/js/admin/pending_review_tab.js" type="text/javascript"></script>
<!-- end of page level js -->

</body>
</html>
