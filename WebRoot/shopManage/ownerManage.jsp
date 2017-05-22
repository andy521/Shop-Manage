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
<a href="javascript:history.go(-1)" class="btn btn-default radius f-r mt-20">返回管理</a>
<h2>[股东管理-人员管理]</h2>
	<div class="line"></div>
	<form action="shopManage!shopown.action" method="post" name="sel">
	<input type="hidden" name="shopid" value="${shopid}">
	<input type="hidden" name="page" value="${page}">
	</form>
<table class="table table-border table-bordered table-hover table-bg mt-10">

		<thead>
			<tr>
				<th class="col1">序号</th>
				<th class="col2">股东姓名</th>
				<th class="col3">股东股份</th>
				<th class="col3">股东电话</th>
				<th class="col3">股东生日</th>
				<th class="col3">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="usersList" status="a" id="s">
		<form action="" method="post" name="<s:property value="#s.id"/>" id="<s:property value="#s.id"/>">
		<input type="hidden" name="shopid" value="${shopid}">
			<tr>
			<th class="col1 text-c"><s:property value="#a.count" /></th>
			<td class="col2 text-c"><s:property value="#s.users.realname"/></td>
			<td class="col2 text-c">
			<input type="hidden" value="<s:property value="#s.id"/>" name="pershopid">
			<input type="text" required="required" class="input-text radius" name="gufen" id='<s:property value="#s.id"/>gufen' value="<s:property value="#s.gufen"/>"></td>
			<td class="col2 text-c"><s:property value="#s.users.tel"/></td>
			<td class="col2 text-c"><s:date format="yyyy-MM-dd" name="birthday"/></td>
			<td class="col2 text-c">
			<input class="btn radius btn-warning" type="button" value="修改" onclick="upd('<s:property value="#s.id"/>');">
			<input class="btn btn-danger radius" type="button" value="删除" onclick="del('<s:property value="#s.id"/>');">
			</td>
			
			</tr>
			</form>
		</s:iterator>
		<tr>
		<form action="shopManage!addGufen.action" method="post" onsubmit="return add();">
		<th class="col1 text-c">自动添加</th>
			<td class="col2 text-c">
			<input type="hidden" name="shopid" value="${shopid}">
			<select class="select radius" size="1" name="userid">
					<s:iterator value="userList" id="a">
					<option value='<s:property value="#a.usersid"/>'><s:property value="#a.realname"/></option>				
					</s:iterator>
				</select>
			
			
			</td>
			<td class="col2 text-c"><input type="text" required="required" class="input-text radius" name="gufen" id="gufen" value="0"></td>
			<td class="col2 text-c"></td>
			<td class="col2 text-c"></td>
			<td class="col2 text-c">
			<input class="btn btn-success radius"  type="submit"  value="添加">
			</td>
		</form></tr>
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
    document.sel.shopid.value='${shopid}';
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
<script type="text/javascript">
function upd(a) {
	document.getElementById(a).action='shopManage!updGufen.action';
	var x=document.getElementById(a+'gufen').value;
	if(x>=0&&x<=1)
		{document.getElementById(a).submit();}
	else
	{
		alert("请输入0-1之间的小数！");
	}
	
}

function del(a) {
	document.getElementById(a).action='shopManage!delGufen.action';
	document.getElementById(a).submit();
}

function add()
{
	var x=document.getElementById("gufen").value;
	if(x>=0&&x<=1)
		{		}
	else
	{
		alert("请输入0-1之间的小数！");
	return false;	
	}
	}
</script>

</body>
</html>