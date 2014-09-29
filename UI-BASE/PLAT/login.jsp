<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-TAG/platForm.tld" prefix="PF"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<PF:basePath/>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><PF:sysTitle />-登录页</title>
		<jsp:include page="/WEB-FACE/conf/include_all.jsp"></jsp:include>
		<script src="<PF:basePath/>/WEB-FACE/script/Md5.js"
			language="javascript" type="text/javascript"></script>
		<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: #d3d7d7;
}

.all {
	width: 100%;
	background: #d3d7d7;
}

.bg {
	background: url('WEB-FACE/img/temp/login.png') no-repeat;
	width: 395px;
	height: 368px;
	margin: 0 auto;
	padding-top: 368px;
	padding-left: 609px;
}
</style>
	</head>
	<body>
		<div class="all">
			<div class="bg">
				<div style="height: 100px;">
					<form target="_top" id="loginFormId" method="post"
						action="admin/ALONEFRAME_LOGIN_COMMIT.do">
						<table style="font-size: 12px;">
							<tr>
								<td>
									<div align="right">
										用户名：
									</div>
								</td>
								<td>
									<input class="validate[required] text-input" id="name"
										name="name" type="text" value="sysadmin" />
								</td>
							</tr>
							<tr>
								<td height="27">
									<div align="right">
										密码：
									</div>
								</td>
								<td>
									<input class="validate[required] text-input" id="passwordId"
										value="111111" name="password" type="password" />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span style="color: red;">${page.message}</span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<img id="id_loginButto" src="WEB-FACE/img/temp/land.png"
										style="border-width: 0px; cursor: pointer;" />
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div
					style="margin-left: -610px; margin-top: 80px; text-align: center;">
					macpaohui@126.com
				</div>
			</div>

		</div>
	</body>
	<script type="text/javascript">
	$(function() {
		$('#id_loginButto').bind('click', function() {
			var password = $('#passwordId').attr('value');
			var name = $('#name').attr('value');
			if (password != null && password != '') {
				$('#passwordId').attr('value', hex_md5(password));
			}
			$('#loginFormId').submit();
			$('#id_loginButto').hide();
		});
		$('#id_loginButto').bind('mouseover ', function() {
			$('#id_loginButto').attr('src', 'WEB-FACE/img/temp/land_on.png');
		});
		$('#id_loginButto').bind('mouseout ', function() {
			$('#id_loginButto').attr('src', 'WEB-FACE/img/temp/land.png');
		});
		$('#passwordId').keydown(function(e) {
			if (e.keyCode == 13) {
				$('#id_loginButto').click();
			}
		});
	})
</script>
</html>