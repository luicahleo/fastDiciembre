/*FJFJ*/
package fast;

/**
 * Clase que guarda informacion sobre el tipo de campo Input que
 * se va a anadir al formulario. Utilizable como bean.
 * @author fjfj
 *
 */
public class DatosInput {
	/**
	 * Tipo del campo
	 * 1=text
	 * 2=radio
	 * 3=checkbox
	 * 4=select
	 * 5=submit
	 * 6=button
	 */
	private int tipo;
	/**
	 * Etiqueta que se anadira al campo
	 */
	private String nombre;
	/**
	 * Numero de elementos. Valido para tipos 2 y 4
	 */
	private int numElementos;
	
	/**
	 * Valor del atributo id
	 */
	private String id;

	public DatosInput() {
		tipo = 0;
		nombre = "";
		numElementos = 0;
		id="";
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getNumElementos() {
		return numElementos;
	}

	public void setNumElementos(int numElementos) {
		this.numElementos = numElementos;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * Genera un String con el codigo HTML equivalente
	 */
	public String getHtml() {
		String codigoFuente = "";
		
		switch (tipo) {
		case 1:
			codigoFuente = "<label for='"+id+"'>"+nombre+": </label>\n"+
							"<input type='text' id='"+id+"' />\n";
			break;
		case 2:
			codigoFuente = "<label>"+nombre+": </label>\n";
			for( int i = 0 ; i < numElementos ; i++ ) {
				String idElemento = id+"-"+i;
				codigoFuente += "<span>\n"+
						"\t<input type='radio' name='"+id+"' id='"+idElemento+"' value='"+idElemento+"' />\n"+
						"\t<label for='"+idElemento+"'>Opci&oacute;n"+i+"</label>\n"+
						"</span>\n";
			}
			break;
		case 3:
			codigoFuente = "<label for='"+id+"'>"+nombre+": </label>\n"+
							"<input type='checkbox' id='"+id+"' />\n";
			break;
		case 4:
			codigoFuente = "<label for='"+id+"'>"+nombre+": </label>\n"+
						"<select name='"+id+"' id='"+id+"'>\n";
			for( int i = 0 ; i < numElementos ; i++ ) {
				String idElemento = id+"-"+i;
				codigoFuente += "\t<option value='"+idElemento+"'>Opci&oacute;n"+i+"</option>\n";
			}
			codigoFuente += "</select>\n";
			break;
		case 5:
			codigoFuente = "<input type='submit' id='"+id+"' value='"+nombre+"'/>\n";
			break;
		case 6:
			codigoFuente = "<input type='button' id='"+id+"' value='"+nombre+"'/>\n";
			break;
			
		default:
			break;
		}
		
		return codigoFuente;	
	}
	

}
