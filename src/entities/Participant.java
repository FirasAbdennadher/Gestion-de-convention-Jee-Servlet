package entities;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="Participant")
public class Participant {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String libelle;
    //@Column(nullable=false, columnDefinition="Blob")
	private String logo;
	@OneToMany(mappedBy="participant")
	private Collection<ParticipantConvention> participantConvention;
	public Participant(String libelle,String logo,
			Collection<ParticipantConvention> participantConvention) {
		super();
		this.libelle = libelle;
		this.logo=logo;
		this.participantConvention = participantConvention;
	}
	
	public Participant(String libelle,String logo){
		super();
		this.libelle = libelle;
		this.logo=logo;
	}

	public Participant() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLibelle() {
		return libelle;
	}
	public void setLogo(String l) {
		this.logo = l;
	}
	
	public String  getLogo() {
		return logo;
	}
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	
	public Collection<ParticipantConvention> getParticipantConvention() {
		return participantConvention;
	}
	public void setParticipantConvention(
			Collection<ParticipantConvention> participantConvention) {
		this.participantConvention = participantConvention;
	}
	@Override
	public String toString() {
		return "Participant [id=" + id + "Logo= "+logo +", libelle=" + libelle
				+ ", participantConvention=" + participantConvention + "]";
	}



}
