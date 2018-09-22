/**
 * 
 */
package fast.tags;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import fast.IntegerBean;

/**
 * @author dit
 *
 */
public class TestTag extends SimpleTagSupport {

	String nombre;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void doTag() throws JspException, IOException {
		//Obtenemos el bean numTest en el ámbito REQUEST
		IntegerBean numTest = (IntegerBean) getJspContext().getAttribute(
				"numTest", PageContext.REQUEST_SCOPE );
		if (numTest == null) {
			numTest = new IntegerBean();
			getJspContext().setAttribute(
					"numTest", numTest, PageContext.REQUEST_SCOPE);
		}
		numTest.setValue(numTest.getValue()+1);
		
		// Obtiene el objeto out para imprimir HTML
		JspWriter out = getJspContext().getOut();

		if (nombre == null) {
			// Damos un valor por defecto a nombre
			nombre = "";
		}

		/* Imprime el id y cabecera del test */
		out.println(
				"<div id='" + nombre + "'>\n" +
				"<h3 class='underline'>Test de FAST "+numTest.getValue()+": " +
						nombre + "</h3>\n" +
				"<h4>Fecha: "+new Date()+"</h4>"+
				"<hr />");

		StringWriter sw = new StringWriter();
		/* obtiene el cuerpo de la etiqueta (ya procesado) y lo imprime */
		getJspBody().invoke(sw);
		out.println(sw.toString());
		/* Imprime fin del test */
		out.println("<hr />\n</div>");

	}

}
