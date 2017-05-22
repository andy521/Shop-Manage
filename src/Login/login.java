package Login;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.sql.Template;

import obj.Logs;
import obj.Peruse;
import obj.Shop;
import obj.Users;
import tools.MD5;
import Dao.Ins;
import Dao.Sel;

import com.opensymphony.xwork2.ActionSupport;

public class login extends ActionSupport {
private Users users;
private String pic;
private String mess;
private List<Peruse> nav=null;

	public Users getUsers() {
	return users;
}
public void setUsers(Users users) {
	this.users = users;
}

public String getPic() {
	return pic;
}

public void setPic(String pic) {
	this.pic = pic;
}

public String getMess() {
	return mess;
}

public void setMess(String mess) {
	this.mess = mess;
}

public List<Peruse> getNav() {
	return nav;
}

public void setNav(List<Peruse> nav) {
	this.nav = nav;
}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		String checkCode=(String)session.getAttribute("checkCode");
		
		if (checkCode!=null) 
		{
			
			if (pic.equals(checkCode))
			{
			
				String sql="from Users a join fetch a.position where a.username=:username and a.password=:password";
				users.setPassword(MD5.MD5_32(users.getPassword()));
				String[][] values={{"username",users.getUsername()},{"password",users.getPassword()}};
				List isUsers=Sel.HSQL(sql, 1, values,10);
				
				if (isUsers!=null&&isUsers.size()>0) {
					Users users=(Users)isUsers.get(0);
					Timestamp time=new Timestamp(System.currentTimeMillis());
					session.setAttribute("user_id",users.getUsersid());
					Shop shop=users.getShop();
					session.setAttribute("shopid", shop.getShopid());
					session.setAttribute("user_name",users.getUsername());
					session.setAttribute("realname",users.getRealname());
					session.setAttribute("position",users.getPosition().getName());
					
					//插入日志
					Logs a=new Logs();
					a.setTime(time);
					a.setShop(shop);
					a.setUpkind("login");
					a.setUsers(users);
					Ins.INS(a);
					
					//查询用户权限
					
					nav=Sel.HSQL("from Peruse a join fetch a.users x join fetch a.uses u where x.usersid='"+users.getUsersid()+"'");
					session.setAttribute("nav", nav);
					
					return "login";
					
				}
				else {
					setMess("用户名或密码错误！请重新输入");
					return "index";
				}
			}
			else 
			{
				setMess("验证码错误！请重新输入");
				return "index";
			}
			
		}
		else 
		{
			setMess("时间超限！请重新输入！");
			return "index";
		}
		
		
	}

}
