package tools;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JSONObject;
import obj.Goods;

import org.json.JSONException;

public class tm
{

	public static JSONObject loadJson(String id)
	{
		String geturl = "http://123.206.28.198/ANCC/info?username=&key=&id=" + id;
		StringBuilder json = new StringBuilder();
		try
		{

			URL urlObject = new URL(geturl);
			HttpURLConnection uc = (HttpURLConnection) urlObject.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream(), "utf-8"));
			String inputLine = null;
			while ((inputLine = in.readLine()) != null)
			{
				json.append(inputLine);
			}
			in.close();
			JSONObject jsonObject = JSONObject.fromObject(json.toString());
			return jsonObject;
			//				System.out.println(jsonObject);
		}
		catch (MalformedURLException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		return null;

	}

	public static Goods getTm(String id)
	{
		Goods goods = new Goods();
		JSONObject json = loadJson(id);
		try
		{

			goods.setName(json.getJSONObject("d").getString("ItemName"));
			goods.setIdcard(id);
			goods.setFactory(json.getJSONObject("d").getString("FirmAddress"));
			goods.setSavetime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			goods.setBounds(json.getJSONObject("d").getString("BrandName"));
			goods.setWhight(json.getJSONObject("d").getString("ItemSpecification") + " " + json.getJSONObject("d").getString("ItemWidth") + " "
					+ json.getJSONObject("d").getString("ItemHeight"));
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
		}
		finally
		{
		}
		return goods;
	}

	public static void main(String[] args) throws JSONException
	{

	}
}
