package com.ed.smarthome.struts;

import com.ed.smarthome.dao.DeviceDAO;
import com.ed.smarthome.dao.PiipDAO;
import com.ed.smarthome.entity.Device;
import com.ed.smarthome.entity.Piip;
import com.opensymphony.xwork2.ActionSupport;

public class RemoteCamera extends ActionSupport {
	private String ip;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		PiipDAO piipDAO=new PiipDAO();
		Piip piip=piipDAO.getIp();
		ip=piip.getIp();
		return "rc";
	}

	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String openlight(){
		DeviceDAO dao=new DeviceDAO();
		Device device=dao.findbyId(1);
		device.setLight(1);
		dao.update(device);
		return NONE;
	}
	public String closelight(){
		DeviceDAO dao=new DeviceDAO();
		Device device=dao.findbyId(1);
		device.setLight(0);
		dao.update(device);
		return NONE;
	}
	public String openfan(){
		DeviceDAO dao=new DeviceDAO();
		Device device=dao.findbyId(1);
		device.setFan(1);
		dao.update(device);
		return NONE;
	}
	public String closefan(){
		DeviceDAO dao=new DeviceDAO();
		Device device=dao.findbyId(1);
		device.setFan(0);
		dao.update(device);
		return NONE;
	}
}
