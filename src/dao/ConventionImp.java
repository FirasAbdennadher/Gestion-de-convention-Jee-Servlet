package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import Util.HibernateUtil;
import dao.Metier.IConvention;
import entities.Convention;
import entities.Participant;
import entities.TypeConvention;
  
public class ConventionImp implements IConvention {

	@Override
	public void addConvention(Convention c) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();//ope transactionelle
		try {
			session.save(c);
		} catch (HibernateException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		session.getTransaction().commit();
		
	}

	@Override
	public void editConvention(Convention c) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(c);
		session.getTransaction().commit();
		
	}

	@Override
	public void deleteConvention(int id) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Object o=session.get(Convention.class, id);
		if(o==null) throw new RuntimeException("Convention inexistant");
		session.delete(o);
		session.getTransaction().commit();
		
	}

	@Override
	public List<Convention> getAllConvention() {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query req=session.createQuery("select c from Convention c");//HQL manuplie les class et les relation
		List<Convention>conventions=req.list();
	session.getTransaction().commit();
		return conventions;
	}

	@Override
	public Convention getConvention(int id) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Object o=session.get(Convention.class, id);
		if(o==null) throw new RuntimeException("Convention inexistant");
		session.getTransaction().commit();

	return (Convention) o;
	}

	@Override
	public List<Convention> getAllConventionParMotCle(String mc) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query req=session.createQuery("select p from Convention p where p.objet like :x");
		req.setParameter("x","%"+mc+"%");
		List<Convention>conv=req.list();
	session.beginTransaction().commit();
		return conv;	}

	/*@Override
	public int getNumberConvention() {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query req=session.createQuery("select count(p) from Convention ");
		int valCount=req.
	session.beginTransaction().commit();
		return conv;	}*/

}
