<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-TAG/platForm.tld" prefix="PF"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<PF:basePath/>">
		<title>安装-install-<PF:sysTitle />
		</title>
		<META HTTP-EQUIV="pragma" CONTENT="no-cache">
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-store, must-revalidate">
		<META HTTP-EQUIV="expires" CONTENT="0">
		<META http-equiv="content-type" content="text/html; charset=UTF-8">
		<jsp:include page="/WEB-FACE/conf/include_all.jsp"></jsp:include>
		<script
			src="<PF:basePath/>WEB-FACE/script/jquery.cookies.2.2.0.min.js"
			language="javascript" type="text/javascript"></script>
	</head>
	<body style="text-align: center;">
		<div style="text-align: center;padding-top: 200px;">
			<div class="frame_main_box"
				style="width: 800px; margin: auto; margin-top: 4px; padding: 4px; text-align: center;">
				<p style="font-size: 18px;color: red">---------------------
					您没有权限访问该页面---------------------
				</p>
				<div
					style="clear: left; border-top: 1px solid #CEE1EE; color: #686868; text-align: center; padding-top: 20px; padding-bottom: 50px;">
					macplus@126.com
				</div>
			</div>
		</div>
	</body>
</html>
