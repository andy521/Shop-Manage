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
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.css" />
<link rel="stylesheet" type="text/css" href="lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="goods/styles.css" />
<style type="text/css">
    .btn-upload{position: relative; display:inline-block;height:36px; *display:inline;overflow:hidden;vertical-align:middle;cursor:pointer}
    .upload-url{cursor: pointer}
    .input-file{position:absolute; right:0; top:0; cursor: pointer; z-index:1; font-size:30em; *font-size:30px;opacity:0;filter: alpha(opacity=0)}
    .btn-upload .input-text{ width:auto;}
    .form-group .upload-btn{ margin-left:-1px}</style>
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
  
   <a href="javascript:history.go(-1)" class="btn btn-default radius f-r mt-20">返回用户</a>
	<h2>[库存管理-图码查询]</h2>
	<div class="line"></div>

		<section id="container" class="container">


    <div class="controls">
        <fieldset class="input-group">
	       <span class="btn-upload">
			  <a href="javascript:void();" class="btn btn-primary radius"><i class="iconfont">&#xf0020;</i> 浏览文件</a>
			  <input type="file" multiple name="file_0" class="input-file"  accept="image/*"  capture="camera">
			</span>
            <button  style="display:none;float: left;">Rerun</button>
			<button id="start" style="float: right;" class="btn btn-success radius">激活</button>
        </fieldset>
        <fieldset class="reader-config-group" style="display:none;">
            <label>
                <span>Barcode-Type</span>
                <select name="decoder_readers" id="decoder_readers" style="display:none;">
					
                    <option value="code_128" >Code 128</option>
                    <option value="code_39">Code 39</option>
                    <option value="code_39_vin">Code 39 VIN</option>
					<option value="ean" selected='selected'  id="ccc" >国产商品</option> 
                    <option value="ean_extended">EAN-extended</option>
                    <option value="ean_8">EAN-8</option>
                    <option value="upc">UPC</option>
                    <option value="upc_e">UPC-E</option>
                    <option value="codabar">Codabar</option>
                    <option value="i2of5">ITF</option>
                </select>
				
            </label>
            <label>
               
                <select name="input-stream_size" style="display:none;">
                    <option value="320">320px</option>
                    <option value="640">640px</option>
                    <option selected="selected" value="800">800px</option>
                    <option value="1280">1280px</option>
                    <option value="1600">1600px</option>
                    <option value="1920">1920px</option>
                </select>
            </label>
            <label>
               
                <select name="locator_patch-size" style="display:none;">
                    <option value="x-small">x-small</option>
                    <option value="small">small</option>
                    <option value="medium">medium</option>
                    <option selected="selected" value="large">large</option>
                    <option value="x-large">x-large</option>
                </select>
            </label>
            <label>
                
                <input type="checkbox" name="locator_half-sample" style="display:none;" />
            </label>
            <label>
              
                <input type="checkbox" name="input-stream_single-channel" style="display:none;" />
            </label>
            <label>
                
                <select name="numOfWorkers" style="display:none;">
                    <option value="0">0</option>
                    <option selected="selected" value="1">1</option>
                </select>
            </label>
        </fieldset>
    </div>
    <form action="house!selWebCam.action" method="post">
	   <table>
            <tr>
            <td>商店名称：</td>
            <td>
			<span class="formControls col-xs-5 select-box radius">
			<select class="select radius" size="1" name="shopid" id="shopid">
			<s:iterator value="shopList" id="a">
			<option value='<s:property value="#a.shop.shopid"/>'><s:property value="#a.shop.name"/></option>
			</s:iterator>
			</select>
			</span>
			
			</td>
            </tr>
            <tr>
            <td>
           	商品编码：
            </td>
            <td>
            <input type="text"  id="naah" name="barcode" class="input-text radius size-M">
            </td>
            </tr>
            </table>
      <input type="submit" class="btn btn-secondary radius" value="查询">
    </form>
  
</section>

<script src="goods/quagga.js" type="text/javascript"></script>
<script src="goods/file_input.js" type="text/javascript"></script>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script> 
<script src="goods/file_input.js" type="text/javascript"></script>
<script>

 $("#start").on("click",function (){
	 $("#decoder_readers").change();
	
 })

</script>
 </body>
</html>
