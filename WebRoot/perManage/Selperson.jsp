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
  <form action="perManage!searchPerson.action" method="post" name="sel">
  <input class="btn btn-secondary radius f-r mt-20" type="submit" value="查询">
  <a href='perManage!toAdd.action' class="btn btn-success radius f-r mt-20">新增人员</a>
	<h2>[人事管理-人员管理]</h2>
	<div class="line"></div>
  
	<table class="table table-bg  mt-10">
	<tr>
		<td width="50%">
			<!-- page -->
			<s:if test="userList!=null"><input type="hidden" name="page" value="${page}"></s:if>
			<s:else><input type="hidden" name="page" value="1"></s:else>
			登录名称/真实姓名：
			<input type="text" class="input-text radius size-M" placeholder="" name="name" id="name" value="${name}">
		</td>
		
		<td>
			电话号码：
			<input type="text" class="input-text radius size-M" placeholder="" name="tel" id="tel" value="${tel}">
			
		</td>
	</tr>
	<tr>
		<td>
			店铺名称：
			<span class="formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="shopid" id="shopid">
			<option value="xuanz">请选择！</option>
			<s:iterator value="shopList" id="a">
			<option value='<s:property value="#a.shop.shopid"/>'><s:property value="#a.shop.name"/></option>
			</s:iterator>
			</select>
			</span>
		</td>
		
		<td>
			店铺部门：
			<span class=" formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="alongid" id="alongid">
			
			</select>
			</span>
		</td>
	</tr>
	<tr>
		<td>
			用户上司：
			<span class="formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="headerid" id="headerid">
			</select>
			</span>
		</td>
		<td>
			用户职位：
			<span class="formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="positionid" id="positionid">
			
			</select>
			</span>
		</td>
	</tr>
	</table>
	</form>
  
  <s:if test="userList!=null">
  <table class="table table-border table-bordered table-hover table-bg mt-10">

		<thead>
			<tr>
				<th class="col1">序号</th>
				<th class="col2">登录名称</th>
				<th class="col3">真实姓名</th>
				<th class="col3">所属店铺</th>
				<th class="col3">所属部门</th>
				<th class="col3">店铺职位</th>
				<th class="col3">联系方式</th>
				<th class="col3">上司名称</th>
				<th class="col3">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="userList" status="a" id="s">
			<tr>
			<th class="col1 text-c"><s:property value="#a.count" /></th>
			<td class="col2 text-c"><s:property value="#s.username"/></td>
			<td class="col2 text-c"><s:property value="#s.realname"/></td>
			<td class="col2 text-c"><s:property value="#s.shop.name"/></td>
			<td class="col2 text-c"><s:property value="#s.along.alongname"/></td>
			<td class="col2 text-c"><s:property value="#s.position.name"/></td>
			<td class="col2 text-c"><s:property value="#s.tel"/></td>
			<td class="col2 text-c"><s:property value="#s.users.realname"/></td>
			<td class="col2 text-c">
			<a href="javascript:PrivilegePage('<s:property value="#s.usersid"/>')" class="btn btn-primary radius">权限授权</a>&nbsp;&nbsp;&nbsp;
			<a href="perManage!selPer.action?usersid=<s:property value="#s.usersid"/>" class="btn btn-warning radius">员工信息</a>&nbsp;&nbsp;&nbsp;
			<a href="perManage!DelPer.action?usersid=<s:property value="#s.usersid"/>" class="btn btn-danger radius">删除员工</a>&nbsp;&nbsp;&nbsp;
			</td>
			
			</tr>
			
			</s:iterator>
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
<script>  
function PrivilegePage(str)
{
	var url="perManage!PrivilegeList.action?usersid="+str;
	window.open(url, 'newwindow', 'height=500, width=300, top='+Math.round((window.screen.height-400)/2-100)+',left='+Math.round((window.screen.width-400)/2)+',toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');

}

        $("#shopid").change(function(){
        	//along
            var url = "perManage!alongAjax.action?shopid="+$("#shopid").val();  
            $("#alongid").empty();
            $.ajax({  
                type:'get',  
                url:url,  
                dataType: 'json',  
                success:function(data){  
                	$("#alongid").append("<option></option>");
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
                	$("#positionid").append("<option></option>");
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
                	$("#headerid").append("<option></option>");
                    $.each(data,function(i,list){  
                    	$("#headerid").append("<option value='"+list.usersid+"'>"+list.realname+"</option>");

                    });  
                }  
            });
              
        });  
    </script>  

<s:if test="userList!=null">
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
 
 <s:if test="userList!=null">
 
 <script>
 $("#shopid").val("${shopid}");
 $("#shopid").change();

 var test = setTimeout(function(){
	 $("#alongid").val("${alongid}");
	 $("#headerid").val("${headerid}");
	 $("#positionid").val("${positionid}");
 },200);
 </script>
 
 
 </s:if>
 </body>
</html>
