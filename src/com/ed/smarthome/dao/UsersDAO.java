package com.ed.smarthome.dao;

import java.util.Iterator;  
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.ed.smarthome.entity.Users;
import com.ed.smarthome.util.HibernateUtil;

public class UsersDAO {
	
	public void create(Users users){
		Session session=HibernateUtil.getSession();
		Transaction tx=session.beginTransaction();
		try {
			session.save(users);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tx.rollback();
		}finally{
			HibernateUtil.closeSession();
		}
	}
	public Users finduserbyid(int id){
		Users users=null;
		Session session=HibernateUtil.getSession();
		Transaction tx=session.beginTransaction();
		try {
			users=(Users) session.get(Users.class,id);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tx.rollback();
		}finally{
			HibernateUtil.closeSession();
		}
		return users;
	}
	
	public Users finduserbyname(String name){
		Users users=null;
		Session session=HibernateUtil.getSession();
		Transaction tx=session.beginTransaction();
		try {
			List user=session.createCriteria(Users.class).add(Restrictions.eq("name", name)).list();
			users=(Users) user.get(0);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tx.rollback();
		}finally{
			HibernateUtil.closeSession();
		}
		return users;
	}
	public void update(Users users){
		Session session=HibernateUtil.getSession();
		Transaction tx=session.beginTransaction();
		try {
			session.update(users);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tx.rollback();
		}finally{
			HibernateUtil.closeSession();
		}
	}
	public long countunuseusers(){
		List list=null;
		Session session=HibernateUtil.getSession();
		Transaction tx=session.beginTransaction();
		String sql="select count(*) from Users u where u.inuse='0'";
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
	
	public long getCountUsers(){
		List list=null;
		Session session=HibernateUtil.getSession();
		Transaction tx=session.beginTransaction();
		String sql="select count(*) from Users";
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
	
	public boolean check(Users users){
		Session session=HibernateUtil.getSession();
		Transaction tx=session.beginTransaction();
		String sql="select u.password from Users u where u.name='" +users.getName()+ "'";
		try {
			List list = session.createQuery(sql).list();  
	        if(!list.isEmpty()) {  
	            Iterator it = list.iterator();  
	            while(it.hasNext()) {  
	                String get = (String) it.next();  
	                if(get.equals(users.getPassword())) {  
	                    //HibernateUtil.closeSession();  
	                    return true;  
	                }  
	            }  
	        }
	        tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tx.rollback();
		}finally{
			HibernateUtil.closeSession();
		}  
	    return false;     
	}
//	public List<Users> getUsersList(){
//		Session session=HibernateUtil.getSession();
//		Transaction tx=session.beginTransaction();
//		String sql="select * from Users";
//		List<Users> list=null;
//		try {
//			list=(List<Users>) session.createSQLQuery(sql).addEntity(Users.class).list();
//			tx.commit();
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			tx.rollback();
//		}finally{
//			HibernateUtil.closeSession();
//		}
//		return list;
//	}
	public List<Users> findUsersByPage(int page,int rowsPerPage){
		Session session=HibernateUtil.getSession();
		Query query=session.createQuery("from Users");
		query.setMaxResults(rowsPerPage);
		query.setFirstResult((page-1)*rowsPerPage);
		List<Users> list=query.list();
		session.close();
		return list;
	}
	public int getUsersTotalPage(int rowsPerPage){
		int rows=0;
		String sql="select count(*) from Users";
		Session session=HibernateUtil.getSession();
		Query query=session.createQuery(sql);
		rows=((Long) query.iterate().next()).intValue();
		session.close();
		 if (rows % rowsPerPage == 0) {  
	            return rows / rowsPerPage;  
	        } else {  
	            return rows / rowsPerPage + 1;  
	        }  
	}
	public void delUsersbyid(int id){
		Session session=HibernateUtil.getSession();
		String hql="delete from Users where id="+id;
		Transaction tx=session.getTransaction();
		try {
			Query query=session.createQuery(hql);
			query.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
}
