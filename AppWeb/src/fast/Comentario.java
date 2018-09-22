/*FJFJ*/
package fast;

import java.io.Serializable;
import java.util.Date;

public class Comentario implements Serializable{
	
	private static final long serialVersionUID = 5777135965173648569L;
	
	private String autor;
	private String texto;
	private Date fecha;

	public Comentario() {
		fecha = new Date();
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	

}
