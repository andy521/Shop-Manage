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
  
  
	<h2>[库存管理-库存查询]</h2>
	<div class="line"></div>
  
  	<a href="house!toWebCam.action" class="btn btn-success radius">扫码查询</a>
  	<a href="house!toFile.action" class="btn btn-secondary radius">图码查询</a>
  	<a href="house!toSub.action" class="btn btn-primary radius">条件查询</a>
	
  
  <s:if test="flag==1">
  <table class="table table-border table-bordered table-hover table-bg mt-10">
		<thead>
			<tr>
				<th class="col1">序号</th>
				<th class="col2">商品名称</th>
				<th class="col3">商品类型</th>
				<th class="col3">库存数量</th>
				<th class="col3">商品进价</th>
				<th class="col3">商品条码</th>
				<th class="col3">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="goodshouse" status="n" id="s">
			<tr>
			
			<th class="col1 text-c"><s:property value="#n.count"/></th>
			<td class="col2 text-c">
			<s:property value="#s.goods.name"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.goods.kind"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.number"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.buyprice"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.goods.idcard"/>
			</td>
			
			<td class="col2 text-c">
			<a href="house!toUpd.action?id=<s:property value="#s.id"/>" class="btn btn-primary radius ">库存信息</a>&nbsp;&nbsp;&nbsp;
			<a href="house!Del.action?id=<s:property value="#s.id"/>" class="btn btn-danger radius">删除库存</a>&nbsp;&nbsp;&nbsp;
			</td>
			
			</tr>
			</s:iterator>
		</tbody>
		
	</table>  
  </s:if>
  <s:elseif test="flag==2">
  <form action="house!search.action" method="post" name="sel">
  <input type="hidden"  name="page" value="<s:property value="page"/>">
  <s:iterator value="goodshouse" id="g"><s:property value="#g.name"/>
  <input type="hidden" value="<s:property value="name"/>" name="name">
  <input type="hidden" value="<s:property value="kind"/>" name="kind">
  <input type="hidden" value="<s:property value="number"/>" name="number">
  <input type="hidden" value="<s:property value="barcode"/>" name="barcode">
  <input type="hidden" value="<s:property value="buyprice"/>" name="buyprice">
  <input type="hidden" value="<s:property value="shopid"/>" name="shopid">
  </s:iterator>
  </form>
  <table class="table table-border table-bordered table-hover table-bg mt-10">
		<thead>
			<tr>
				<th class="col1">序号</th>
				<th class="col2">商品名称</th>
				<th class="col3">商品类型</th>
				<th class="col3">库存数量</th>
				<th class="col3">商品进价</th>
				<th class="col3">商品条码</th>
				<th class="col3">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="goodshousesList" status="b" id="s">
			<tr>
			
			<th class="col1 text-c"><s:property value="#b.count"/></th>
			<td class="col2 text-c">
			<s:property value="#s.goods.name"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.goods.kind"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.number"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.buyprice"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.goods.idcard"/>
			</td>
			
			<td class="col2 text-c">
			<a href="house!toUpd.action?id=<s:property value="#s.id"/>" class="btn btn-primary radius ">库存信息</a>&nbsp;&nbsp;&nbsp;
			<a href="house!Del.action?id=<s:property value="#s.id"/>" class="btn btn-danger radius">删除库存</a>&nbsp;&nbsp;&nbsp;
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
