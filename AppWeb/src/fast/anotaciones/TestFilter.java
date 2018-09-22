/**
 * 
 */
package fast.anotaciones;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * @author dit
 *
 */
@WebFilter(urlPatterns = { "*.app", "/filtro" })
public class TestFilter implements Filter {

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.Filter#destroy()
	 */
	@Override
	public void destroy() {
		// Si hay que eliminar o guardar algo antes de terminar.

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest,
	 * javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		/*
		 * Ejemplos de filtrado 
		 * - Seguridad, bloquear el acceso a determinadas páginas. 
		 * - Registro y auditoría de páginas consultadas. 
		 * - Conversión de imágenes (escalado automático). 
		 * - Compresión de datos. 
		 * - Servir distintas páginas según el idioma. 
		 * - Modificar las peticiones y respuestas. 
		 * - etc
		 */
		HttpServletRequest request = (HttpServletRequest) req;
		String url = request.getServletPath();
		System.out.println("TestFilter: filtrando");
		
		if (url.endsWith("/filtro")) {
			PrintWriter salida = resp.getWriter();
			salida.println("<!DOCTYPE html>");
			salida.println("<html><body><div>" +
					"<h1>URL Filtrada</h1><br/>"	+
					"</div>" +
					"</body></html>");
		} else if (url.endsWith(".app")) {
			// Cambia la extensión de la petición
			String nuevaUrl = url.substring(0, url.length() - 4) + ".jsp";
			System.out.println("TestFilter: reenvio a "+nuevaUrl);
			
			req.getRequestDispatcher(nuevaUrl).forward(req,resp);
		} else {

			// Continua la cadena de filtros
			chain.doFilter(req, resp);

			// Si se quiere modificar la respuesta que se va a enviar, se haría
			// a continuación.
			// ...
		}
		
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// Inicialización
		System.out.println("TestFilter: Inicialización.");
	}

}
