/**
 * 
 */
package fast;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fjfj
 * Almacena una lista de comentarios
 */
public class AlmacenComentarios {
	
	private List<Comentario> comentarios;


	/**
	 * Constructor
	 */
	public AlmacenComentarios() {
		comentarios = new ArrayList<Comentario>();
	}
	
	public List<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(List<Comentario> comentarios) {
		this.comentarios = comentarios;
	}
	
	public int getTotal() {
		return comentarios.size();
	}
	
	public void setNuevoComentario(Comentario nuevo) {
		if ( nuevo.getAutor()!=null && nuevo.getTexto()!=null )
			comentarios.add(nuevo);
	}
}
