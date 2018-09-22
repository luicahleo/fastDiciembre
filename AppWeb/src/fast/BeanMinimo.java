//--FJFJ--
package fast;

//La clase debería implementar la interfaz Serializable, 
// sin embargo no es necesario para que funcione.
public class BeanMinimo {
	
	/**
	 * Debería crearse dos funciones por cada propiedad: get y set
	 * 
	 */
	String propiedad;
	
	// Si no existe el constructor, 
	// Java crea uno sin parámetros por defecto

	
	/**
	 * Esta función se puede omitir, y sería como crear
	 * una propiedad de solo escritura (no puede leerse)
	 * 
	 */
	public String getPropiedad() {
		return propiedad;
	}

	/**
	 * Esta función se puede omitir, y sería como crear
	 * una propiedad de solo lectura (no puede modificarse)
	 * @param propiedad
	 */
	public void setPropiedad(String propiedad) {
		this.propiedad = propiedad;
	}
	
}
