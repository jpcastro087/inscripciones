package ar.com.inscripciones.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Cursos")
public class Curso implements Serializable {

	@Id
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_asignatura", referencedColumnName = "id")
	private Asignatura asignatura;
	@Id
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_docente", referencedColumnName = "id")
	private Docente docente;

	private Integer cupoMaximo;

	public Asignatura getAsignatura() {
		return asignatura;
	}

	public void setAsignatura(Asignatura asignatura) {
		this.asignatura = asignatura;
	}

	public Integer getCupoMaximo() {
		return cupoMaximo;
	}

	public void setCupoMaximo(Integer cupoMaximo) {
		this.cupoMaximo = cupoMaximo;
	}

	public Docente getDocente() {
		return docente;
	}

	public void setDocente(Docente docente) {
		this.docente = docente;
	}

}
