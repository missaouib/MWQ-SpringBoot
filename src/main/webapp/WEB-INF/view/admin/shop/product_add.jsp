<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>产品添加</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!-- global css -->
    <link href="/css/app.css" rel="stylesheet">
    <!-- end of global css -->
    <!--page level css -->
    <link href="/vendors/jasny-bootstrap/css/jasny-bootstrap.css" rel="stylesheet" />
    <link href="/vendors/iCheck/css/all.css" rel="stylesheet" type="text/css" />
    <link href="/vendors/sweetalert/css/sweetalert.css" rel="stylesheet">
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
            <h1>产品添加</h1>
            <ol class="breadcrumb">
                <li>
                    <a href="/admin">
                        <i class="livicon" data-name="home" data-size="14" data-loop="true"></i>
                        仪表板
                    </a>
                </li>
                <li>
                    <a href="#">商城管理</a>
                </li>
                <li class="active">产品添加</li>
            </ol>
        </section>
        <!-- Main content -->

        <section class="content">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="panel panel-primary" id="hidepanel1">
                        <div class="panel-body">
                            <form class="form-horizontal">
                                <fieldset>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="title">产品名称</label>
                                        <div class="col-md-9">
                                            <input class="form-control resize_vertical" id="title" name="content" placeholder="请输入产品名称"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="price">产品价格</label>
                                        <div class="col-md-9">
                                            <input class="form-control resize_vertical" id="price" name="content" placeholder="请输入产品价格"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="express">快递</label>
                                        <div class="col-md-9">
                                            <input class="form-control resize_vertical" id="express" name="content" placeholder="请输入快递"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="parameter">参数</label>
                                        <div class="col-md-9">
                                            <input class="form-control resize_vertical" id="parameter" name="content" placeholder="请输入参数" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="detail">详情</label>
                                        <div class="col-md-9">
                                            <textarea class="form-control resize_vertical" id="detail" name="content" placeholder="请输入详情" rows="5"> </textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-9">
                                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
                                                <div>
                                                            <span class="btn btn-default btn-file">
                                                                <span class="fileinput-new">图片添加</span>
                                                                <span class="fileinput-exists">更新</span>
                                                                <input id="image" name="image" type="file"></span>
                                                    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">删除</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Form actions -->
                                    <div class="form-group">
                                        <div class="col-md-12 text-center">
                                            <button type="button" id="add_button" class="btn btn-responsive btn-primary btn-sm">添加</button>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-3"></div>

            </div>
        </section>


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
<script src="/vendors/favicon/favicon.js"></script>
<script src="/vendors/jasny-bootstrap/js/jasny-bootstrap.js"></script>
<script src="/vendors/iCheck/js/icheck.js"></script>
<script src="/vendors/select2/js/select2.js"></script>
<script src="/js/pages/form_examples.js"></script>
<!-- end of page level js -->
<script src="<%=request.getContextPath()%>/vendors/sweetalert/js/sweetalert.min.js"></script>
<!-- end of page level js -->

</body>
</html>
