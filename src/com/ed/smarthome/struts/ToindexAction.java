package com.ed.smarthome.struts;

import com.ed.smarthome.dao.UsersDAO;
import com.opensymphony.xwork2.ActionSupport;

public class ToindexAction extends ActionSupport {
	private long unuseusers;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		UsersDAO usersDAO=new UsersDAO();
		unuseusers=usersDAO.countunuseusers();
		return SUCCESS;
	}
	public void setUnuseusers(long unuseusers) {
		this.unuseusers = unuseusers;
	}
	public long getUnuseusers() {
		return unuseusers;
	}
}
