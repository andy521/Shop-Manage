<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
 <head>
<meta charset="utf-8">
<meta name="goods.renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="goods.viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.css" />
<link rel="stylesheet" type="text/css" href="lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="goods/styles.css" />
<style type="text/css">
    .btn-upload{position: relative; display:inline-block;height:36px; *display:inline;overflow:hidden;vertical-align:middle;cursor:pointer}
    .upload-url{cursor: pointer}
    .input-file{position:absolute; right:0; top:0; cursor: pointer; z-index:1; font-size:30em; *font-size:30px;opacity:0;filter: alpha(opacity=0)}
    .btn-upload .input-text{ width:auto;}
    .form-group .upload-btn{ margin-left:-1px}</style>
<!--[if lt IE 9]>
<link href="static/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
  <title>Document</title>
 </head>
 <body>
  <div class="container">
  <form action="house!search.action" onsubmit="return add();" method="post" id="demoform" class="form form-horizontal responsive">
    <input class="btn btn-secondary radius f-r mt-20" type="submit" value="查询">
   <a href="javascript:history.go(-1)" class="btn btn-default radius f-r mt-20">返回库存</a>
   
	<h2>[库存查询-条件查询]</h2>
	<div class="line"></div>
	
	<table class="table table-bg  mt-10">
	<tr>
		
		<td width="50%">
			商品名称：
			<input type="text" class="input-text radius size-M" placeholder="" name="name" id="name">
		</td>
		
		<td>
			商品类型：
			<input type="text" class="input-text radius size-M" placeholder="" name="kind" id="kind">
			
		</td>
	</tr>
	<tr>
		<td>
			库存数量：
			<input type="text" class="input-text radius size-M" placeholder="" name="number" id="number" >
			
		</td>
		
		<td>
			商品条码：
			<input type="text" class="input-text radius size-M" placeholder="" name="barcode" id="barcode" >
			
		</td>
	</tr>
	<tr>
		<td>
			商品进价：
			<input type="text"   class="input-text radius size-M" placeholder="" name="buyprice" id="buyprice" >
			
		</td>
		<td>
			商店名称：
			<span class="formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="shopid" id="shopid">
			<s:iterator value="shopList" id="a">
			<option value='<s:property value="#a.shop.shopid"/>'><s:property value="#a.shop.name"/></option>
			</s:iterator>
			</select>
			</span>
		</td>
	</tr>
	</table>
	</form>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script> 
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="lib/bootstrap-Switch/bootstrapSwitch.js"></script> 
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script> 
<script>
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	$("#demoform").Validform({
		tiptype:2,
		datatype:{
			"float": /^[0-9]\d*\.{1}[0-9]\d*|[0-9]\d*$/,
			"tel" : /^[0-9-()]{7,18}$/,
			"date" : /^([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8])))$/,
			"idcard":/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/
			
			}
		}
	);
});
function add()
{
	n=document.getElementById("number").value;
	b=document.getElementById("buyprice").value;
	if(isNaN(n)==false)
	{
		if(isNaN(b)==false)
		{
			return true;
		}
		else
			{
			alert("商品数量只能为数字！");
			return false;
			}
		
		
		
	}
	else
	{
		alert("商品进价只能为数字！");
	return false;
	}
}



</script>
 </body>
</html>
