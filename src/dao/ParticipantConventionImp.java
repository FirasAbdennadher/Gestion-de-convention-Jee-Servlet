package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import Util.HibernateUtil;
import dao.Metier.IParticipantConvention;
import entities.Convention;
import entities.Participant;
import entities.ParticipantConvention;

public class ParticipantConventionImp  implements IParticipantConvention{

	@Override
	public void addParticipantConvention(ParticipantConvention c) {
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
	public void editParticipantConvention(ParticipantConvention p) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(p);
		session.getTransaction().commit();
		
	}

	@Override
	public void deleteParticipantConvention(int id) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Object o=session.get(ParticipantConvention.class, id);
		if(o==null) throw new RuntimeException("Participant inexistant");
		session.delete(o);
		session.getTransaction().commit();
		
		
	}

	@Override
	public List<ParticipantConvention> getAllParticipantConvention() {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query req=session.createQuery("select p from ParticipantConvention p");//HQL manuplie les class et les relation
		List<ParticipantConvention>partiConventions=req.list();
	session.getTransaction().commit();
		return partiConventions;
	}

	@Override
	public ParticipantConvention getParticipantConvention(int id) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Object o=session.get(ParticipantConvention.class, id);
		if(o==null) throw new RuntimeException("Participant inexistant");
		session.getTransaction().commit();

	return (ParticipantConvention) o;
	}

	@Override
	public List<ParticipantConvention> getAllParticipantConventionParMotCle(
			String mc) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query req=session.createQuery("select p from ParticipantConvention p where p.objet like :x");
		req.setParameter("x","%"+mc+"%");
		List<ParticipantConvention>conv=req.list();
	session.beginTransaction().commit();
		return conv;	
	}

	@Override
	public List<ParticipantConvention> getAllParticipantParConvention(
			String id) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query req=session.createQuery("select p from ParticipantConvention p where p.convention_id like :x");
		req.setParameter("x","%"+id+"%");
		List<ParticipantConvention>conv=req.list();
	session.beginTransaction().commit();
		return conv;	

	}

	@Override
	public List<ParticipantConvention> getAllConvntionParticipantParParticipant(
			String id) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query req=session.createQuery("select p from ParticipantConvention p where p.convention="+id);
		//req.setParameter("x","%"+id+"%");
		List<ParticipantConvention>conv=req.list();
	session.beginTransaction().commit();
		return conv;	
	}

	@Override
	public List<ParticipantConvention> getParticipantConventionParIDConvention(
			String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Participant> getPariticpantNotInConvention(String id) {
		
	
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query req=session.createQuery("select p from Participant p where p.id not in (select pc.participant.id from ParticipantConvention pc where pc.convention.id="+id+")");
		List<Participant>conv=req.list();
	session.beginTransaction().commit();
		return conv;	

	
	}

	@Override
	public void deleteParticipantConventionParConvention(int id) {
			Session session=HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			Query query = session.createQuery("delete  ParticipantConvention  where convention.id="+id); 
			int result = query.executeUpdate(); 
			if (result > 0) { System.out.println("Cbon"); 
			session.beginTransaction().commit();
			}
	}	
	

}
