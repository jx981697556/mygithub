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
	<body class="easyui-layout" style="border: 0px;">
		<div data-options="region:'north',title:'',split:true"
			style="height: 40px; border: 1px; padding: 4px;">
			<div>
				日期 从:&lt;
				<input class="easyui-datebox" style="width: 80px">
				到:
				<input class="easyui-datebox" style="width: 80px">
				语言:
				<select class="easyui-combobox" name="language"><option value="ar">Arabic</option><option value="bg">Bulgarian</option><option value="ca">Catalan</option><option value="zh-cht">Chinese Traditional</option><option value="cs">Czech</option></select>
				<a href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			</div>
		</div>
		<div data-options="region:'center'"
			style="background: #eee; border: 0px;">
			<table id="dg1" class="easyui-datagrid" style="height: 350px"
				data-options="closable:true,checkOnSelect:true,pagination:true,singleSelect:false,striped:true,rownumbers:true,fitColumns:true,toolbar:toolbar">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th field="inv" width="80">
							序号
						</th>
						<th field="date" width="100">
							日期
						</th>
						<th field="name" width="80">
							名称
						</th>
						<th field="amount" width="80" align="right">
							数量
						</th>
						<th field="price" width="80" align="right">
							价格
						</th>
						<th field="cost" width="100" align="right">
							合计
						</th>
						<th field="note" width="110">
							操作
						</th>
					</tr>
				</thead>
			</table>
		</div>
		<div id="w" class="easyui-window" title="主题信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:600px;height:400px;padding:5px;">
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
	<script type="text/javascript">
		var toolbar = [{
			text:'增加',
			iconCls:'icon-add',
			handler:function(){$('#w').window('open')}
		},{
			text:'剪切',
			iconCls:'icon-cut',
			handler:function(){alert('cut')}
		},'-',{
			text:'保存',
			iconCls:'icon-save',
			handler:function(){alert('save')}
		}];
	function getData() {
		var rows = [];
		for ( var i = 1; i <= 40; i++) {
			var amount = Math.floor(Math.random() * 1000);
			var price = Math.floor(Math.random() * 1000);
			rows.push( {
				inv : '值' + i,
				date : $.fn.datebox.defaults.formatter(new Date()),
				name : '姓名 ' + i,
				amount : amount,
				price : price,
				cost : amount * price,
				note : '<a href="#">备注</a> ' + i
			});
		}
		return rows;
	}
	$(function() {
		$('#dg1').datagrid().datagrid('loadData', getData());
	});
</script>
</html>