<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新增圈子</title>
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
            <h1>新增圈子</h1>
            <ol class="breadcrumb">
                <li>
                    <a href="/admin">
                        <i class="livicon" data-name="home" data-size="14" data-loop="true"></i>
                        仪表板
                    </a>
                </li>
                <li>
                    <a href="#">板块管理</a>
                </li>
                <li class="active">新增圈子</li>
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
                                        <label class="col-md-3 control-label" for="title">圈子名称</label>
                                        <div class="col-md-9">
                                            <input class="form-control resize_vertical" id="title" name="title" placeholder="请输入圈子名称。。。"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-9">
                                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
                                                <div>
                                                            <span class="btn btn-default btn-file">
                                                                <span class="fileinput-new">选择 logo</span>
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
<script>
    $(document).ready(function(){
        $("#add_button").click(function(event){
            event.preventDefault();
            submit();
        });
    });

    function submit() {
        var content = $("#content").val();
        if(title.length < 1){
            swal("警告", "请输入圈子名称。", "warning");
            return;
        }

        var form = $('form')[0];
        var data = new FormData(form);

        $("#add_button").prop("disabled", true);

        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "/admin/add-group",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (result) {
                if (result.status) {
                    swal("成功！", "", "success");
                    reset();
                } else {
                    swal("失败", "", "warning");
                }

                $("#add_button").prop("disabled", false);
            },
            error: function (e) {
                swal("错误", "上传数据时出错", "error");
                $("#add_button").prop("disabled", false);
            }
        });
    }

    function reset() {
        $("#title").val("");
        $("#image").val("");
        $(".fileinput-preview").html("");
    }
</script>
<!-- end of page level js -->

</body>
</html>
