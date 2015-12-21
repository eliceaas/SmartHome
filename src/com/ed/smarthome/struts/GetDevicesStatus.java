package com.ed.smarthome.struts;

import org.apache.struts2.json.annotations.JSON;

import com.ed.smarthome.dao.DeviceDAO;
import com.ed.smarthome.entity.Device;
import com.opensymphony.xwork2.ActionSupport;

public class GetDevicesStatus extends ActionSupport {
	private Device device=new Device();
	@JSON(name ="DEVICES")
	public Device getDevice() {
		return device;
	}
	@Override
	public String execute() throws Exception {
		DeviceDAO deviceDAO=new DeviceDAO();
		Device d=deviceDAO.findbyId(1);
		device.setFan(d.getFan());
		device.setLight(d.getLight());
		device.setDate(d.getDate());
		device.setId(1);
		return SUCCESS;
	}
}
