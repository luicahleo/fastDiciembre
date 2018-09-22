package fast1718.trabajo;

import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;

//import javax.naming.NamingException;
//import javax.naming.InitialContext;
//import javax.naming.NamingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.sql.DataSource;

/**
 * Servlet Filter implementation class FiltroMenu
 */
// TODO MODIFICAR

@WebFilter(urlPatterns = { "/admin/*" })

public class FiltroAdmin implements Filter {

	/**
	 * Default constructor.
	 */

	public FiltroAdmin() {
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;// Lo importante es que es HttpRequest
		HttpServletResponse res = (HttpServletResponse) response;

		Usuario usuario = (Usuario) req.getSession().getAttribute("usuario");

		if (usuario != null && usuario.getTipo_usu() == 0) {//si el tipo de usuario es administrado
			// Deja pasar la petición
			chain.doFilter(request, response);// Lo de dentro del do Filter debe ser ServletRequest y ServletResponse
		} // Para dejar seguir la petición
		else {
			res.sendError(HttpServletResponse.SC_FORBIDDEN, "Acceso prohibido");// Necesita que sea HttpServletRequest, este mensaje es lo que se muestra
																				// no ServletRequest
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {

	}

}
