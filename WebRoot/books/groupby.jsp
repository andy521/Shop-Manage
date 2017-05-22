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
  
   <form action="books!groupby.action"  method="post" id="demoform" class="form form-horizontal responsive" name="sel">
    <input class="btn btn-secondary radius f-r mt-20" type="submit" value="查询">
	<h2>[账本管理-种类汇总]</h2>
	<div class="line"></div>
  

   <input type="hidden"  name="page" value="<s:property value="page"/>">
	<table class="table table-bg  mt-10">
	
	<tr>
		<td>
			操作时间：
			从<input type="text" class="input-text radius size-M Wdate" onClick="WdatePicker()" value="<s:property value="date1"/>" name="date1" id="date1">
		</td>
		
		<td>
			至<input type="text" class="input-text radius size-M Wdate" onClick="WdatePicker()" value="<s:property value="date2"/>" name="date2" id="date2">
		</td>
	</tr>
	<tr>
		<td>
			操作人员：
			<input type="text"   class="input-text radius size-M" placeholder="" value="<s:property value="realname"/>" name="realname" id="realname" >
		</td>
		<td>
			商店名称：
			<span class="formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="shopid" id="shopid">
			<s:iterator value="shopList" id="a">
			<option value='<s:property value="#a.shop.shopid"/>'><s:property value="#a.shop.name"/></option>
			</s:iterator>
			</select>
			</span>
		</td>
	</tr>
	</table>
	</form>
 

  
  <s:if test="flag==4">
  <table class="table table-border table-bordered table-hover table-bg mt-10">
		<thead>
			<tr>
				<th class="col1">序号</th>
				<th class="col2">商品种类</th>
				<th class="col3">售卖数量</th>
				<th class="col3">售卖金额</th>
				<th class="col3">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="groupby" status="b" id="s">
			<tr>
			
			<th class="col1 text-c"><s:property value="#b.count"/></th>
			<td class="col2 text-c">
			<s:property value="#s.kind"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.sum_number"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.sum_salemoney"/>
			</td>
			<td class="col2 text-c">
			<input class="btn btn-primary radius" onclick="document.sel.page.value=1;document.sel.action='books!groupby_all.action';document.sel.submit();" value="详细信息" type="button">
			</td>
			
			</tr>
			</s:iterator>
		</tbody>
		
	</table>  
  </s:if>
  
  

  
   <span id="biuuu_city" class="text-c"></span>
  </div>
  <script language="javascript" type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
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
$("#kind").val("${kind}");
$("#shopid").val("${shopid}");


</script>
</s:if>
<s:else></s:else>
<script type="text/javascript">
function all()
{
	
}
</script>

 </body>
</html>
