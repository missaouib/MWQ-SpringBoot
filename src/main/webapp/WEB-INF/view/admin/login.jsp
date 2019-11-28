<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>管理员登入</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- global level css -->
        <link href="/css/bootstrap.min.css" rel="stylesheet" />
        <!-- end of global level css -->
        <!-- page level css -->
        <link href="/css/pages/login2.css" rel="stylesheet" />
        <link href="/vendors/sweetalert/css/sweetalert.css" rel="stylesheet">
        <!-- styles of the page ends-->
    </head>

    <body>
        <div class="container">
            <div class="row vertical-offset-100">
                <div class=" col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3  col-md-5 col-md-offset-4 col-lg-4 col-lg-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">竞猜管理系统</h3>
                        </div>
                        <c:if test = "${message == 'not exist'}">
                            <div class="alert alert-danger alert-dismissable margin5">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                账户不正确
                            </div>
                        </c:if>
                        <c:if test = "${message == 'wrong password'}">
                            <div class="alert alert-danger alert-dismissable margin5">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                密码不正确
                            </div>
                        </c:if>

                        <div class="panel-body">
                            <form action="<%=request.getContextPath()%>/admin/login" method="post" accept-charset="UTF-8" role="form">
                                <fieldset>
                                    <div class="form-group input-group">
                                        <div class="input-group-addon">
                                            <i class="livicon" data-name="user" data-size="18" data-c="#484848" data-hc="#484848" data-loop="true"></i>
                                        </div>
                                        <input class="form-control" placeholder="用户名" id="username" name="username" type="text" value="${userName}" required>
                                    </div>
                                    <div class="form-group input-group">
                                        <div class="input-group-addon">
                                            <i class="livicon" data-name="lock" data-size="18" data-c="#484848" data-hc="#484848" data-loop="true"></i>
                                        </div>
                                        <input class="form-control" placeholder="密码" id="password" name="password" type="password" value="${password}" required>
                                    </div>

                                    <a href="#" class="btn btn-primary btn-block" id="login_button">登入</a>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- global js -->
        <script src="/js/app.js" type="text/javascript"></script>
        <!-- end of global js -->
        <script src="<%=request.getContextPath()%>/vendors/sweetalert/js/sweetalert.min.js"></script>

        <script>
            $(document).ready(function(){
                $("#login_button").click(function(){
                    login();
                });
            });

            function login() {
                var username = $("#username").val();
                var password = $("#password").val();
                if(username.length < 1){
                    swal("警告", "请输入用户名。", "warning");
                    return;
                }
                if(password.length < 1){
                    swal("警告", "请输入密码。", "warning");
                    return;
                }

                $('form').submit();
            }
        </script>
    </body>
</html>
