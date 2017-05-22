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
  
  	<a href="goods!toWebCam.action" class="btn btn-success radius">扫码查询</a>
  	<a href="goods!toFile.action" class="btn btn-secondary radius">图码查询</a>
  	<a href="goods!toSub.action" class="btn btn-primary radius">条件查询</a>
	
  
  <s:if test="flag==1">
  <table class="table table-border table-bordered table-hover table-bg mt-10">
		<thead>
			<tr>
				<th class="col1">序号</th>
				<th class="col2">商品名称</th>
				<th class="col3">商品品牌</th>
				<th class="col3">商品厂家</th>
				<th class="col3">商品规格</th>
				<th class="col3">商品描述</th>
				<th class="col3">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="goods" status="n" id="s">
			<tr>
			
			<th class="col1 text-c"><s:property value="#n.count"/></th>
			<td class="col2 text-c">
			<s:property value="#s.name"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.bounds"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.factory"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.whight"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.note"/>
			</td>
			
			<td class="col2 text-c">
			<a href="goods!toUpd.action?goods.goodsid=<s:property value="#s.goodsid"/>" class="btn btn-primary radius ">商品信息</a>&nbsp;&nbsp;&nbsp;
			<a href="goods!Del.action?goods.goodsid=<s:property value="#s.goodsid"/>" class="btn btn-danger radius">删除商品</a>&nbsp;&nbsp;&nbsp;
			</td>
			
			</tr>
			</s:iterator>
		</tbody>
		
	</table>  
  </s:if>
  <s:elseif test="flag==2">
  <form action="goods!search.action" method="post" name="sel">
  <input type="hidden"  name="page">
  <s:iterator value="goods" id="g"><s:property value="#g.name"/>
  <input type="hidden" value="<s:property value="#g.name"/>" name="goods.name">
  <input type="hidden" value="<s:property value="#g.idcard"/>" name="goods.idcard">
  <input type="hidden" value="<s:property value="#g.bounds"/>" name="goods.bounds">
  <input type="hidden" value="<s:property value="#g.factory"/>" name="goods.factory">
  <input type="hidden" value="<s:property value="#g.whight"/>" name="goods.whight">
  <input type="hidden" value="<s:property value="#g.note"/>" name="goods.note">
  </s:iterator>
  </form>
  <table class="table table-border table-bordered table-hover table-bg mt-10">
		<thead>
			<tr>
				<th class="col1">序号</th>
				<th class="col2">商品名称</th>
				<th class="col3">商品品牌</th>
				<th class="col3">商品厂家</th>
				<th class="col3">商品规格</th>
				<th class="col3">商品描述</th>
				<th class="col3">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="goodsList" status="b" id="s">
			<tr>
			
			<th class="col1 text-c"><s:property value="#b.count"/></th>
			<td class="col2 text-c">
			<s:property value="#s.name"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.bounds"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.factory"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.whight"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.note"/>
			</td>
			
			<td class="col2 text-c">
			<a href="goods!toUpd.action?goods.goodsid=<s:property value="#s.goodsid"/>" class="btn btn-primary radius ">商品信息</a>&nbsp;&nbsp;&nbsp;
			<a href="goods!Del.action?goods.goodsid=<s:property value="#s.goodsid"/>" class="btn btn-danger radius">删除商品</a>&nbsp;&nbsp;&nbsp;
			</td>
			
			</tr>
			</s:iterator>
		</tbody>
		
	</table>  
  
  
  </s:elseif>
  
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
