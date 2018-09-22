/*FJFJ*/
package fast;

public class Usuario {
	private String usuario;
	private String nombreReal;
	private String clave;
	
	public Usuario(String usuario, String nombreReal, String clave) {
		this.usuario = usuario;
		this.nombreReal = nombreReal;
		this.clave = clave;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getNombreReal() {
		return nombreReal;
	}
	public void setNombreReal(String nombreReal) {
		this.nombreReal = nombreReal;
	}
	public String getClave() {
		return clave;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}
	
	
}
