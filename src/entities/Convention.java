package entities;

import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "Convention")
public class Convention {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Temporal(TemporalType.DATE)
	private Date dateEdition;
	private String objet;
	@Temporal(TemporalType.DATE)
	private Date dateEntre;
	@Temporal(TemporalType.DATE)

	private Date dateExpiration;
	@OneToMany(mappedBy = "convention")
	private Collection<ParticipantConvention> participantConvention;
	@ManyToOne
	private TypeConvention typeConventions;
	public Convention(String objet,Date dateEdit, Date dateEntre, Date dateExpiration,
			Collection<ParticipantConvention> participantConvention,
			TypeConvention typeConvention) {
		super();
		this.objet = objet;
		this.dateEdition=dateEdit;
		this.dateEntre = dateEntre;
		this.dateExpiration = dateExpiration;
		this.participantConvention = participantConvention;
		this.typeConventions = typeConvention;
	}
	
	
	public Convention(Date dateEdition, String objet, Date dateEntre,
			Date dateExpiration, TypeConvention typeConventions) {
		super();
		this.dateEdition = dateEdition;
		this.objet = objet;
		this.dateEntre = dateEntre;
		this.dateExpiration = dateExpiration;
		this.typeConventions = typeConventions;
	}


	public Convention() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getObjet() {
		return objet;
	}
	public void setObjet(String objet) {
		this.objet = objet;
	}
	public Date getDateEntre() {
		return dateEntre;
	}
	public void setDateEntre(Date dateEntre) {
		this.dateEntre = dateEntre;
	}
	public Date getDateExpiration() {
		return dateExpiration;
	}
	public void setDateExpiration(Date dateExpiration) {
		this.dateExpiration = dateExpiration;
	}
	public Collection<ParticipantConvention> getParticipantConvention() {
		return participantConvention;
	}
	public void setParticipantConvention(
			Collection<ParticipantConvention> participantConvention) {
		this.participantConvention = participantConvention;
	}
	public TypeConvention getTypeConvention() {
		return typeConventions;
	}
	public void setTypeConvention(TypeConvention typeConvention) {
		this.typeConventions = typeConvention;
	}
	
	
	
	public Date getDateEdition() {
		return dateEdition;
	}
	public void setDateEdition(Date dateEdition) {
		this.dateEdition = dateEdition;
	}
	public TypeConvention getTypeConventions() {
		return typeConventions;
	}
	public void setTypeConventions(TypeConvention typeConventions) {
		this.typeConventions = typeConventions;
	}
	@Override
	public String toString() {
		return "Convention [id=" + id + ", objet=" + objet + ", dateEntre="
				+ dateEntre + ", dateExpiration=" + dateExpiration
				+ ", participantConvention=" + participantConvention
				+ ", typeConvention=" + typeConventions + "]";
	}

	
	
}
