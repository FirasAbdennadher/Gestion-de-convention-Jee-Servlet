package entities;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TypeConvention")
public class TypeConvention {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String libelle;
	@OneToMany(mappedBy = "typeConventions")
	private Collection<Convention> conventions;
	public TypeConvention(String libelle, Collection<Convention> conventions) {
		super();
		this.libelle = libelle;
		this.conventions = conventions;
	}
	
	
	public TypeConvention(String libelle) {
		super();
		this.libelle = libelle;
	}


	public TypeConvention() {
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
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	public Collection<Convention> getConventions() {
		return conventions;
	}
	public void setConventions(Collection<Convention> conventions) {
		this.conventions = conventions;
	}


	@Override
	public String toString() {
		return "TypeConvention [id=" + id + ", libelle=" + libelle+"]";
	}

	
	
}
