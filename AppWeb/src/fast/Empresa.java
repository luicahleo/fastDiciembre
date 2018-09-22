//--FJFJ--
package fast;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Empresa implements Serializable {

	private static final long serialVersionUID = 5006405973048453093L;

	private String nombre;
	private Direccion direccion;
	private List<Persona> empleados;
	
	public Empresa() {
		empleados = new ArrayList<Persona>();
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Direccion getDireccion() {
		return direccion;
	}

	public void setDireccion(Direccion direccion) {
		this.direccion = direccion;
	}

	public List<Persona> getEmpleados() {
		return empleados;
	}

	public void setEmpleados(List<Persona> empleados) {
		this.empleados = empleados;
	}

}
