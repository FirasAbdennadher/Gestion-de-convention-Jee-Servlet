package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import Util.HibernateUtil;
import dao.Metier.ITypeConvention;
import entities.TypeConvention;
import entities.User;

public class TypeConventionImp implements ITypeConvention {

	@Override
	public void addType(TypeConvention t) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();//ope transactionelle
		try {
			session.save(t);
		} catch (HibernateException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		session.getTransaction().commit();
		
	}

	@Override
	public void editType(TypeConvention t) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(t);
		session.getTransaction().commit();
		
	}

	@Override
	public void deleteType(int id) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Object o=session.get(TypeConvention.class, id);
		if(o==null) throw new RuntimeException("Type de convention inexistant");
		session.delete(o);
		session.getTransaction().commit();
		
	}

	@Override
	public List<TypeConvention> getAllType() {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query req=session.createQuery("select t from TypeConvention t");//HQL manuplie les class et les relation
		List<TypeConvention>typeConvention=req.list();
		session.getTransaction().commit();
		return typeConvention;
	}

	@Override
	public TypeConvention getType(int id) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Object o=session.get(TypeConvention.class, id);
		if(o==null) throw new RuntimeException("Type de Convention inexistant");
		session.getTransaction().commit();

	return (TypeConvention) o;
	}

}
