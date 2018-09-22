//--FJFJ--
package fast;

import java.io.Serializable;


/**
 * Almacena información de una persona
 * @author fjfj
 */
public class Persona implements Serializable{
	/**
	 * Campo necesario para que al implementar la interfaz
	 * Serializable no de warning 
	 */
	private static final long serialVersionUID = 1L;
	
	String nombre;
	String apellidos;
	int edad;
	
	public Persona() {
		//No hace nada por defecto
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		//El nombre se convierte a mayúsculas
		this.nombre = nombre.toUpperCase();
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		//Los apellidos se convierten a mayúsculas
		this.apellidos = apellidos.toUpperCase();
	}
	public int getEdad() {
		return edad;
	}
	public void setEdad(int edad) {
		//Edad debe ser mayor o igual a cero
		if (edad < 0 )
			edad = 0;
		this.edad = edad;
	}
	
	/**
	 * Es posible crear funciones que sigan la regla
	 * getPropiedadVirtual, para simular la existencia de propiedades, de tal
	 * manera que estas funciones puedan ser ejecutadas desde JSP con
	 * <jsp:getProperty>. Lo mismo se podría hacer con una función con
	 * nombre setPropiedadVirtual
	 * @return El nombre y apellidos completo
	 */
	public String getNombreCompleto() {
		return nombre+" "+apellidos;
	}
	
}

