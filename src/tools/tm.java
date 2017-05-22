package tools;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import obj.Goods;

import org.json.JSONException;
import org.json.JSONObject;

public class tm {
	
    public static String loadJson (String id) {  
    	String geturl="http://search.anccnet.com/searchResult2.aspx?keyword=";
        StringBuilder json = new StringBuilder();  
        try {  
            URL urlObject = new URL(geturl+id);  
            URLConnection uc = urlObject.openConnection();  
            uc.setRequestProperty("Host", "search.anccnet.com");
            uc.setRequestProperty("Referer", geturl+id);
         
            // 读取响应  
            int length = (int) uc.getContentLength();// 获取长度  
            InputStream is = uc.getInputStream();  
            if (length != -1) {  
                byte[] data = new byte[length];  
                byte[] temp = new byte[512];  
                int readLen = 0;  
                int destPos = 0;  
                while ((readLen = is.read(temp)) > 0) {  
                    System.arraycopy(temp, 0, data, destPos, readLen);  
                    destPos += readLen;  
                }  
                String result = new String(data, "gb2312"); // utf-8编码  
                return result;  
            }
//            BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream(),"utf-8")); 
//            String inputLine = null;  
//            while ( (inputLine = in.readLine()) != null) {  
//                json.append(inputLine);  
//            }  
//            in.close();  
        } catch (MalformedURLException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        return json.toString();  
    }  
    public static Goods getTm(String id) {
    	Goods goods=new Goods();
    	String tm = id;
		String sb = "";
		String cj = "";
		String mc = "";
		String ggxh = "";
		String ms = "";
		int beginIx = 0;
		int endIx = 0;
		String json = loadJson(id).replaceAll("\\s*", "");  
		try {
			
			beginIx = json.indexOf("<dt>商标：</dt><dd>");  
			endIx = json.indexOf("</dd><dt>发布厂家：</dt>");  
			sb = json.substring(beginIx+16, endIx); 
			
			beginIx = json.indexOf("mLink\"target=\"_blank\">");  
			endIx = json.indexOf("</a></dd></dl><dlclass=\"p-info\"><dt>商品条码：");  
			cj = json.substring(beginIx+22, endIx); 
			
			beginIx = json.indexOf("<dt>名称：</dt><dd>");  
			endIx = json.indexOf("</dd><dt>规格型号：</dt>");  
			mc = json.substring(beginIx+16, endIx); 
			
			beginIx = json.indexOf("<dt>规格型号：</dt><dd>");  
			endIx = json.indexOf("</dd><dt>描述：</dt>");  
			ggxh = json.substring(beginIx+18, endIx); 
			
			beginIx = json.indexOf("<dt>描述：</dt><dd>");  
			endIx = json.indexOf("</dd></dl><brclear=\"all\"/");  
			ms = json.substring(beginIx+16, endIx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			if(json.indexOf("暂时没有您要找的商品！")==-1)
			{
			beginIx = json.indexOf("企业名称（中文）：</td><td><spanid=\"firm_name\">")+38;  
			endIx = json.indexOf("</span></td></tr><tr><td>企业名称（英文）");  
			mc="目前没有该产品信息！请添加！";
			cj = json.substring(beginIx, endIx); }
			else 
			{
				mc="目前没有该产品信息！请添加！";
			}
			
		} 
		finally
		{
			goods.setGoodsid(tm);
			goods.setIdcard(tm);
			goods.setBounds(sb);
			goods.setFactory(cj);
			goods.setName(mc);
			goods.setWhight(ggxh);
			goods.setNote(ms);
		}
    	return goods;
	}

    public static void main(String[] args) throws JSONException {
		// TODO Auto-generated method stub
    	Goods aGoods=getTm("6900000000010");
    	System.out.println("0:"+aGoods.getGoodsid());
    	System.out.println("1:"+aGoods.getBounds());
    	System.out.println("2:"+aGoods.getFactory());
    	System.out.println("3:"+aGoods.getIdcard());
    	System.out.println("4:"+aGoods.getName());
    	System.out.println("5:"+aGoods.getNote());
    	System.out.println("6:"+aGoods.getWhight());
	}
}
