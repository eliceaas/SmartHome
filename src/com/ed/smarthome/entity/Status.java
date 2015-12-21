package com.ed.smarthome.entity;

import java.sql.Timestamp;

/**
 * Status entity. @author MyEclipse Persistence Tools
 */

public class Status implements java.io.Serializable {

	// Fields

	private Timestamp date;
	private String temp;
	private String humi;
	private String cputemp;

	// Constructors

	/** default constructor */
	public Status() {
	}

	/** minimal constructor */
	public Status(Timestamp date) {
		this.date = date;
	}

	/** full constructor */
	public Status(Timestamp date, String temp, String humi, String cputemp) {
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