//--FJFJ-- 
package fast;

import java.beans.XMLDecoder;
import java.beans.XMLEncoder;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;


public class GestorEntradasBlog {

	private String nombreFichero;
	private ArrayList<EntradaBlog> entradas;
	
	
	public GestorEntradasBlog() {
		nombreFichero = null;
		entradas = new ArrayList<EntradaBlog>();
		System.out.println("Gestor de Entradas del Blog creado.");
	}
	
	public ArrayList<EntradaBlog> getEntradas() {
		return entradas;
	}

	public void setEntradas(ArrayList<EntradaBlog> entradas) {
		this.entradas = entradas;
	}

	public String getNombreFichero() {
		return nombreFichero;
	}

	public void setNombreFichero(String nombre) {
		if ( this.nombreFichero == null ||
				!this.nombreFichero.equals(nombre) ) {
			//Solo se realiza una vez
			this.nombreFichero = nombre;
			cargarEntradasBlog();
		}
	}

	@SuppressWarnings("unchecked")
	private void cargarEntradasBlog()
	{
		System.out.println("Cargando entradas del blog desde el fichero "+nombreFichero);
		/**
		 * La clase java.beans.XMLDecoder
		 * http://docs.oracle.com/javase/6/docs/api/java/beans/XMLDecoder.html
		 * Permite leer un objeto JavaBean de un fichero XML (incluyendo listas y
		 * tablas).
		 * En el constructor se le indica el InputStream del que tiene que leer.
		 * La funci�n readObject lee un objeto desde el flujo XML.
		 * Este objeto habr� que convertirlo a su clase original.
		 */
		XMLDecoder d;
		entradas = null;
		try {
			
			d = new XMLDecoder(
			        new BufferedInputStream(
			            new FileInputStream(nombreFichero)));
			//Cuidado, esto puede ser peligroso si el fichero está corrupto
			Object o = d.readObject();
			if ( o instanceof ArrayList<?>)
				entradas = (ArrayList<EntradaBlog>) o;  
			d.close();
		} catch (FileNotFoundException e) {
			//El fichero no existia
		}
		if ( entradas == null )  {
			//Creamos una entrada básica y generamos el fichero
			EntradaBlog ejemploEntrada = 
					new EntradaBlog(new Date(), "Autor", "Titulo", "<em>Contenido<em>");
			entradas = new ArrayList<EntradaBlog>();
			entradas.add(ejemploEntrada);
			guardarEntradasBlog();
		}
	}
	
	private void guardarEntradasBlog() {
		try {
			/**
			 * La clase java.beans.XMLEncoder
			 * http://docs.oracle.com/javase/6/docs/api/java/beans/XMLEncoder.html
			 * Permite guardar un objeto JavaBeans en un fichero XML, tambi�n
			 * vale para guardar listas y tablas.
			 * En el constructor se le indica el OutputStream donde escribir�.
			 * La funci�n writeObject escribe el objeto al flujo XML.
			 * 
			 */
			XMLEncoder d;
			d = new XMLEncoder(
			        new BufferedOutputStream(
			            new FileOutputStream(nombreFichero)));
			//Cuidado, esto puede ser peligroso si el fichero está corrupto
			d.writeObject(entradas);
			d.close();
		} catch (FileNotFoundException e) {
			//El fichero no se puede escribir
		}
	}

}
