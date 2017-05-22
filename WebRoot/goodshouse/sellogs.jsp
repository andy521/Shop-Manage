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
<a href="javascript:history.go(-1)" class="btn btn-default radius f-r mt-20">返回库存</a>
<h2>[库存管理-详细库存]</h2>
<div class="line"></div>
<s:iterator value="logs" id="s">
<form action="" method="post" class="form form-horizontal responsive" >
		<div class="row cl">
			<label class="form-label col-xs-2">商品名称：</label>
			<div class="formControls col-xs-5">
				<input type="text"  readonly="readonly" class="input-text radius size-M" placeholder="" name="name" id="name" value="<s:property value="#s.goods.name"/>">
			</div>
			<div class="col-xs-5"> </div>
		</div>
        <s:if test='#s.upkind=="addhouse"'><s:set name="upkind1" value="'添加库存'" /></s:if>
			<s:elseif test='#s.upkind=="updhouse"'><s:set name="upkind1" value="'修改库存'" /></s:elseif>
			<s:elseif test='#s.upkind=="delhouse"'><s:set name="upkind1" value="'删除库存'" /></s:elseif>
			<s:elseif test='#s.upkind=="sale"'><s:set name="upkind1" value="'销售库存'" /></s:elseif>
		<div class="row cl">
			<label class="form-label col-xs-2">操作类型：</label>
			<div class="formControls col-xs-5">
				<input type="text"  readonly="readonly" value="<s:property value="upkind1"/>"   placeholder="请输入商品种类！" datatype="*" nullmsg="商品种类不能为空!"   class="input-text radius"  >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
			
			
		<div class="row cl">
			<label class="form-label col-xs-2">操作数量：</label>
			<div class="formControls col-xs-5">
				<input type="text"  value='<s:property value="#s.number"/>'  placeholder="请输入商品数量！" datatype="float" nullmsg="商品数量不能为空!"   class="input-text radius" name="number" id="number" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
        
		<div class="row cl">
			<label class="form-label col-xs-2">剩余数量：</label>
			<div class="formControls col-xs-5">
				<input type="text"  value="<s:property value="#s.lastnumber"/>"   placeholder="请输入商品品牌！" datatype="float" nullmsg="商品进价不能为空!"   class="input-text radius" name="buyprice" id="buyprice" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
        
		
        <div class="row cl">
			<label class="form-label col-xs-2">销售价格：</label>
			<div class="formControls col-xs-5">
				<input type="text"  readonly="readonly" value="<s:property value="#s.salemoney"/>"  placeholder="请输入商品厂家!" datatype="*" nullmsg="商品厂家不能为空!"     class="input-text radius" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
        <div class="row cl">
			<label class="form-label col-xs-2">商店名称：</label>
			<div class="formControls col-xs-5">
				<input type="text"  readonly="readonly" value="<s:property value="#s.shop.name"/>"  placeholder="请输入商品厂家!" datatype="*" nullmsg="商品厂家不能为空!"     class="input-text radius" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
        <div class="row cl">
			<label class="form-label col-xs-2">操作人员：</label>
			<div class="formControls col-xs-5">
				<input type="text"  readonly="readonly" value="<s:property value="#s.users.realname"/>"  placeholder="请输入商品厂家!" datatype="*" nullmsg="商品厂家不能为空!"     class="input-text radius" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
        <div class="row cl">
			<label class="form-label col-xs-2">操作时间：</label>
			<div class="formControls col-xs-5">
				<input type="text"  readonly="readonly" value="<s:date format="yyyy-MM-dd" name="#s.time"/>"  placeholder="请输入商品厂家!" datatype="*" nullmsg="商品厂家不能为空!"     class="input-text radius" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
		
	
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