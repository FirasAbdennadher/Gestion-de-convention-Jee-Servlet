package dao;

import java.util.List;

import javax.management.RuntimeErrorException;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import Util.HibernateUtil;
import dao.Metier.IUser;
import entities.User;



public class UserImp implements IUser {

	@Override
	public void addUser(User user) {

		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();//ope transactionelle
		try {
			session.save(user);
		} catch (HibernateException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		session.getTransaction().commit();
	}

	@Override
	public void editUser(User user) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(user);
		session.getTransaction().commit();
		
	}

	@Override
	public void deleteUser(int id) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Object o=session.get(User.class, id);
		if(o==null) throw new RuntimeException("User inexistant");
		session.delete(o);
		session.getTransaction().commit();

		
	}

	@Override
	public User getUser(int id) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Object o=session.get(User.class, id);
		if(o==null) throw new RuntimeException("User inexistant");
		session.getTransaction().commit();

	return (User) o;
	}

	@Override
	public List<User> getAllUsers() {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query req=session.createQuery("select p from User p");//HQL manuplie les class et les relation
		List<User>uers=req.list();
	session.getTransaction().commit();
		return uers;

	}

	
}
