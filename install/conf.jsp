<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.farm.core.config.PropertiesUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-TAG/platForm.tld" prefix="PF"%>
<%
	String ipStr = request.getRemoteHost().toString();
	if (!ipStr.equals("127.0.0.1") && !ipStr.equals("localhost")
			&& !ipStr.equals("0:0:0:0:0:0:0:1")) {
		response.sendRedirect("conf-Nopop.jsp");

	}
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	PropertiesUtils conf = new PropertiesUtils("config.properties");
	PropertiesUtils jdbc = new PropertiesUtils("jdbc.properties");
	Enumeration anames = request.getParameterNames();
	boolean isUp = false;
	while (anames.hasMoreElements()) {
		String name = anames.nextElement().toString();
		String value = (String) request.getParameter(name);
		if (name.startsWith("conf.")) {
			name = name.replaceFirst("conf.", "");
			conf.setData(name, value);
			isUp = true;
		}
		if (name.startsWith("jdbc.")) {
			name = name.replaceFirst("jdbc.", "");
			jdbc.setData(name, value);
			isUp = true;
		}
	}
	if (isUp) {
		response.sendRedirect("conf-success.jsp");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<PF:basePath/>">
		<title>安装-install-<PF:sysTitle /></title>
		<META HTTP-EQUIV="pragma" CONTENT="no-cache">
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-store, must-revalidate">
		<META HTTP-EQUIV="expires" CONTENT="0">
		<META http-equiv="content-type" content="text/html; charset=UTF-8">
		<jsp:include page="/WEB-FACE/conf/include_all.jsp"></jsp:include>
		<script
			src="<PF:basePath/>WEB-FACE/script/jquery.cookies.2.2.0.min.js"
			language="javascript" type="text/javascript"></script>
		<style>
<!--
.login_left_login_box input {
	width: 300px;
}
-->
</style>
	</head>

	<body style="text-align: center;">
		<div style="text-align: center;">
			<div class="frame_main_box"
				style="width: 800px; margin: auto; margin-top: 4px; padding: 4px; text-align: center;">
				<form action="install/conf.jsp" method="post">
					<div class="login_left_login_box">
						<table
							style="text-align: left; width: 600; margin: auto; line-height: 30px; font-size: 12px;">
							<tr>
								<td colspan="2"
									style="font-weight: bold; text-align: center; font-size: 16px;">
									安装向导
									<br />
									<span style="font-size: 12px; font-weight: lighter;">系统参数设置（环境要求：jdk1.5或以上、tomcat5.5或以上、mysql5.0或以上）</span>
								</td>
							</tr>
							<tr style="border-bottom: 1px dotted black;">
								<td colspan="2" style="text-align: center;">
									<span style="color: green; font-weight: bold;">服务配置</span>
								</td>
							</tr>
							<tr>
								<td style="text-align: right;">
									系统显示名称:
								</td>
								<td>
									<input type="text" name="conf.config.sys.title"
										value="<%=conf.getData("config.sys.title")%>">
								</td>
							</tr>
							<tr>
								<td style="text-align: right;">
									系统显示公司名称:
								</td>
								<td>
									<input type="text" name="conf.config.company.title"
										value="<%=conf.getData("config.company.title")%>">
								</td>
							</tr>
							<tr>
								<td style="text-align: right;">
									关闭测试模式:
								</td>
								<td>
									<input type="text" name="conf.config.auth.check.url"
										value="<%=conf.getData("config.auth.check.url")%>">
								</td>
							</tr>
							<tr>
								<td style="text-align: right;">
									允许同用户重复登录:
								</td>
								<td>
									<input type="text" name="conf.config.auth.multi.user"
										value="<%=conf.getData("config.auth.multi.user")%>">
								</td>
							</tr>
							<tr style="border-bottom: 1px dotted black;">
								<td colspan="2" style="text-align: center;">
									<span style="color: green; font-weight: bold;">数据库配置</span>
									<span>请 <a target="_blank"
										href="install/console_1.1.0-stable.rar">下载</a>并安装数据库</span>
								</td>
							</tr>
							<tr>
								<td style="text-align: right;">
									数据库地址:
								</td>
								<td>
									<input type="text" name="jdbc.jdbc.url"
										value="<%=jdbc.getData("jdbc.url")%>">
								</td>
							</tr>
							<tr>
								<td style="text-align: right;">
									数据库用户名：
								</td>
								<td>
									<input type="text" name="jdbc.jdbc.username"
										value="<%=jdbc.getData("jdbc.username")%>">
								</td>
							</tr>
							<tr>
								<td style="text-align: right;">
									数据库用户密码:
								</td>
								<td>
									<input type="text" name="jdbc.jdbc.password"
										value="<%=jdbc.getData("jdbc.password")%>">
								</td>
							</tr>
						</table>
					</div>
					<div>
						<input type="submit" style="padding: 5px;" value="下一步">
					</div>
				</form>
				<div
					style="clear: left; border-top: 1px solid #CEE1EE; color: #686868; text-align: center; padding-top: 20px; padding-bottom: 50px;">
					macplus@126.com
				</div>
			</div>
		</div>
	</body>
</html>
