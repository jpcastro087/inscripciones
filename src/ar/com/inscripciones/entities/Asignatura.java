package ar.com.inscripciones.entities;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="Asignaturas")
public class Asignatura extends Entidad {

	private String descripcion;

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
