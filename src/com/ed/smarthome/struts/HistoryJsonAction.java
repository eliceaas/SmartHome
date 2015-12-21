package com.ed.smarthome.struts;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.json.annotations.JSON;

import com.ed.smarthome.dao.HistoryDAO;
import com.ed.smarthome.entity.History;
import com.opensymphony.xwork2.ActionSupport;

public class HistoryJsonAction extends ActionSupport implements ServletRequestAware,ServletResponseAware {
	private List<History> hList;
	HttpServletRequest request;
	HttpServletResponse response;
	public List<History> gethList() {
		return hList;
	}
	public void sethList(List<History> hList) {
		this.hList = hList;
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
	public void history(){
		this.response.setContentType("text/json;charset=utf-8");
		this.response.setCharacterEncoding("UTF-8");
		HistoryDAO historyDAO=new HistoryDAO();
		hList=historyDAO.find10his();
		JSONObject j=new JSONObject();
		JSONObject json=new JSONObject();
		for(int i = 0;i < hList.size(); i ++){
            json.put("date", hList.get(i).getDate().toString());
            json.put("temp", hList.get(i).getTemp());
            json.put("humi", hList.get(i).getHumi());
            json.put("cputemp", hList.get(i).getCputemp());
            j.put(i, json);
        }
		try {
			byte[] jsonbytes=j.toString().getBytes("utf-8");
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
}
