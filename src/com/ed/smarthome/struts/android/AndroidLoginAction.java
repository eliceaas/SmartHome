package com.ed.smarthome.struts.android;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.ed.smarthome.dao.UsersDAO;
import com.ed.smarthome.entity.Users;
import com.opensymphony.xwork2.ActionSupport;

public class AndroidLoginAction extends ActionSupport implements ServletRequestAware,ServletResponseAware {
	HttpServletRequest request;
	HttpServletResponse response;
	private String userName;
	private String password;
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
	public void login(){
		this.response.setContentType("text/json;charset=utf-8");
		this.response.setCharacterEncoding("UTF-8");
		UsersDAO usersDAO=new UsersDAO();
		Users users=new Users();
		users.setName(this.userName);
		users.setPassword(this.password);
		JSONObject json=new JSONObject();
		if(usersDAO.check(users)){
			json.put("status", "ok");
		}else{
			json.put("status", "error");
		}
		try {
			byte[] jsonBytes=json.toString().getBytes("utf-8");
			response.setContentLength(jsonBytes.length);
			response.getOutputStream().write(jsonBytes);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
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
