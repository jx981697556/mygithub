<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-TAG/platForm.tld" prefix="PF"%>
<div class="easyui-accordion" data-options="fit:true,border:false">
	<div title="Title1" data-options="selected:true">
		<ul class="easyui-tree">
			<li>
				<span>My Documents</span>
				<ul>
					<li data-options="state:'closed'">
						<span>Photos</span>
						<ul>
							<li>
								<span>Friend</span>
							</li>
							<li>
								<span>Wife</span>
							</li>
							<li>
								<span>Company</span>
							</li>
						</ul>
					</li>
					<li>
						<span>Program Files</span>
						<ul>
							<li>
								Intel
							</li>
							<li>
								Java
							</li>
							<li>
								Microsoft Office
							</li>
							<li>
								Games
							</li>
						</ul>
					</li>
					<li>
						index.html
					</li>
					<li>
						about.html
					</li>
					<li>
						welcome.html
					</li>
				</ul>
			</li>
		</ul>
	</div>
	<div title="Title2"  style="">
		<table id="dg" class="easyui-datagrid" 
					data-options="url:'../accordion/datagrid_data1.json',fit:true,fitColumns:true,singleSelect:true">
				<thead>
					<tr>
						<th data-options="field:'itemid',width:80">Item ID</th>
						<th data-options="field:'productid',width:100">Product ID</th>
						<th data-options="field:'listprice',width:80,align:'right'">List Price</th>
					</tr>
				</thead>
			</table>
	</div>
	<div title="Title3" style="padding: 10px">
		<div title="About" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
			<h3 style="color:#0099FF;">Accordion for jQuery</h3>
			<p>Accordion is a part of easyui framework for jQuery. It lets you define your accordion component on web page more easily.</p>
		</div>
	</div>
</div>