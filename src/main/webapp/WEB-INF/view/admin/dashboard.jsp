<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>仪表板</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <!-- global css -->
    <link href="/css/app.css" rel="stylesheet" type="text/css" />
    <!-- end of global css -->
    <!--page level css -->
    <link href="/vendors/fullcalendar/css/fullcalendar.css" rel="stylesheet" type="text/css" />
    <link href="/css/pages/calendar_custom.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" media="all" href="/vendors/bower-jvectormap/css/jquery-jvectormap-1.2.2.css" />
    <link rel="stylesheet" href="/vendors/animate/animate.min.css">
    <link rel="stylesheet" type="text/css" href="/vendors/datetimepicker/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="/css/pages/only_dashboard.css" />
    <!--end of page level css-->
</head>
<body class="skin-josh">

<jsp:include page="header.jsp"/>

<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="sliderbar.jsp"/>
    <!-- Right side column. Contains the navbar and content of the page -->
    <aside class="right-side">
        <!-- Main content -->
        <section class="content-header">
            <h1>欢迎来到竞猜管理系统</h1>
            <ol class="breadcrumb">
                <li class="active">
                    <a href="#">
                        <i class="livicon" data-name="home" data-size="14" data-color="#333" data-hovercolor="#333"></i> 仪表板
                    </a>
                </li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6 margin_10 animated fadeInLeftBig">
                    <!-- Trans label pie charts strats here-->
                    <div class="lightbluebg no-radius">
                        <div class="panel-body squarebox square_boxs">
                            <div class="col-xs-12 pull-left nopadmar">
                                <div class="row">
                                    <div class="square_box col-xs-7 text-right">
                                        <span>总用户</span>
                                        <div class="number" id="myTargetElement1"></div>
                                    </div>
                                    <i class="livicon  pull-right" data-name="eye-open" data-l="true" data-c="#fff" data-hc="#fff" data-s="70"></i>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <small class="stat-label">Last Week</small>
                                        <h4 id="myTargetElement1.1"></h4>
                                    </div>
                                    <div class="col-xs-6 text-right">
                                        <small class="stat-label">Last Month</small>
                                        <h4 id="myTargetElement1.2"></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 margin_10 animated fadeInUpBig">
                    <!-- Trans label pie charts strats here-->
                    <div class="redbg no-radius">
                        <div class="panel-body squarebox square_boxs">
                            <div class="col-xs-12 pull-left nopadmar">
                                <div class="row">
                                    <div class="square_box col-xs-7 pull-left">
                                        <span>Today's Sales</span>
                                        <div class="number" id="myTargetElement2"></div>
                                    </div>
                                    <i class="livicon pull-right" data-name="piggybank" data-l="true" data-c="#fff" data-hc="#fff" data-s="70"></i>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <small class="stat-label">Last Week</small>
                                        <h4 id="myTargetElement2.1"></h4>
                                    </div>
                                    <div class="col-xs-6 text-right">
                                        <small class="stat-label">Last Month</small>
                                        <h4 id="myTargetElement2.2"></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-4 col-md-6 margin_10 animated fadeInDownBig">
                    <!-- Trans label pie charts strats here-->
                    <div class="goldbg no-radius">
                        <div class="panel-body squarebox square_boxs">
                            <div class="col-xs-12 pull-left nopadmar">
                                <div class="row">
                                    <div class="square_box col-xs-7 pull-left">
                                        <span>Subscribers</span>
                                        <div class="number" id="myTargetElement3"></div>
                                    </div>
                                    <i class="livicon pull-right" data-name="archive-add" data-l="true" data-c="#fff" data-hc="#fff" data-s="70"></i>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <small class="stat-label">Last Week</small>
                                        <h4 id="myTargetElement3.1"></h4>
                                    </div>
                                    <div class="col-xs-6 text-right">
                                        <small class="stat-label">Last Month</small>
                                        <h4 id="myTargetElement3.2"></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 margin_10 animated fadeInRightBig">
                    <!-- Trans label pie charts strats here-->
                    <div class="palebluecolorbg no-radius">
                        <div class="panel-body squarebox square_boxs">
                            <div class="col-xs-12 pull-left nopadmar">
                                <div class="row">
                                    <div class="square_box col-xs-7 pull-left">
                                        <span>Registered Users</span>
                                        <div class="number" id="myTargetElement4"></div>
                                    </div>
                                    <i class="livicon pull-right" data-name="users" data-l="true" data-c="#fff" data-hc="#fff" data-s="70"></i>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <small class="stat-label">Last Week</small>
                                        <h4 id="myTargetElement4.1"></h4>
                                    </div>
                                    <div class="col-xs-6 text-right">
                                        <small class="stat-label">Last Month</small>
                                        <h4 id="myTargetElement4.2"></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/row-->
        </section>
    </aside>
    <!-- right-side -->
</div>
<a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button" title="Return to top" data-toggle="tooltip" data-placement="left">
    <i class="livicon" data-name="plane-up" data-size="18" data-loop="true" data-c="#fff" data-hc="white"></i>
</a>
<!-- global js -->
<script src="/js/app.js" type="text/javascript"></script>
<!-- end of global js -->
<!-- begining of page level js -->
<!-- EASY PIE CHART JS -->
<script src="/vendors/jquery.easy-pie-chart/js/easypiechart.min.js"></script>
<script src="/vendors/jquery.easy-pie-chart/js/jquery.easypiechart.min.js"></script>
<script src="/js/jquery.easingpie.js"></script>
<!--end easy pie chart -->
<!--for calendar-->
<script src="/vendors/moment/js/moment.min.js" type="text/javascript"></script>
<script src="/vendors/fullcalendar/js/fullcalendar.min.js" type="text/javascript"></script>
<!--   Realtime Server Load  -->
<script src="/vendors/flotchart/js/jquery.flot.js" type="text/javascript"></script>
<script src="/vendors/flotchart/js/jquery.flot.resize.js" type="text/javascript"></script>
<!--Sparkline Chart-->
<script src="/vendors/sparklinecharts/jquery.sparkline.js"></script>
<!-- Back to Top-->
<script type="text/javascript" src="/vendors/countUp.js/js/countUp.js"></script>
<!--   maps -->
<script src="/vendors/bower-jvectormap/js/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/vendors/bower-jvectormap/js/jquery-jvectormap-world-mill-en.js"></script>
<script src="/vendors/chartjs/Chart.js"></script>
<script type="text/javascript" src="/vendors/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<!--  todolist-->
<script src="/js/pages/todolist.js"></script>
<script src="/js/pages/dashboard.js" type="text/javascript"></script>
<!-- end of page level js -->
</body>

</html>
