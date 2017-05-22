package house;

import java.sql.Timestamp;
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

public class houseManage extends ActionSupport {

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
	
	
	
 	public List<Logs> getLogs() {
		return logs;
	}
	public void setLogs(List<Logs> logs) {
		this.logs = logs;
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
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	public String getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<Goodshouse> getGoodshousesList() {
		return goodshousesList;
	}
	public void setGoodshousesList(List<Goodshouse> goodshousesList) {
		this.goodshousesList = goodshousesList;
	}
	public List<Shop> getShopList() {
		return shopList;
	}
	public void setShopList(List<Shop> shopList) {
		this.shopList = shopList;
	}
	public Goodshouse getGoodshouse() {
		return goodshouse;
	}
	public void setGoodshouse(Goodshouse goodshouse) {
		this.goodshouse = goodshouse;
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
	public Logs getaLogs() {
		return aLogs;
	}
	public void setaLogs(Logs aLogs) {
		this.aLogs = aLogs;
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

	
	
	
	
	public void shopList() {
		String shopsqlString="from Pershop a join fetch a.users x join fetch a.shop n where 1=1 and x.usersid='"+userid+"' ";
		setShopList(Sel.HSQL(shopsqlString, Integer.parseInt(page), 10));
	}
	
	public String togoods() {
		return "togoods";
		
	}
	
	public String toWebCam() {
		shopList();
		return "toWebCam";
	}
	
	public String toFile() {
		shopList();
		return "toFile";
	}
	
	public String toSub() {
		shopList();
		return "toSub";
	}
	
	public String selWebCam()
	{
		
		flag="1";
		goodshouse=(Goodshouse)Sel.getObj("from Goodshouse a "
								+ "join fetch a.shop s "
								+ "join fetch a.goods g "
								+ "where s.shopid='"+shopid+"' "
								+ "and g.idcard='"+barcode+"'");
		
		if (goodshouse==null) {
			goods=(Goods)Sel.getObj("from Goods g where g.idcard='"+barcode+"'");
			return "tianjia";
		}
		else {
			return "togoods";
		}
		
	
	}

	public String search()
	{
		flag="2";
		String sqlString="from Goodshouse a "
						+ "join fetch a.shop s "
						+ "join fetch a.goods g where 1=1 ";
		if (name!=null&&name.equals("")==false) 
		{
			sqlString=sqlString+" and g.name like '%"+name+"%'";
		}
		
		if (barcode!=null&&barcode.equals("")==false) 
		{
			sqlString=sqlString+" and g.idcard like '%"+barcode+"%'";
		}
		
		if (kind!=null&&kind.equals("")==false) 
		{
			sqlString=sqlString+" and g.kind like '%"+kind+"%'";
		}
		
		if (number!=null&&number.equals("")==false) 
		{
			sqlString=sqlString+" and a.number='"+number+"'";
		}
		
		if (buyprice!=null&&buyprice.equals("")==false) 
		{
			sqlString=sqlString+" and a.buyprice='"+buyprice+"'";
		}
		
		if (shopid!=null&&shopid.equals("")==false) 
		{
			sqlString=sqlString+" and s.shopid='"+shopid+"'";
		}
		
		goodshousesList=Sel.HSQL(sqlString, Integer.parseInt(page), 10);
		count=Sel.HSQL(sqlString).size();
		return "togoods";
		
		
		
		
	}

	public String Del() {
		goodshouse=(Goodshouse)Sel.getObj("from Goodshouse g "
													+ "join fetch g.goods a "
													+ "join fetch g.shop s "
													+ "where g.id='"+id+"'");
		if(goodshouse!=null)
		{
		aLogs.setGoods(goodshouse.getGoods());
		aLogs.setShop(goodshouse.getShop());
		aLogs.setTime(new Timestamp(System.currentTimeMillis()));
		aLogs.setUpkind("delhouse");
		aLogs.setUsers(aUsers);
		aLogs.setLastnumber(0.0);
		Ins.INS(aLogs);
		Dao.Del.DEL(goodshouse);
		}
		
		return "togoods";
	}

	public String  toUpd() 
	{
		goodshouse=(Goodshouse)Sel.getObj("from Goodshouse g "
										+ "join fetch g.shop s "
										+ "join fetch g.goods d "
										+ "where g.id='"+id+"'");
		return "toUpd";
	}
	public String UpdSave() 
	{
		goodshouse=(Goodshouse)Sel.getHQL(Goodshouse.class, id);
		goods=(Goods)Sel.getHQL(Goods.class,goodsid);
		shop=(Shop)Sel.getHQL(Shop.class,shopid);
		aLogs.setNumber(goodshouse.getNumber());
		goodshouse.setNumber(Double.parseDouble(number));
		goodshouse.setGoods(goods);
		goodshouse.setShop(shop);
		goodshouse.setBuyprice(Double.parseDouble(buyprice));
		Upd.UPD(goodshouse);
		aLogs.setLastnumber(goodshouse.getNumber());
		aLogs.setGoods(goodshouse.getGoods());
		aLogs.setShop(goodshouse.getShop());
		aLogs.setTime(new Timestamp(System.currentTimeMillis()));
		aLogs.setUpkind("updhouse");
		aLogs.setUsers(aUsers);
		Ins.INS(aLogs);
		return "togoods";
	}
	public String AddSave() 
	{
		
		goods=(Goods)Sel.getHQL(Goods.class,goodsid);
		shop=(Shop)Sel.getHQL(Shop.class,shopid);
		goodshouse.setNumber(Double.parseDouble(number));
		goodshouse.setGoods(goods);
		goodshouse.setShop(shop);
		goodshouse.setBuyprice(Double.parseDouble(buyprice));
		Ins.INS(goodshouse);
		aLogs.setGoods(goodshouse.getGoods());
		aLogs.setNumber(0.0);
		aLogs.setLastnumber(Double.parseDouble(number));
		aLogs.setShop(goodshouse.getShop());
		aLogs.setTime(new Timestamp(System.currentTimeMillis()));
		aLogs.setUpkind("addhouse");
		aLogs.setUsers(aUsers);
		Ins.INS(aLogs);
		return "togoods";
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
		
		if (kind!=null&&kind.equals("")==false) 
		{
			sqlString=sqlString+" and a.upkind like '%"+kind+"%'";
		}
		else 
		{
			sqlString=sqlString+" and ((a.upkind like '%"+"house"+"%') or (a.upkind like '%"+"sale"+"%'))";
		}
		
		 if(getDate1()!=null&&getDate2()!=null&&getDate1().equals("")==false&&getDate2().equals("")==false)
		 {
			 
			 sqlString=sqlString +" and (a.time between '"+getDate1()+"' and '"+getDate2()+"' ) ";
		 }
		 
		
		if (shopid!=null&&shopid.equals("")==false) 
		{
			sqlString=sqlString+" and s.shopid='"+shopid+"'";
		}
		
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

	
}
