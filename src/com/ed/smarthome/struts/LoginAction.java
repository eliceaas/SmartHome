package com.ed.smarthome.struts;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ed.smarthome.dao.UsersDAO;
import com.ed.smarthome.entity.Users;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements SessionAware,ModelDriven<Users> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	private Users users=new Users();
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		UsersDAO usersDAO=new UsersDAO();
		if(usersDAO.check(users)){
			session.put("user",users);
			//判断是否为管理员
			Users tu=usersDAO.finduserbyname(users.getName());
			if(tu.getType()==0){
				return "adminlogin";
			}else{
				return "userlogin";
			}
		}
		return "loginerror";
	}
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session=session;
	}
	public Map<String, Object> getSessionMap(){
        return this.session;
    }
	@Override
	public Users getModel() {
		// TODO Auto-generated method stub
		return users;
	}
}
