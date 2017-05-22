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
    .form-group .upload-btn{ margin-left:-1px}
    
    /* line 1, ../sass/_viewport.scss */
#interactive.viewport {
  width: 100px;
  height: 100px;
}

/* line 6, ../sass/_viewport.scss */
#interactive.viewport canvas, video {
  float: left;
  width: 100px;
  height: 100px;
}
/* line 10, ../sass/_viewport.scss */
#interactive.viewport canvas.drawingBuffer, video.drawingBuffer {
  margin-left: -100px;
}
    
    
    
    </style>
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
  <form action="goods!search.action" method="post">
    <input class="btn btn-secondary radius f-r mt-20" type="submit" value="查询">
   <a href="javascript:history.go(-1)" class="btn btn-default radius f-r mt-20">返回用户</a>
   
	<h2>[商品查询-条件查询]</h2>
	<div class="line"></div>
	
	<table class="table table-bg  mt-10">
	<tr>
		<td width="50%">
			商品名称：
			<input type="text" class="input-text radius size-M" placeholder="" name="goods.name" id="name">
		</td>
		
		<td>
			商品条码：
			<input type="text" class="input-text radius size-M" placeholder="" name="goods.idcard" id="idcard">
			
		</td>
	</tr>
	<tr>
		<td>
			商品品牌：
			<input type="text" class="input-text radius size-M" placeholder="" name="goods.bounds" id="bounds" >
			
		</td>
		
		<td>
			商品厂家：
			<input type="text" class="input-text radius size-M" placeholder="" name="goods.factory" id="factory" >
			
		</td>
	</tr>
	<tr>
		<td>
			商品规格：
			<input type="text" class="input-text radius size-M" placeholder="" name="goods.whight" id="whight" >
			
		</td>
		<td>
			商品描述：
			<input type="text" class="input-text radius size-M" placeholder="" name="goods.note" id="note" >
			
		</td>
	</tr>
	</table>
	</form>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script> 

 </body>
</html>
