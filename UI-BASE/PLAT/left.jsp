<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-TAG/platForm.tld" prefix="PF"%>
<div id="frame_accordion" class="easyui-accordion"
	data-options="fit:true,border:false">
	<c:set var="index" value="0"></c:set>
	<c:forEach items="${result}" var="node">
		<c:if test="${index==0}">
			<div img="${node.IMG}" url="${node.URL}" id="${node.ID}"
				title="${node.NAME}" data-options="selected:true">
				<ul id="tree${node.ID}" class="easyui-tree">
				</ul>
			</div>
		</c:if>
		<c:if test="${index==1}">
			<div title="${node.NAME}" img="${node.IMG}" url="${node.URL}"
				id="${node.ID}" style="">
				<ul id="tree${node.ID}" class="easyui-tree">
				</ul>
			</div>
		</c:if>
		<c:set var="index" value="1"></c:set>
	</c:forEach>
</div>
<script type="text/javascript">
	//加载二级菜单
	function loadMenuTow() {
		var menu_id = $('#frame_accordion').accordion('getSelected').attr('id');
		//<--加载过就不加载了$(selector).data
		if ($('#' + menu_id).data('isLoad') == true) {
			return;
		} else {
			$('#' + menu_id).data('isLoad', true);
		}
		//-->
		$('#tree' + menu_id).tree( {
			onSelect : openMenuTow
		});
		$.post('admin/ALONEAJAX_SUBORDINATION_MENU.do', {
			menuId : menu_id
		}, function(flag) {
			$(flag.result).each(function(i, o) {
				$('#tree' + menu_id).tree('append', {
					data : [ {
						id : o.ID,
						text : o.NAME,
						attributes : o.URL,
						iconCls:o.IMG
					} ]
				});
			});
		});
	}
	//点击菜单
	function openMenuTow(node) {
		var url = $(node).attr('attributes');
		if (!url) {
			return;
		}
		openUrlAtIfram($(node).attr("attributes"),$(node).attr('id'),$(node).attr('text'));
	}
	/**在选项卡中打开一个菜单
	*address:地址默认为action的index
	*id：识别是否已经打开的标签用的
	*text:显示的中文标题
	*isURI:是否是URL，默认false即系统会自动拼admin/和.do
	**/
	function openUrlAtIfram(address,id,text,isURI){
		var URL='';
		if(!isURI){
			isURI==false;
			URL='admin/'+address+'.do';
		}else{
			URL=address;
		}
		//打开一个选项卡在选项卡中加载页面
		var exist_tab= $('#frame_tabs').tabs('getTab',text);
		//是否已经打开该选项卡
		if(exist_tab&&$(exist_tab).attr('id')=='tab'+id){
			$('#frame_tabs').tabs('select',text);
			return;
		}else{
			$('#frame_tabs').tabs('add', {
				'id':'tab'+id,
				title : text,
				fit:true,
				content : '<div id="load'+id+'"  style="vertical-align:middle; text-align: center; padding-top: 25px;"><img style="margin-top: 50px;" alt="" src="WEB-FACE/img/temp/loadinglogo.png"></div><iframe onload="loadLaberOver(\'load'+id+'\');" scrolling="auto" frameborder="0"  src="'+URL+'" style="width:100%;height:100%;"></iframe>',
				closable : true
			});
			$('#frame_tabs').tabs('getSelected').css('overflow','hidden');   
		}
	}
	$(document).ready(function() {
		$('#frame_accordion').accordion( {
			onSelect : loadMenuTow
		});
		loadMenuTow();
	});
	function loadLaberOver(id){
		$('#'+id).remove();
	}
	//-->
</script>
