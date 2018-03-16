<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入JSTL-->
<%@include file="../../../jsp/common/tag.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>
    寻亲登记 - 宝贝回家寻子网 关爱儿童我们共同的责任
    </title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
    <meta http-equiv="X-UA-Compatible" content="IE=7"/>
    <link href="../../../../style/css/app/find/style.css" rel="stylesheet" type="text/css"/>
    <link href="../../../../style/css/app/find/global.css" rel="stylesheet" type="text/css"/>
    <link href="../../../../style/css/app/find/nivoslider.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath() %>/style/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="<%=request.getContextPath() %>/style/css/fileinput.min.css" rel='stylesheet' type='text/css' />
    <script src="../../../../style/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/style/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath() %>/style/js/fileinput.min.js"></script>
    <script src="<%=request.getContextPath() %>/style/js/zh.js"></script>
    <style type="text/css">
        .cimg {
            line-height: 150px;
            height: 150px;
            vertical-align: middle;
        }
        .Hui-userbar > li{
            margin-right:20px;
            float: right;
        }
        .Hui-userbar{
            float: right;
        }
        #userLogin{
            float: right;
        }
        .wrap{
            font-size: 14px;
        }
        #login_2 input{
            line-height: normal;
        }
        #menu_li{
            margin-top: -20px;
        }
    </style>
</head>
<body>

<div class="header" style="height: 100px;">
    <div class="wrap" style="margin: 0 auto">
        <div class="logo col-md-2">
            <a href="#"><img src="<%=request.getContextPath() %>/style/imgs/angeleyes_logo.png" width="150" height="70" title="pinbal" /></a>
        </div>
        <%--导航菜单--%>
        <div class="col-md-2">
            <ul class="nav nav-pills" style="float: left; margin-top: 19px;" id="nav-menu">
                <li class="dropdown all-camera-dropdown">
                    <a class="dropdown-toggle btn-default" data-toggle="dropdown">
                        网站导航
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a  href="/app/index">主页</a></li>
                        <li><a  href="/app/module1/list">宝贝寻家</a></li>
                        <li><a  href="/app/module2/list">家寻宝贝</a></li>
                        <li><a  href="/app/loster/registration">走失登记</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <%--搜索框--%>
        <div class="col-md-4" style="margin-top: 20px">
            <form action="/app/search" id="searchForm">
                <div class="input-group" style="margin-top:0px; positon:relative" id="search">

                    <input type="text" class="form-control" placeholder="请输入搜索内容" name="searchKey">
                    <span class="input-group-btn">
                           <button class="btn btn-info btn-search" type="submit">搜索</button>
                        </span>

                </div>
            </form>
        </div>
        <!--顶部右侧账户-->
        <div id="userLogin" class="col-md-4">
            <ul class="Hui-userbar" style="margin-top: 20px;">
                <c:if test="${sessionScope.UserInfo_session == '用户退出成功' || empty sessionScope.UserInfo_session}">
                    <li>
                        <a  href="/app/login/registview" class="btn btn-success">
                            <span class="glyphicon glyphicon-user"></span> 注册
                        </a>
                    </li>
                    <li>
                        <a  href="/app/login/loginview" class="btn btn-primary">
                            <span class="glyphicon glyphicon-log-in"></span> 登录
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.UserInfo_session != null}">
                    <li>
                        <span>欢迎会员：</span>
                        <input type="text" hidden id="user_id" value="${sessionScope.UserInfo_session.user_id}" />
                        <a class="btn btn-info" href="/app/user/user_info${sessionScope.UserInfo_session.user_id}/info" title="点击修改个人资料">
                            <span class="glyphicon glyphicon-user"></span> ${sessionScope.UserInfo_session.user_name}
                        </a>
                        <button id="logout" class="btn btn-danger">退出</button>
                    </li>
                </c:if>
            </ul>
        </div>
        <div class="clear"> </div>
    </div>
</div>
<div class="page-space">&nbsp;</div>
<!--content-->
<div class="sctn21_1">
    <div class="sctn21_1_1">
        <div class="sctn21_1_1_1">
            <img src="../../../../style/imgs/app/find/icon.gif" width="51" height="43" align="top"/> 上传图片
        </div>

        <form  method="post" id="uploadimg" class="main_step_text">
            选择文件:<input type="file" name="file" id="file" class=""  />
            <div>
                <p style="color: red; font-size: 15px;">郑重提示：为了更好的让别人辨识走失人员， 请上传走失人员质量比较高，能辨认正脸的一张照片！</p>
                <p style="color: red; font-size: 15px;">图片格式限定为：png,jpg,jpeg,  大小不要超过2M</p>
            </div>

            <button class="btn btn-danger" id="submitBtn"> 确认上传图片</button>
        </form>
    </div>
</div>
<div class="sctn21_2"> &nbsp;</div>
</body>
<script>
    $(function(){
        $("#submitBtn").click(function(){
            var form = new FormData($("#test")[0]);
            alert(form);
            $.ajax({
                url: "${pageContext.request.contextPath}/app/loster/upload",
                type: 'post',
                data: form,
                cache: false,
                dataType: 'JSON',
                processData: false,
                contentType: false,
                success: function (data, status) {
                    if (data === "1") {
                        // alert("上传成功");
                        // window.location.reload();
                    } else if (data === "0") {
                        // alert("上传失败");
                    }
                },
                error: function (xhr, textStatus, errorThrown) {
                    // alert("error！");
                }
            });
        });
    });
</script>
<
<script >
    function initFileInput(ctrlName) {
        var control = $('#' + ctrlName);
        control.fileinput({
            language: 'zh', //设置语言
            showUpload: false, //是否显示上传按钮
            showRemove: true,
            dropZoneEnabled: true,
            showCaption: true,//是否显示标题
            allowedPreviewTypes: ['image'],
            allowedFileTypes: ['image'],
            allowedFileExtensions:  ['jpg', 'png', 'jpeg'],
            maxFileSize : 2000,
            maxFileCount: 1

        })
    }

    $(function () {
        initFileInput("file");
    })
</script>
</html>
