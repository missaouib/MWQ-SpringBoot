<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 注册 </title>
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
    <link href="/css/pages/radio_checkbox.css" rel="stylesheet">
</head>
<body>
<div class="wrapper main_page" style="background-color: white;">
    <section class="content" style="margin-bottom: 1rem;">
        <div style="height: 120px; width: 100%;">
            <img src="<%=request.getContextPath()%>/img/raw_1536823039.png"  style="height: 100%; width: 100%;">
        </div>
    </section>
    <form action="<%=request.getContextPath()%>/register" method="post" style="width: 100%;">
        <section class="content" style="background-color: white;">
            <div class="row" style="margin-top: 4rem; margin-bottom: 4rem;">
                <div class="col-xs-1"></div>
                <div class="col-xs-10">
                    <input id="username" name="username" type="text" placeholder="姓名" class="form-control" value="${username}">
                </div>
                <div class="col-xs-1"></div>
            </div>
            <div class="row" style="margin-bottom: 3rem;">
                <div class="col-xs-1"></div>
                <div class="col-xs-10">
                    <input id="phone" name="phone" type="number" placeholder="手机号码" class="form-control" value="${phone}">
                </div>
                <div class="col-xs-1"></div>
            </div>
            <div class="row" style="margin-bottom: 4rem;">
                <div class="col-xs-1"></div>
                <div class="col-xs-10">
                    <div style="float:left; width: 65%;">
                        <input id="passcode" name="passcode" type="number" placeholder="验证码" class="form-control" value="${passcode}">
                    </div>
                    <div style="float: right; width: 35%; text-align: right;">
                        <button type="button" id="send_sms_button" class="btn btn-warning" data-toggle="button" style="width: 80%;">获取</button>
                    </div>
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
            <div class="row">
                <div class="col-xs-1"></div>
                <div class="col-xs-10">
                    <label>
                        <input type="checkbox" id="agreement"class="minimal-blue" checked/>
                    </label>
                    <span class="site_font" style="font-size: 12px;">本人意见悦读并同意  </span>
                    <span class="site_font" style="font-size: 12px; color: blue;">《服务协议》  </span>
                </div>
                <div class="col-xs-1"></div>
            </div>
        </section>
    </form>
    <div class="row text-center" style="margin-top: 6rem;">
    <div class="col-xs-1"></div>
        <div class="col-xs-10">
            <button type="button" id="signup_button" class="btn btn-warning btn-block btn-sm" style="height: 40px;">立即注册</button>
        </div>
        <div class="col-xs-1"></div>
    </div>
    <div class="page_footer text-center" style="border: none; font-size: 14px;">
        <div class="col-xs-1"></div>
        <div class="col-xs-10">
            <br>
            你注册了吗？ <a href="<%=request.getContextPath()%>/login">登录</a>
        </div>
        <div class="col-xs-1"></div>
    </div>

    <input type="hidden" id="response_message" value="${message}">
</div>
<script src="<%=request.getContextPath()%>/js/app.js"></script>
<script src="<%=request.getContextPath()%>/js/pages/radio_checkbox.js"></script>
<script src="<%=request.getContextPath()%>/vendors/sweetalert/js/sweetalert.min.js"></script>

<script>
    $(document).ready(function(){
        if($('#response_message').val() == 'phone exist')
            swal("警告", "手机号码已经存在，请输入另一个手机号码。", "warning");
        else if($('#response_message').val() == 'sms not exist')
            swal("警告", "验证码不存在。", "warning");
        else if($('#response_message').val() == 'sms expired')
            swal("警告", "验证码已过期。", "warning");

        $("#send_sms_button").click(function(){
            sendSMS($('#phone').val());
        });

        $("#signup_button").click(function(){
            signup();
        });
    });

    function sendSMS(phone) {
        if (phone.length == 0){
            swal("警告", "请输入手机号码。", "warning");
        }
        else{
            $.post("<%=request.getContextPath()%>/register/send-sms", {phoneNumber: phone},
                function (result) {
                    if (result.status) {
                        // Start downcounter
                        time();
                    } else if (result.message == 'phone exist') {
                        swal("警告", "手机号码已经存在，请输入另一个手机号码。", "warning");
                    }
                }
            );
        }
    }

    var wait=60;
    function time() {
        if (wait == 0) {
            $("#send_sms_button").removeAttr("disabled");
            $("#send_sms_button").html("获取");
            wait = 60;
        } else {
            $("#send_sms_button").attr("disabled", 'disabled');
            $("#send_sms_button").html(wait+"秒");
            wait--;
            setTimeout(function() {
                    time()
                },
                1000)
        }
    }

    function signup() {
        var username = $("#username").val();
        var phone = $("#phone").val();
        var passcode = $("#passcode").val();
        var password = $("#password").val();
        var agreement = $("#agreement").val();

        // Validate
        if(username.length < 1) {
            swal("警告", "请输入姓名", "warning");
            return;
        }
        if (phone.length < 1) {
            swal("警告", "请输入手机号码。", "warning");
            return;
        }
        if(passcode.length < 1){
            swal("警告", "请输入验证码", "warning");
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