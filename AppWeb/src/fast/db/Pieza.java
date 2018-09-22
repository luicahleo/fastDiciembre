/**
 * 
 */
package fast.db;

import java.io.Serializable;

/**
 * @author dit
 *
 */
public class Pieza implements Serializable {

	private static final long serialVersionUID = 1L;
	
	Integer idp;
	String nombre;
	String color;
	Integer peso;
	String ciudad;
	
	
	public Integer getIdp() {
		return idp;
	}
	public void setIdp(Integer idp) {
		this.idp = idp;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Integer getPeso() {
		return peso;
	}
	public void setPeso(Integer peso) {
		this.peso = peso;
	}
	public String getCiudad() {
		return ciudad;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	

}
