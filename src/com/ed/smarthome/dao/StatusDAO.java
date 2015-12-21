package com.ed.smarthome.dao;


import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.ed.smarthome.entity.Status;
import com.ed.smarthome.util.HibernateUtil;

public class StatusDAO {
	String sql="select * from status order by date desc limit 1";
	private Session session;
	public Status getStatu(){
		session=HibernateUtil.getSession();
		session.clear();
		SQLQuery query = this.session.createSQLQuery(sql).addEntity(Status.class);
		query.setCacheable(false);
		Status status=(Status) query.uniqueResult();
		session.close();
		return status;
	}
}
