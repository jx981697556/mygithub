<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-TAG/platForm.tld" prefix="PF"%>
<!--40 <span style="font-size: 14px; font-weight: bold;margin: 20px;"> 系统管理控制台2.0.0</span> -->
<div class="accordion"
	style="text-align: right; height: 100%; background-color: #fff;">
	<div style="background-color: #555555; height: 10px; width: 100%;"></div>
	<div
		style="float: left; color: #ffffff; font-size: 18px; padding-top: 0px; padding-left: 50px;">
		<img alt=""
			src="<PF:basePath/>WEB-FACE/img/web/logo.png"> 
	</div>
	<div style="padding: 4px; float: right;">
		<a id="editPW_a" href="javascript:void(0)" class="easyui-linkbutton"
			data-options="plain:true" iconCls="icon-login" title="修改密码"></a>
		<a id="logout_a" href="javascript:void(0)" class="easyui-linkbutton"
			style="margin-right: 8px" data-options="plain:true"
			iconCls="icon-sign-out" title="退出系统"></a>
	</div>
	<div id="DIV_EDIT_PASSWORD_WINDOW"></div>
</div>
<script type="text/javascript">
	$('#logout_a').bind('click', function() {
		$.messager.confirm('退出系统', '确定要注销此用户并退出系统吗？', function(r) {
			if (r) {
				window.location = "admin/ALONEFRAME_LOGOUT_COMMIT.do";
			}
		});
	});
	$('#editPW_a').bind(
			'click',
			function() {
				openWindow('#DIV_EDIT_PASSWORD_WINDOW', 200, 300, true,
						'admin/AloneUser_UpdataPassWord.do', '修改用户密码');

			});
	//-->
</script>