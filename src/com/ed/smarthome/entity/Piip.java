package com.ed.smarthome.entity;

/**
 * Piip entity. @author MyEclipse Persistence Tools
 */

public class Piip implements java.io.Serializable {

	// Fields

	private Integer id;
	private String ip;

	// Constructors

	/** default constructor */
	public Piip() {
	}

	/** minimal constructor */
	public Piip(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public Piip(Integer id, String ip) {
		this.id = id;
		this.ip = ip;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}