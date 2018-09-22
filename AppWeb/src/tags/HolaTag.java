package tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

public class HolaTag extends TagSupport {
	
	private static final long serialVersionUID = 1L;
	
	public HolaTag() {
	}

	// Tipo de dato del atributo segun valor se espere
	private String atrhola;

	public void setAtrhola(String s) {
		this.atrhola = s;
	}

	// Método que se invoca cuando se encuentra la marca de cierre de
	// la acción
	public int doEndTag() throws JspException {
		try {
			// Obtencion del metodo HTTP usado en la solicitud
			String metodo = ((HttpServletRequest) pageContext.getRequest()).getMethod();
			if (metodo.equalsIgnoreCase("POST") || metodo.equalsIgnoreCase("GET")) {
				// Se utiliza el pageContext para obtener el objeto de salida
				// "out"
				if (atrhola != null)
					pageContext.getOut().print("Etiqueta Hola. <br>Valor Atributo: " + atrhola);
				else
					pageContext.getOut().print("Etiqueta Hola. <br>Sin atributo");

				// Obtencion del valor rellenado en el formulario
				// Con este metodo se consigue un JSP con solo etiquetas (sin
				// codigo Java)
				Object numero = pageContext.getRequest().getParameter("numero");
				pageContext.getOut().print(
						"<br>Valor introducido en el formulario (m&eacute;todo " + metodo + "): " + (String) numero);
			}
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
