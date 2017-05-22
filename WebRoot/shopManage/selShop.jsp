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
<a href="javascript:history.go(-1)" class="btn btn-default radius f-r mt-20">返回店铺</a>
<h2>[旗下店铺-查看店铺]</h2>
<div class="line"></div>
<s:iterator value="shop">
<form action="" method="post" class="form form-horizontal responsive" id="demoform">
			<div class="row cl">
			<label class="form-label col-xs-2">店铺名称：</label>
			<div class="formControls col-xs-5">
				<input type="text" value='${name}'  readonly="readonly"  readonly="readonly" class="input-text radius" name="username" id="username">
			</div>
			<div class="col-xs-5"> </div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-2">店铺类型：</label>
			<div class="formControls col-xs-5">
				<input type="text" value="${kind}"  readonly="readonly" class="input-text radius" placeholder="4~16个字符，字母/中文/数字/下划线" name="username" id="username"  >
			</div>
			<div class="col-xs-5"> </div>
		</div>
        
		
        <div class="row cl">
			<label class="form-label col-xs-2">店铺电话：</label>
			<div class="formControls col-xs-5">
				<input type="text" value="${tel}" readonly="readonly" class="input-text radius" autocomplete="off" placeholder="真实姓名" name="username" id="username" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-2">店铺主人：</label>
			<div class="formControls col-xs-5">
			<s:iterator value="users">
				<input type="text" value="${realname}" readonly="readonly" class="input-text radius" autocomplete="off" placeholder="真实姓名" name="username" id="username" >
			</s:iterator>
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-2">店铺法人：</label>
			<div class="formControls col-xs-5">
				<input type="text" value="${powerman}" readonly="readonly" class="input-text radius" autocomplete="off" placeholder="真实姓名" name="username" id="username" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-2">法人电话：</label>
			<div class="formControls col-xs-5">
				<input type="text" value="${powertel}"  readonly="readonly" class="input-text radius" autocomplete="off" placeholder="真实姓名" name="username" id="username" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-2">开店日期：</label>
			<div class="formControls col-xs-5">
				<input type="text" value="<s:date format="yyyy-MM-dd" name="birthday"/>" readonly="readonly" class="input-text radius" autocomplete="off" placeholder="真实姓名" name="username" id="username" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-2">开店资金：</label>
			<div class="formControls col-xs-5">
				<input type="text" value="${money}" readonly="readonly"  class="input-text radius" autocomplete="off" placeholder="真实姓名" name="username" id="username" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-2">所在省：</label>
			<div class="formControls col-xs-5"> 
			<input type="text" value="${priv}" readonly="readonly" class="input-text radius"  name="shop.priv" id="shop.priv" >
				</div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">所在城市：</label>
			<div class="formControls col-xs-5"> 
				<input type="text" value="${city}" readonly="readonly" class="input-text radius"  name="shop.city" id="shop.city" >
				 </div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">所在县区：</label>
			<div class="formControls col-xs-5">
			
				<input type="text" value="${country}" readonly="readonly" class="input-text radius"  name="shop.country" id="shop.country" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
	</form>
	</s:iterator>
	</div>
</body>
</html>