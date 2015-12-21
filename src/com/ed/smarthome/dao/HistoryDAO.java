package com.ed.smarthome.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ed.smarthome.entity.History;
import com.ed.smarthome.entity.Status;
import com.ed.smarthome.entity.Users;
import com.ed.smarthome.util.HibernateUtil;

public class HistoryDAO {

	public List<History>findHistoryByPage(int page,int rowsPerPage){
		Session session=HibernateUtil.getSession();
		Query query=session.createQuery("from History");
		query.setMaxResults(rowsPerPage);
		query.setFirstResult((page-1)*rowsPerPage);
		List<History> list=query.list();
		session.close();
		return list;
	}
	
	public List<History>find10his(){
		Session session=HibernateUtil.getSession();
		String sql="select * from history order by date desc limit 10";
		SQLQuery query = session.createSQLQuery(sql).addEntity(History.class);
		List<History> list=query.list();
		return list;
	}
	
	public int getHistoryTotalPage(int rowsPerPage){
		int rows=0;
		String sql="select count(*) from History";
		Session session=HibernateUtil.getSession();
		Query query=session.createQuery(sql);
		rows=((Long)query.iterate().next()).intValue();
		session.close();
		if(rows%rowsPerPage==0){
			return rows/rowsPerPage;
		}else{
			return rows/rowsPerPage+1;
		}
	}
	public long getCountHistory(){
		List list=null;
		Session session=HibernateUtil.getSession();
		Transaction tx=session.beginTransaction();
		String sql="select count(*) from History";
		try {
			list=session.createQuery(sql).list();
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
		}finally{
			HibernateUtil.closeSession();
		}
		return (Long) list.get(0);
	}
}
