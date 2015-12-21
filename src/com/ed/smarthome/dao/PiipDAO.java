package com.ed.smarthome.dao;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.ed.smarthome.entity.Piip;
import com.ed.smarthome.util.HibernateUtil;

public class PiipDAO {
	public Piip getIp(){
		Session session=HibernateUtil.getSession();
		String sql="select * from piip where id=1";
		SQLQuery sqlQuery=session.createSQLQuery(sql).addEntity(Piip.class);
		Piip piip=(Piip) sqlQuery.uniqueResult();
		session.close();
		return piip;
	}
}
