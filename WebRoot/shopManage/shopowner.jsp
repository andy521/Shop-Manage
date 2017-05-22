<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.css" />
<link rel="stylesheet" type="text/css" href="lib/icheck/icheck.css" />
<!--[if lt IE 9]>
<link href="static/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>Hi，H-ui</title>

</head>
<body>

<div class="container">

<h2>[店铺管理-股东管理]</h2>
	<div class="line"></div>
	<form action="shopManage!shopown.action" method="post" name="sel">
	<table class="table table-bg  mt-10">
	<tr>
	<td>
	店铺名称：
	</td>
	<td >
	<input type="hidden" name="page" value="${page}">
	<input type="text" class="input-text radius size-M" placeholder="" name="name" id="name" value="${name}">
	</td>
	<td>
	<input class="btn btn-secondary radius" type="submit" value="查询">
	</td>
	</tr>
	<tr>
	<td>
	店铺类型：
	</td>
	<td>
	<input type="text" class="input-text radius size-M" placeholder="" name="kind" id="kind" value="${kind}">
	</td>
	</tr>
	</table>
	</form>
<table class="table table-border table-bordered table-hover table-bg mt-10">

		<thead>
			<tr>
				<th class="col1">序号</th>
				<th class="col2">店铺名称</th>
				<th class="col3">店铺类型</th>
				<th class="col3">店铺电话</th>
				<th class="col3">开店日期</th>
				<th class="col3">店铺法人</th>
				<th class="col3">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="shopList" status="a" id="s">
			<tr>
			<th class="col1 text-c"><s:property value="#a.count" /></th>
			<td class="col2 text-c"><s:property value="#s.shop.name"/></td>
			<td class="col2 text-c"><s:property value="#s.shop.kind"/></td>
			<td class="col2 text-c"><s:property value="#s.shop.tel"/></td>
			<td class="col2 text-c"><s:date format="yyyy-MM-dd" name="#s.shop.birthday"/></td>
			<td class="col2 text-c"><s:property value="#s.shop.powerman"/></td>
			<td class="col2 text-c">
			<a href="shopManage!ownmanage.action?shopid=<s:property value="#s.shop.shopid"/>" class="btn btn-primary radius ">人员管理</a>&nbsp;&nbsp;&nbsp;
			</td>
			
			</tr>
			
			</s:iterator>
		</tbody>
		
	</table>
	
	</div>

<span id="biuuu_city" class="text-c"></span>

<script src="lib/laypage/laypage.js"></script>

<script>

var nums = 10; //每页出现的数量
var pages = Math.ceil(${count}/nums); //得到总页数

var changepage = function(curr){
    //此处是页数变得地方
    document.sel.page.value=curr;
    document.sel.name.value='${name}';
    document.sel.kind.value='${kind}';
    document.sel.submit();
};

//调用分页
laypage({
    cont: 'biuuu_city',
    curr:${page},
    pages: pages,
    skin: '#AF0000',
    first: '首页',
    last: '尾页/'+pages,
    skip:true,
    jump: function(obj,first){
       //点完后处理页的函数
    	if(!first)
    		{
    	changepage(obj.curr);}
    }
})
</script>


</body>
</html>