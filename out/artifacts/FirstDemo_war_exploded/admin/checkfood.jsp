<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>修改美食</title>
		<meta name="description" content="Restyling jQuery UI Widgets and Elements" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/select2.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace.min.css" id="main-ace-style" />
		<link rel="stylesheet" href="<%=path%>/uEditor/themes/default/css/ueditor.css">
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-part2.min.css" />
		<![endif]-->
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="<%=basePath%>/admin/assets/js/ace-extra.min.js"></script>
		<!--[if lte IE 8]>
		<script src="<%=basePath%>/admin/assets/js/html5shiv.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
			<%@ include file="navbar.jsp" %>
		<!-- /section:basics/navbar.layout -->
		
		<div class="main-container" id="main-container">

			<!-- #section:basics/sidebar -->
				<%@ include file="sidebar.jsp" %>
			<!-- /section:basics/sidebar -->
			
			<div class="main-content">
				<!-- #section:basics/content.breadcrumbs -->
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="index.jsp">首页</a>
						</li>
						<li>
							<a href="javascript:void(0)">美食管理</a>
						</li>
						<li>
							<a href="form-wizard.html">修改美食</a>
						</li>
					</ul><!-- /.breadcrumb -->

				</div>

				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
					<!-- /section:settings.box -->
					<div class="page-content-area">
						<div class="row">
							<div class="col-xs-12">
							<div>
								<form action="${pageContext.request.contextPath}/admin/updateFood" class="form-inline" method="post" enctype="multipart/form-data">
								<div class="row">
									<input id="foodId" name="foodId" value="${food.foodId}" style="display: none">
									<span class="col-md-6" style="margin: 5px 0">
										<label for="foodName">美食名称：</label><input id="foodName" type="text" name="foodName" style="width: 300px;" value="${food.foodName}" readonly/>
									</span>
									<span class="col-md-6" style="margin: 5px 0">
										<label for="foodAddress">美食位置：</label><input id="foodAddress" type="text" name="foodAddress" style="width: 400px;" value="${food.foodAddress}" readonly>
									</span>
									<span class="col-md-6" style="margin: 5px 0">
										<label for="foodPrice">美食价格：</label><input id="foodPrice" type="text" name="foodPrice" style="width: 300px" value="${food.foodPrice}" readonly>
									</span>
									<span class="col-md-6" style="margin: 5px 0">
										<span><label>美食类型：</label></span>
										<label ><input type="radio" value="1" name="types" style="vertical-align: text-bottom;margin-bottom: 2px;" ${(1 eq food.types)?"checked":""} readonly> 特色菜 </label>
										<label><input type="radio" value="2" name="types" style="vertical-align: text-bottom;margin-bottom: 2px;" ${(2 eq food.types)?"checked":""} readonly> 风味小吃 </label>
									</span>
									<span class="col-md-12" style="margin: 5px 0">
										<label for="multipartFile">更换图片：</label>
										<img src="<%=basePath%>/${food.foodImage}" alt="${food.foodName}图片" style="width: 200px;height: 100px">
										<input id="multipartFile" name="multipartFile" type="file" style="display: inline" readonly/>
									</span>
								</div>
								<label for="myEditor" style="margin: 5px 0">美食文章：</label>
								<textarea id="myEditor" style="padding-top: 2px;padding-bottom:5px;width: 1030px;height: 200px" name="foodContent" readonly>${food.foodContent}</textarea>
								<%--超级管理员审核--%>
								<c:if test="${food.state == 0 && user.status == 3}">
									<label class="col-md-4"></label>
									<label class="col-md-3"><a class="btn btn-success" style="text-align: center;" onclick="Check(2)">通过</a></label>
									<label class="col-md-3"><a class="btn btn-danger" style="text-align: center;" onclick="Check(1)">不通过</a></label>
								</c:if>
								</form>
							</div><!-- /.widget-main -->
						</div><!-- /.row -->
					</div><!-- /.page-content-area -->
				</div><!-- /.page-content -->
			</div><!-- /.main-content -->


			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=basePath%>/admin/assets/js/jquery.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='<%=basePath%>/admin/assets/js/jquery1x.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<%=basePath%>/admin/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="<%=basePath%>/admin/assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="<%=basePath%>/admin/assets/js/fuelux/fuelux.wizard.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/jquery.validate.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/additional-methods.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/bootbox.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/jquery.maskedinput.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/select2.min.js"></script>

		<!-- ace scripts -->
		<script src="<%=basePath%>/admin/assets/js/ace-elements.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/ace.min.js"></script>
		<!-- 配置文件 -->
		<script type="text/javascript" charset="utf-8" src="<%=path%>/uEditor/ueditor.config.js"></script>
		<!-- 编辑器源码文件 -->
		<script type="text/javascript" charset="utf-8" src="<%=path%>/uEditor/ueditor.all.js"></script>
		<script type="text/javascript"  charset="utf-8" src="<%=path%>/uEditor/lang/zh-cn/zh-cn.js"></script>
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		$(function(){
			if(window.history.replaceState){
				window.history.replaceState(null, null, "<%=basePath%>/admin/addscenery.jsp")
			}
		})
		</script>
		<script>
			var ue = UE.getEditor("myEditor");
			ue.ready(function (){
				console.log(ue.getContentTxt());
			});

			function Check(state){
				if(state === 1){
					bootbox.prompt({
						title:"请填写不过申原因：",
						inputType:"textarea",
						buttons:{
							confirm:{
								label:"提交",
								className:"btn btn-primary",
							},
							cancel:{
								label: "取消",
								className: "btn",
							}
						},
						callback:function (result) {
							let data = {"foodId":${food.foodId},"state":state,"checkMsg":result};
							console.log(result);
							if (result){
								$.ajax({
									dataType: "json",
									url:"${pageContext.request.contextPath}/admin/checkFood",
									data:data,
									method: "post",
									success:function (msg) {
										console.log(msg);
										if(msg === true){
											alert("审核完成");
											window.location.href = "${pageContext.request.contextPath}/admin/foodList";
										}else {
											Qmsg.info("审核失败");
										}
									}
								})
							}
						}
					})
				}
				if(state === 2){
					let data = {"foodId":${food.foodId},"state":state,"checkMsg":null};
					$.ajax({
						dataType:"json",
						url:"${pageContext.request.contextPath}/admin/checkFood",
						data:data,
						method:"post",
						success:function (msg) {
							console.log(msg);
							if(msg === true){
								alert("审核完成");
								window.location.href = "${pageContext.request.contextPath}/admin/foodList";
							}else {
								Qmsg.info("审核失败");
							}
						}
					})
				}
			}
		</script>
	</body>
</html>
