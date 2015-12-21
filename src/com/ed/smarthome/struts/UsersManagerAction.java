package com.ed.smarthome.struts;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ed.smarthome.dao.UsersDAO;
import com.ed.smarthome.entity.Users;
import com.opensymphony.xwork2.ActionSupport;

public class UsersManagerAction extends ActionSupport {
	private List<Users> userslist;
	private int rowsPerPage=10;//num per page
	private int page=1;//default pagenum
	private int totalPage;
	private long totalNum;
	public int getRowsPerPage() {
		return rowsPerPage;
	}
	public void setRowsPerPage(int rowPerPage) {
		this.rowsPerPage = rowPerPage;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public long getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		UsersDAO usersDAO=new UsersDAO();
		//userslist=usersDAO.getUsersList();
		userslist=usersDAO.findUsersByPage(page, rowsPerPage);
		totalPage=usersDAO.getUsersTotalPage(rowsPerPage);
		totalNum=usersDAO.getCountUsers();
		return "manager";
	}
	public void setUserslist(List<Users> userslist) {
		this.userslist = userslist;
	}
	public List<Users> getUserslist() {
		return userslist;
	}
	public String setAdmin(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		UsersDAO usersDAO=new UsersDAO();
		Users tempuser=usersDAO.finduserbyid(id);
		tempuser.setType(0);
		usersDAO.update(tempuser);
		return "allowsuccess";
	}
	public String banAdmin(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		UsersDAO usersDAO=new UsersDAO();
		Users tempuser=usersDAO.finduserbyid(id);
		tempuser.setType(1);
		usersDAO.update(tempuser);
		return "allowsuccess";
	}
	
	public String allowUser(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		UsersDAO usersDAO=new UsersDAO();
		Users tempuser=usersDAO.finduserbyid(id);
		tempuser.setInuse(1);
		usersDAO.update(tempuser);
		return "allowsuccess";
	}
	public String banUser(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		UsersDAO usersDAO=new UsersDAO();
		Users temUsers=usersDAO.finduserbyid(id);
		temUsers.setInuse(0);
		usersDAO.update(temUsers);
		return "bansuccess";
	}
	public String delUser(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		UsersDAO usersDAO=new UsersDAO();
		usersDAO.delUsersbyid(id);
		return "allowsuccess";
	}
}
