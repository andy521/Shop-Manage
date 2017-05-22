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
  
  <a href="javascript:history.go(-1)" class="btn btn-default radius f-r mt-20">返回用户</a>
	<h2>[商品查询-扫码查询]</h2>
	<div class="line"></div>

		  <section id="container" class="container">
       
        <div class="controls">
            <fieldset class="input-group">
          
            <button id="start"  class="btn btn-success radius">激活</button>
            <button class="stop btn btn-danger radius" id="stop">停止</button>
              <form action="goods!selWebCam.action" method="post">
            <input type="text" required id="naah" name="barcode" class="input-text radius size-M">
            <input type="submit" class="btn btn-secondary radius" value="查询">
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

      
      </div>

  <script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script> 
  <script src="goods/quagga.js" type="text/javascript"></script>
  <script src="goods/aaa.js" type="text/javascript"></script>
<script>
//webcam
 $("#start").on("click",function (){

	 $("#decoder_readers").change();
 })

</script>
 </body>
</html>
