<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.7/iconfont.css" />
<style>
.a1{background-color:rgba(238,238,238,0.98);
border-right:1px solid #e5e5e5;}
dt{border-bottom:1px solid #e5e5e5;}
</style>
</head>
<body>
<s:if test="flag==1">
<script type="text/javascript">
alert("授权成功！即将关闭本页！");
window.close();
</script>

</s:if>
<form action="perManage!PrivilegeSave.action" method="post" >
<input type="hidden" name="usersid" value="${usersid}">
<table>
<tr>
<td align="left"><input class="btn btn-success radius" type="submit" value="授权"></td>
<td align="right"><input class="btn btn-warning radius" type="button" value="关闭" onclick="javascript:window.close();">
</td>
<tr>
</table>
<aside class="a1">
<div class="menu_dropdown bk_2">
<s:iterator value="#session.nav" id="w">
	<s:if test="#w.uses.isone==0">
		<dl id="menu<s:property value="#w.uses.useid"/>" >
			<dt>
			<input type="checkbox" id="<s:property value="#w.uses.useid"/>" name="checkbox2" value="<s:property value="#w.uses.useid"/>">
			<s:property value="#w.uses.name"/><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>	
			<dd >
				<ul>
					<s:iterator value="#session.nav" id="b">
						<s:if test="#b.uses.parentid==#w.uses.useid">
							<li>
								<div class="check-box">
									<input type="checkbox" id="<s:property value="#b.uses.useid"/>" name="checkbox2" value="<s:property value="#b.uses.useid"/>">
									<s:property value="#b.uses.name"/>
								</div>
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
</form>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>  
<script>

var box=document.getElementsByName("checkbox2");
<s:iterator value="usersList" id="a">
for(var i=0;i<box.length;i++)
	{
	if(box[i].value=="<s:property value="#a.uses.useid" />")
		{
		box[i].checked = true;
		}
	}
</s:iterator>

</script>

</body>
</html>