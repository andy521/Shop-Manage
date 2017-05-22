package books;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import obj.Goods;
import obj.Goodshouse;
import obj.Logs;
import obj.Shop;
import obj.Users;

import org.apache.struts2.ServletActionContext;

import Dao.Sel;

import com.opensymphony.xwork2.ActionSupport;

public class booksManage extends ActionSupport {

	public HttpSession session = ServletActionContext.getRequest().getSession();
	public HttpServletRequest request = ServletActionContext.getRequest();
	public HttpServletResponse response =ServletActionContext.getResponse();
	private String page = "1";
	private int count;
	private String userid=(String) session.getAttribute("user_id");
	private String shopid;
	private String goodsid;
	private String barcode;
	private Goods goods=new Goods();
	private Shop shop=new Shop();
	private Goodshouse goodshouse=new Goodshouse();
	private String flag="0";
	private Users aUsers=(Users)Sel.getHQL(Users.class, userid);
	private Logs aLogs=new Logs();
	private double sell;
	private String mess=null;
	private List<Shop> shopList=null;
	private List<Goodshouse> goodshousesList;
	private String id;
	private String name;
	private String kind;
	private String number;
	private String buyprice;
	private String date1;
	private String date2;
	private String realname;
	private List<Logs> logs;
	private List groupby;
	
	
	
	
	public List getGroupby() {
		return groupby;
	}

	public void setGroupby(List groupby) {
		this.groupby = groupby;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
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

	public String getShopid() {
		return shopid;
	}

	public void setShopid(String shopid) {
		this.shopid = shopid;
	}

	public String getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Goodshouse getGoodshouse() {
		return goodshouse;
	}

	public void setGoodshouse(Goodshouse goodshouse) {
		this.goodshouse = goodshouse;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Users getaUsers() {
		return aUsers;
	}

	public void setaUsers(Users aUsers) {
		this.aUsers = aUsers;
	}

	public Logs getaLogs() {
		return aLogs;
	}

	public void setaLogs(Logs aLogs) {
		this.aLogs = aLogs;
	}

	public double getSell() {
		return sell;
	}

	public void setSell(double sell) {
		this.sell = sell;
	}

	public String getMess() {
		return mess;
	}

	public void setMess(String mess) {
		this.mess = mess;
	}

	public List<Shop> getShopList() {
		return shopList;
	}

	public void setShopList(List<Shop> shopList) {
		this.shopList = shopList;
	}

	public List<Goodshouse> getGoodshousesList() {
		return goodshousesList;
	}

	public void setGoodshousesList(List<Goodshouse> goodshousesList) {
		this.goodshousesList = goodshousesList;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getBuyprice() {
		return buyprice;
	}

	public void setBuyprice(String buyprice) {
		this.buyprice = buyprice;
	}

	public String getDate1() {
		return date1;
	}

	public void setDate1(String date1) {
		this.date1 = date1;
	}

	public String getDate2() {
		return date2;
	}

	public void setDate2(String date2) {
		this.date2 = date2;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public List<Logs> getLogs() {
		return logs;
	}

	public void setLogs(List<Logs> logs) {
		this.logs = logs;
	}

	
	
	
	public void shopList() {
		String shopsqlString="from Pershop a join fetch a.users x join fetch a.shop n where 1=1 and x.usersid='"+userid+"' ";
		setShopList(Sel.HSQL(shopsqlString, Integer.parseInt(page), 10));
	}
	
	
	public String tologs() {
		shopList();
		return "tologs";
	}
	
	public String logs() {
		shopList();
		String sqlString="from Logs a "
				+ "join fetch a.shop s "
				+ "join fetch a.goods g "
				+ "join fetch a.users u "
				+ "where 1=1 ";
		if (name!=null&&name.equals("")==false) 
		{
			sqlString=sqlString+" and g.name like '%"+name+"%'";
		}
		
		if (realname!=null&&realname.equals("")==false) 
		{
			sqlString=sqlString+" and u.realname like '%"+realname+"%'";
		}
		
		
			sqlString=sqlString+" and a.upkind like '%"+"sale"+"%'";
		
		
		 if(getDate1()!=null&&getDate2()!=null&&getDate1().equals("")==false&&getDate2().equals("")==false)
		 {
			 
			 sqlString=sqlString +" and (a.time between '"+getDate1()+"' and '"+getDate2()+"' ) ";
		 }
		 
		
		if (shopid!=null&&shopid.equals("")==false) 
		{
			sqlString=sqlString+" and s.shopid='"+shopid+"'";
		}
		sqlString=sqlString+" order by a.time desc ";
		System.out.println(sqlString);
		logs=Sel.HSQL(sqlString, Integer.parseInt(page), 10);
		count=Sel.HSQL(sqlString).size();
		flag="4";
		return "tologs";
	}

	public String selLog()
	{
		String sqlString="from Logs a "
				+ "join fetch a.shop s "
				+ "join fetch a.goods g "
				+ "join fetch a.users u "
				+ "where a.id='"+id+"'";
		logs=Sel.HSQL(sqlString);
		 
		return "sellogs";
	}
	
	public String togroupby() {
		shopList();
		return "togroupby";
	}
	
	public String groupby() {
		shopList();
		String sqlString="SELECT g.kind as kind,"
				+ "sum(a.number) as sum_number,"
				+ "sum(a.salemoney) as sum_salemoney "
				+ "FROM shopManage.dbo.logs AS a "
				+ "JOIN shopManage.dbo.goods g on a.goodsid = g.goodsid  "
				+ "JOIN shopManage.dbo.users u on a.operaid = u.usersid  "
				+ "JOIN shopManage.dbo.shop s on a.shopid = s.shopid  "
				+ "where a.upkind like '%sale%' ";
		if (realname!=null&&realname.equals("")==false) 
		{
			sqlString=sqlString+" and u.realname like '%"+realname+"%'";
		}
		
		
		
		
		 if(getDate1()!=null&&getDate2()!=null&&getDate1().equals("")==false&&getDate2().equals("")==false)
		 {
			 
			 sqlString=sqlString +" and (a.time between '"+getDate1()+"' and '"+getDate2()+"' ) ";
		 }
		 
		
		if (shopid!=null&&shopid.equals("")==false) 
		{
			sqlString=sqlString+" and s.shopid='"+shopid+"'";
		}
		
		sqlString=sqlString+ "group by g.kind";
		groupby=Sel.SSQL(sqlString);
		count=groupby.size();
		flag="4";
		 
		return "groupby";
	}
	
	public String groupby_all() {
		String sqlString="from Logs a "
						+ "join fetch a.goods g "
						+ "join fetch a.users u "
						+ "join fetch a.shop s "
						+ "where a.upkind like '%sale%' ";
		
		if (realname!=null&&realname.equals("")==false) 
		{
			sqlString=sqlString+" and u.realname like '%"+realname+"%'";
		}
		
		
		
		
		 if(getDate1()!=null&&getDate2()!=null&&getDate1().equals("")==false&&getDate2().equals("")==false)
		 {
			 
			 sqlString=sqlString +" and (a.time between '"+getDate1()+"' and '"+getDate2()+"' ) ";
		 }
		 
		
		if (shopid!=null&&shopid.equals("")==false) 
		{
			sqlString=sqlString+" and s.shopid='"+shopid+"'";
		}
		
		groupby=Sel.HSQL(sqlString, Integer.parseInt(page), 10);
		count=groupby.size();
		flag="4";
		 
		
		return "groupby_all";
	}
	

	
}
