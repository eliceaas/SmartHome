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

public class AndroidGetUserInfo extends ActionSupport implements ServletRequestAware,ServletResponseAware {
	public String userName;
	HttpServletRequest request;
	HttpServletResponse response;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public void getUserInfo(){
		UsersDAO usersDAO=new UsersDAO();
		Users users=usersDAO.finduserbyname(userName);
		this.response.setContentType("text/json;charset=utf-8");  
        this.response.setCharacterEncoding("UTF-8"); 
        JSONObject json=new JSONObject();
        json.put("username", users.getName());
        json.put("userid", users.getId());
        json.put("inuse", users.getInuse());
        json.put("usertype", users.getType());
        json.put("phonenum", users.getPhonenum());
        json.put("photoid", users.getPhotoid());
        try {
			byte[] jsonbytes=json.toString().getBytes("utf-8");
			response.setContentLength(jsonbytes.length);
			response.getOutputStream().write(jsonbytes);
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
		response=arg0;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		request=arg0;
	}
	
}
