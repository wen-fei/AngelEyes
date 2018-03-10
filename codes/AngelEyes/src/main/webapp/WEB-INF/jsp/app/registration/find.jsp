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
    <script type="text/javascript">
        <!--
        window.onerror = function () {
            event.returnValue = true;
        }
        -->
    </script>
    <script src="../../../../style/js/app/find/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="../../../../style/js/app/find/jquery.nivo.slider.pack.js" type="text/javascript"></script>
    <script src="../../../../style/js/app/find/formValidator-4.0.1.js" type="text/javascript" charset="UTF-8"></script>
    <script src="../../../../style/js/app/find/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
    <script src="../../../../style/js/app/find/swfobject_source.js" type="text/javascript"></script>
    <script src="../../../../style/js/app/find/tipswindown.js" type="text/javascript"></script>
    <script src="../../../../style/js/app/find/tbhb.js" type="text/javascript"></script>
    <script src="../../../../style/js/app/find/popImg.js" type="text/javascript"></script>
    <script src="../../../../style/js/app/find/loadimg.js" type="text/javascript"></script>
    <script src="../../../../style/js/app/find/jquery.rollGallery_yeso.js" type="text/javascript"></script>
    <!-- 省市级联动js-->
    <script src="../../../../style/js/app/find/PCA2SClass.js" type="text/javascript"></script>
    <!--日期选择插件-->
    <script src="../../../../style/js/app/find/jquery.dooei.date.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $("#KinSlideshow").nivoSlider();
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#kefu_a").toggle(function () {
                $("#kf_img").attr("src", "/images/jian.jpg");
                $("#kefu_b").show();
            }, function () {
                $("#kf_img").attr("src", "/images/jia.jpg");
                $("#kefu_b").hide();
            })
        })
    </script>
    <style type="text/css">
        .cimg {
            line-height: 150px;
            height: 150px;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="nav-top">
    <div class="nav-top_bar">
        <div class="nav-top_bar1">
            <span style="padding-top:11px;display:block; width:260px;text-align:center; "><a
                    href="/down/app/AgeFace.rar" style="font-size:14px;color:#009933;">年龄人像APP下载</a></span>
            <span>|</span>
            <span style="padding-top:11px;color:#ff0000;font-size:16px;font-weight:bold;">注意：本站所有寻亲帮助均为免费，宝贝回家不会以任何理由收取费用，请勿上当受骗。</span>
        </div>
    </div>
</div>

<div class="header">
    <div class="header_logo"><a href="/" style="display:block; width:240px; height:87px">
        <!--<img src="image/baby_header_logo.jpg" style="width:240px; height:87px; border: none;" />--></a></div>
</div>
<div class="nav-main">
    <div class="nav-main_channel">
        <ul id="nav-main">
            <li><a href="/index.aspx">首页</a></li>
            <li><a href="/find.aspx">寻亲登记</a>
                <ul>
                    <li><a href="/find.aspx?type=1&amp;step=2">家寻宝贝</a></li>
                    <li><a href="/find.aspx?type=2&amp;step=2">宝贝寻家</a></li>
                    <li><a href="/find.aspx?type=3&amp;step=2">流浪乞讨</a></li>
                    <li><a href="/find.aspx?type=4&amp;step=2">其他寻人</a></li>
                    <li><a href="/find.aspx?type=5&amp;step=2">海外寻亲</a></li>
                </ul>
            </li>
            <li><a href="/volunteer_reg.aspx">志愿者登记</a></li>
            <li><a href="http://bbs.baobeihuijia.com/forum.php?mod=forumdisplay&amp;fid=182">社会新闻</a></li>
            <li><a href="/tv.aspx">相关视频</a></li>
            <li><a href="http://bbs.baobeihuijia.com/forum.php?mod=forumdisplay&amp;fid=203">紧急求助</a></li>
            <li><a href="http://bbs.baobeihuijia.com/">论坛</a></li>
        </ul>
        <script type="text/javascript">
            function menuFix() {
                var sfEls = document.getElementById("nav-main").getElementsByTagName("li");
                for (var i = 0; i < sfEls.length; i++) {
                    sfEls[i].onmouseover = function () {
                        this.className += (this.className.length > 0 ? " " : "") + "sfhover";
                    };
                    sfEls[i].onMouseDown = function () {
                        this.className += (this.className.length > 0 ? " " : "") + "sfhover";
                    };
                    sfEls[i].onMouseUp = function () {
                        this.className += (this.className.length > 0 ? " " : "") + "sfhover";
                    };
                    sfEls[i].onmouseout = function () {
                        this.className = this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
                    };
                }
            }

            window.onload = menuFix;
        </script>
    </div>
    <div class="nav-main_report">
        <div class="nav-main_report1">
            <span><a href=""><img src="../../../../style/imgs/app/find/baby_nav_main_report_lb.gif"
                                  style="width: 25px;height: 25px;border: none;" alt=""/></a></span>
        </div>
        <form action="/result.aspx" method="POST" name="form_nav" id="form_nav">
            <div class="nav-main_report3">
        <span>
            <input type="hidden" name="type" value="1">
            <input type="text" name='key' id="query" value=""/>
        </span>
            </div>
            <div class="nav-main_report4">
                <span>&nbsp;&nbsp;<input id="subn" value="      " type="submit" class="scorll_subn"
                                         style="cursor:pointer;"/></span>
                <span>&nbsp;<a href="/so.aspx"><img src="../../../../style/imgs/app/find/baby_nav_main_gjss.jpg" alt="" border="0"/></a> </span>
            </div>
        </form>
        <script src="../../../../style/js/app/find/jquery.autocomplete-min.js" type="text/javascript"></script>
        <script type="text/javascript">
            var options, a;
            jQuery(function () {
                options = {serviceUrl: 'look.aspx'};
                a = $('#query').autocomplete(options);
            });
        </script>
    </div>
</div>
<div class="page-space">&nbsp;</div>
<!--content-->
<div class="sctn21_1">

    <div class="sctn21_1_1">
        <div class="sctn21_1_1_1">
            <img src="../../../../style/imgs/app/find/icon.gif" width="51" height="43" align="top"/> 寻亲登记
        </div>
    </div>
    <div style="margin:0 auto; height:50px;"></div>
    <div class="main_cube1">&nbsp;</div>

    <div class="main_cube">
        <div class="main_step" style="position:relative;">
            <ul>
                <li id="select">1.选择登记类型</li>
                <li id="normal">2.填写信息登记</li>
                <li id="norma2">3.上传照片</li>
                <li id="norma3">4.完成登记</li>
            </ul>
        </div>

        <!--start选择登记类型-->
        <script type="text/javascript">    function register() { $("#registion").hide(); $("#pronouncement").show(); }</script>
        <div class="main_step_text" style="position:relative;" id="registion">
            <div id="login_9">
                <img src="../../../../style/imgs/app/find/d_login10.gif" width="220" height="40"/>
            </div>
            <div id="login_2">
                <ul>
                    <li>
                        <div><input name="" type="button" value="家寻宝贝"
                                    style="background:url(../../../../style/imgs/app/find/button2.gif);width:83px; height:32px; color:#FFF; font-size:15px; font-family:黑体; font-weight:bold; border:0px; margin:auto;cursor:pointer; _margin-top:20px; "
                                    onclick="register()"/> &nbsp;&nbsp;&nbsp;是指家长寻找失踪、被拐时16周岁以下的儿童，可在&quot;家寻宝贝&quot;版块进行寻亲登记。
                        </div>
                    </li>
                    <li>
                        <div><input name="" type="button" value="宝贝寻家"
                                    style="background:url(../../../../style/imgs/app/find/button2.gif); width:83px; height:32px; color:#FFF; font-size:15px; font-family:黑体; font-weight:bold; border:0px; margin:auto;cursor:pointer;_margin-top:20px;"
                                    onclick="register()"/> &nbsp;&nbsp;&nbsp;对于自幼被拐、走失及送养的孩子（16周岁以下儿童），可在&quot;宝贝寻家&quot;版块里进行寻亲登记。
                        </div>
                    </li>
                    <li>
                        <div>
                            <input name="" type="button" value="其他寻人"
                                   style="background:url(../../../../style/imgs/app/find/button2.gif); width:83px; height:32px; color:#FFF; font-size:15px; font-family:黑体; font-weight:bold; border:0px; margin:auto;cursor:pointer;_margin-top:20px;"
                                   onclick="register()"/> &nbsp;&nbsp;&nbsp;针对于寻找失踪时16周岁以上的寻亲人士。
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!--end填写表格-->
        <!--start登记说明-->
        <script type="text/javascript">    function agree() { $("#pronouncement").hide(); $("#regform").show(); }</script>
        <div class="main_step_text" style="position:relative;font-size: 14px;line-height: 28px; display: none;" id="pronouncement">
            <p>
            <center style="font-weight: bold;font-size: 16px;">寻亲登记说明</center>
            &nbsp;&nbsp;&nbsp;&nbsp;宝贝回家志愿者协会（以下简称本协会）是由关爱儿童的各界爱心人士自愿组成的民间志愿者组织，于2008年1月18日在民政部门正式注册，是具有独立法人资格的非营利性社会公益团体。 <br />
            &nbsp;&nbsp;&nbsp;&nbsp;《宝贝回家寻子网》，即www.baobeihuijia.com是隶属于宝贝回家志愿者协会的公益性寻人网站，为失踪儿童、家长提供免费的寻人帮助，帮助走失、被拐、被遗弃儿童寻找亲人，帮助因各种原因流浪、乞讨、卖艺的儿童回归家庭。本协会及网站已按照相关规定在信息产业部和公安部门完成了备案。本协会及网站的宗旨是：关爱儿童，共筑和谐。 <br />
            &nbsp;&nbsp;&nbsp;&nbsp;进行寻亲登记之前，请认真阅读以下内容及法律声明：当您的孩子失踪或被拐后，请马上拨打110报警。 <br />
            1、宝贝回家寻子网接受失踪或被拐时16周岁以下儿童的登记信息及流浪乞讨儿童的登记信息，超过16周岁或不属于失踪或被拐的儿童信息，需在家属同意并且相关资料完整的情况下在“其他寻人”区域进行登记。如果您所登记的信息超过16周岁资料信息不完整或不属于失踪被拐范围，请访问宝贝回家论坛的其它寻人版块http://bbs.baobeihuijia.com/forum-21-1.html，注册后将寻亲信息发布在其它寻人版块。<br />
            2、本协会为寻亲者提供免费的寻人帮助，请如实填写您在网站登记的资料。<br />
            3、请不要利用宝贝回家寻子网站发布虚假寻人信息或恶作剧信息，本协会将保留一切追究法律责任的权利。 <br />
            4、以下情况，请您与您的家人或孩子现在的抚养人协商后再决定是否进行登记操作：①离家出走；②被亲生父亲或母亲带走；③将亲生子女卖掉或送人；④父母离异，孩子判给另一方，想要回孩子的抚养权。 <br />
            5、由于网络的连通性及实时性的特殊，您在宝贝回家登记的信息通过审核后，将会被转载到全国各地的论坛，宝贝回家只能对本站及论坛的资料进行修改及删除，无法对被转载到其它论坛的资料进行修改及删除等操作。 <br />
            6、在您登记的信息审核通过以后，我们会将您的信息下发给工作组的志愿者进行跟进，跟进过程中，志愿者会与您联系确认登记内容；为了防止被骗，当有其它人与您联系说知道您孩子的情况时，请将通话内容及短信内容记录下来，与跟进志愿者或网站办公室进行沟确认通后，再看下一步如何进行；如果有人给您以彩信或电子邮件形式发送您孩子的照片，请将该照片转给跟进志愿者或者网站的邮箱，以辩认是否为合成图像。 <br />
            7、宝贝回家寻子网及宝贝回家志愿者协会志愿者所提供的寻人服务不会收取您任何费用，如果有任何人以宝贝回家名义向您索取财物，请直接报警或与宝贝回家办公室联系。 <br />
            8、如果您在寻亲信息中登记的联系方式发生变化，请您通知宝贝回家办公室。 <br />
            宝贝回家办公电话：0435-3338090（吉林通化）地址：吉林省通化市和平路685号邮编：134000 <br />
            宝贝回家志愿者协会电子邮箱：baobeihuijia@yeah.net 全国接待QQ群：1840533<br />
            </p>
            <p>
            <center style="font-weight: bold;font-size: 16px;">法律声明</center>
            &nbsp;&nbsp;&nbsp;&nbsp;宝贝回家志愿者协会（以下简称本协会）是由关爱儿童的各界爱心人士自愿组成的民间志愿者组织，于2008年1月18日在民政部门正式注册，是具有独立法人资格的非营利性社会公益团体。《宝贝回家寻子网》，即http://www.baobeihuijia.com是隶属于宝贝回家志愿者协会的公益性寻人网站，为失踪儿童、家长提供免费的寻人帮助，帮助走失、被拐、被遗弃儿童寻找亲人，帮助因各种原因流浪、乞讨、卖艺的儿童回归家庭。本协会及网站已按照相关规定在信息产业部和公安部门完成了备案。本协会及网站的宗旨是：关爱儿童，共筑和谐。<br />
            （一）立场原则 <br />
            1、 本协会及网站坚决拥护中国共产党的领导，维护祖国统一，自觉遵守《全国人大常委会关于维护互联网安全的决定》及中华人民共和国的各项法律法规，坚持爱国、守法、自律、真实、文明的原则，尊重网络道德。 <br />
            2、 本协会及网站坚决反对任何危害国家安全、民族团结，破坏国家宗教政策、社会稳定的活动和行为，禁止任何含有侮辱、诽谤、教唆、淫秽及攻击性内容的信息和作品。不组织、不提倡、不参与任何示威、游行、上访等活动。本协会及网站谢绝一切境外媒体的采访与合作。<br />
            （二）免责条款 <br />
            1、本协会及网站所提供的信息，只供参考之用，不应用于任何商业用途。不保证该等信息的准确性、有效性、及时性或完整性。本协会及网站一概毋须以任何方式就任何信息传递或传送的不准确或错误对用户或第三人负任何直接或间接的责任。用户应为使用本网站承担全部责任和风险。本协会及网站保留自行决定修改本网站中任何部分内容的权利。 <br />
            2、本协会及网站尊重他人的知识产权和合法权利，同时要求用户也给予尊重。本协会及网站发布的任何信息，如侵犯他人合法权利或违反相关法律法规，一经权利人提出异议，本网站在承担立即删除该信息的义务外，不再承担其他任何的法律责任。用户使用不当或未经授权发布信息，侵犯他人知识产权或其它合法权益，独立承担由此引起的一切后果和法律责任，与本协会及网站无关。用户在本网站上表述的任何意见均属于发表者个人意见，并不代表本协会及网站的意见。 <br />
            3、本网站可能会提供由第三方发起并维护之特定互联网站的链接。网站提供该等链接的目的仅在于向用户提供方便。本协会及网站对链接内容不作任何暗示和保证。第三方网站对本网站的链接，并不表示本协会及网站对第三方作出了某种认可、授权，或表明其属于本协会及网站的关联组织、合作组织或业务伙伴。在多数情况下，本网站并未意识到第三方已提供对本网站的链接，也不承担由此引起的任何责任。<br />
            （三）敬告用户 <br />
            1、本协会及网站享有以任何形式无偿使用、转载和引用用户向本协会或网站提交的启事和有关信息的权利，同时保留对用户发布信息管理、修改、删除的权利。<br />
            2、本协会及网站善意提醒信息发布者审慎管理个人信息，且勿轻信陌生人的电话，谨防上当受骗。用户在寻人启事中如若承诺了酬金，则由悬赏者自己承担，相关事宜由双方自行协商，用户通过使用本网站免费寻人服务平台所引起的一切纠纷与本协会及网站无关。　<br />
            3、本网站只是为志愿者与失踪儿童家长提供信息交流与共享的平台。本网站的信息均由本协会统一发布，未经本协会书面授权，任何人不得以“宝贝回家”名义组织活动、接受采访或发布信息，对于违反本声明的志愿者，本协会将取消其会员资格。对于违反本声明的用户，本协会及网站将立即终止对其所提供的所有服务。<br />
            4、本协会及网站保留在任何时间自行修改、增删本法律声明中任何内容的权利。用户每次登陆或使用本网站时均视为同意受当时有效的条款的制约。该法律声明的解释权归本协会及网站所有。 <br />
            5、本法律声明的制定、执行、解释及争议的解决适用中华人民共和国法律。请认真阅读以上信息并确认是否进行登记；如果确认登记，请点击“我要登记”，如果不登记，您可以直接关闭页面或点击返回。<br />
            </p>
            <div class="sctn21_1_3_2" style="width:700px; margin:0 auto; float:none">
                <input onclick="javascript:history.back();" type="button" value="我要返回" class="sctn21_1_3_1" />
                <input onclick="agree();" type="button" value="我要登记" class="sctn21_1_3_1" />
            </div>
        </div>
        <!--end填写表格-->
        <!--start填写表格-->
        <div class="main_step_text" style="position:relative; display: none;" id="regform">
            <div class="main_text_left_1">
                <form  method="POST" id="form1" name="form1" >
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="right"  width="30%"><span class="s1"><strong>　*&nbsp;</strong></span>失踪人姓名：</td>
                            <td><input type="text" class="text_a"  name="name" id="name" value="" maxlength="20"/> <span id="nameTip"  ></span></td>
                        </tr>
                        <tr>
                            <td align="right"><span class="s1"><strong>　*&nbsp;</strong></span>性别：</td>
                            <td>男<input type="radio" name="sex"  value="1" checked=checked /> 女<input type="radio" name="sex" value="0"  /></td>
                        </tr>
                        <tr>
                            <td align="right"><span class="s1"><strong>　*&nbsp;</strong></span>出生日期：</td>
                            <td>
                                <select name="yearbirth_day" id="yearbirth_day"></select>
                                <select name="monbirth_day" id="monbirth_day"></select>
                                <select name="daybirth_day" id="daybirth_day"></select>
                                <script  type="text/javascript"> InitDooeiDate("yearbirth_day", "monbirth_day", "daybirth_day");</script>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><span class="s1"><strong>　&nbsp;</strong></span>失踪时身高：</td>
                            <td><input type="text" class="text_a" name="lost_height" value="" id="lost_height"/>  厘米</td>
                        </tr>
                        <tr>
                            <td align="right"><span class="s1"><strong>　*&nbsp;</strong></span>失踪日期：</td>
                            <td><select name="yearlost_day" id="yearlost_day"></select>
                                <select name="monlost_day" id="monlost_day"></select>
                                <select name="daylost_day" id="daylost_day"></select>
                                <script  type="text/javascript"> InitDooeiDate("yearlost_day", "monlost_day", "daylost_day");</script>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><span class="s1"><strong>　*&nbsp;</strong></span>登记类型：</td>
                            <td>
                                <select name="loster_type" id="loster_type" >
                                    <option value ="0">宝贝寻家</option>
                                    <option value ="1">家寻宝贝</option>
                                    <option value="2">其他</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><span class="s1"><strong>　*&nbsp;</strong></span>选择要上传的照片文件：</td>
                            <td> <input type="file" name="fuPhoto" id="fuPhoto" class="text_a" FileType=".jpg|.gif|.png" /></td></tr>
                        </tr>
                        <tr>
                            <td colspan="2" id="blood"></td>
                        </tr>

                        <script type="text/javascript">
                            function add_blood() {
                                $("#blood").html("<table id='add_blood' width=\"100%\"><tr><td align=\"right\" width=\"33%\">父亲姓名：</td><td><input type=\"text\" value=\"\" class=\"text_a\" name=\"take_blood_fad\"/></td></tr><tr><td align=\"right\" width=\"33%\">母亲姓名：</td><td><input type=\"text\" value=\"\" class=\"text_a\" name=\"take_blood_mad\"/></td></tr><tr><td align=\"right\" width=\"33%\">其他人姓名：</td><td><input type=\"text\" value=\"\" class=\"text_a\" name=\"take_blood_name\"/></td></tr><tr><td align=\"right\" width=\"33%\"><span class=\"s1\"><strong>　*&nbsp;</strong></span>采血地点：</td><td><input type=\"text\" value=\"\" class=\"text_a\" name=\"blood_address\"/></td></tr><tr><td align=\"right\"><span class=\"s1\"><strong>　*&nbsp;</strong></span>采血时间：</td><td><select name=\"yearblood_time\" id=\"yearblood_time\"></select><select name=\"monblood_time\" id=\"monblood_time\"></select><select name=\"dayblood_time\" id=\"dayblood_time\"></select></td></tr><tr><td align=\"right\"><span class=\"s1\"><strong>　*&nbsp;</strong></span>DNA是否入全国打拐数据库：</td><td>是<input type=\"radio\"  name=\"blood_is_add\"   value=\"1\" /> 否<input type=\"radio\" name=\"blood_is_add\" checked=checked value=\"0\" /></td></tr></table>");
                                InitDooeiDate("yearblood_time", "monblood_time", "dayblood_time");
                            }
                            function clean_blood() { $("#add_blood").empty();}
                        </script>
                        <tr>
                            <td align="right"><span class="s1"><strong>　*&nbsp;</strong></span>是否报案：</td>
                            <td>是<input type="radio" name="is_report" value="1"  onclick="add_report();"/> 否<input type="radio" name="is_report" value="0"   onclick="clean_report();" checked='checked'/></td>

                        </tr>
                        <tr><td colspan="2" id="report"></td></tr>
                        <script type="text/javascript">
                            function add_report() {
                                $("#report").html("<table id='add_report' width=\"100%\"><tr><td align=\"right\" width=\"33%\"><span class=\"s1\"><strong>　*&nbsp;</strong></span>报案机关名称：</td><td><input type=\"text\" class=\"text_a\" name=\"report_name\" value=\"\"/></td></tr><tr><td align=\"right\"><span class=\"s1\"><strong>　*&nbsp;</strong></span>是否立案：</td><td>是<input type=\"radio\" name=\"report_is_add\" value=\"1\" /> 否<input type=\"radio\" name=\"report_is_add\" value=\"0\" checked=checked/></td></tr></table>");
                            }
                            function clean_report() {$("#add_report").empty();}
                        </script>
                        <tr>
                            <td align="right"><span class="s1"><strong>　*&nbsp;</strong></span>失踪人籍贯：</td>
                            <td><input type="text" class="text_a"  id="birth_address"  name="birth_address"
                                       value="" maxlength="200"/>  <span id="birth_addressTip"  ></span></td>
                        </tr>
                        <tr>
                            <td align="right">
                                <span class="s1"><strong>　*&nbsp;</strong></span>失踪地点：</td>
                            <td>
                                <select name="province1" id="province1"></select>
                                <select name="city1" id="city1"></select>
                                <span id="province1Tip"></span>
                            </td>
                        </tr>

                        <script type="text/javascript" defer> new PCAS("province1", "city1") ;</script>
                        <tr>
                            <td align="right"><span class="s1"><strong>　*&nbsp;</strong></span></td>
                            <td>
                                <input type="text" class="text_a" name="lost_address" id="lost_address"
                                       value="" maxlength="150"/>
                                <span id="lost_addressTip"></span></td>
                        </tr>
                        <tr>
                            <td align="right"  style="vertical-align: top;">
                                <span class="s1">
                                <strong>　*&nbsp;</strong>
                                </span>失踪人特征描述：</td>
                            <td>
                                <textarea rows="3" cols="30" name="lost_person_feature" id="lost_person_feature"></textarea>
                                <span id="lost_person_featureTip"></span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"  style="vertical-align: top;"><span class="s1">
                                <strong>　*&nbsp;</strong></span>失踪经过：
                            </td>
                            <td><textarea rows="3" cols="30" name="lost_intro" id="lost_intro"></textarea>  <span id="lost_introTip"></span></td>
                        </tr>
                        <tr>
                            <td align="right"  style="vertical-align: top;"><span class="s1">
                                <strong>&nbsp;</strong></span>家庭背景以及线索资料：</td>
                            <td>
                                <textarea rows="3" cols="30" name="family" id="family"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><span class="s1"><strong>　*&nbsp;</strong></span>有无唤起孩子记忆信息：</td>
                            <td>
                                是<input type="radio" name="is_memory"  value="1" onclick="add_ismemory();" />
                                否<input type="radio" name="is_memory" value="0" checked=checked  onclick="clean_ismemory();" />
                            </td>
                        </tr>
                        <tr><td colspan="2" id="ismemory"></td></tr>
                        <script type="text/javascript">
                            function add_ismemory() {
                                $("#ismemory").html("<table id='add_ismemory' width=\"100%\"><tr><td align=\"right\" width=\"33%\" style=\"vertical-align: top;\"><span class=\"s1\"><strong>&nbsp;</strong></span>信息内容描述：</td> <td><textarea rows=\"3\" cols=\"30\" name=\"memory\"></textarea></td></tr></table>");
                            }
                            function clean_ismemory() { $("#add_ismemory").empty(); }
                        </script>

                        <tr>
                            <td align="right"  style="vertical-align: top;"><span class="s1"><strong>&nbsp;</strong></span>其他资料：</td>
                            <td><textarea rows="3" cols="30" name="other_intro"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right"  style="vertical-align: top;"><span class="s1"><strong>　&nbsp;</strong></span>其他说明：</td>
                            <td><textarea rows="3" cols="30" name="explain" id="explain"></textarea></td>
                        </tr>
                        <tr>
                            <td  align="right"><h2>联系人信息</h2></td><td></td>
                        </tr>
                        <tr>
                            <td align="right"><span class="s1"><strong>　*&nbsp;</strong></span>联系人姓名：</td>
                            <td><input type="text" class="text_a" id="contact_name" name="contact_name"
                                       value="" maxlength="20"/> <span id="contact_nameTip"  ></span></td>
                        </tr>
                        <tr>
                            <td align="right">
                                <span class="s1"><strong>　*&nbsp;</strong></span>联系人与失踪人关系：</td>
                            <td>
                                <input type="text" class="text_a" id="contact_relation" name="contact_relation"
                                       value="" maxlength="20"/>
                                <span id="contact_relationTip"></span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <span class="s1"><strong>　*&nbsp;</strong></span>填写人与失踪人关系：</td>
                            <td>
                                <input type="text" class="text_a" id="write_relation" name="write_relation"
                                       value="" maxlength="20"/>
                                <span id="write_relationTip"  ></span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <span class="s1"><strong>　&nbsp;</strong></span>手机：</td>
                            <td>
                                <input type="text" class="text_a" id="moblie" name="moblie" value=""
                                       maxlength="50"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><span class="s1"><strong>　&nbsp;</strong></span>电话：</td>
                            <td>
                                <input type="text" class="text_a" name="tel" value="" maxlength="50"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><span class="s1"><strong>　&nbsp;</strong></span>邮箱：</td>
                            <td><input type="text" class="text_a" name="email" value="" maxlength="50"/></td>
                        </tr>
                        <tr>
                            <td align="right"><span class="s1"><strong>　&nbsp;</strong></span>QQ号：</td>
                            <td><input type="text" class="text_a" name="qq" value="" maxlength="15"/></td>
                        </tr>
                        <tr>
                            <td align="right"><span class="s1"><strong>　&nbsp;</strong></span>地址：</td>
                            <td><input type="text" class="text_a" name="address" value="" maxlength="200"/></td>
                        </tr>
                        <tr>
                            <td align="right"><span class="s1"><strong>　&nbsp;</strong></span>其他联系方式：</td>
                            <td><input type="text" class="text_a" name="other_contact" value=""
                                       maxlength="200"/></td>
                        </tr>
                    </table>
                    <div class="sctn21_1_3_2" style="width:700px; margin:0 auto; float:none">
                        <input style="float:none; margin:15px auto" onclick="return checkdate();" type="submit" value="下一步" class="sctn21_1_3_1" />
                    </div>
                </form>
            </div>

            <div id="background" class="background" style="display:none"></div>
            <div id="progressBar" class="progressBar" style="display:none">数据加载中，请稍等...</div>
            <script type="text/javascript">
                $(document).ready(function () {
                    $.formValidator.initConfig({
                        formID: "form1",
                        onError: function () {
                            alert("信息填写不完善，点击确定，定位到不完善位置");
                        },
                        onSuccess: function () {
                            showdiv();
                        }
                    });

                    $("#name").formValidator({

                        onShow: "请输入姓名",

                        onFocus: "请输入姓名,1~10个字符",

                        onCorrect: "通过"
                    }).regexValidator({

                        regExp: "notempty",

                        dataType: "enum",

                        onError: "<span style=\"color:#ff0000;\">姓名不能为空<\span>"

                    });
                    $("#birth_address").formValidator({
                        onShow: "请填写所在地",
                        onFocus: "请填写所在地",
                        onCorrect: "通过"
                    }).regexValidator({
                        regExp: "notempty",
                        dataType: "enum",
                        onError: "<span style=\"color:#ff0000;\">不通过<\span>"
                    });

                    $("#birth_address_1").formValidator({

                        onShow: "请填写详细地点",

                        onFocus: "请填写详细地点",

                        onCorrect: "通过"
                    }).regexValidator({

                        regExp: "notempty",

                        dataType: "enum",

                        onError: "<span style=\"color:#ff0000;\">不通过<\span>"

                    });
                    $("#lost_person_feature").formValidator({
                        onShow: "请填写特征描述",
                        onFocus: "请填写失踪人特征描述",
                        onCorrect: "通过"
                    }).regexValidator({
                        regExp: "notempty",
                        dataType: "enum",
                        onError: "<span style=\"color:#ff0000;\">不通过<\span>"
                    });
                    $("#lost_intro").formValidator({
                        onShow: "请填写失踪经过",
                        onFocus: "请填写失踪经过",
                        onCorrect: "通过"
                    }).regexValidator({
                        regExp: "notempty",
                        dataType: "enum",
                        onError: "<span style=\"color:#ff0000;\">不通过<\span>"
                    });
                    $("#lost_address").formValidator({
                        onShow: "请填写详细地址",
                        onFocus: "请填写详细地址",
                        onCorrect: "通过"
                    }).regexValidator({
                        regExp: "notempty",
                        dataType: "enum",
                        onError: "<span style=\"color:#ff0000;\">不通过<\span>"
                    });
                    $("#contact_name").formValidator({
                        onShow: "请填写联系人姓名",
                        onFocus: "请填写联系人姓名",
                        onCorrect: "通过"
                    }).regexValidator({
                        regExp: "notempty",
                        dataType: "enum",
                        onError: "<span style=\"color:#ff0000;\">不通过<\span>"
                    });
                    $("#contact_relation").formValidator({
                        onShow: "请填写",
                        onFocus: "请填写",
                        onCorrect: "通过"
                    }).regexValidator({
                        regExp: "notempty",
                        dataType: "enum",
                        onError: "<span style=\"color:#ff0000;\">不通过<\span>"
                    });
                    $("#write_relation").formValidator({
                        onShow: "请填写",
                        onFocus: "请填写",
                        onCorrect: "通过"
                    }).regexValidator({
                        regExp: "notempty",
                        dataType: "enum",
                        onError: "<span style=\"color:#ff0000;\">不通过<\span>"
                    });
                    $("#qq").formValidator({
                        onShow: "请填写QQ号",
                        onFocus: "请填写QQ号",
                        onCorrect: "通过"
                    }).regexValidator({
                        regExp: "qq",
                        dataType: "enum",
                        onError: "<span style=\"color:#ff0000;\">不通过<\span>"
                    });

                    $("#file_1").formValidator({
                        onShow: "支持doc,docx,jpeg,jpg,zip,rar",
                        onFocus: "支持doc,docx,jpeg,jpg,zip,rar",
                        empty: true,
                        onCorrect: "通过"
                    }).regexValidator({
                        regExp: "picture",
                        dataType: "enum",
                        onError: "支持doc,docx,jpeg,jpg,,zip,rar类型错误"
                    });
                    $("#file_2").formValidator({
                        onShow: "支持doc,docx,jpeg,jpg,zip,rar",
                        onFocus: "支持doc,docx,jpeg,jpg,zip,rar",
                        empty: true,
                        onCorrect: "通过"
                    }).regexValidator({
                        regExp: "picture",
                        dataType: "enum",
                        onError: "支持doc,docx,jpeg,jpg,,zip,rar类型错误"
                    });

                    $("#file_3").formValidator({
                        onShow: "支持doc,docx,jpeg,jpg,zip,rar",
                        onFocus: "支持doc,docx,jpeg,jpg,zip,rar",
                        empty: true,
                        onCorrect: "通过"
                    }).regexValidator({
                        regExp: "picture",
                        dataType: "enum",
                        onError: "支持doc,docx,jpeg,jpg,zip,rar类型错误"
                    });
                });
                function checkdate() {
                    var birth_year = $("#yearbirth_day").val();
                    if ($("#monbirth_day").val() < 10) {
                        var birth_mon = "0" + $("#monbirth_day").val();
                    } else {
                        var birth_mon = $("#monbirth_day").val();
                    }
                    if ($("#daybirth_day").val() < 10) {
                        var birth_days = "0" + $("#daybirth_day").val();
                    } else {
                        var birth_days = $("#daybirth_day").val();
                    }
                    var birth_day = birth_year + "-" + birth_mon + "-" + birth_days;
                    var lost_year = $("#yearlost_day").val();
                    if ($("#monlost_day").val() < 10) {
                        var lost_mon = "0" + $("#monlost_day").val();
                    } else {
                        var lost_mon = $("#monlost_day").val();
                    }
                    if ($("#daylost_day").val() < 10) {
                        var lost_days = "0" + $("#daylost_day").val();
                    } else {
                        var lost_days = $("#daylost_day").val();
                    }
                    var lost_day = lost_year + "-" + lost_mon + "-" + lost_days;

                    var date = new Date();
                    var years = date.getFullYear();
                    if ((date.getMonth() + 1) < 10) {
                        var month = "0" + (date.getMonth() + 1);
                    } else {
                        var month = date.getMonth() + 1;
                    }

                    if (date.getDate() < 10) {
                        var days = "0" + date.getDate();
                    } else {
                        var days = date.getDate();
                    }

                    var now = years + "-" + month + "-" + days;

                    if ($("#yearbirth_day").val()) {
                        if (lost_day > now) {
                            alert("失踪日期不能大于现在时间");
                            return false;
                        }
                    }
                    if ($("#yearbirth_day").val()) {
                        if (birth_day > now) {
                            alert("出生日期不能大于现在时间");
                            return false;
                        }
                    }

                    if ($("#yearbirth_day").val() && $("#yearlost_day").val()) {
                        if (lost_day < birth_day) {
                            alert("失踪日期不能小于出生日期");
                            return false;
                        }
                    }

                    if ($("#province").val() != 'undefined') {
                        if ($("#province").val() == "") {
                            if (1 == 3) {
                                alert("请选择发现地点");
                            } else {
                                alert("请选择所在地");
                            }

                            return false;
                        }
                    }
                    if ($("#province1").val() != 'undefined') {
                        if ($("#province1").val() == "") {
                            alert("请选择失踪地");
                            return false;
                        }
                    }
                }
                function showdiv() {
                    $("#background").show();
                    $("#progressBar").show();
                }
                function hiddendiv() {
                    $("#background").hide();
                    $("#progressBar").hide();
                }
                function checkday(year, id) {
                    var mon = $("#mon" + id).val();
                    var str = '';
                    if (mon % 2 != 0) {
                        for (i = 1; i <= 31; i++) {
                            str += '<option name="' + i + '">' + i + '</option>';
                        }
                    } else {
                        if (mon % 2 == 0 && mon != 2) {
                            for (i = 1; i <= 30; i++) {
                                str += '<option name="' + i + '">' + i + '</option>';
                            }
                        } else {
                            if (year % 400 == 0 || year % 4 == 0 && year % 100 != 0) {
                                for (i = 1; i <= 29; i++) {
                                    str += '<option name="' + i + '">' + i + '</option>';
                                }
                            } else {
                                for (i = 1; i <= 28; i++) {
                                    str += '<option name="' + i + '">' + i + '</option>';
                                }
                            }
                        }
                    }
                    $('#day' + id).html(str);
                }
                function checkmon(mon, id) {

                    var year = $("#year" + id).val();
                    var str = '';
                    if (mon % 2 != 0) {
                        for (i = 1; i <= 31; i++) {
                            str += '<option name="' + i + '">' + i + '</option>';
                        }
                    } else {
                        if (mon % 2 == 0 && mon != 2) {
                            for (i = 1; i <= 30; i++) {
                                str += '<option name="' + i + '">' + i + '</option>';
                            }
                        } else {
                            if (year % 400 == 0 || year % 4 == 0 && year % 100 != 0) {
                                for (i = 1; i <= 29; i++) {
                                    str += '<option name="' + i + '">' + i + '</option>';
                                }
                            } else {
                                for (i = 1; i <= 28; i++) {
                                    str += '<option name="' + i + '">' + i + '</option>';
                                }
                            }
                        }
                    }
                    $('#day' + id).html(str);
                }

            </script>
        </div>
        <!--end填写表格-->
        <!-- start上传结果 -->

        <div class="main_step_text" style="padding-bottom:200px; display: none;" id="registResult">
            <div class="login_su"><div class="zhucechenggong">确认提交结果！</div>
                <button class="btn btn-primary" id="submitBtn">提交</button>
            </div>
        </div>
        <!--end上传结果-->

    </div>
    <div style="margin:0 auto; height:50px;"></div>
</div>
<div class="sctn21_2"> &nbsp;</div>

<script>
    $(function(){
        $("#submitBtn").click(function(){
            query = {
                "loster_name": $("#name").val(),
                "loster_sex": $("input[name='sex']:radio:checked").val(),
                "loster_type": $("#loster_type").val(),
                "loster_birth_year": $("#yearbirth_day").val(),
                "loster_birth_month": $("#monbirth_day").val(),
                "loster_birth_day": $("#daybirth_day").val(),
                "loster_height": $("#lost_height").val(),
                "loster_year": $("#yearlost_day").val(),
                "loster_month": $("#monlost_day").val(),
                "loster_day": $("#daylost_day").val(),
                "loster_live": $("#birth_address").val,
                "loster_area_province": $("#province1").val,
                "loster_area_city": $("#city1").val,
                "loster_area_detail": $("#lost_address").val,
                "loster_character": $("#lost_person_feature").val,
                "loster_intro": $("#lost_intro").val,
                "loster_family": $("#family").val,
                "loster_family_name": $("#contact_name").val,
                "loster_family_phone": $("#moblie").val,

            }
            $.ajax({
                url:"${pageContext.request.contextPath}/app/loster/registor",
                type:'post',
                data: query,
                dataType:'json',
                cache:false,
                success:function(data,status){
                    if(status=="success"){

                        if(data=="1"){
                            alert("登记成功");
                            window.location.href = "http://localhost:8080/app/index";
                        }else if (data=="0"){
                            alert("登记失败");
                        }else if(data=="2"){
                            alert("用户尚未登录，请登录");
                            window.location.href = "http://localhost:8088/app/loster/registration";
                        }
                    }
                },
                error:function(xhr,textStatus,errorThrown){
                    alert("失败！");
                }
            });
        });
    });
</script>
</body>
</html>
