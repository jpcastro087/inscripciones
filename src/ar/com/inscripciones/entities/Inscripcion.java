package ar.com.inscripciones.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "Inscripciones")
public class Inscripcion implements Serializable{

	@Id
	@ManyToOne
    @JoinColumn(name="id_alumno")
	private Alumno alumno;
	@Id
	@ManyToOne(cascade =CascadeType.ALL)
	@JoinColumns({
		@JoinColumn(name = "id_asignatura", referencedColumnName = "id_asignatura"),
		@JoinColumn(name = "id_docente", referencedColumnName = "id_docente") })
	private Curso curso;
	@Id
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date fechaInscripcion;
	private Integer estado;

	/**
	 * @return the alumno
	 */
	public Alumno getAlumno() {
		return alumno;
	}

	/**
	 * @param alumno
	 *            the alumno to set
	 */
	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
	}

	/**
	 * @return the curso
	 */
	public Curso getCurso() {
		return curso;
	}

	/**
	 * @param curso
	 *            the curso to set
	 */
	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	/**
	 * @return the fechaInscripcion
	 */
	public Date getFechaInscripcion() {
		return fechaInscripcion;
	}

	/**
	 * @param fechaInscripcion
	 *            the fechaInscripcion to set
	 */
	public void setFechaInscripcion(Date fechaInscripcion) {
		this.fechaInscripcion = fechaInscripcion;
	}

	/**
	 * @return the estado
	 */
	public Integer getEstado() {
		return estado;
	}

	/**
	 * @param estado
	 *            the estado to set
	 */
	public void setEstado(Integer estado) {
		this.estado = estado;
	}

}
