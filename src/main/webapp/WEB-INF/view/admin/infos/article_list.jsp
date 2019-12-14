<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>话题</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!-- global css -->
    <link href="/css/app.css" rel="stylesheet">
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
            <h1 style="display: inline">话题</h1> &nbsp;&nbsp;&nbsp;
            <a href="/admin/add-article" class="btn btn-primary" role="button">
                <span class="livicon" data-name="plus-alt" data-size="18" data-loop="true" data-c="#fff" data-hc="white" style="position: relative; top:4px; right:4px;"></span>
                <span>添加</span>
            </a>
            <ol class="breadcrumb">
                <li>
                    <a href="/admin">
                        <i class="livicon" data-name="home" data-size="14" data-loop="true"></i>
                        仪表板
                    </a>
                </li>
                <li>
                    <a href="#">资讯中心</a>
                </li>
                <li class="active">话题</li>
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
                                <table class="table table-striped table-bordered table-hover dataTable no-footer"
                                       id="article_list_table" role="grid">
                                    <thead class="table_head">
                                        <tr role="row">
                                            <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                colspan="1" aria-label="
                                                         Image
                                                    : activate to sort column ascending"> 图片
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                colspan="1" aria-label="
                                                         Content
                                                    : activate to sort column ascending"> 文章内容
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                colspan="1" aria-label="
                                                         Read Count
                                                    : activate to sort column ascending"> 人阅读
                                            </th>
                                            <th class="sorting text-center" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                colspan="1" aria-label="
                                                             Updated Date
                                                        : activate to sort column ascending">更新日期
                                            </th>
                                            <th class="sorting text-center" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                                colspan="1" aria-label="
                                                             Action
                                                        : activate to sort column ascending">操作
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="article" varStatus="status" items="${articleList}">
                                            <c:choose>
                                                <c:when test="${status.index % 2 == 1}">
                                                    <c:set value="odd" var="class_type" />
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set value="even" var="class_type" />
                                                </c:otherwise>
                                            </c:choose>
                                            <tr role="row" class="${class_type}" data-id="${article.id}">
                                                <td>
                                                    <c:if test="${article.imageUrl != ''}">
                                                        <img src="${article.imageUrl}" style="max-width: 200px; max-height: 150px;">
                                                    </c:if>
                                                </td>
                                                <td><c:out value="${article.content}" /></td>
                                                <td><c:out value="${article.readCount}" /></td>
                                                <td><fmt:formatDate value="${article.updatedAt}" pattern="yyyy年MM月dd日 H:mm:ss"/></td>
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
        <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog">
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
                        <button type="button" class="btn btn-danger" id="delete_item" data-dismiss="modal">删除
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
<script src="/js/admin/article_list_table.js"></script>
<!-- end of page level js -->

</body>
</html>
