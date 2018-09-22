package tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class AdiosTag extends BodyTagSupport {

	private static final long serialVersionUID = 1L;

	public AdiosTag() {
	}

	// Tipo de dato del atributo segun valor se espere
	private int atrad = 0;

	public void setAtrad(int s) {
		this.atrad = s;
	}

	private Object atrad2;

	public void setAtrad2(Object s) {
		this.atrad2 = s;
	}

	// Método que se invoca tras leer el cuerpo de la etiqueta
	public int doAfterBody() throws JspException {
		try {
			// Lectura del cuerpo de la etiqueta
			BodyContent bc = getBodyContent();
			String cuerpo = bc.getString();

			// Se obtiene el objeto de salida out mediante JspWriter
			JspWriter out = bc.getEnclosingWriter();
			if (cuerpo != null) {
				out.print("Etiqueta Adios. <br>Valor de su cuerpo: \"" + cuerpo + "\"");
				out.print("<br>Longitud del cuerpo (incluye espaciados): " + cuerpo.length() + "<br><br>");
			}

			// Lectura de los atributos de la etiqueta
			out.print("Atributos etiqueta Adios:");
			if (atrad != 0)
				out.print("<br>Atributo \"atrad\" = " + atrad);
			else
				out.print("<br>Atributo \"atrad\" igual a \"0\"");
			if (atrad2 != null) {
				out.print("<br>Atributo \"atrad2\" = " + atrad2);
				out.print("<br>Suma de los atributos: " + (atrad + Integer.parseInt((String) atrad2)));
			} else
				out.print("<br>Atributo \"atrad2\" nulo");

		} catch (Exception e) {
			throw new JspTagException(e.getMessage());
		}

		// Tenemos que devolver SKIP_BODY (constante definida en la interfaz
		// "Tag")
		// porque esta acción no tien que mostrar nada en la pantalla
		return (SKIP_BODY);
	}

	public void release() {
		// Llama al método release() del padre, para que se devuelvan
		// todos los recursos utilizados al sistema. Esta es una buena
		// práctica, sobre todo cuando se están utilizando jerarquías
		// de acciones
		super.release();
	}
}
