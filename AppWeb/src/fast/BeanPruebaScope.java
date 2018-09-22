//--FJFJ--
package fast;

import java.io.Serializable;
import java.util.Date;

public class BeanPruebaScope implements Serializable{

	/**
	 * Para que no de warning cuando se implementa la interfaz Serializable
	 */
	private static final long serialVersionUID = -5855194264622968665L;

	/**
	 * Variable de clase utilizada para asignar un identificador único
	 * a cada objeto
	 */
	static int contadorInstancias = 0;
	
	private int id;
	private String valor;
	
	public BeanPruebaScope() {
		id = getNuevoId();
		valor = "No asignado";
		System.out.println("Objeto BeanPruebaScope creado con id="+id);
	}

	private int getNuevoId() {
		return contadorInstancias++;
	}

	public int getId() {
		return id;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		//Solo permitimos asignar un valor la primera vez
		if ("No asignado".equals(this.valor))
			this.valor = valor+" Creado el "+new Date();
	}
	
}
