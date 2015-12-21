package com.ed.smarthome.struts;

import org.apache.struts2.json.annotations.JSON;
import com.ed.smarthome.dao.StatusDAO;
import com.ed.smarthome.entity.Status;
import com.opensymphony.xwork2.ActionSupport;

public class StatusJsonAction extends ActionSupport {
	private Status status=new Status();
	@JSON(name ="STATUS")
	public Status getStatus(){
		return status;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		StatusDAO statusDAO=new StatusDAO();
		Status s=statusDAO.getStatu();
		if (s==null) {
			s=new Status();
		}
		status.setHumi(s.getHumi());
		status.setCputemp(s.getCputemp());
		status.setTemp(s.getTemp());
		status.setDate(s.getDate());
		return SUCCESS;
	}
}
