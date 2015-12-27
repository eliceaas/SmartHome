package com.ed.smarthome.struts.android;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.ed.smarthome.dao.UsersDAO;
import com.ed.smarthome.entity.Users;
import com.opensymphony.xwork2.ActionSupport;

public class AndroidRegAction extends ActionSupport implements ServletRequestAware,ServletResponseAware {
	HttpServletRequest request;
	HttpServletResponse response;
	private String userName;
	private String password;
	private String phonenum;
	private String photoid;
	
	
	public String getPhotoid() {
		return photoid;
	}
	public void setPhotoid(String photoid) {
		this.photoid = photoid;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public AndroidRegAction() {
		// TODO Auto-generated constructor stub
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	
	
	
	public void reg(){
		this.response.setContentType("text/json;charset=utf-8");
		this.response.setCharacterEncoding("UTF-8");
		UsersDAO usersDAO=new UsersDAO();
		Users users=new Users();
		users.setName(this.userName);
		users.setPassword(this.password);
		users.setPhonenum(this.phonenum);
		users.setPhotoid(this.photoid);
		users.setType(1);
		users.setInuse(0);
		usersDAO.create(users);
		JSONObject jsonObject=new JSONObject();
		if(usersDAO.check(users)){
			jsonObject.put("reg", "ok");
		}else{
			jsonObject.put("reg", "error");
		}
		try {
			byte[] jsonBytes=jsonObject.toString().getBytes("utf-8");
			response.setContentLength(jsonBytes.length);
			response.getOutputStream().write(jsonBytes);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response=arg0;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}

}
