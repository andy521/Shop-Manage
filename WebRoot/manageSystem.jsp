<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<style type="text/css">
body,td,th {
	font-family: "Microsoft Yahei", "Hiragino Sans GB", "Helvetica Neue", Helvetica, tahoma, arial, "WenQuanYi Micro Hei", Verdana, sans-serif, \5B8B\4F53;
	color: #000;
}
</style>
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>商品系统</title>
</head>
<body>
<%
String realname=(String)session.getAttribute("realname");
String user_name=(String)session.getAttribute("user_name");
%>
<header class=" navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs">商品管理系统<a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">Naah</a> <span class="logo navbar-slogan f-l mr-10 hidden-xs">v0.1</span> <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<li><%=realname %></li>
<li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A"><%=user_name %> <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							
							<li><a href="login!loginout.action">退出</a></li>
						</ul>
					</li>
				  
<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（蓝色）</a></li>
							
							<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
							<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
							<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
							<li><a href="javascript:;" data-val="orange" title="绿色">橙色</a></li>
						</ul>
					</li>
			  </ul>
			</nav>
		</div>
	</div>
</header>
<aside class="Hui-aside">

	
	<div class="menu_dropdown bk_2">
    <!--菜单用dl包住 dt放一级菜单名 dd中放ul中的li包超链接-->
    
 
<!--		<dl id="teach">-->
<!--			<dt><i class="Hui-iconfont">&#xe616;</i> 资讯管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>-->
<!--			<dd> -->
<!--				<ul>	-->			<!-- data-title是打开页选项卡的标题-->
<!--					<li><a _href="article-list.html" data-title="资管理" href="javascript:void(0)">资讯管理</a></li>-->
<!--					 <li><a _href="admin-list.html" data-title="管理员列表" href="javascript:void(0)">管理员列表</a></li> -->
<!--				</ul>-->
<!--			</dd>-->
<!--		</dl>-->
<s:iterator value="#session.nav" id="a">
<s:set name="one" value="#a.uses.isone"></s:set>
<s:if test="#one==0">
<dl id="menu">
<dt><i class="Hui-iconfont">&#xe616;</i><s:property value="#a.uses.name"/><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>	
<dd>
<ul>
<s:iterator value="#session.nav" id="b">
<s:if test="#b.uses.parentid==#a.uses.useid">

<li>
<a _href="<s:property value="#b.uses.url"/>" data-title="<s:property value="#b.uses.name"/>"><s:property value="#b.uses.name"/></a>
</li>
</s:if>
</s:iterator>
</ul>
</dd>
</dl>
</s:if>

</s:iterator>
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="我的桌面" data-href="welcome.html">我的桌面</span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="default.jsp"></iframe>
		</div>
	</div>
</section>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>  

</body>
</html>