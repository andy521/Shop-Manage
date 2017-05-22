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
<a href="javascript:history.go(-1)" class="btn btn-default radius f-r mt-20">返回商品</a>
<h2>[ 商品管理-商品修改]</h2>
<div class="line"></div>
<s:iterator value="goods" id="s">
<form action="goods!UpdSave.action" method="post" class="form form-horizontal responsive" id="demoform">
		<div class="row cl">
			<label class="form-label col-xs-2">商品名称：</label>
			<div class="formControls col-xs-5">
				<input type="text" required value="<s:property value="#s.name"/>"   placeholder="请输入商品名称！" datatype="*" nullmsg="商品名称不能为空!"   class="input-text radius" name="goods.name" id="goods/name" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
        
		<div class="row cl">
			<label class="form-label col-xs-2">商品种类：</label>
			<div class="formControls col-xs-5">
				<input type="text" required value="<s:property value="#s.kind"/>"   placeholder="请输入商品种类！" datatype="*" nullmsg="商品种类不能为空!"   class="input-text radius" name="goods.kind" id="goods.kind" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-2">售卖价格：</label>
			<div class="formControls col-xs-5">
				<input type="text" required value="<s:property value="#s.sellprice"/>" placeholder="请输入售卖价格！" datatype="float" nullmsg="售卖价格不能为空!"   class="input-text radius" name="goods.sellprice" id="goods.sellprice" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
        
        
        
		<div class="row cl">
			<label class="form-label col-xs-2">商品品牌：</label>
			<div class="formControls col-xs-5">
				<input type="text" required value="<s:property value="#s.bounds"/>"   placeholder="请输入商品品牌！" datatype="*" nullmsg="商品品牌不能为空!"   class="input-text radius" name="goods.bounds" id="goods.bounds" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
        
		
        <div class="row cl">
			<label class="form-label col-xs-2">商品厂家：</label>
			<div class="formControls col-xs-5">
				<input type="text" required value="<s:property value="#s.factory"/>"  placeholder="请输入商品厂家!" datatype="*" nullmsg="商品厂家不能为空!" value=""     class="input-text radius"  name="goods.factory" id="goods.factory" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-2">商品规格：</label>
			<div class="formControls col-xs-5">
			<input type="text" required value="<s:property value="#s.whight"/>"  placeholder="请输入商品规格!" datatype="*" nullmsg="商品规格不能为空!" value=""     class="input-text radius"  name="goods.whight" id="goods.whight" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-2">商品描述：</label>
			<div class="formControls col-xs-5">
			<input type="text" required value="<s:property value="#s.note"/>" placeholder="请输入商品描述!" datatype="*" nullmsg="商品描述不能为空!" value=""     class="input-text radius"  name="goods.note" id="goods.note" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-2">箱装数量：</label>
			<div class="formControls col-xs-5"> 
				<input type="number" required value="<s:property value="#s.box"/>" placeholder="请输入箱装数量!" datatype="*" nullmsg="箱装数量不能为空!"   value="" class="input-text radius"  name="goods.box" id="goods.box" >
				 </div>
			<div class="col-xs-5"> </div>
		</div>
		<input type="hidden" name="goods.goodsid" value="<s:property value="#s.goodsid"/>">
		<input type="hidden" name="goods.idcard" value="<s:property value="#s.idcard"/>">
		
		<div class="row cl .va-m">
			<div class="col-xs-10 col-xs-offset-2">
		<input class="btn btn-secondary radius  mt-20" type="submit" value="修改商品">
		</div></div>
	</form>
	</s:iterator>
	</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
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
</script>


</body>
</html>