//--FJFJ--
package fast;

import java.util.Date;

public class EntradaBlog {
	private Date fecha;
	private String autor;
	private String titulo;
	private String contenido;
	
	
	
	public EntradaBlog() {
	}
	public EntradaBlog(Date fecha, String autor, String titulo, String contenido) {
		super();
		this.fecha = fecha;
		this.autor = autor;
		this.titulo = titulo;
		this.contenido = contenido;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getAutor() {
		return autor;
	}
	public void setAutor(String autor) {
		this.autor = autor;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getContenido() {
		return contenido;
	}
	public void setContenido(String contenido) {
		this.contenido = contenido;
	}
	
}
