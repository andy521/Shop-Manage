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
<a href="javascript:history.go(-1)" class="btn btn-default radius f-r mt-20">返回用户</a>
<h2>[人员管理-添加人员]</h2>
<div class="line"></div>
<s:iterator value="updUsers">
<form action="perManage!addSave.action" method="post" class="form form-horizontal responsive" id="demoform">
			<div class="row cl">
			<label class="form-label col-xs-2">登录名称：</label>
			<div class="formControls col-xs-5">
				<input type="text" required   placeholder="请输入登录名称！" datatype="*" nullmsg="登录名称不能为空!" value=''  class="input-text radius" name="updUsers.username" id="updUsers.username">
			</div>
			<div class="col-xs-5"> </div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-2">用户密码：</label>
			<div class="formControls col-xs-5">
				<input type="text"   placeholder="请输入用户密码！" datatype="*" nullmsg="用户密码不能为空!"   class="input-text radius" name="updUsers.password" id="updUsers.password" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
        
		
        <div class="row cl">
			<label class="form-label col-xs-2">真实姓名：</label>
			<div class="formControls col-xs-5">
				<input type="text" required  placeholder="请输入真实姓名!" datatype="*" nullmsg="真实姓名不能为空!" value=""     class="input-text radius"  name="updUsers.realname" id="updUsers.realname" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-2">所属店铺：</label>
			<div class="formControls col-xs-5">
			<span class="formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="shopid" id="shopid">
			
			<s:iterator value="shopList" id="a">
			<option value='<s:property value="#a.shop.shopid"/>'><s:property value="#a.shop.name"/></option>
			</s:iterator>
			</select>
			</span>
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-2">所属部门：</label>
			<div class="formControls col-xs-5">
			<span class=" formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="alongid" id="alongid">
			
			</select>
			</span>
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-2">所属上司：</label>
			<div class="formControls col-xs-5">
			<span class="formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="headerid" id="headerid">
			</select>
			</span>
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-2">用户职位：</label>
			<div class="formControls col-xs-5">
			<span class="formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="positionid" id="positionid">
			
			</select>
			</span>
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-2">联系方式：</label>
			<div class="formControls col-xs-5">
				<input type="text" required  placeholder="请输入联系方式!" datatype="tel" nullmsg="联系方式不能为空!" errormsg="请输入正确的联系方式！"  value="" class="input-text radius"  name="updUsers.tel" id="updUsers.tel" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-2">身份证号：</label>
			<div class="formControls col-xs-5"> 
			<input type="text" required  placeholder="请输入身份证号码!" datatype="idcard" nullmsg="身份证号码不能为空!" errormsg="请输入正确的身份证号码！" value="" class="input-text radius"  name="updUsers.idcard" id="updUsers.idcard" >
				</div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">出生日期：</label>
			<div class="formControls col-xs-5">
			
				<input type="text" required  placeholder="请输入出生日期!" datatype="date" nullmsg="出生日期不能为空!" value="" onClick="WdatePicker()" class="input-text radius Wdate"  name="updUsers.birthday" id="updUsers.birthday" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">入职时间：</label>
			<div class="formControls col-xs-5"> 
				<input type="text" required  placeholder="请输入入职时间!" datatype="*" nullmsg="入职时间不能为空!"  onClick="WdatePicker()" value="" class="input-text radius Wdate"  name="updUsers.positionBirthday" id="updUsers.positionBirthday" >
				 </div>
			<div class="col-xs-5"> </div>
		</div>
		
		<div class="row cl .va-m">
			<div class="col-xs-10 col-xs-offset-2">
		<input class="btn btn-secondary radius  mt-20" type="submit" value="添加用户">
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
$("#updUsers.idcard").blur(function(){
	alert("1");
  $("#updUsers.birthday").val($("#updUsers.idcard").val().substring(6,4)+"-"+$("#updUsers.idcard").val().substring(10,2)+"-"+$("#updUsers.idcard").val().substring(12,2));
});

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
<script>
//ajax
$("#shopid").change(function(){
	//along
    var url = "perManage!alongAjax.action?shopid="+$("#shopid").val();  
    $("#alongid").empty();
    $.ajax({  
        type:'get',  
        url:url,  
        dataType: 'json',  
        success:function(data){  
            $.each(data,function(i,list){  
            	$("#alongid").append("<option value='"+list.alongid+"'>"+list.alongname+"</option>");

            });  
        }  
    });
    //position
    var url1 = "perManage!positionAjax.action?shopid="+$("#shopid").val(); 
    $("#positionid").empty();
    $.ajax({  
        type:'get',  
        url:url1,  
        dataType: 'json',  
        success:function(data){  
            $.each(data,function(i,list){  
            	$("#positionid").append("<option value='"+list.positionid+"'>"+list.name+"</option>");

            });  
        }  
    });
    //header
    var url2 = "perManage!headerAjax.action?shopid="+$("#shopid").val();  
    $("#headerid").empty();
    $.ajax({  
        type:'get',  
        url:url2,  
        dataType: 'json',  
        success:function(data){  
            $.each(data,function(i,list){  
            	$("#headerid").append("<option value='"+list.usersid+"'>"+list.realname+"</option>");

            });  
        }  
    });
      
});  

$("#shopid").change();
</script>

</body>
</html>