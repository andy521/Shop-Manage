package goods;

import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import obj.Goods;
import obj.Goodshouse;
import obj.Logs;
import obj.Sale;
import obj.Shop;
import obj.Users;

import org.apache.struts2.ServletActionContext;

import tools.tm;
import Dao.Ins;
import Dao.Sel;
import Dao.Upd;

import com.opensymphony.xwork2.ActionSupport;

public class goodsManage extends ActionSupport {

	public HttpSession session = ServletActionContext.getRequest().getSession();
	public HttpServletRequest request = ServletActionContext.getRequest();
	public HttpServletResponse response =ServletActionContext.getResponse();
	private String page = "1";
	private int count;
	private String userid=(String) session.getAttribute("user_id");
	private String shopid=(String) session.getAttribute("shopid");
	private String barcode;
	private Goods goods=new Goods();
	private List<Goods> goodsList=null;
	private String flag="0";
	private List<Sale> sales=null;
	private Users aUsers=(Users)Sel.getHQL(Users.class, userid);
	private Sale aSale=new Sale();
	private Logs aLogs=new Logs();
	private double sell;
	private String mess=null;
	private String id=null;
	private String goodsid=null;
	
	
	
	public String getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMess() {
		return mess;
	}
	public void setMess(String mess) {
		this.mess = mess;
	}
	public double getSell() {
		return sell;
	}
	public void setSell(double sell) {
		this.sell = sell;
	}
	public String getShopid() {
		return shopid;
	}
	public void setShopid(String shopid) {
		this.shopid = shopid;
	}
	public Users getaUsers() {
		return aUsers;
	}
	public void setaUsers(Users aUsers) {
		this.aUsers = aUsers;
	}
	public Sale getaSale() {
		return aSale;
	}
	public void setaSale(Sale aSale) {
		this.aSale = aSale;
	}
	public Logs getaLogs() {
		return aLogs;
	}
	public void setaLogs(Logs aLogs) {
		this.aLogs = aLogs;
	}
	public List<Sale> getSales() {
		return sales;
	}
	public void setSales(List<Sale> sales) {
		this.sales = sales;
	}
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPage() {
		return page;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	
	
	
	
	
	
	public String togoods() {
		return "togoods";
		
	}
	
	public String toWebCam() {
		return "toWebCam";
	}
	
	public String toFile() {
		return "toFile";
	}
	
	public String toSub() {
		return "toSub";
	}
	
	public String selWebCam()
	{
		flag="1";
		goods=(Goods)Sel.getObj("from Goods a where a.idcard='"+barcode+"'");
		if (goods==null) {
			goods=tm.getTm(barcode);
			//数据库查不到，网络抓不到时，手动输入
			if(tm.getTm(barcode).getName().indexOf("目前没有该产品信息")!=-1)
			{
				return "tianjia";
			}
			else 
			{
				//数据库查不到，能抓到时
				
				Ins.INS(goods);
				return "toUpd";
			}
			
		} else 
		{//数据库能找到时
			return "togoods";
		}
		
	}

	public String search()
	{
		flag="2";
		String sqlString="from Goods g where 1=1 ";
		if (goods.getName()!=null&&goods.getName().equals("")==false) 
		{
			sqlString=sqlString+" and g.name='"+goods.getName()+"'";
		}
		
		if (goods.getIdcard()!=null&&goods.getIdcard().equals("")==false) 
		{
			sqlString=sqlString+" and g.idcard='"+goods.getIdcard()+"'";
		}
		
		if (goods.getBounds()!=null&&goods.getBounds().equals("")==false) 
		{
			sqlString=sqlString+" and g.bounds='"+goods.getBounds()+"'";
		}
		
		if (goods.getFactory()!=null&&goods.getFactory().equals("")==false) 
		{
			sqlString=sqlString+" and g.factory='"+goods.getFactory()+"'";
		}
		
		if (goods.getWhight()!=null&&goods.getWhight().equals("")==false) 
		{
			sqlString=sqlString+" and g.whight='"+goods.getWhight()+"'";
		}
		
		if (goods.getNote()!=null&&goods.getNote().equals("")==false) 
		{
			sqlString=sqlString+" and g.note='"+goods.getNote()+"'";
		}
		
		goodsList=Sel.HSQL(sqlString, Integer.parseInt(page), 10);
		count=Sel.HSQL(sqlString).size();
		return "togoods";
		
		
		
		
	}

	public String Del() {
		Dao.Del.DEL(goods);
		return "togoods";
	}

	public String  toUpd() 
	{
		goods=(Goods)Sel.getHQL(Goods.class, goods.getGoodsid());
		return "toUpd";
	}
	public String UpdSave() 
	{
		Upd.UPD(goods);
		return "togoods";
	}
	public String AddSave() 
	{
		Ins.INS(goods);
		return "togoods";
	}

	public String toSale()
	{
		sell=0;
		String sqlString="from Sale s join fetch s.goods g join fetch s.users u where u.usersid='"+userid+"'";
		sales=Sel.HSQL(sqlString);
		flag="3";
		for (Sale a : sales) 
		{
			sell=sell+a.getGoods().getSellprice()*a.getCount();
		}
		
		return "toSale";
	}
	
	public String addSale() 
	{
		Goodshouse aGoodshouse=(Goodshouse)Sel.getObj("from Goodshouse g join fetch g.goods a where a.idcard='"+barcode+"'");
		goods=(Goods)Sel.getObj("from Goods a where a.idcard='"+barcode+"'");
		if (aGoodshouse.getNumber()>0) {
			aSale.setGoods(goods);
			aSale.setUsers(aUsers);
			aSale.setCount(1);
			Ins.INS(aSale);
			return toSale();
		}
		else {
			mess=aGoodshouse.getGoods().getName()+"在仓库中库存不足！";
			return toSale();
		}
		
	}
	
	public String updSale() 
	{
		
		Goodshouse aGoodshouse=(Goodshouse)Sel.getObj("from Goodshouse g join fetch g.shop s join fetch g.goods a where a.goodsid='"+goodsid+"'");
		if (aGoodshouse.getNumber()>=count) {
			aSale=(Sale)Sel.getHQL(Sale.class, id);
			aSale.setCount(count);
			Upd.UPD(aSale);
			return toSale();
		}
		else {
			mess=aGoodshouse.getGoods().getName()+"在仓库中库存不足！";
			return toSale();
		}
		
		
		
	}
	
	public String delSale() 
	{
		aSale=(Sale)Sel.getHQL(Sale.class, id);
		Dao.Del.DEL(aSale);
		return toSale();
	}

	public String saleSave()
	{
		String sqlString="from Sale s join fetch s.goods g join fetch s.users u where u.usersid='"+userid+"'";
		sales=Sel.HSQL(sqlString);
		for (Sale a : sales) 
		{
			aLogs.setShop((Shop)Sel.getHQL(Shop.class, shopid));
			aLogs.setGoods(a.getGoods());
			aLogs.setTime(new Timestamp(System.currentTimeMillis()));
			aLogs.setUpkind("sale");
			aLogs.setNumber((double)a.getCount());
			Goodshouse aGoodshouse=(Goodshouse)Sel.getObj("from Goodshouse g join fetch g.goods a join fetch g.shop s where s.shopid='"+shopid+"' and a.goodsid='"+a.getGoods().getGoodsid()+"'");
			aLogs.setLastnumber(aGoodshouse.getNumber()-(double)a.getCount());
			aGoodshouse.setNumber(aGoodshouse.getNumber()-(double)a.getCount());
			Upd.UPD(aGoodshouse);
			aLogs.setUsers(aUsers);
			aLogs.setSalemoney(a.getGoods().getSellprice()*(double)a.getCount());
			Ins.INS(aLogs);
			Dao.Del.DEL(a);
		}
		return toSale();
	}



}
