package com.ed.smarthome.entity;

import java.sql.Timestamp;

/**
 * History entity. @author MyEclipse Persistence Tools
 */

public class History implements java.io.Serializable {

	// Fields

	private Timestamp date;
	private String temp;
	private String humi;
	private String cputemp;

	// Constructors

	/** default constructor */
	public History() {
	}

	/** minimal constructor */
	public History(Timestamp date) {
		this.date = date;
	}

	/** full constructor */
	public History(Timestamp date, String temp, String humi, String cputemp) {
		this.date = date;
		this.temp = temp;
		this.humi = humi;
		this.cputemp = cputemp;
	}

	// Property accessors

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getTemp() {
		return this.temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public String getHumi() {
		return this.humi;
	}

	public void setHumi(String humi) {
		this.humi = humi;
	}

	public String getCputemp() {
		return this.cputemp;
	}

	public void setCputemp(String cputemp) {
		this.cputemp = cputemp;
	}

}