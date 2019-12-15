<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title> 登入 </title>
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
        <link href="/vendors/iCheck/css/all.css" rel="stylesheet">
        <link href="/vendors/awesome-bootstrap-checkbox/css/awesome-bootstrap-checkbox.css" rel="stylesheet">
    </head>
    <body>
        <div class="wrapper main_page" style="background-color: white;">
            <section class="content" style="margin-bottom: 1rem;">
                <div style="height: 120px; width: 100%;">
                    <img src="img/raw_1536823039.png"  style="height: 100%; width: 100%;">
                </div>
            </section>
            <section class="content" style="background-color: white;">
                <form action="<%=request.getContextPath()%>/login" method="post" style="width: 100%;">
                    <div class="row" style="margin-top:8rem; margin-bottom: 3rem;">
                        <div class="col-xs-1"></div>
                        <div class="col-xs-10">
                            <input id="phone" name="phone" type="number" placeholder="手机号码" class="form-control" value="${phone}">
                        </div>
                        <div class="col-xs-1"></div>
                    </div>

                    <div class="row" style="margin-bottom: 2rem;">
                        <div class="col-xs-1"></div>
                        <div class="col-xs-10">
                            <input id="password" name="password" type="password" placeholder="密码" class="form-control" value="${password}">
                        </div>
                        <div class="col-xs-1"></div>
                    </div>

                    <input type="hidden" name="redirectCtrl" value="${redirectCtrl}">
                </form>
            </section>
            <div class="row">
                <div class="col-xs-1"></div>
                <div class="col-xs-10">
                    <button type="button" id="login_button" class="btn btn-warning btn-block btn-sm" style="height: 40px;">立即登入</button>
                </div>
                <div class="col-xs-1"></div>
            </div>
            <div class="page_footer text-center" style="border: none; font-size: 14px;">
                <div class="col-xs-1"></div>
                <div class="col-xs-10">
                    <br>
                    没有账号吗？ <a href="<%=request.getContextPath()%>/register">注册</a>
                </div>
                <div class="col-xs-1"></div>
            </div>
            <input type="hidden" id="response_message" value="${message}">
        </div>
        <script src="/js/app.js"></script>
        <script src="<%=request.getContextPath()%>/vendors/sweetalert/js/sweetalert.min.js"></script>
        <script>
            $(document).ready(function(){
                if($('#response_message').val() == 'not exist')
                    swal("警告", "此用户不存在。", "warning");
                else if($('#response_message').val() == 'wrong password')
                    swal("警告", "密码错误。", "warning");
                else if($('#response_message').val() == 'inactive')
                    swal("警告", "帐户正在等待审核。", "warning");

                $("#login_button").click(function(){
                    login();
                });
            });

            function login() {
                var phone = $("#phone").val();
                var password = $("#password").val();
                if(phone.length < 1){
                    swal("警告", "请输入手机号码。", "warning");
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