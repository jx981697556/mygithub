<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-TAG/platForm.tld" prefix="PF"%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<PF:basePath/>">
		<title><PF:sysTitle /></title>
		<link rel="icon" href="<PF:basePath/>favicon.ico" type="image/x-icon" />
		<link rel="shortcut icon" type="image/x-icon"
			href="<PF:basePath/>favicon.ico" />
		<link rel="apple-touch-icon" href="<PF:basePath/>favicon.ico" />
		<jsp:include page="/WEB-FACE/conf/include_all.jsp"></jsp:include>
		<!--  -->
	</head>
	<body style="padding: 0x" >
	<div id="tb" style="padding: 1px; height: auto">
	<div>
		Date From:
		<input class="easyui-datebox" style="width: 80px">
		To:
		<input class="easyui-datebox" style="width: 80px">
		Language:
		<select class="easyui-combobox" panelHeight="auto"
			style="width: 100px">
			<option value="java">
				Java
			</option>
			<option value="c">
				C
			</option>
			<option value="basic">
				Basic
			</option>
			<option value="perl">
				Perl
			</option>
			<option value="python">
				Python
			</option>
		</select>
		<a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>
	</div>
	<div style="margin-bottom: 5px">
		<a   onclick="$('#w').window('open')" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"></a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true"></a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove"
			plain="true"></a>
	</div>

</div>
<table id="dg1" class="easyui-datagrid" style="height: 250px"
	data-options="closable:true,pagination:true,singleSelect:true,rownumbers:true,fitColumns:true">
	<thead>
		<tr>
			<th field="inv" width="80">
				Inv No
			</th>
			<th field="date" width="100">
				Date
			</th>
			<th field="name" width="80">
				Name
			</th>
			<th field="amount" width="80" align="right">
				Amount
			</th>
			<th field="price" width="80" align="right">
				Price
			</th>
			<th field="cost" width="100" align="right">
				Cost
			</th>
			<th field="note" width="110">
				Note
			</th>
		</tr>
	</thead>
</table>
<script>
	function getData() {
		var rows = [];
		for ( var i = 1; i <= 20; i++) {
			var amount = Math.floor(Math.random() * 1000);
			var price = Math.floor(Math.random() * 1000);
			rows.push( {
				inv : '值' + i,
				date : $.fn.datebox.defaults.formatter(new Date()),
				name : '姓名 ' + i,
				amount : amount,
				price : price,
				cost : amount * price,
				note : '备注 ' + i
			});
		}
		return rows;
	}
	$(function() {
		$('#dg1').datagrid().datagrid('loadData', getData());
	});
</script>
<div id="w" class="easyui-window" title="主题信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:200px;padding:5px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'east',split:true" style="width:100px"></div>
		<div data-options="region:'center'" style="padding:10px;">
			<form id="ff" method="post">
	    	<table>
	    		<tr>
	    			<td>姓名:</td>
	    			<td><input class="easyui-validatebox" type="text" name="name" data-options="required:true"></input></td>
	    			<td>Email:</td>
	    			<td><input class="easyui-validatebox" type="text" name="email" data-options="required:true,validType:'email'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>主题:</td>
	    			<td><input class="easyui-validatebox" type="text" name="subject" data-options="required:true"></input></td>
	    			<td>消息:</td>
	    			<td><textarea name="message" style="height:60px;"></textarea></td>
	    		</tr>
	    		<tr>
	    			<td>语言:</td>
	    			<td>
	    				<select class="easyui-combobox" name="language"><option value="ar">Arabic</option><option value="bg">Bulgarian</option><option value="ca">Catalan</option><option value="zh-cht">Chinese Traditional</option><option value="cs">Czech</option><option value="da">Danish</option><option value="nl">Dutch</option><option value="en" selected="selected">English</option><option value="et">Estonian</option><option value="fi">Finnish</option><option value="fr">French</option><option value="de">German</option><option value="el">Greek</option><option value="ht">Haitian Creole</option><option value="he">Hebrew</option><option value="hi">Hindi</option><option value="mww">Hmong Daw</option><option value="hu">Hungarian</option><option value="id">Indonesian</option><option value="it">Italian</option><option value="ja">Japanese</option><option value="ko">Korean</option><option value="lv">Latvian</option><option value="lt">Lithuanian</option><option value="no">Norwegian</option><option value="fa">Persian</option><option value="pl">Polish</option><option value="pt">Portuguese</option><option value="ro">Romanian</option><option value="ru">Russian</option><option value="sk">Slovak</option><option value="sl">Slovenian</option><option value="es">Spanish</option><option value="sv">Swedish</option><option value="th">Thai</option><option value="tr">Turkish</option><option value="uk">Ukrainian</option><option value="vi">Vietnamese</option></select>
	    			</td>
	    			
	    		</tr>
	    	</table>
	    </form>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="javascript:alert('ok')">确定</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:alert('cancel')">取消</a>
		</div>
	</div>
</div>
	</body>
</html>