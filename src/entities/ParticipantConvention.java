package entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Type;
@Entity
@Table(name="ParticipantConvention")
public class ParticipantConvention {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Temporal(TemporalType.DATE)
	private Date datesignature;

	@ManyToOne
	private Convention convention;
	@ManyToOne
	private Participant participant;
	public ParticipantConvention(Date datesignature, Convention convention,
			Participant participant) {
		super();
		this.datesignature = datesignature;
		this.convention = convention;
		this.participant = participant;
	}
	public ParticipantConvention() {
		super();
	}
	public ParticipantConvention(Date datesignature) {
		super();
		this.datesignature = datesignature;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDatesignature() {
		return datesignature;
	}
	public void setDatesignature(Date datesignature) {
		this.datesignature = datesignature;
	}
	public Convention getConvention() {
		return convention;
	}
	public void setConvention(Convention convention) {
		this.convention = convention;
	}
	public Participant getParticipant() {
		return participant;
	}
	public void setParticipant(Participant participant) {
		this.participant = participant;
	}
	@Override
	public String toString() {
		return "ParticipantConvention [id=" + id + ", datesignature="
				+ datesignature + ", convention=" + convention
				+ ", participant=" + participant + "]";
	}

	
	
}
