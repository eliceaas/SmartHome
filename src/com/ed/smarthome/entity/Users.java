package com.ed.smarthome.entity;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String password;
	private Integer type;
	private Integer inuse;
	private String phonenum;
	private String photoid;

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(String name, String password, Integer type, Integer inuse,
			String photoid) {
		this.name = name;
		this.password = password;
		this.type = type;
		this.inuse = inuse;
		this.photoid = photoid;
	}

	/** full constructor */
	public Users(String name, String password, Integer type, Integer inuse,
			String phonenum, String photoid) {
		this.name = name;
		this.password = password;
		this.type = type;
		this.inuse = inuse;
		this.phonenum = phonenum;
		this.photoid = photoid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getInuse() {
		return this.inuse;
	}

	public void setInuse(Integer inuse) {
		this.inuse = inuse;
	}

	public String getPhonenum() {
		return this.phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getPhotoid() {
		return this.photoid;
	}

	public void setPhotoid(String photoid) {
		this.photoid = photoid;
	}

}