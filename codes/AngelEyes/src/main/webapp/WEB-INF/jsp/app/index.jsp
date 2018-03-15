<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入JSTL-->
<%@include file="../../jsp/common/tag.jsp" %>

<html lang="en">
	<head>
		<title>天使之眼</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="<%=request.getContextPath() %>/style/css/style.css" rel='stylesheet' type='text/css' />
		<link href="<%=request.getContextPath() %>/style/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/style/css/main.css">
		<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
		<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/style/imgs/fav-icon.png" />
		<script type="application/x-javascript">
			addEventListener("load", function() {
			    setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); }
		</script>
		<!---start-click-drop-down-menu----->
		<script src="<%=request.getContextPath() %>/style/js/jquery.min.js"></script>
        <!----start-dropdown--->
         <script type="text/javascript">
			var $ = jQuery.noConflict();
				$(function() {
					$('#activator').click(function(){
						$('#box').animate({'top':'0px'},500);
					});
					$('#boxclose').click(function(){
					$('#box').animate({'top':'-700px'},500);
					});
				});
				$(document).ready(function(){
				//Hide (Collapse) the toggle containers on load
				$(".toggle_container").hide(); 
				//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
				$(".trigger").click(function(){
					$(this).toggleClass("active").next().slideToggle("slow");
						return false; //Prevent the browser jump to the link anchor
				});
									
			});
		</script>
        <!----//End-dropdown--->
		<!---//End-click-drop-down-menu----->
		<style>
			.rateit p{
				font-size: 0.875em;
				color: #B7B5B5;
				margin: 0.6em 0;
				line-height: 1.5em;
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
			body{
				background-color: none;
			}
			#menu{
				margin-top:7px;
			}
		</style>
	</head>
	<body>
		<!---start-wrap---->
			<!---start-header---->
			<div class="header">
				<div class="wrap">
					<div class="logo">
						<a href="#"><img src="<%=request.getContextPath() %>/style/imgs/angeleyes_logo.png" width="150" height="70" title="pinbal" /></a>
					</div>
					<%--<div class="nav-icon">--%>
						 <%--<a href="#" class="right_bt" id="activator"><span> </span> </a>--%>
					<%--</div>--%>
					<%--<div class="box" id="box">--%>
						 <%--<div class="box_content">--%>
							<%--<div class="box_content_center">--%>
								<%--<div class="form_content">--%>
									<%--<div class="menu_box_list">--%>
										<%--<ul>--%>
											<%--<li><a href="/app/module1/list"><span>宝贝寻家</span></a></li>--%>
											<%--<li><a href="/app/module2/list"><span>家寻宝贝</span></a></li>--%>
											<%--<li><a href="/app/loster/registration"><span>走失登记</span></a></li>--%>
											<%--<li><a href="/app/contact"><span>关于我们</span></a></li>--%>
											<%--<div class="clear"> </div>--%>
										<%--</ul>--%>
									<%--</div>--%>
									<%--<a class="boxclose" id="boxclose">--%>
										<%--<span>--%>
										<%--</span>--%>
									<%--</a>--%>
								<%--</div>--%>
							<%--</div>--%>
						<%--</div>--%>
					<%--</div>--%>
					<ul class="nav nav-pills btn-info" style="float: left;" id="nav-menu">
						<li class="dropdown all-camera-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">
								菜单
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li data-filter-camera-type="all"><a data-toggle="tab" href="#">主页</a></li>
								<li data-filter-camera-type="Alpha"><a data-toggle="tab" href="#">宝贝寻家</a></li>
								<li data-filter-camera-type="Zed"><a data-toggle="tab" href="#">家寻宝贝</a></li>
								<li data-filter-camera-type="Bravo"><a data-toggle="tab" href="#">走失登记</a></li>

							</ul>
						</li>
					</ul>
					<div class="top-searchbar">
						<form>
							<input type="text" /><input type="submit" value="" />
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
										<input type="text" hidden id="user_id" value="${sessionScope.UserInfo_session.user_id}">
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
		</div>
		<!---//End-header---->
		<!---start-content---->
		<div class="content">
			<div class="wrap">
			 <div id="main" role="main">
			      <ul id="tiles">
                      <c:forEach items="${lost_person_info}" var="lost_info">
						  <li onClick="location.href='/app/loster/person_id/${lost_info.lost_person_id}';">
							<img src="<%=request.getContextPath() %>/style/imgs/app/loster/${lost_info.lost_person_no}.jpg" style="border: 1px solid rgb(217, 217, 217);padding: 2px;width: 270px;height: 311.657px;">
							<div class="post-info">
								<div class="post-basic-info">
									<h3><a href="#">走失人姓名：${lost_info.lost_person_name}</a></h3>
									<p>出生日期：${lost_info.lost_person_birth}</p>
									<p>走失时身高：${lost_info.lost_person_height}</p>
									<p>特征：${lost_info.lost_person_character}</p>
								</div>
								<div class="post-info-rate-share">
									<div class="rateit">
										<p>家属姓名：${lost_info.lost_person_family_name}</p>
										<p>家属联系方式：${lost_info.lost_person_family_phone} </p>
									</div>
									<%--<div class="post-share"></div>--%>
									<div class="clear"> </div>
								</div>
							</div>
						</li>
					  </c:forEach>
			        <!-- End of grid blocks -->
			      </ul>
			    </div>
			</div>
		</div>
		<!---//End-content---->
		<!----wookmark-scripts---->
		  <script src="<%=request.getContextPath() %>/style/js/jquery.imagesloaded.js"></script>
		  <script src="<%=request.getContextPath() %>/style/js/jquery.wookmark.js"></script>
		  <script type="text/javascript">
		    (function ($){
		      var $tiles = $('#tiles'),
		          $handler = $('li', $tiles),
		          $main = $('#main'),
		          $window = $(window),
		          $document = $(document),
		          options = {
		            autoResize: true, // This will auto-update the layout when the browser window is resized.
		            container: $main, // Optional, used for some extra CSS styling
		            offset: 20, // Optional, the distance between grid items
		            itemWidth:280 // Optional, the width of a grid item
		          };
		      /**
		       * Reinitializes the wookmark handler after all images have loaded
		       */
		      function applyLayout() {
		        $tiles.imagesLoaded(function() {
		          // Destroy the old handler
		          if ($handler.wookmarkInstance) {
		            $handler.wookmarkInstance.clear();
		          }
		
		          // Create a new layout handler.
		          $handler = $('li', $tiles);
		          $handler.wookmark(options);
		        });
		      }
		      /**
		       * When scrolled all the way to the bottom, add more tiles
		       */
		      function onScroll() {
		        // Check if we're within 100 pixels of the bottom edge of the broser window.
		        var winHeight = window.innerHeight ? window.innerHeight : $window.height(), // iphone fix
		            closeToBottom = ($window.scrollTop() + winHeight > $document.height() - 100);
		
		        if (closeToBottom) {
		          // Get the first then items from the grid, clone them, and add them to the bottom of the grid
		          var $items = $('li', $tiles),
		              $firstTen = $items.slice(0, 10);
		          $tiles.append($firstTen.clone());
		
		          applyLayout();
		        }
		      };
		
		      // Call the layout function for the first time
		      applyLayout();
		
		      // Capture scroll event.
		      $window.bind('scroll.wookmark', onScroll);
		    })(jQuery);
		  </script>
		<!---//End-wrap---->
	</body>
	<script src="<%=request.getContextPath() %>/style/js/bootstrap.js"></script>

</html>

