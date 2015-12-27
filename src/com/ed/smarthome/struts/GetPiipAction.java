package com.ed.smarthome.struts;

import org.apache.struts2.json.annotations.JSON;

import com.ed.smarthome.dao.PiipDAO;
import com.ed.smarthome.entity.Piip;
import com.opensymphony.xwork2.ActionSupport;

public class GetPiipAction extends ActionSupport {
	private Piip piip=new Piip();
	@JSON(name="PIIP")
	public Piip getPiip() {
		return piip;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		PiipDAO piipDAO=new PiipDAO();
		Piip p=piipDAO.getIp();
		piip.setIp(p.getIp());
		return SUCCESS;
	}
}
