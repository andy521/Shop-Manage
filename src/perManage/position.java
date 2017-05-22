package perManage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import obj.Along;
import obj.Pershop;
import obj.Position;
import obj.Shop;

import org.apache.struts2.ServletActionContext;

import Dao.Del;
import Dao.Ins;
import Dao.Sel;
import Dao.Upd;

import com.opensymphony.xwork2.ActionSupport;

public class position extends ActionSupport {
	private String page = "1";
	private int count;
	public HttpSession session = ServletActionContext.getRequest().getSession();
	public HttpServletRequest request = ServletActionContext.getRequest();
	public HttpServletResponse response =ServletActionContext.getResponse();
	private String userid=(String) session.getAttribute("user_id");
	private List<Pershop> shopList=null;
	private List<Position> positionList=null;
	private String name;
	private String shopid;
	private Position position;
	
	
	
	
	
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
	public List<Position> getPositionList() {
		return positionList;
	}
	public void setPositionList(List<Position> positionList) {
		this.positionList = positionList;
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
	public Position getPosition() {
		return position;
	}
	public void setPosition(Position position) {
		this.position = position;
	}
	
	
	public void shopList() 
	{
		String shopsqlString="from Pershop a join fetch a.users x join fetch a.shop n where 1=1 and x.usersid='"+userid+"' ";
		setShopList(Sel.HSQL(shopsqlString));
	}

	public String toPosi() 
	{
		shopList();
		return "toPosi";
		
	}
	
	public String selposition() {
		String sqlString="from Position a join fetch a.shop s where 1=1 ";
		if(name!=null&&name.equals("")==false)
		{
			sqlString=sqlString+" and a.name like '%"+name+"%' ";
		}
		if (shopid!=null&&shopid.equals("")==false) 
		{
			sqlString=sqlString+" and s.shopid like '%"+shopid+"%' ";
		}
		
		sqlString=sqlString+" order by s.name desc";
		
		setPositionList(Sel.HSQL(sqlString, Integer.parseInt(page), 10));
		
		String shopsqlString="from Pershop a join fetch a.users x join fetch a.shop n where 1=1 and x.usersid='"+userid+"' ";
		setShopList(Sel.HSQL(shopsqlString, Integer.parseInt(page), 10));
		setCount(Sel.HSQL(sqlString).size());
		
		return "selPosi";
		
	}

	public String updSave()
	{	
		position.setShop((Shop)Sel.getHQL(Shop.class, shopid));
		Upd.UPD(position);
		shopid="";
		return selposition();
	}

	public String addSave()
	{
		System.out.println(shopid);
		position.setShop((Shop)Sel.getHQL(Shop.class, shopid));
		Ins.INS(position);
		shopid="";
		return selposition();
	}

	public String delSave()
	{
		Del.DEL(position);
		shopid="";
		return selposition();
	}


}
