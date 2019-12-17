<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 发布帖子 </title>
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
</head>
<body>
<div class="wrapper main_page" style="background-color: white;">
    <section class="content" style="height: 45px; width: 100%; position: fixed; top: 0; left: 0; padding-top: 1rem;">
        <div class="row ">
            <div class="col-xs-3 text-left">
                <span style="font-family: PingFangSC; color: #8C8C8C;" onclick="goBack()">取消</span>
            </div>
            <div class="col-xs-6 text-center">
                <span style="font-family: PingFangSC; font-size: 16px;">发布帖子</span>
            </div>
            <div class="col-xs-3 text-right">
                <span id="send_button" style="font-family: PingFangSC; color: #8C8C8C;">下一步</span>
            </div>
        </div>
    </section>

    <section class="content" style="margin-top: 80px; padding-bottom: 1rem;">
        <div class="row">
            <div class="col-xs-4" style="padding-right: 5px;">
<%--                <button class="user_setting_button">--%>
                    <i class="fa fa-fw fa-plus-square" style="color: rgb(141, 142, 212); font-size: 19px;"></i>
                    <span style="font-size: 12px;">实力玩家互动</span>
<%--                </button>--%>
            </div>
            <div class="col-xs-4">
                <i class="fa fa-fw fa-calendar-o" style="color: rgb(212, 137, 180); font-size: 19px;"></i>
                <span style="font-size: 12px;">快速审核</span>
            </div>
            <div class="col-xs-4">
                <i class="fa fa-fw fa-lock" style="color: rgb(142, 199, 212); font-size: 19px;"></i>
                <span style="font-size: 12px;">隐私保护</span>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="row" style="padding-bottom: 2rem;">
            <div class="col-xs-12">
                <textarea class="form-control resize_vertical" id="message" name="message" placeholder="输入你的话题" rows="5"></textarea>
            </div>
        </div>
        <div class="row" id="image_view">
<%--            <div id="preview">--%>
<%--                <div class="col-xs-4">--%>
<%--                    <img src="img/image_selete.png" style="width: 100%; height: 90px;">--%>
<%--                </div>--%>
<%--            </div>--%>

            <div id="image_select" class="col-xs-4" style="padding-top: 10px; padding-bottom: 10px;">
                <input id="file-input" type="file" accept="image/*" style="width: 106px;height: 85px;position: absolute;opacity: 0;">
                <img src="/img/image_selete.png" style="width: 100%; height: 90px;">
            </div>
        </div>
    </section>


</div>
<script src="/js/app.js"></script>
<script src="<%=request.getContextPath()%>/vendors/sweetalert/js/sweetalert.min.js"></script>
<script>
    var arr_image_data = [];
    var cnt = 0;

    $(document).ready(function(){
        $("#send_button").click(function(){
            submit();
        });
    });

    function submit() {
        var message = $("#message").val();

        if(message.length < 1){
            swal("警告", "请输入话题内容。", "warning");
            return;
        }

        arr_image_data.push("");

        console.log(arr_image_data);

        $("#send_button").prop("disabled", true);

        $.ajax({
            type: "POST",
            url: "/add-post",
            dataType: "json",
            data: {
                'groupId': ${group_id},
                'message': message,
                'images': arr_image_data,
            },
            success: function (result) {
                if (result.status) {
                    swal("成功！", "", "success");
                    reset();
                } else {
                    swal("失败", "", "warning");
                }

                $("#send_button").prop("disabled", false);
            },
            error: function (e) {
                swal("错误", "上传数据时出错", "error");
                $("#send_button").prop("disabled", false);
            }
        });
    }

    function reset() {
        arr_image_data = [];

        $("#message").val("");
        for(var i = 1; i <= cnt ; i++) {
            $('#preview-'+ i).remove();
        }
        cnt = 0;
        $('#image_select').css('display', 'block');
    }

    function goBack() {
        window.location.href = "<%=request.getContextPath()%>/circle/${group_id}";
    }

    function previewImages() {

        var preview = document.querySelector('#image_view');

        if (this.files) {
            [].forEach.call(this.files, readAndPreview);
        }

        function readAndPreview(file) {
            // Make sure `file.name` matches our extensions criteria
            if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
                return alert(file.name + " is not an image");
            } // else...

            var reader = new FileReader();

            reader.addEventListener("load", function() {
                cnt++;

                var image = new Image();
                image.title  = file.name;
                image.src = this.result;
                image.style.height = "90px";
                image.style.width = "100%";
                image.style.objectFit = 'cover';
                var newDiv = document.createElement("div");
                newDiv.id="preview-" + cnt;
                newDiv.className = 'col-xs-4';
                newDiv.style.paddingTop = '10px';
                newDiv.style.paddingBottom = '10px';
                newDiv.appendChild(image);
                var currentDiv = document.querySelector('#image_select');
                preview.insertBefore(newDiv, currentDiv);

                arr_image_data.push(this.result);
            });

            reader.readAsDataURL(file);
            console.log(cnt);
            if (cnt > 8 ) {
                $('#image_select').css('display', 'none');
            }
        }
    }

    document.querySelector('#file-input').addEventListener("change", previewImages);

</script>
</body>
</html>