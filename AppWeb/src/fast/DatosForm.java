/*FJFJ*/
package fast;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Datos del formulario. Utilizable como bean.
 * @author fjfj
 *
 */
public class DatosForm implements Serializable {

	/**
	 * Serial Version por defecto
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Lista conteniendo cada una de las líneas HTML de cada
	 * uno de los campos
	 */
	private List<String> campos;

	public DatosForm() {
		campos = new ArrayList<String>();
	}
	
	/**
	 * Añade un nuevo campo
	 * @param nuevo
	 */
	public void setNuevoCampo(DatosInput nuevo) {
		if (nuevo.getTipo() != 0 ) {  //0 indica que no se ha inicializado
			nuevo.setId("fq"+campos.size());
			campos.add(nuevo.getHtml());
		}
	}
	
	/**
	 * Devuelve código HTML equivalente
	 */
	public String getHtml() {
		String html="<ul>\n";
		for (String item: campos) {
			html+= "<li>\n"+item+"</li>\n";
		}
		html+="</ul>\n";
		return html;
	}

}
