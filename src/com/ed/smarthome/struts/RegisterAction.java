package com.ed.smarthome.struts;

import com.ed.smarthome.dao.UsersDAO;
import com.ed.smarthome.entity.Users;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {
	private String name;
	private String password;
	private String phonenum;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		UsersDAO usersDAO=new UsersDAO();
		Users users=new Users();
		users.setName(name);
		users.setPassword(password);
		users.setType(1);
		users.setInuse(0);
		users.setPhonenum(phonenum);
		usersDAO.create(users);
		if(usersDAO.check(users)){
			return SUCCESS;
		}
		return ERROR;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getPhonenum() {
		return phonenum;
	}
}
