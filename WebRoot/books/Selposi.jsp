<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
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
<link rel="stylesheet" type="text/css" href="goods/styles.css" />
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
  
  
	<h2>[商品管理-商品查询]</h2>
	<div class="line"></div>
  
  	<a href="goods!toWebCam.action" class="btn btn-success radius">种类汇总</a>
  	<a href="goods!toFile.action" class="btn btn-secondary radius">年度汇总</a>
  	<a href="goods!toSub.action" class="btn btn-primary radius">月份汇总</a>
  	<a href="goods!toSub.action" class="btn btn-primary radius">单日汇总</a>
	
  
 
  
   <span id="biuuu_city" class="text-c"></span>
  </div>
  <script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script> 
  <script src="lib/laypage/laypage.js"></script>
  <script src="static/h-ui/js/H-ui.js"></script>
<!--ajax  -->

<s:if test="flag!=0">

<script>

var nums = 10; //每页出现的数量
var pages = Math.ceil(${count}/nums); //得到总页数

var changepage = function(curr){
    //此处是页数变得地方
    document.sel.page.value=curr;
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
});
</script>
</s:if>
<s:else></s:else>


 </body>
</html>
