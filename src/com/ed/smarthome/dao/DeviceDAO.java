package com.ed.smarthome.dao;

import com.ed.smarthome.entity.Device;
import com.ed.smarthome.util.HibernateUtil;

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DeviceDAO{
	
	public void save(Device transientInstance) {
		Session session=HibernateUtil.getSession();
		Transaction tx=session.beginTransaction();
		try {
			session.save(transientInstance);
			tx.commit();
		} catch (RuntimeException re) {
			re.printStackTrace();
			tx.rollback();
		}finally{
			HibernateUtil.closeSession();
		}
	}
	public void update(Device device){
		Session session=HibernateUtil.getSession();
		Transaction tx=session.beginTransaction();
		try {
			session.update(device);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tx.rollback();
		}finally{
			HibernateUtil.closeSession();
		}
	}
	public Device findbyId(int id){
		Device device=null;
		Session session=HibernateUtil.getSession();
		Transaction tx=session.beginTransaction();
		try {
			device=(Device) session.get(Device.class, id);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			HibernateUtil.closeSession();
		}
		return device;
	}
}