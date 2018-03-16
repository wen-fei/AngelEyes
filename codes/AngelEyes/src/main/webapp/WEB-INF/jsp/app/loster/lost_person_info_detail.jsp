<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入JSTL-->
<%@include file="../../../jsp/common/tag.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>登记信息</title>
    <link href="<%=request.getContextPath() %>/style/css/style.css" rel='stylesheet' type='text/css'/>
    <link href="<%=request.getContextPath() %>/style/css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <script src="<%=request.getContextPath() %>/style/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/style/js/bootstrap.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/style/imgs/fav-icon.png"/>

    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!----webfonts---->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!----//webfonts---->
    <!---start-click-drop-down-menu----->

    <!----start-dropdown--->
    <script type="text/javascript">
        var $ = jQuery.noConflict();
        $(function () {
            $('#activator').click(function () {
                $('#box').animate({'top': '0px'}, 500);
            });
            $('#boxclose').click(function () {
                $('#box').animate({'top': '-700px'}, 500);
            });
        });
        $(document).ready(function () {
            //Hide (Collapse) the toggle containers on load
            $(".toggle_container").hide();
            //Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
            $(".trigger").click(function () {
                $(this).toggleClass("active").next().slideToggle("slow");
                return false; //Prevent the browser jump to the link anchor
            });

        });
    </script>
    <!----//End-dropdown--->
    <style>
        #FormView1{
            margin-left: 100px;
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
    </style>
</head>
<body style="background: rgb(227, 229, 232);">
    <!---start-wrap---->
    <!---start-header---->
    <div class="header">
        <div class="wrap">
            <div class="logo col-md-2">
                <a href="#"><img src="<%=request.getContextPath() %>/style/imgs/angeleyes_logo.png" width="150" height="70" title="pinbal" /></a>
            </div>
            <%--导航菜单--%>
            <div class="col-md-2">
                <ul class="nav nav-pills " style="float: left; margin-top: 19px;" id="nav-menu">
                    <li class="dropdown all-camera-dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            网站导航
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li >  <a  href="/app/index">主页</a></li>
                            <li ><a  href="/app/module1/list">宝贝寻家</a></li>
                            <li >  <a  href="/app/module2/list">家寻宝贝</a></li>
                            <li ><a  href="/app/loster/registration">走失登记</a></li>
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
            <div id="userLogin" class="col-md-3">
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
    <!---//End-header---->
    <!---start-content---->
    <div class="content">
        <div class="wrap">
            <div class="contact-info">
                <div class="contact-grids">
                    <!-- 宝贝信息开始 -->
                    <table cellspacing="0" border="0" id="FormView1" style="border-collapse:collapse;">
                        <tr>
                            <td colspan="2">
                                <div id="table_1_normaldivl">
                                    <ul>
                                        <li>
                                            <div id="_table_1_photo">
                                                <img class="cimg" src="<%=request.getContextPath() %>/style/imgs/app/loster/${loster_info.lost_person_no}.jpg" style="border: 1px solid rgb(217, 217, 217); padding: 2px; width: 266px; height: 360px;"/>
                                            </div>
                                        </li>
                                        <li>
                                            <div id="font_red">
                                                （1）本网站及志愿者提供的寻亲服务均是免费。<br/>
                                                （2）如信息需修改、补充等情况，请直接通过本站在线咨询联系网站工作人员。<br/>
                                                （3）本网站不保证登记信息中酬金承诺的有效性，知情人如需要有偿提供线索，请自行与登记人联系确认。
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div id="table_1_normaldivr" class="reginfo">
                                    <div class="title"><img src="<%=request.getContextPath() %>/style/imgs/app/djxx.jpg" width="200" height="50" alt=""/></div>
                                    <ul>
                                        <li><span>寻亲类别：</span>${loster_info.lost_person_type}</li>
                                        <li><span>寻亲编号：</span>${loster_info.lost_person_no}</li>
                                        <li><span>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</span>${loster_info.lost_person_name}</li>
                                        <li><span>性&nbsp;&nbsp;&nbsp;&nbsp;别：</span>${loster_info.lost_person_sex}</li>
                                        <li><span>出生日期：</span>${loster_info.lost_person_birth}</li>
                                        <li><span>失踪时身高：</span>${loster_info.lost_person_height}</li>
                                        <li><span>失踪时间：</span>${loster_info.lost_person_time}</li>
                                        <li><span>失踪人所在地：</span>${loster_info.lost_person_live}</li>
                                        <li><span>失踪地点：</span>${loster_info.lost_person_area}</li>
                                        <li><span>寻亲者特征描述：</span>${loster_info.lost_person_character}</li>
                                        <li><span>其他资料：</span>${loster_info.lost_person_others}</li>
                                        <li><span>注册时间：</span>${loster_info.lost_person_registerTime}</li>
                                        <li><span>家属联系人：</span>${loster_info.lost_person_family_name}</li>
                                        <li><span>家属联系方式：</span>${loster_info.lost_person_family_phone}</li>
                                    </ul>
                                    <div class="clear"></div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>

            </div>
        </div>
    </div>
</body>
<script>
    $(function () {
        // 传给后台界面url，用于登陆后返回
        query = {
            "back_url": window.location.href
        },
            $.ajax({
                url: "${pageContext.request.contextPath}/app/login/back_url_session",
                type: 'post',
                data: query,
                success: function (data, status) {
                    if (data == "1") {
                        // alert("退出成功");
                        // window.location.reload();
                    } else if (data == "0") {
                        // alert("error");
                    }
                },
                error: function (xhr, textStatus, errorThrown) {
                    alert("error！");
                }
            });
    });
</script>
</html>

