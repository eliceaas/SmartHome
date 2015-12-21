package com.ed.smarthome.struts;

import java.util.List;

import com.ed.smarthome.dao.HistoryDAO;
import com.ed.smarthome.entity.History;
import com.opensymphony.xwork2.ActionSupport;

public class HistoryAction extends ActionSupport {
	private List<History> list;
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
	public List<History> getList() {
		return list;
	}
	public void setList(List<History> list) {
		this.list = list;
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HistoryDAO historyDAO=new HistoryDAO();
		list=historyDAO.findHistoryByPage(page, rowsPerPage);
		totalPage=historyDAO.getHistoryTotalPage(rowsPerPage);
		totalNum=historyDAO.getCountHistory();
		return "history";
	}
	
}
