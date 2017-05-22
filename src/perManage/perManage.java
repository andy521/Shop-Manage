package perManage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import obj.Along;
import obj.Pershop;
import obj.Peruse;
import obj.Position;
import obj.Shop;
import obj.Users;
import obj.Uses;

import org.apache.struts2.ServletActionContext;

import tools.MD5;
import Dao.Del;
import Dao.Ins;
import Dao.Sel;
import Dao.Upd;

import com.opensymphony.xwork2.ActionSupport;

public class perManage extends ActionSupport
{
	public HttpSession session = ServletActionContext.getRequest().getSession();
	public HttpServletRequest request = ServletActionContext.getRequest();
	public HttpServletResponse response = ServletActionContext.getResponse();
	private String userid = (String) session.getAttribute("user_id");
	private List<Pershop> shopList = null;
	private String usersid = null;
	private String page = "1";
	private int count;
	private String shopid = null;
	private String name = null;
	private String tel = null;
	private String alongid = null;
	private String headerid = null;
	private String positionid = null;
	private List<Users> userList = null;
	private List<Users> headerlist = null;
	private List<Peruse> usersList = null;
	private String checkbox2[] = null;
	private Peruse peruses = new Peruse();
	private String flag = "0";
	private Users updUsers = new Users();

	public Users getUpdUsers()
	{
		return updUsers;
	}

	public void setUpdUsers(Users updUsers)
	{
		this.updUsers = updUsers;
	}

	public String getFlag()
	{
		return flag;
	}

	public void setFlag(String flag)
	{
		this.flag = flag;
	}

	public Peruse getPeruses()
	{
		return peruses;
	}

	public void setPeruses(Peruse peruses)
	{
		this.peruses = peruses;
	}

	public String[] getCheckbox2()
	{
		return checkbox2;
	}

	public void setCheckbox2(String[] checkbox2)
	{
		this.checkbox2 = checkbox2;
	}

	public String getUsersid()
	{
		return usersid;
	}

	public void setUsersid(String usersid)
	{
		this.usersid = usersid;
	}

	public List<Peruse> getUsersList()
	{
		return usersList;
	}

	public void setUsersList(List<Peruse> usersList)
	{
		this.usersList = usersList;
	}

	public List<Users> getHeaderlist()
	{
		return headerlist;
	}

	public void setHeaderlist(List<Users> headerlist)
	{
		this.headerlist = headerlist;
	}

	public int getCount()
	{
		return count;
	}

	public void setCount(int count)
	{
		this.count = count;
	}

	public List<Users> getUserList()
	{
		return userList;
	}

	public void setUserList(List<Users> userList)
	{
		this.userList = userList;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getAlongid()
	{
		return alongid;
	}

	public void setAlongid(String alongid)
	{
		this.alongid = alongid;
	}

	public String getHeaderid()
	{
		return headerid;
	}

	public void setHeaderid(String headerid)
	{
		this.headerid = headerid;
	}

	public String getPositionid()
	{
		return positionid;
	}

	public void setPositionid(String positionid)
	{
		this.positionid = positionid;
	}

	public String getShopid()
	{
		return shopid;
	}

	public void setShopid(String shopid)
	{
		this.shopid = shopid;
	}

	public String getPage()
	{
		return page;
	}

	public void setPage(String page)
	{
		this.page = page;
	}

	public List<Pershop> getShopList()
	{
		return shopList;
	}

	public void setShopList(List<Pershop> shopList)
	{
		this.shopList = shopList;
	}

	public String getUserid()
	{
		return userid;
	}

	public void setUserid(String userid)
	{
		this.userid = userid;
	}

	/**
	 * 显示用户信息
	 * 用于修改
	 * @return
	 */
	public String selPer()
	{
		String shopsqlString = "from Pershop a join fetch a.users x join fetch a.shop n where 1=1 and x.usersid='" + userid + "' ";
		setShopList(Sel.HSQL(shopsqlString, Integer.parseInt(page), 10));
		setUpdUsers((Users) Sel.getHQL(Users.class, usersid));
		return "selPer";

	}

	/**
	 * 显示店铺列表
	 * @return
	 */
	public String selShopList()
	{
		String shopsqlString = "from Pershop a join fetch a.users x join fetch a.shop n where 1=1 and x.usersid='" + userid + "' ";
		setShopList(Sel.HSQL(shopsqlString, Integer.parseInt(page), 10));
		return "selShopList";

	}

	/**
	 * 所属部门的ajax
	 * @return
	 */
	public String alongAjax()
	{
		String sqlString = "select * from shopManage.dbo.along where shopid='" + shopid + "'";
		//级联过滤

		JSONArray jsonArray = Sel.json(sqlString);;
		response.setCharacterEncoding("UTF-8");
		try
		{
			response.getWriter().print(jsonArray);
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 职位的ajax
	 * @return
	 */
	public String positionAjax()
	{
		String sqlString = "select * from shopManage.dbo.position where shopid='" + shopid + "'";
		//级联过滤
		JSONArray jsonArray = Sel.json(sqlString);
		response.setCharacterEncoding("UTF-8");
		try
		{
			response.getWriter().print(jsonArray);
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 领导的ajax
	 * @return
	 */
	public String headerAjax()
	{
		String sqlString = "select * from shopManage.dbo.users where shopid='" + shopid + "'";
		//级联过滤
		JSONArray jsonArray = Sel.json(sqlString);
		response.setCharacterEncoding("UTF-8");
		try
		{
			response.getWriter().print(jsonArray);
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 条件查询的用户列表
	 * @return
	 */
	public String searchPerson()
	{
		String sqlString =
				"from Users a " + "join fetch a.shop s " + "join fetch a.along g " + "join fetch a.position p " + "join fetch a.users u " + " where 1=1 ";
		if (name != null && name.equals("") == false)
		{
			sqlString = sqlString + " and ((a.username like '%" + name + "%') or (a.realname like '%" + name + "%')) ";
		}
		if (tel != null && tel.equals("") == false)
		{
			sqlString = sqlString + " and a.tel like '%" + tel + "%' ";
		}
		if (shopid != null && shopid.equals("") == false)
		{
			sqlString = sqlString + " and s.shopid like '%" + shopid + "%' ";
		}
		if (alongid != null && alongid.equals("") == false)
		{
			sqlString = sqlString + " and g.alongid like '%" + alongid + "%' ";
		}
		if (headerid != null && headerid.equals("") == false)
		{
			sqlString = sqlString + " and u.usersid like '%" + headerid + "%' ";

		}
		if (positionid != null && positionid.equals("") == false)
		{
			sqlString = sqlString + " and p.positionid like '%" + positionid + "%' ";
		}

		sqlString = sqlString + " order by a.positionBirthday desc";

		userList = Sel.HSQL(sqlString, Integer.parseInt(page), 10);

		String shopsqlString = "from Pershop a join fetch a.users x join fetch a.shop n where 1=1 and x.usersid='" + userid + "' ";
		setShopList(Sel.HSQL(shopsqlString, Integer.parseInt(page), 10));
		setCount(Sel.HSQL(sqlString).size());
		return "searchPerson";
	}

	/**
	 * 权限列表
	 * @return
	 */
	public String PrivilegeList()
	{
		setUsersList(Sel.HSQL("from Peruse a join fetch a.users x join fetch a.uses u where x.usersid='" + usersid + "'"));
		return "PrivilegeList";
	}

	/**
	 * 权限保存
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public String PrivilegeSave() throws ClassNotFoundException,SQLException
	{
		setUsersList(Sel.HSQL("from Peruse a join fetch a.users x join fetch a.uses u where x.usersid='" + usersid + "'"));

		if (getUsersList() != null && getUsersList().size() > 0)
		{
			String delsql = "delete from shopManage.dbo.peruse where usersid='" + usersid + "'";
			Del.Del(delsql);
		}
		System.out.println(usersid);
		if (checkbox2 != null && checkbox2.length != 0)
		{
			peruses.setUsers((Users) Sel.getHQL(Users.class, usersid));
			for (int i = 0; i < checkbox2.length; i++)
			{

				peruses.setUses((Uses) Sel.getHQL(Uses.class, checkbox2[i]));
				Ins.INS(peruses);
			}
		}
		setFlag("1");
		return "PrivilegeList";
	}

	/**
	 * 删除用户
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public String DelPer() throws ClassNotFoundException,SQLException
	{
		Del.Del("delete from shopManage.dbo.users where usersid='" + usersid + "'");
		return searchPerson();
	}

	/**
	 * 用户修改的保存
	 * @return
	 * @throws Exception
	 */
	public String updSave() throws Exception
	{
		if (updUsers != null && updUsers.getPassword().equals("") == false)
		{
			Shop a = (Shop) Sel.getHQL(Shop.class, shopid);
			Along along = (Along) Sel.getHQL(Along.class, alongid);
			Users users = (Users) Sel.getHQL(Users.class, headerid);
			Position position = (Position) Sel.getHQL(Position.class, positionid);
			updUsers.setPassword(MD5.MD5_32(updUsers.getPassword()));
			updUsers.setShop(a);
			updUsers.setAlong(along);
			updUsers.setUsers(users);
			updUsers.setPosition(position);

			Upd.UPD(updUsers);

		}
		else if (updUsers != null && updUsers.getPassword().equals("") == true)
		{
			String passwordString = ((Users) Sel.getHQL(Users.class, updUsers.getUsersid())).getPassword();
			System.out.println(passwordString);
			Shop a = (Shop) Sel.getHQL(Shop.class, shopid);
			Along along = (Along) Sel.getHQL(Along.class, alongid);
			Users users = (Users) Sel.getHQL(Users.class, headerid);
			Position position = (Position) Sel.getHQL(Position.class, positionid);

			updUsers.setShop(a);
			updUsers.setAlong(along);
			updUsers.setUsers(users);
			updUsers.setPosition(position);
			updUsers.setPassword(passwordString);

			Upd.UPD(updUsers);
		}
		else
		{
			throw new Exception("updUsers is null");
		}

		return selShopList();
	}

	/**
	 * 显示添加页面
	 * @return
	 */
	public String toAdd()
	{
		String shopsqlString = "from Pershop a join fetch a.users x join fetch a.shop n where 1=1 and x.usersid='" + userid + "' ";
		setShopList(Sel.HSQL(shopsqlString, Integer.parseInt(page), 10));

		return "addPer";
	}

	/**
	 * 添加用户保存
	 * @return
	 */
	public String addSave()
	{
		Users users = null;
		Shop a = (Shop) Sel.getHQL(Shop.class, shopid);
		Along along = (Along) Sel.getHQL(Along.class, alongid);
		if (headerid != null)
			users = (Users) Sel.getHQL(Users.class, headerid);

		Position position = (Position) Sel.getHQL(Position.class, positionid);
		updUsers.setPassword(MD5.MD5_32(updUsers.getPassword()));
		updUsers.setShop(a);
		updUsers.setAlong(along);
		updUsers.setUsers(users);
		updUsers.setPosition(position);

		Ins.INS(updUsers);

		updUsers.setUsers(updUsers);
		Upd.UPD(updUsers);
		return selShopList();
	}

}
