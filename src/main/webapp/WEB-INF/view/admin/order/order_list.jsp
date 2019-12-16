<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>订单列表</title>
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
            <h1>订单列表</h1>
            <ol class="breadcrumb">
                <li>
                    <a href="/admin">
                        <i class="livicon" data-name="home" data-size="14" data-loop="true"></i>
                        仪表板
                    </a>
                </li>
                <li>
                    <a href="#">订单管理</a>
                </li>
                <li class="active">订单列表</li>
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
                                       id="order_list_table" role="grid">
                                    <thead class="table_head">
                                    <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1"
                                            rowspan="1" colspan="1">订单号
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                            colspan="1" aria-label="
                                                 Full Name
                                            : activate to sort column ascending">买家
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                            colspan="1" aria-label="
                                                 Points
                                            : activate to sort column ascending">商品名称
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                            colspan="1" aria-label="
                                                 Notes
                                            : activate to sort column ascending">价格
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                            colspan="1" aria-label="
                                                 Notes
                                            : activate to sort column ascending">运费
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                            colspan="1" aria-label="
                                                 Notes
                                            : activate to sort column ascending">发货地址
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                            colspan="1" aria-label="
                                                 Notes
                                            : activate to sort column ascending">订单日期
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1"
                                            colspan="1" aria-label="
                                                 Notes
                                            : activate to sort column ascending">状态
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
<%--                                    <tr role="row" class="odd" data-id="1">--%>

<%--                                    </tr>--%>
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
        <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Delete Item</h4>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure to delete?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-danger" id="delete_item" data-dismiss="modal">Delete
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <div class="modal fade" id="editConfirmModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Edit Confirm</h4>
                    </div>
                    <div class="modal-body">
                        <p>You are already editing a row, you must save or cancel that row before editing/deleting a new
                            row</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <div class="modal fade" id="saveConfirmModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Save Row</h4>
                    </div>
                    <div class="modal-body">
                        <p>Updated successfully, Do not forget to do some ajax to sync with backend.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
<script src="/js/admin/order_list_table.js"></script>
<!-- end of page level js -->

</body>
</html>
