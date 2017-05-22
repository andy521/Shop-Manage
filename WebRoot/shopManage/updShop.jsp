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

<script language="javascript" type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<div class="container">
<a href="javascript:history.go(-1)" class="btn btn-default radius f-r mt-20">返回店铺</a>
<h2>[旗下店铺-修改店铺]</h2>
<div class="line"></div>
<s:iterator value="shop">
<form action="shopManage!updSave.action" method="post" class="form form-horizontal responsive" id="demoform">
			<input type="hidden" name="shop.shopid" id="shop.shopid" value="${shopid}">
			<div class="row cl">
			<label class="form-label col-xs-2">店铺名称：</label>
			<div class="formControls col-xs-5">
				<input type="text"   placeholder="请输入店铺名称！" datatype="*" nullmsg="店铺名称不能为空!" value='${name}'  class="input-text radius" name="shop.name" id="shop.name">
			</div>
			<div class="col-xs-5"> </div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-2">店铺类型：</label>
			<div class="formControls col-xs-5">
				<input type="text" required  placeholder="请输入店铺类型!" datatype="*" nullmsg="店铺类型不能为空!" value="${kind}"   class="input-text radius" name="shop.kind" id="shop.kind" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
        
		
        <div class="row cl">
			<label class="form-label col-xs-2">店铺电话：</label>
			<div class="formControls col-xs-5">
				<input type="text" required  placeholder="请输入店铺电话!" datatype="tel" nullmsg="店铺电话不能为空!" value="${tel}"  errormsg="请输入电话号或手机号！"   class="input-text radius"  name="shop.tel" id="shop.tel" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-2">店铺主人：</label>
			<div class="formControls col-xs-5">
			<span class="select-box">
			
				<select class="select radius" size="1" name="powerid">
					
					<s:iterator value="userList" id="a">
					
					<s:iterator value="users1" id="b">
					
					<s:if test="#a.users.usersid==#b.usersid">
					<option selected="selected" value='<s:property value="#b.usersid"/>'><s:property value="#a.users.realname"/></option>
					</s:if>
					<s:else>
					<option value='<s:property value="#a.users.usersid"/>'><s:property value="#a.users.realname"/></option>				
					</s:else>
					</s:iterator>
					</s:iterator>
				</select>
				</span> 
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-2">店铺法人：</label>
			<div class="formControls col-xs-5">
				<input type="text" required  placeholder="请输入店铺法人!" datatype="*" nullmsg="店铺法人不能为空!" value="${powerman}"  class="input-text radius" name="shop.powerman" id="shop.powerman" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-2">法人电话：</label>
			<div class="formControls col-xs-5">
				<input type="text" required  placeholder="请输入法人电话!" datatype="m" nullmsg="法人电话不能为空!" value="${powertel}"   class="input-text radius" name="shop.powertel" id="shop.powertel" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-2">开店日期：</label>
			<div class="formControls col-xs-5">
				<input type="text" required  placeholder="请输入开店日期!"  errormsg="请输入正确格式（2016-01-01）！" datatype="date" nullmsg="开店日期不能为空!" value="<s:date format="yyyy-MM-dd" name="birthday"/>"  onClick="WdatePicker()"  class="input-text radius Wdate"  name="shop.birthday" id="shop.birthday" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-2">开店资金：</label>
			<div class="formControls col-xs-5">
				<input type="text" required  placeholder="请输入开店资金!" datatype="float" nullmsg="开店资金不能为空!" errormsg="请输入正整数或正小数！"  value="${money}" class="input-text radius"  name="shop.money" id="shop.money" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-2">所在省：</label>
			<div class="formControls col-xs-5"> 
			<input type="text" required  placeholder="请输入所在省!" datatype="*" nullmsg="所在省不能为空!" value="${priv}" class="input-text radius"  name="shop.priv" id="shop.priv" >
				</div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">所在城市：</label>
			<div class="formControls col-xs-5"> 
				<input type="text" required  placeholder="请输入所在城市!" datatype="*" nullmsg="所在城市不能为空!" value="${city}" class="input-text radius"  name="shop.city" id="shop.city" >
				 </div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">所在县区：</label>
			<div class="formControls col-xs-5">
			
				<input type="text" required  placeholder="请输入所在县区!" datatype="*" nullmsg="所在县区不能为空!" value="${country}" class="input-text radius"  name="shop.country" id="shop.country" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl .va-m">
			<div class="col-xs-10 col-xs-offset-2">
		<input class="btn btn-secondary radius  mt-20" type="submit" value="修改信息">
		</div></div>
	</form>
	</s:iterator>
	</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="lib/bootstrap-Switch/bootstrapSwitch.js"></script> 
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script> 
<script>
//var navigation = responsiveNav("Hui-navbar", {customToggle: ".nav-toggle"});

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
			"date" : /^([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8])))$/
			
			}
		}
	);
});
</script>
</body>
</html>