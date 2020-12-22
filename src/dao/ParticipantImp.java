package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import Util.HibernateUtil;
import dao.Metier.IParticipant;
import entities.Convention;
import entities.Participant;
import entities.TypeConvention;

public class ParticipantImp implements IParticipant{

	@Override
	public void addParticipant(Participant p) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();//ope transactionelle
		try {
			session.save(p);
		} catch (HibernateException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		session.getTransaction().commit();

	}

	@Override
	public void editParticipant(Participant p) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(p);
		session.getTransaction().commit();
		
	}

	@Override
	public void deleteParticipant(int id) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Object o=session.get(Participant.class, id);
		if(o==null) throw new RuntimeException("Participant inexistant");
		session.delete(o);
		session.getTransaction().commit();
		
	}

	@Override
	public List<Participant> getAllParticipant() {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query req=session.createQuery("select p from Participant p");//HQL manuplie les class et les relation
		List<Participant>partiConventions=req.list();
	session.getTransaction().commit();
		return partiConventions;
	}

	@Override
	public Participant getParticipant(int id) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Object o=session.get(Participant.class, id);
		if(o==null) throw new RuntimeException("Participant inexistant");
		session.getTransaction().commit();

	return (Participant) o;
	}

	@Override
	public List<Participant> getAllParticipantParMotCle(String mc) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query req=session.createQuery("select p from Participant p where p.objet like :x");
		req.setParameter("x","%"+mc+"%");
		List<Participant>par=req.list();
	session.beginTransaction().commit();
		return par;	}
	
}
