<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>商品管理系统 - Naah v0.1</title>
</head>
<body>
<s:if test="mess==null">

</s:if>
<s:else>
<script type="text/javascript">
alert('${mess}');
</script></s:else>
<div class="header"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">

    <form class="form form-horizontal" action="login.action" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="username" name="users.username" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="password" name="users.password" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="pic" class="input-text size-L" type="text" placeholder="验证码"  value="" style="width:150px;">
          <img src="pic.action" id="imgObj"  onclick="this.src='pic.action?'+Math.random()" title="点击图片刷新验证码"> <a id="kanbuq" href="#" onclick="document.getElementById('imgObj').src='pic.action?'+ Math.random();">看不清，换一张</a> </div>
      
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
        <p></p>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="button" class="btn btn-default radius size-L" value="&nbsp;退&nbsp;&nbsp;&nbsp;&nbsp;出&nbsp;" onclick="JavaScript:if(confirm(&quot;你是否要退出系统？&quot;)){parent.window.close();}">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 商品管理系统by Naah</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script> 


</body>
</html>