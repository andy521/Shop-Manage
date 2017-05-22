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
<style type="text/css">
#interactive.viewport {
  width: 160px;
  height: 120px;
}

/* line 6, ../sass/_viewport.scss */
#interactive.viewport canvas, video {
  float: left;
  width: 160px;
  height: 120px;
}
</style>
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
 <s:if test="mess!=null">
 <script type="text/javascript">
 alert("${mess}");
 </script>
 </s:if>
  <div class="container">
  

	<h2>[商品查询-商品售卖]</h2>
	<div class="line"></div>

		  <section id="container" class="container">
       
        <div class="controls">
            <fieldset class="input-group">
            <button id="start"  class="btn btn-success radius">激活</button>
            <button class="stop btn btn-danger radius" id="stop">停止</button>
              <form action="goods!addSale.action" method="post">
            <input type="text" required id="naah" name="barcode" class="input-text radius size-M">
            <input type="submit" class="btn btn-secondary radius" value="添加">
            </form>
            </fieldset>
            <br>
            <fieldset class="reader-config-group">
               
                    <select name="decoder_readers" id="decoder_readers" style="display:none;">                     
                        <option value="ean" >请选择模式</option>
                        <option value="ean"  selected="selected" id="ccc" >国产商品</option> 
                    </select>
                <label>
                   
                    <select name="input-stream_constraints" style="display:none;">
                        <option  value="320x240">320px</option>
                        <option selected="selected" value="640x480">640px</option>
                        <option value="800x600">800px</option>
                        <option value="1280x720">1280px</option>
                        <option value="1600x960">1600px</option>
                        <option value="1920x1080">1920px</option>
                    </select>
                </label>
                <label>
                    
                    <select name="locator_patch-size" style="display:none;">
                        <option selected="selected" value="x-small">x-small</option>
                        <option value="small">small</option>
                        <option  value="medium">medium</option>
                        <option value="large">large</option>
                        <option value="x-large">x-large</option>
                    </select>
                </label>
                <label>
                   
                    <input type="checkbox" checked="checked" name="locator_half-sample" id="locator_half-sample" style="display:none;"/>
                </label>
                <label>
                    
                    <select name="numOfWorkers" style="display:none;">
                        <option value="0">0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option selected="selected" value="4">4</option>
                        <option  value="8">8</option>
                    </select>
                </label>
            </fieldset>
        </div>
      <div id="interactive" class="viewport"></div>
    </section>
	<s:if test="flag=3">
	 
              
               
          
           <table class="table table-border table-bordered table-hover table-bg mt-10">
           <tr>
           <td>
           <input type="text" onchange="js();"  id="shouqu" name="shouqu" class="input-text radius size-M">
           </td>
           <td>
           <input type="text" readonly value="${sell}" id="sell" name="sell" class="input-text radius size-M">
           </td>
           <td>
           <input type="text" readonly id="jisuan" name="jisuan" class="input-text radius size-M">
           </td>
           <td>
           <a href="goods!saleSave.action" class="btn btn-primary radius ">商品结算</a>&nbsp;&nbsp;&nbsp;
           </td>
           </tr>
           </table>
	 <table class="table table-border table-bordered table-hover table-bg mt-10">
		<thead>
			<tr>
				<th class="col1">序号</th>
				<th class="col2">商品名称</th>
				<th class="col3">商品价格</th>
				<th class="col3">商品数量</th>
				<th class="col3">操作</th>
				
			</tr>
		</thead>
		<tbody>
		<s:iterator value="sales" status="n" id="s">
			<form action="" method="post" name="<s:property value="#s.id"/>" id="<s:property value="#s.id"/>">
			<tr>
			<th class="col1 text-c">
			<s:property value="#n.count"/>
			<input type="hidden" name="id" value="<s:property value="#s.id"/>">
			<input type="hidden" name="goodsid" value="<s:property value="#s.goods.goodsid"/>">
			</th>
			<td class="col2 text-c">
			<s:property value="#s.goods.name"/>
			</td>
			<td class="col2 text-c">
			<s:property value="#s.goods.sellprice"/>
			</td>
			<td class="col2 text-c">
			  <input type="number" value="<s:property value="#s.count"/>" required id="count" name="count" class="input-text radius size-M">
			</td>
			<td class="col2 text-c">
			<input class="btn radius btn-warning" type="button" value="修改" onclick="upd('<s:property value="#s.id"/>');">
			<input class="btn btn-danger radius" type="button" value="删除" onclick="del('<s:property value="#s.id"/>');">
			</td>
			</tr>
			</form>
			</s:iterator>
		</tbody>
		
	</table>  
	
	
	</s:if>
      
      </div>

  <script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script> 
  <script src="goods/quagga.js" type="text/javascript"></script>
  <script src="goods/aaa.js" type="text/javascript"></script>
<script>
//webcam
 $("#start").on("click",function (){

	 $("#decoder_readers").change();
 });
 
function upd(a) {
	document.getElementById(a).action='goods!updSale.action';
	document.getElementById(a).submit();
	
	
}

function del(a) {
	document.getElementById(a).action='goods!delSale.action';
	document.getElementById(a).submit();
}

function js()
{
	if(!isNaN(document.getElementById("jisuan").value)){
		document.getElementById("jisuan").value=document.getElementById("shouqu").value-document.getElementById("sell").value;
		}else{
		   alert("输入的不是数字！");
		}
	
}
</script>
 </body>
</html>
