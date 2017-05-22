package shopManage;

import java.util.List;

import javassist.expr.NewArray;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import obj.Pershop;
import obj.Shop;
import obj.Users;
import obj.Uses;
import tools.HSession;
import tools.MD5;
import Dao.Del;
import Dao.Ins;
import Dao.Sel;
import Dao.Upd;

import com.opensymphony.xwork2.ActionSupport;

public class shopManage extends ActionSupport {
	public HttpSession session = ServletActionContext.getRequest().getSession();
	public HttpServletRequest request = ServletActionContext.getRequest();
	private String shopid=(String) session.getAttribute("shopid");
	private String userid=(String) session.getAttribute("user_id");
	
	private String pershopid;
	private String powerid;
	private List usersList;
	private String gufen;
	private List<Shop> shopList=null;
	private String page = "1";
	private String name =null;
	private String kind=null;
	private Shop shop=null;
	private Users users1=null;
	private List<Users> userList=null;
	private int count=0;

	
	
	public String getPershopid() {
		return pershopid;
	}

	public void setPershopid(String pershopid) {
		this.pershopid = pershopid;
	}

	public String getGufen() {
		return gufen;
	}

	public void setGufen(String gufen) {
		this.gufen = gufen;
	}

	public List getUsersList() {
		return usersList;
	}

	public void setUsersList(List usersList) {
		this.usersList = usersList;
	}

	public String getShopid() {
		return shopid;
	}

	public void setShopid(String shopid) {
		this.shopid = shopid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
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

	public List<Shop> getShopList() {
		return shopList;
	}

	public void setShopList(List<Shop> shopList) {
		this.shopList = shopList;
	}

	public String getPowerid() {
		return powerid;
	}

	public void setPowerid(String powerid) {
		this.powerid = powerid;
	}
	
 	public List<Users> getUserList() {
		return userList;
	}

	public void setUserList(List<Users> userList) {
		this.userList = userList;
	}

	
	public Users getUsers1() {
		return users1;
	}

	public void setUsers1(Users users1) {
		this.users1 = users1;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	
	public void sel() {
		
		Shop aShop=(Shop)Sel.getHQL(Shop.class, shopid);
		setShop(aShop);
		setUsers1(aShop.getUsers());
		
		setUserList(Sel.HSQL("from Pershop a join fetch a.shop s join fetch a.users x where s.shopid='"+shop.getShopid()+"'"));
	}
	
	public String selShop()
	{
		sel();
		return "selShop";
	}
	public String infoManage() {
		sel();
		
		return "infoManage";
		
	}	
	
	public String infoSave()
	{
		
		Users aUsers=(Users)Sel.getHQL(Users.class, powerid);
		shop.setUsers(aUsers);
		Upd.UPD(shop);
		sel();
		return "infoSave";
		
	}
	
	public String addShop()
	{
		return "addShop";
		
	}

	public String addSave() {
		
		Users aUsers=(Users)Sel.getHQL(Users.class, userid);
		shop.setUsers(aUsers);
		Ins.INS(shop);
		Pershop aPershop=new Pershop();
		aPershop.setShop(shop);
		aPershop.setUsers(aUsers);
		aPershop.setGufen(1.0);
		Ins.INS(aPershop);
		selSearchShop();
		return "searchShop";
		
	}
	
	public void selSearchShop()
	{
		String sql="from Pershop a join fetch a.users x join fetch a.shop n where 1=1 and x.usersid='"+userid+"' ";
		
		if(name!=null&&name!="")
		{
			sql=sql+" and n.name like '%"+name+"%' ";
		}
		
		if(kind!=null&&kind!="")
		{
			sql=sql+" and n.kind like '%"+kind+"%' ";
		}
		sql=sql+" order by n.birthday desc";
		setShopList(Sel.HSQL(sql,Integer.parseInt(page),10));
		setCount(Sel.HSQL(sql).size());
		
		
	}

	public String searchShop() {
		selSearchShop();
		return "searchShop";
		
	}

	public String selshop() {
		sel();
		return "selshop";
	}

	public String updShop() {
		sel();
		return "updShop";
	}
	
	public String updSave()
	{
		Users aUsers=(Users)Sel.getHQL(Users.class, powerid);
		shop.setUsers(aUsers);
		Upd.UPD(shop);
		selSearchShop();
		return "updSave";
	}
	
	public String delShop()
	{
		Del.DEL(shop);
		selSearchShop();
		return "delShop";
	}
	
	public String shopown()
	{
		selSearchShop();
		return "shopown";
	}
	
	public void selownmanage() {
		String sql="from Pershop a join fetch a.users x join fetch a.shop n where 1=1 and n.shopid='"+shopid+"' ";
		sql=sql+" order by x.positionBirthday desc";
		
		setUsersList(Sel.HSQL(sql,Integer.parseInt(page),10));
		setCount(Sel.HSQL(sql).size());
		
		String usersql="from Users a join fetch a.shop n where n.shopid='"+shopid+"'";
		setUserList(Sel.HSQL(usersql));
		
	}
	
	public String ownmanage() {
		
		selownmanage();
		return "ownmanage";
	}
	
	public String updGufen() {
		Upd.upd("update shopManage.dbo.pershop set gufen="+gufen+"  where id='"+pershopid+"'");

		selownmanage();
		return "updGufen";
		
	}
	
	public String delGufen() {
		
		Del.Del("delete from shopManage.dbo.pershop where id='"+pershopid+"'");
		selownmanage();
		return "delGufen";
		
	}
	
	public String addGufen() {
		
		Pershop aPershop=new Pershop();
		aPershop.setShop((Shop)Sel.getHQL(Shop.class, shopid));
		aPershop.setGufen(Double.parseDouble(gufen));
		aPershop.setUsers((Users)Sel.getHQL(Users.class, userid));
		Ins.INS(aPershop);
		selownmanage();
		return "addGufen";
	}
}
