package com.ed.smarthome.struts;

import java.util.Map;

import org.apache.struts2.json.annotations.JSON;

import com.ed.smarthome.dao.UsersDAO;
import com.ed.smarthome.entity.Users;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UsersJsonAction extends ActionSupport {
	private Users user=new Users();
	@JSON(name ="USER")
	public Users getUsers(){
		return user;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		UsersDAO usersDAO=new UsersDAO();
		ActionContext actionContext=ActionContext.getContext();
		Map session=(Map) actionContext.getSession();
		Users users=(Users) session.get("user");
		Users u=usersDAO.finduserbyname(users.getName());
		user.setId(u.getId());
		user.setName(u.getName());
		user.setType(u.getType());
		user.setInuse(u.getInuse());
		return SUCCESS;
	}
}
