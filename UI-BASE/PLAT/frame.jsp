<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.core.config.AppConfig"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-TAG/platForm.tld" prefix="PF"%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<PF:basePath/>">
		<title><PF:sysTitle />
		</title>
		<link rel="icon" href="<PF:basePath/>favicon.ico" type="image/x-icon" />
		<link rel="shortcut icon" type="image/x-icon"
			href="<PF:basePath/>favicon.ico" />
		<link rel="apple-touch-icon" href="<PF:basePath/>favicon.ico" />
		<jsp:include page="/WEB-FACE/conf/include_all.jsp"></jsp:include>
	</head>
	<body class="easyui-layout">
		<div id="loadInitFrameIndex"
			style="vertical-align: middle; text-align: center; padding-top: 25px;height: 2000px;">
			<img style="margin-top: 50px;" alt="" src="WEB-FACE/img/temp/loadinglogo.png">
			<!-- <img align="middle" src="WEB-FACE/img/style/loading.gif" />
			<span style="font-size: 14px; color: #102947;">&nbsp;加载中...</span> -->
		</div>
		<div data-options="region:'north',border:false"
			style="height: 60px; border: 0px; padding: 0px; overflow: hidden;">
			<jsp:include page="head.jsp"></jsp:include>
		</div>
		<div data-options="region:'west',split:true,title:' '"
			style="width: 150px;">
			<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'north',split:false"
					style="height: 130px; padding: 4px;">
					<p>
						<b><c:forEach var="node" varStatus="index"
								items="${sessionScope.LOGINROLES}">
								<c:if test="${index.count!=1}">,</c:if>
						${node.name}
						</c:forEach> </b>
						<span style="color: green; font-weight: bold;">${sessionScope.USEROBJ.name}</span>属于
						<b>${sessionScope.USERORG.name}</b> (
						<span style="color: #666666;">本次登录在 <PF:FormatTime
								date="${sessionScope.LOGINTIME}"
								yyyyMMddHHmmss="yyyy年MM月dd日HH:mm" /> , 最近一次登录在 <PF:FormatTime
								date="${sessionScope.USEROBJ.logintime}"
								yyyyMMddHHmmss="yyyy年MM月dd日HH:mm" /> </span> )
					</p>
				</div>
				<div data-options="region:'center'"><jsp:include
						page="left.jsp"></jsp:include></div>
			</div>
		</div>
		<%
			if (AppConfig.getString("config.auth.check.url").toUpperCase()
					.equals("FALSE")) {
		%><div
			data-options="region:'east',collapsed:true,split:true,title:'服务'"
			style="width: 400px; padding: 10px; background-color: #fafafa;">
			<jsp:include page="server.jsp"></jsp:include>
		</div>
		<%
			}
		%>
		<div data-options="region:'south',border:false"
			style="height: 20px; background-color: #f3f3f3;">
			<jsp:include page="foot.jsp"></jsp:include>
		</div>
		<div data-options="region:'center'">
			<div class="easyui-tabs" id="frame_tabs" style="overflow: hidden;background-color: #f3f3f3;"
				data-options="fit:true,border:false,plain:true">
				<div title="首页" style="overflow: hidden;">
					<iframe scrolling="auto" frameborder="0"
						src="UI-BASE/PLAT/main.jsp" style="width: 100%; height: 100%;"></iframe>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
	$.parser.onComplete = function() {
		$('#loadInitFrameIndex').hide();
	};
	//-->
</script>
</html>