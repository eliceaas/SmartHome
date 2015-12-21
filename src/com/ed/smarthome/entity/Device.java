package com.ed.smarthome.entity;

import java.sql.Timestamp;

/**
 * Device entity. @author MyEclipse Persistence Tools
 */

public class Device implements java.io.Serializable {

	// Fields

	private Integer id;
	private Timestamp date;
	private Integer light;
	private Integer fan;

	// Constructors

	/** default constructor */
	public Device() {
	}

	/** minimal constructor */
	public Device(Timestamp date) {
		this.date = date;
	}

	/** full constructor */
	public Device(Timestamp date, Integer light, Integer fan) {
		this.date = date;
		this.light = light;
		this.fan = fan;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public Integer getLight() {
		return this.light;
	}

	public void setLight(Integer light) {
		this.light = light;
	}

	public Integer getFan() {
		return this.fan;
	}

	public void setFan(Integer fan) {
		this.fan = fan;
	}

}