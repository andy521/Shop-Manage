package perManage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import obj.Along;
import obj.Pershop;
import obj.Shop;

import org.apache.struts2.ServletActionContext;

import Dao.Del;
import Dao.Ins;
import Dao.Sel;
import Dao.Upd;

import com.opensymphony.xwork2.ActionSupport;

public class along extends ActionSupport {
	private String page = "1";
	private int count;
	public HttpSession session = ServletActionContext.getRequest().getSession();
	public HttpServletRequest request = ServletActionContext.getRequest();
	public HttpServletResponse response =ServletActionContext.getResponse();
	private String userid=(String) session.getAttribute("user_id");
	private List<Pershop> shopList=null;
	private List<along> alongs=null;
	private String name;
	private String shopid;
	private Along along=new Along();
	
	
	
	


	public Along getAlong() {
		return along;
	}

	public void setAlong(Along along) {
		this.along = along;
	}

	public List<along> getAlongs() {
		return alongs;
	}

	public void setAlongs(List<along> alongs) {
		this.alongs = alongs;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShopid() {
		return shopid;
	}

	public void setShopid(String shopid) {
		this.shopid = shopid;
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

	public List<Pershop> getShopList() {
		return shopList;
	}

	public void setShopList(List<Pershop> shopList) {
		this.shopList = shopList;
	}

	
	
	
	
	
	public void shopList() {
		String shopsqlString="from Pershop a join fetch a.users x join fetch a.shop n where 1=1 and x.usersid='"+userid+"' ";
		setShopList(Sel.HSQL(shopsqlString));
		
	}
	
	public String toAlong() {
		shopList();
		return "toAlong";
		
	}
	
	public String selalong() {
		String sqlString="from Along a join fetch a.shop s where 1=1 ";
		if(name!=null&&name.equals("")==false)
		{
			sqlString=sqlString+" and a.alongname like '%"+name+"%' ";
		}
		if (shopid!=null&&shopid.equals("")==false) 
		{
			sqlString=sqlString+" and s.shopid like '%"+shopid+"%' ";
		}
		
		sqlString=sqlString+" order by s.name desc";
		
		setAlongs(Sel.HSQL(sqlString, Integer.parseInt(page), 10));
		
		String shopsqlString="from Pershop a join fetch a.users x join fetch a.shop n where 1=1 and x.usersid='"+userid+"' ";
		setShopList(Sel.HSQL(shopsqlString, Integer.parseInt(page), 10));
		setCount(Sel.HSQL(sqlString).size());
		
		return "selAlong";
		
	}

	public String updSave()
	{	
		along.setShop((Shop)Sel.getHQL(Shop.class, shopid));
		Upd.UPD(along);
		shopid="";
		return selalong();
	}

	public String addSave()
	{
		along.setShop((Shop)Sel.getHQL(Shop.class, shopid));
		Ins.INS(along);
		shopid="";
		return selalong();
	}

	public String delSave()
	{
		Del.DEL(along);
		shopid="";
		return selalong();
	}

}
