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
  <form action="Position!selposition.action" method="post" name="sel">
  
	<h2>[人事管理-职位管理]</h2>
	<div class="line"></div>
  
	<table class="table table-bg  mt-10">
	<tr>
		<td>
			<!-- page -->
			 <s:if test="positionList!=null">
			<input type="hidden" name="page" value="${page}">
			</s:if>
			<s:else><input type="hidden" name="page" value="1"></s:else>
			职位名称：
		</td>
		<td>
			<input type="text" class="input-text radius size-M" placeholder="" name="name" id="name" value="${name}">
		</td>
		<td>
		<input class="btn btn-secondary radius " type="submit" value="查询">
		</td>
	</tr>
	<tr>
		<td>
			店铺名称：
		</td>
		<td>
			<span class="formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="shopid" id="shopid">
			<option value="xuanzhe">请选择！</option>
			<s:iterator value="shopList" id="a">
			<option value='<s:property value="#a.shop.shopid"/>'><s:property value="#a.shop.name"/></option>
			</s:iterator>
			</select>
			</span>
		</td>
		
	</tr>
	</table>
	</form>
  
  <s:if test="positionList!=null">
  <table class="table table-border table-bordered table-hover table-bg mt-10">

		<thead>
			<tr>
				<th class="col1">序号</th>
				<th class="col2">职位名称</th>
				<th class="col3">所属店铺</th>
				<th class="col3">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="positionList" status="n" id="s">
			<tr>
			
			<th class="col1 text-c"><s:property value="#n.count"/></th>
			<form action="" method="post" name="<s:property value="#s.positionid"/>" id="<s:property value="#s.positionid"/>">
			<input type="hidden" name="position.positionid" value="<s:property value="#s.positionid"/>">
			<td class="col2 text-c">
			<input type="text" required class="input-text radius size-M" placeholder="" name="position.name" id="<s:property value="#s.positionid"/>name" value="<s:property value="#s.name"/>">
			</td>
			<td class="col2 text-c">
			<span class="formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="shopid" id="shopid">
			<s:iterator value="shopList" id="a">
			<s:if test="#a.shop.shopid==#s.shop.shopid">
			<option value='<s:property value="#a.shop.shopid"/>' selected="selected"><s:property value="#a.shop.name"/></option>
			</s:if>
			
			<s:else>
			<option value='<s:property value="#a.shop.shopid"/>'><s:property value="#a.shop.name"/></option>
			</s:else>
			</s:iterator>
			</select>
			</span>
			</td>
			<td class="col2 text-c">
			<input class="btn radius btn-warning" type="button" value="修改职位" onclick="upd('<s:property value="#s.positionid"/>');">
			<input class="btn btn-danger radius" type="button" value="删除职位" onclick="del('<s:property value="#s.positionid"/>');">
			</td>
			</form>
			</tr>
			
			</s:iterator>
			
			<tr>
			<form action="Position!addSave.action" method="post" onsubmit="return add1()" name="add">
			<th class="col1 text-c">自动添加</th>
			<td class="col2 text-c">
			<input type="text" required class="input-text radius size-M" placeholder="" name="position.name" id="addname" value="">
			</td>
			<td class="col2 text-c">
			<span class="formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="shopid" id="shopid">
			<s:iterator value="shopList" id="x">
			<option value='<s:property value="#x.shop.shopid"/>'><s:property value="#x.shop.name"/></option>
			</s:iterator>
			</select>
			</span>
			</td>
			<td class="col2 text-c">
			<input class="btn btn-success radius"  type="submit"  value="添加职位">
			</td>
			</form>
			</tr>
		</tbody>
		
	</table>  
  </s:if>
  <s:else>
 
  </s:else>
  
   <span id="biuuu_city" class="text-c"></span>
  </div>
  <script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script> 
  <script src="lib/laypage/laypage.js"></script>
<!--ajax  -->

<s:if test="positionList!=null">
<script type="text/javascript">
function upd(a) {
	document.getElementById(a).action='Position!updSave.action';
	var x=document.getElementById(a+"name").value;
	if(x!="")
		{document.getElementById(a).submit();}
	else
	{
		alert("请输入职位名称！");
	}
	
}

function del(a) {
	document.getElementById(a).action='Position!delSave.action';
	document.getElementById(a).submit();
}

function add1()
{
	var x=document.getElementById("addname").value;
	if(x=="")
	{alert("职位名称不能为空！");
		return false;
	}
	
		
	
	}

</script>
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
$("#shopid").val("${shopid}");
</script>
</s:if>
<s:else></s:else>
 

 </body>
</html>
