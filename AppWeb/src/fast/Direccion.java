//--FJFJ--
package fast;

import java.io.Serializable;

public class Direccion implements Serializable {

	private static final long serialVersionUID = 7318194466491121984L;

	private String calle;
	private int codigoPostal;
	private String ciudad;
	
	public Direccion() {
		
	}

	public String getCalle() {
		return calle;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public int getCodigoPostal() {
		return codigoPostal;
	}

	public void setCodigoPostal(int codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

}
