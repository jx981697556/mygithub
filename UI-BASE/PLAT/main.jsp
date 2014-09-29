<%@ page language="java" pageEncoding="utf-8"%>
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
		<!--  -->
	</head>
	<body style="text-align: center;overflow: hidden;background-image: url('<PF:basePath/>WEB-FACE/img/web/head2.png')">
		<img style="margin-top: 50px;" alt="" src="<PF:basePath/>WEB-FACE/img/web/head1.png">
		<br/><h1 style="font-size: 12px;font-weight: bold;color: #0198DB;">E服务.北下关</h1>
	</body>
</html>