package tools;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class isSess extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation ac) throws Exception {
		// TODO 自动生成的方法存根
		HttpSession session = ServletActionContext.getRequest().getSession();
		String username=(String) session.getAttribute("user_id");
		if (username!=null&&username.equals("")==false) 
		{
			return ac.invoke();
		}
		else
		{
			return "error";
		}
		
		
	}
	

}
